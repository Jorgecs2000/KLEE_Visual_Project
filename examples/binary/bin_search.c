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
    int found_error = 0;
    for (int i = 0; i < size-1; i++) {
        found_error = found_error | (arr[i] > arr[i+1]);
    }
    return !found_error;
}
 
int main() {
  int a[10];
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
  }  return 1;
}
