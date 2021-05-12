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

#pragma omp for schedule(runtime) firstprivate(suma) lastprivate(suma)
    for (i = 0; i < n; i++) {
      suma = suma + a[i];
      printf(" thread %d suma a[%d] suma=%d \n", omp_get_thread_num(), i, suma);
    }
#pragma omp single
    {
      int chunk;
      omp_sched_t sched;
      omp_get_schedule(&sched, &chunk);
      printf("schedule = %d, nthreads-var = %d in_parallel = %d \n", sched,
             omp_get_num_threads(), omp_in_parallel());
    }

    omp_set_num_threads(5);
    omp_set_schedule(omp_sched_static, 1);
    omp_set_dynamic(4);

#pragma omp single
    {
      int chunk;
      omp_sched_t sched;
      omp_get_schedule(&sched, &chunk);
      printf("schedule = %d, nthreads-var = %d in_parallel = %d \n", sched,
             omp_get_num_threads(), omp_in_parallel());
    }
  }

  omp_set_num_threads(4);
  omp_set_schedule(omp_sched_dynamic, 2);
  omp_set_dynamic(3);
  printf("Fuera de 'parallel for' suma=%d\n", suma);

  omp_sched_t sched;
  omp_get_schedule(&sched, &chunk);
  printf("schedule = %d, nthreads-var = %d in_parallel = %d \n", sched,
         omp_get_num_threads(), omp_in_parallel());

  return (0);
}
