// ## free()

// Deallocates the space previously allocated by malloc(),calloc(),realloc()

//  if a ptr is a null pointer, the function does nothing
// The behavior is undefined , if the value of the ptr does not equal a valiue returned by malloc,calloc,realloc,
// The behavior is undefined if the memory area referred to by ptr has already been deallocated by free(),realloc(),...
// 

// example :: free() ###########################
#include<stdlib.h>

int main(void){
    int *p1 = malloc(10*sizeof *p1);
    free(p1);

    int *p2 = calloc(10, sizeof *p2);
    int *p3 = realloc(p2,1000*sizeof *p3);
    if(p3)
        free(p3);
    else
        free(p2);
}

// #############################################

// free_sized()

// Syntax : void free_sized( void* ptr,size_t size);

// Deallocates the space previously allocated by malloc(),calloc(),or realloc() (but not aligned_alloc())

// Parameters 
//     ptr : pointer to the memory deallocate
//     size: size of memory previously passed to an allocated function

// Return value
//     none

// example :: free_sized() ####################

#include<stddef.h>
#include<stdio.h>
#include<stdlib.h>

typedef struct{
    size_t size; // current number of elements
    size_t capacity; // reserved number of elements
    void** data;
}PtrVector;

PtrVector vector_create(size_t initial_capacity){
    PtrVector ret = {
        
    }
}
