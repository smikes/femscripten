#include <stdio.h>


int idamax_(int * n, double * dx, int * incx);


int main() {
  int n = 4;       // number of values
  int incx = 1;    // increment
  double values[] = { 0.0, 300.0, 1.345e39, -452.0 };

  printf("let's ask BLAS/IDAMAX what's the index of the largest value\n");
  printf("in the array: { 0.0, 300.0, 1.345e39, -452.0 }; \n\n");

  int result = idamax_(&n, &(values[0]), &incx);

  printf("It should be the third element; we got ==> %d\n\n", result);
  printf("Note that FORTRAN has 1-based arrays by default\n");

  return 0;
}
