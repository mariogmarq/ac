#include <omp.h>
#include <stdio.h>
int main(void) {
#pragma omp parallel
  printf("(%d:!!!Hello )", omp_get_thread_num());
  printf("(%d: World!!!)", omp_get_thread_num());
  return (0);
}
