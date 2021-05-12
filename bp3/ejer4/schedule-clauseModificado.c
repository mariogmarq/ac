#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {

  int i, n = 16, chunk, a[n], suma = 0;

  if (argc < 2) {
    fprintf(stderr, "\nFalta chunk \n");
    exit(-1);
  }
  chunk = atoi(argv[1]);

  for (i = 0; i < n; i++)
    a[i] = i;

#pragma parallel omp for schedule(static, chunk) firstprivate(suma)            \
    lastprivate(suma)
  for (i = 0; i < n; i++) {
    suma = suma + a[i];
    printf(" thread %d suma a[%d] suma=%d \n", omp_get_thread_num(), i, suma);

    if (i == 10)
      printf("dyn-var = %d, nthreads-var = %d thread-limit-var = %d "
             "run-sched-var = %d\n",
             omp_get_dynamic(), omp_get_num_threads(), omp_get_thread_limit(),
             omp_get_dynamic());
  }

  printf("Fuera de 'parallel for' suma=%d\n", suma);

  printf("dyn-var = %d, nthreads-var = %d thread-limit-var = %d "
         "run-sched-var = %d fuera\n",
         omp_get_dynamic(), omp_get_num_threads(), omp_get_thread_limit(),
         omp_get_dynamic());

  return (0);
}
