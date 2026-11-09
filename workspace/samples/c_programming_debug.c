// SAMPLE FIRST-YEAR ECE LAB CODE WITH COMMON DEFECTS
#include <stdio.h>
#include <stdlib.h>

void main() {
    int n;
    int arr[5];
    printf("Enter number of elements to process: ");
    
    // Bug 1: Missing address-of '&' operator
    scanf("%d", n);

    // Bug 2: Deprecated gets() unsafe call
    char studentName[20];
    printf("Enter student name: ");
    gets(studentName);

    // Bug 3: Memory allocation without NULL check
    int *dynamicArray = (int *)malloc(100 * sizeof(int));

    printf("Processing complete for %s\n", studentName);
}
