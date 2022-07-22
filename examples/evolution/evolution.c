#include <stdio.h>
#include <stdlib.h>
#include "/home/jorge/klee/include/klee/klee.h"
int main() {
  int *n;
  int m;
  int l;
  int *p;
 klee_make_symbolic(&m, sizeof(m), "m");
  if(m>10)
  {
    p=&l;
  }else
  {
    n=&l;
  }  
  
  return 0;
}

