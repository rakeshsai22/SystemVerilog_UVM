// ## free()

// Deallocates the space previously allocated by malloc(),calloc(),realloc()

// The allocator itself knows the size of the allocated block (it stored it internally when you called malloc), so the caller does not pass the size

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

// Same as free(), but you tell it the size of the allocation that you are freeing.
// The allocator may use this hint to improve performance because it doesn’t need to look up the 
// allocation size in its metadata. Only valid if size is exactly the size originally passed to 
// malloc/calloc/realloc. Passing the wrong size leads to undefined behavior.

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
        .capacity = initial_capacity,
        .data = (void**) malloc(initial_capacity * sizeof(void*))
    };
    return ret;
}

void vector_delete(PtrVector* self){
    free_sized(self->data,self->capacity * sizeof(void*));
}

void vector_push_back(PtrVector* self, void* value){
    if(self->size == self->capacity){
        self->capacity *= 2;
        self->data = (void*) realloc(self->data, self->capacity * sizeof(void*));
    }
    self->data[self-> size++] = value;
}

int main(){

    int data = 42;
    float pi = 3.14;
    PtrVector v = vector_create(8);
    vector_push_back(&v,&data);
    vector_push_back(%v, $pi);
    ptintf("data[0] = %i\n", *(int*)v.data[0]);
    printf("data[1] = %f\n", *(float*)v.data[1]);
    vector_delete(&v);
    
}