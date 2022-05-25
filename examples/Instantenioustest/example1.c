#include <klee/klee.h>
#include <stdio.h>

int function_with_if(int x) {
    printf("input: %d\n", x);
    if (x > 0) {
        return 10 / x;
    } else {
        return 10 / (x + 1);
    }
}

int main() {
  int x;
  klee_make_symbolic(&x, sizeof(x), "x");
  int result = function_with_if(x);
  printf("result = %d\n", result);
  return 1;
}
