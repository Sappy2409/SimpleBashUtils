#include "s21_cat.h"

int main(int argc, char *argv[]) {
  struct flags flags = {0, 0, 0, 0, 0, 0};
  if (argc == 1) {
    int s = 4096;
    int c;
    while (s--) {
      c = getchar();
      putchar(c);
    }
  } else
    while (optind < argc) {
      cat(argc, argv, &flags);
      ++optind;
    }
  return 0;
}

void cat(int argc, char *argv[], struct flags *flags) {
  parse(argc, argv, flags);
  reader(fopen(argv[optind], "r"), flags);
}

void parse(int argc, char *argv[], struct flags *flags) {
  static struct option long_options[] = {{"number-nonblank", 0, NULL, 'b'},
                                         {"number", 0, NULL, 'n'},
                                         {"squeeze-blank", 0, NULL, 's'},
                                         {NULL, 0, NULL, 0}};
  int Flag = 0;
  while (Flag != -1) {
    Flag = getopt_long(argc, argv, "+beEnstTv", long_options, NULL);
    switch (Flag) {
      case 'b':
        flags->b = 1;
        break;
      case 'e':
        flags->e = 1;
        flags->v = 1;
        break;
      case 'E':
        flags->e = 1;
        break;
      case 'n':
        flags->n = 1;
        break;
      case 's':
        flags->s = 1;
        break;
      case 't':
        flags->t = 1;
        flags->v = 1;
        break;
      case 'T':
        flags->t = 1;
        break;
      case 'v':
        flags->v = 1;
        break;
    }
    if (flags->b == 1 && flags->n == 1) flags->n = 0;
  }
}

void reader(FILE *fp, struct flags *flags) {
  int strings = 1;
  int empty_strings = 0;
  int c = 0;
  int lastC = '\n';
  while (!feof(fp)) {
    if (fp != NULL) {
      c = fgetc(fp);
      if (c == EOF) break;
      if (flags->s && c == '\n' && lastC == '\n') {
        empty_strings++;
        if (empty_strings > 1) {
          continue;
        }
      } else {
        empty_strings = 0;
      }
      if (flags->b && c != '\n' && lastC == '\n') printf("%6d\t", strings++);
      if (flags->n && lastC == '\n') printf("%6d\t", strings++);
      if (flags->t && c == '\t') {
        printf("^");
        c = 'I';
      }
      if (flags->e && c == '\n') printf("$");
      if (flags->v) {
        if ((c >= 0 && c < 9) || (c > 10 && c < 32)) {
          printf("^");
          c = c + 64;
        } else if (c > 127 && c <= 160) {
          printf("M-^");
          c = c - 64;
        } else if (c == 127) {
          printf("^");
          c = '?';
        }
      }
      printf("%c", c);
      lastC = c;
    } else {
      perror("Error in opening file");
      exit(1);
    }
  }
  fclose(fp);
}