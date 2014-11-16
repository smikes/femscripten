#include <stdio.h>

float times_(float * a, float * b);

int main () {
    float a = 3.0, b = 2.0;
    printf("%f", times_(&a, &b));
}
