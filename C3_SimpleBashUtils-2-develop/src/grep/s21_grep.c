#include "s21_grep.h"

int main(int argc, char *argv[]) {
  struct flags flags = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL};
  parse(argc, argv, &flags);
  grep(argc, argv, &flags);
  return 0;
}

void parse(int argc, char *argv[], struct flags *flags) {
  int Flag = 0;
  while (Flag != -1) {
    Flag = getopt(argc, argv, "eivclnhsfo");
    switch (Flag) {
      case 'e':
        flags->e = 1;
        break;
      case 'i':
        flags->i = 1;
        break;
      case 'v':
        flags->v = 1;
        break;
      case 'c':
        flags->c = 1;
        break;
      case 'l':
        flags->l = 1;
        break;
      case 'n':
        flags->n = 1;
        break;
      case 'h':
        flags->h = 1;
        break;
      case 's':
        flags->s = 1;
        break;
      case 'f':
        flags->f = 1;
        break;
      case 'o':
        flags->o = 1;
        break;
    }
  }
}

void grep(int argc, char *argv[], struct flags *flags) {
  flags->pattern = argv[optind];
  optind++;
  for (int i = optind; i < argc; i++) {
    FILE *fp;
    char *filename = argv[i];
    fp = fopen(filename, "r");
    if (fp == NULL && !flags->s) fprintf(stderr, "No such file or directory\n");
    if (fp == NULL && flags->s) exit(EXIT_FAILURE);
    if (fp != NULL) process(argc, filename, fp, flags);
    fclose(fp);
  }
}

void process(int argc, char *filename, FILE *fp, struct flags *flags) {
  int cflags = REG_EXTENDED, strings = 0, regXC = 0, countmatch = 0,
      countfiles = argc - optind;
  char *line = NULL;
  regex_t reg;
  size_t len = 0;
  regmatch_t pmatch[1];
  if (flags->i) cflags = REG_ICASE;
  regcomp(&reg, flags->pattern, cflags);
  while (getline(&line, &len, fp) != -1) {
    strings++;
    regXC = regexec(&reg, line, 1, pmatch, 0);
    if (regXC != 0 && flags->v && countfiles > 1) {
      flags->h = 1;
      printf("%s:%s", filename, line);
    }
    if (regXC != 0 && flags->v) printf("%s", line);
    if (regXC == 0 && flags->l) {
      flags->h = 1;
      printf("%s\n", filename);
      break;
    }
    if (regXC == 0 && !flags->h && countfiles > 1) printf("%s:", filename);
    if (regXC == 0 && flags->o) {
      char *current_string = line;
      while (regXC == 0 && pmatch[0].rm_eo != pmatch[0].rm_so) {
        printf("%.*s\n", (int)pmatch[0].rm_eo - (int)pmatch[0].rm_so,
               current_string + pmatch[0].rm_so);
        current_string += pmatch[0].rm_eo;
        regXC = regexec(&reg, current_string, 1, pmatch, 0);
      }
    }
    if (regXC == 0 && flags->n) printf("%d:", strings);
    if (regXC == 0 && !flags->v && !flags->c && !flags->o) {
      printf("%s", line);
    }
    if (regXC == 0 && flags->c) ++countmatch;
    if (flags->v && (strstr(line, "\n") == 0)) printf("\n");
  }
  if (flags->c) printf("%d\n", countmatch);
  regfree(&reg);
  if (line) free(line);
}
