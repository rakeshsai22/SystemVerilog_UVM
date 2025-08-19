// ## High Level Design

// # Backing Storage
//  the memory can come from many sources. It can even change size throughout the program's execution.

// We will implement a simple backing storage:
//      a single statically allocated global array of bytes. We can carry out dynamically allocation of parts of a statically allocated piece of memory

#define STORAGE_SIZE 4096
static char storage[STORAGE_SIZE];

// # Record keeping
// this backing storage needs to be annotated to record what has been allocated so far.