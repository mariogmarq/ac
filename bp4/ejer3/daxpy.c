#include <stdio.h>  // biblioteca donde se encuentra la funciÃ³n printf()
#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <time.h> // biblioteca donde se encuentra la funciÃ³n clock_gettime()

int main(int argc, char **argv) {

  int i, j, k;

  struct timespec cgt1, cgt2;
  double ncgt; // para tiempo de ejecuciÃ³n

  // Leer argumento de entrada (nÂº de componentes del vector)
  if (argc < 2) {
    printf("Faltan nÂº componentes del vector\n");
    exit(-1);
  }

  unsigned int N = atoi(argv[1]);
  unsigned seed = 24567;
  double a = drand48();

  double *x, *y;
	x = malloc(N*sizeof(double));
	y = malloc(N*sizeof(double));

  // Inicializar vectores
  if (N < 9)
    for (i = 0; i < N; i++) {
      x[i] = N * 0.1 + i * 0.1;
      y[i] = N * 0.1 + i * 0.1;
    }
  else {
    srand(time(0));
    for (i = 0; i < N; i++) {
      x[i] = rand_r(&seed);
      y[i] = rand_r(&seed);
    }
  }

  clock_gettime(CLOCK_REALTIME, &cgt1);

  for (i = 0; i < N; i++) {
    y[i] = a * x[i] + y[i];
  }

  clock_gettime(CLOCK_REALTIME, &cgt2);
  ncgt = (double)(cgt2.tv_sec - cgt1.tv_sec) +
         (double)((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

  // Imprimir resultado de la suma y el tiempo de ejecuciÃ³n
  printf("Tiempo:%11.9f\t / Dim vec:%u\t/ "
         "y[0](%f)/ / "
         "y[N-1](%f)/\n",
         ncgt, N, y[0], y[N - 1]);

	free(y);
	free(x);
  return 0;
}
