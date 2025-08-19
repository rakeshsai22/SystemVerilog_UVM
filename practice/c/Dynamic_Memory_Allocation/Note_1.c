// ## Dynamic Vs Static Memory Allocation

// In C we use "heap"(malloc,free,..) for dynamic memory allocation

#include <stdlib.h>

void fn() {
    // Static allocation
    int a = 0;                     // size of a is known
    // dynamic allocation
    int *b = malloc(sizeof(int)); // size of b is also known, but not its location
}

// Sometime the memory may never be allocated
//  example: 
int main(){

    if(/* condition */) {
        int *b = malloc(sizeof(int));
    }
}
// here the condition determines if memory is allocated or not

// # C library malloc function

// "malloc" is used to ask for a suitably sized memory location while a program is running.
 void *malloc(size_t size)
//   the c library looks for a chunk of memory with a size of at least X bytes within th ememory 
// that it has reserved,where X is the value of the size param passed to malloc.(In ubuntu this is done by GLIBC)

// If the liofetime of the data is equal to that of a function, we can initialize both a,b at compilation time
void fn() {
    int a =0;
    int *b = NULL;

}

// when the values live longer than the creating function
// # Singly-linked-list 

#include <stdlib.h>

typedef struct Entry {
    int data;
    struct Entry* next;
} Entry;

void add_entry(Entry *entry,int data){
    // new entry goes to the end of the list

    Entry *new_entry = malloc(sizeof(Entry));
    new_entry->data=data;
    new_entry->next = NULL;
    entry->next = new_entry; // previous entry's tail connected to the new_entry
}

// if we want to add an entry we can delare it globally and add it to the list. This way we know ahead the size of the list.
// This actually provides a known upper bound.
// if it is in a function's stack frame, that stack frame will be reclaimed and modified by the future functions, corrupting th enew entry.

// When we add an entry using add_entry with malloc(), resulting pointer points to somewhere not in the program's global data section
// or in any function's stack space, but in the heap memory. It will stay in the heap untill a free() is called.

// ## free()

void fee(void *ptr); // ptr is the pointer previously returned by malloc(), and this tells the heap that the memory is no longer needed


// We can also use free to remove an item from the linked list

void remove_entry(Entry* previous, Entry* entry){
    previous->next = entry->next;
    free(entry);
}
