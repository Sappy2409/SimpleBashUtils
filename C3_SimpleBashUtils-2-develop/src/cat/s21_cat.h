#ifndef S21_CAT_H
#define S21_CAT_H

#include <fcntl.h>
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

struct flags{
  int b;
  int e;
  int s;
  int t;
  int n;
  int v;
};

void cat(int argc, char *argv[], struct flags *flags);
void reader(FILE *fp, struct flags *flags);
void parse(int argc, char *argv[], struct flags *flags);

#endif