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
#pragma omp parallel
  {
#pragma omp for schedule(static, chunk) firstprivate(suma) lastprivate(suma)
    for (i = 0; i < n; i++) {
      suma = suma + a[i];
      printf(" thread %d suma a[%d] suma=%d \n", omp_get_thread_num(), i, suma);
    }
#pragma omp single
    printf("num_procs = %d, nthreads-var = %d in_parallel = %d \n",
           omp_get_num_procs(), omp_get_num_threads(), omp_in_parallel());
  }

  printf("Fuera de 'parallel for' suma=%d\n", suma);

  printf("num_procs = %d, nthreads-var = %d in_parallel = %d \n",
         omp_get_num_procs(), omp_get_num_threads(), omp_in_parallel());

  return (0);
}
