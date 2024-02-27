#ifndef S21_GREP
#define S21_GREP

#define _GNU_SOURCE
#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct flags{
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int h;
  int s;
  int f;
  int o;
  char *pattern;
};

void parse(int argc, char *argv[], struct flags *flags);
void grep(int argc, char *argv[], struct flags *flags);
void process(int argc, char *filename, FILE *fp, struct flags *flags);

#endif
