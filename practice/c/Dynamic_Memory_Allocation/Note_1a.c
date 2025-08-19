// ## malloc()

// defined in <stdlib.h>

// void malloc(size_t size);

// * Allocates sizes in bytes
// * if allocation succeeds,
//      returns a ptr that is suitably aligned for any object type with fundamental alignment
// * if size = zero,
//      behaviour is implementation defined:
//          - a null pointer may be returned
//          - a non-null pointer may be returned
//              (such a ptr should not be dereferenced, it should be passed to free to avoid memory leaks)

// malloc is thread safe : it behaves as though only accessing the memory locations visible through its argument,and not any static storage

//  A previous call to free or realloc that deallocates a region of memory synchronizes with a call to malloc that allocates the same or part 
// of the same region of memory. 
//  This synchronizationoccurs after any access to the memory by deallocating function and before any access ot the memory by malloc. There is 
// a single total order of all allocation and deallocation functions operating on each particular region or memory.

// Parameters 
//      size : number of bytes to allocate

// Return value:
//      on success : returns pointer to the begining of newly allocated memory.
//      on failure : returns a null pointer

// Example

#include <stdio.h>
#include<stdlib.h>

int main(void){

    int *p1 = malloc(4*sizeof(int)); // alloates enough for an array of 4 integers
    int *p2 = malloc(sizeof(int[4])); //same but naming the type directly
    int *p3 = malloc(4*sizeof*p3);

    if(p1){
        for(int i=0; i<4;++i)
            p1[i] = i*i;
        for(int i =0;i<4; ++i)
            print("p1[%d] == %d\n,i,p1[i]");
    }

    free(p1);
    free(p2);
    free(p3);

}
