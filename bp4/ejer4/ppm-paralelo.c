#include <omp.h>
#include <stdio.h>  // biblioteca donde se encuentra la funciÃ³n printf()
#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <time.h> // biblioteca donde se encuentra la funciÃ³n clock_gettime()

int main(int argc, char **argv) {

  int i, j, k, suma;

  double t1, t2;

  // Leer argumento de entrada (nÂº de componentes del vector)
  if (argc < 2) {
    printf("Faltan nÂº componentes del vector\n");
    exit(-1);
  }

  unsigned int Nviejo = atoi(argv[1]);
  unsigned int N = Nviejo + 4 - (Nviejo % 4);

  double **m1, **m2, **mr, **m2trans;
  m1 = (double **)malloc(N * sizeof(double *));
  m2 = (double **)malloc(N * sizeof(double *));
  mr = (double **)malloc(N * sizeof(double *));
  m2trans = (double **)malloc(N * sizeof(double *));
  for (i = 0; i < N; i++) {
    m1[i] = (double *)malloc(N * sizeof(double));
    m2[i] = (double *)malloc(N * sizeof(double));
    mr[i] = (double *)malloc(N * sizeof(double));
    m2trans[i] = (double *)malloc(N * sizeof(double));
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
    for (i = 0; i < N; i++) {
      for (j = 0; j < N; j++) {
        m2trans[j][i] = m2[i][j];
      }
    }
  }

  t1 = omp_get_wtime();
  // Transponemos m2 para poner recorrerla adecuadamente

#pragma omp parallel for private(j, k)
  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      for (k = 0; k < N; k += 4) {
        mr[i][j] += m1[i][k] * m2trans[j][k];
        mr[i][j] += m1[i][k + 1] * m2trans[j][k + 1];
        mr[i][j] += m1[i][k + 2] * m2trans[j][k + 2];
        mr[i][j] += m1[i][k + 3] * m2trans[j][k + 3];
      }
    }
  }

  t2 = omp_get_wtime();

  // Imprimir resultado de la suma y el tiempo de ejecuciÃ³n
  printf("Tiempo:%11.9f\t / Dim matrices:%u\t/ "
         "mr[0][0](%8.6f) / / "
         "mr[%d][%d](%8.6f) /\n",
         t2 - t1, Nviejo, mr[0][0], Nviejo - 1, Nviejo - 1,
         mr[Nviejo - 1][Nviejo - 1]);

  for (i = 0; i < N; i++) {
    free(m1[i]);
    free(m2[i]);
    free(mr[i]);
    free(m2trans[i]);
  }

  free(m1); // libera el espacio reservado para m1
  free(m2); // libera el espacio reservado para m2
  free(mr); // libera el espacio reservado para mr
  free(m2trans);
  return 0;
}
