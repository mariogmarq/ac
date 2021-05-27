#include <stdio.h>  // biblioteca donde se encuentra la funciÃ³n printf()
#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <time.h> // biblioteca donde se encuentra la funciÃ³n clock_gettime()

int main(int argc, char **argv) {

  int i, j, k, suma;

  struct timespec cgt1, cgt2;
  double ncgt; // para tiempo de ejecuciÃ³n

  // Leer argumento de entrada (nÂº de componentes del vector)
  if (argc < 2) {
    printf("Faltan nÂº componentes del vector\n");
    exit(-1);
  }

  unsigned int N = atoi(argv[1]);

  double **m1, **m2, **mr;
  m1 = (double **)malloc(N * sizeof(double *));
  m2 = (double **)malloc(N * sizeof(double *));
  mr = (double **)malloc(N * sizeof(double *));
  for (i = 0; i < N; i++) {
    m1[i] = (double *)malloc(N * sizeof(double));
    m2[i] = (double *)malloc(N * sizeof(double));
    mr[i] = (double *)malloc(N * sizeof(double));
  }
  if ((m1 == NULL) || (m2 == NULL) || (mr == NULL)) {
    printf("No hay suficiente espacio para los vectores \n");
    exit(-2);
  }

  // Inicializar vectores
  if (N < 9)
    for (i = 0; i < N; i++) {
      for (j = 0; j < N; j++) {
        m1[i][j] = N * 0.1 + i * 0.1 + j * 0.1;
        m2[i][j] = N * 0.1 - i * 0.1 - j * 0.1;
        mr[i][j] = 0;
      }
    }
  else {
    srand(time(0));
    for (i = 0; i < N; i++) {
      for (j = 0; j < N; j++) {
        m1[i][j] = drand48();
        m2[i][j] = drand48();
        mr[i][j] = 0;
      }
    }
  }

  clock_gettime(CLOCK_REALTIME, &cgt1);

  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      for (k = 0; k < N; k++) {
        mr[i][j] += m1[i][k] * m2[k][j];
      }
    }
  }

  clock_gettime(CLOCK_REALTIME, &cgt2);
  ncgt = (double)(cgt2.tv_sec - cgt1.tv_sec) +
         (double)((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

  // Imprimir resultado de la suma y el tiempo de ejecuciÃ³n
  printf("Tiempo:%11.9f\t / Dim matrices:%u\t/ "
         "mr[0][0](%8.6f) / / "
         "mr[%d][%d](%8.6f) /\n",
         ncgt, N, mr[0][0], N - 1, N - 1, mr[N - 1][N - 1]);

  for (i = 0; i < N; i++) {
    free(m1[i]);
    free(m2[i]);
    free(mr[i]);
  }

  free(m1); // libera el espacio reservado para m1
  free(m2); // libera el espacio reservado para m2
  free(mr); // libera el espacio reservado para mr
  return 0;
}
