#include "klee/klee.h"
#include <stdlib.h>

int *p;
int ejem1(int x) {
  
  if (x > 0)
  {
  	p=malloc(100);
     return -1;
  }
  else{
  	p=malloc(50);
     return 1;
     }
} 

int main() {
  int a;
  
  klee_make_symbolic(&a, sizeof(a), "a");
  klee_make_symbolic(&p, sizeof(p), "p");
  return ejem1(a);
}
