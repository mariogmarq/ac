#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

int main(int nargs, char **args) {
  if (nargs < 2) {
    printf("Use program with %s <matrix dimension>\n", args[0]);
    return 1;
  }

  int dim = atoi(args[1]);
  int i, j;
  double suma;
  unsigned seed;

  // Creation of matrix and vector
  double *vector = malloc(sizeof(double) * dim);
  double *resultado = malloc(sizeof(double) * dim);
  double **matrix = malloc(sizeof(double *) * dim);
  for (i = 0; i < dim; i++) {
    matrix[i] = malloc(sizeof(double) * dim);
  }

  // La matriz es triangular inferior
  // Initialization
  for (i = 0; i < dim; i++) {
    seed = 25234 + 17 * omp_get_thread_num();
    vector[i] = rand_r(&seed);
    for (j = 0; j <= i; j++)
      matrix[i][j] = rand_r(&seed);
  }

  // Producto
  for (i = 0; i < dim; i++) {
    suma = 0;
    for (j = 0; j <= i; j++) {
      suma += vector[j] * matrix[i][j];
    }
    resultado[i] = suma;
  }

  // Salida resultados
  printf("resultado[0] = %f, resultado[%d] = %f\n", resultado[0], dim - 1,
         resultado[dim - 1]);

  // Free
  free(vector);
  free(resultado);
  for (i = 0; i < dim; i++) {
    free(matrix[i]);
  }
  free(matrix);
}
