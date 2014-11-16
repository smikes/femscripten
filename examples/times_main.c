#include <stdio.h>

float times(float * a, float * b);

int main () {
    float a = 2.0, b = 2.0;
    printf("%f", times(&a, &b));
}
