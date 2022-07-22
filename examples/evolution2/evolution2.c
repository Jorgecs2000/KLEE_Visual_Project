#include <stdio.h>
#include <stdlib.h>
#include "/home/jorge/klee/include/klee/klee.h"
int *n;
int *p;
int *y;
int main() {
  int m;
  int l;
 klee_make_symbolic(&m, sizeof(m), "m");
  if(m>10)
  {
    p=&l;
    y=p;
  }else
  {
    if(m<5)
    {
     n=&l;
    }else
    {
     y=&l;
     n=y;
    }  
  }  
  return 0;
}

