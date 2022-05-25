#include <klee/klee.h>
#include <stdio.h>
#include <assert.h>
 
void print_data(int arr[], int size, int target) {
    printf("searching for %d in:\n[", target);
    for (int i=0; i < size-1; i++) {
        printf("%d, ", arr[i]);
    }
    printf("%d]\n", arr[size-1]);
}
 
int binary_search(int arr[], int size, int target) {
    print_data(arr, size, target);
    int low = 0;
    int high = size - 1;
    int mid;
    while (low <= high) {
        mid = (low + high)/2;
        if (arr[mid] == target) {
            return mid;
        }
        if (arr[mid] < target) {
            low = mid + 1;
        }
        if (arr[mid] > target) {
            high = mid - 1;
        }
    }
    return -1;
}
 
int sorted(int arr[], int size) {
    for (int i = 0; i < size-1; i++) {
        if (arr[i] > arr[i+1]) {
            return 0;
        }
    }
    return 1;
}
 
int main() {
  unsigned short n;
  klee_make_symbolic(&n, sizeof(n), "n");
  klee_assume(n > 0);
  klee_assume(n < 65535);
  int a[n];
  int x;
  klee_make_symbolic(&a, sizeof(a), "a");
  klee_assume(sorted(a, 10));
  klee_make_symbolic(&x, sizeof(x), "x");
  int result = binary_search(a, 10, x);
  printf("result = %d\n", result);
  if (result != -1) {
    assert(a[result] == x);
  } else {
    // if result == -1, then we didn't find it. Therefore, it shouldn't be in the array
    for (int i = 0; i < 10; i++) {
      assert(a[i] != x);
    }
  }
  return 1;
}
