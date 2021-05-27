#include <stdio.h>  // biblioteca donde se encuentra la funciÃ³n printf()
#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <time.h> // biblioteca donde se encuentra la funciÃ³n clock_gettime()

struct componentes {
  int a;
  int b;
};

int main(int argc, char **argv) {

  int i, j, k, ii, X1, X2;

  struct timespec cgt1, cgt2;
  double ncgt; // para tiempo de ejecuciÃ³n

  // Leer argumento de entrada (nÂº de componentes del vector)
  if (argc < 3) {
    printf("Faltan nÂº componentes del vector\n");
    exit(-1);
  }

  unsigned int N = atoi(argv[1]);
  unsigned int M = atoi(argv[2]);
  unsigned int Nnuevo = N + 4 - (N % 4);
  unsigned seed = 24567;

  struct componentes s[Nnuevo];
  int R[N];

  // Inicializar vectores
  if (N < 9)
    for (i = 0; i < N; i++) {
      s[i].a = N * 0.1 + i * 0.1;
      s[i].b = N * 0.1 - i * 0.1;
    }
  else {
    srand(time(0));
    for (i = 0; i < N; i++) {
      s[i].a = rand_r(&seed);
      s[i].b = rand_r(&seed);
    }
  }

  clock_gettime(CLOCK_REALTIME, &cgt1);

  for (ii = 0; ii < M; ii++) {
    X1 = 0;
    X2 = 0;
    for (i = 0; i < N; i += 4) {
      X1 += 2 * s[i].a + ii;
      X1 += 2 * s[i + 1].a + ii;
      X1 += 2 * s[i + 1].a + ii;
      X1 += 2 * s[i + 1].a + ii;
    }
    for (i = 0; i < N; i += 4) {
      X2 += 3 * s[i].b - ii;
      X2 += 3 * s[i + 1].b - ii;
      X2 += 3 * s[i + 1].b - ii;
      X2 += 3 * s[i + 1].b - ii;
    }

    if (X1 < X2)
      R[ii] = X1;
    else
      R[ii] = X2;
  }

  clock_gettime(CLOCK_REALTIME, &cgt2);
  ncgt = (double)(cgt2.tv_sec - cgt1.tv_sec) +
         (double)((cgt2.tv_nsec - cgt1.tv_nsec) / (1.e+9));

  // Imprimir resultado de la suma y el tiempo de ejecuciÃ³n
  printf("Tiempo:%11.9f\t / Dim vec:%u\t/ "
         "R[0](%d)/ / "
         "R[%d](%d)/\n"
         "S[0].a %d S[0].b %d S[N-1].a %d S[N-1] %d\n",
         ncgt, N, R[0], M - 1, R[M - 1], s[0].a, s[0].b, s[N - 1].a,
         s[N - 1].b);

  return 0;
}
