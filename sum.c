#include <stddef.h>
#include <stdio.h>

#define N 4
#define M 4

int sum(int matrix[N][M], size_t row, size_t cols) {
    int sum = 0; 
    
    for (size_t i = 0; i < cols; ++i) {
        sum += matrix[row][i];
    }   

    return sum;
}

void fill_matrix(int matrix[N][M], size_t rows, size_t cols) {
    for (size_t i = 0; i < rows; ++i) {
        for (size_t j = 0; j < cols; ++j) {
            matrix[i][j] = i * cols + j; 
        }
    }
}

#define ROW 2
int main() {

    int matrix[N][M]; 

    fill_matrix(matrix, N, M);
    int result = sum(matrix, ROW, N); 

    printf("%d", result);

    return 0;
}