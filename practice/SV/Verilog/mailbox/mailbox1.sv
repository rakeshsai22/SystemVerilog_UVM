// mailbox is a way to allow different processes to exchange data betwen each other
//  created with a bounded or unbounded queue size
// Mailbox behaves as a FIFO
// where is it used?
//      communication between different blocks in the tb
// ## teo types of mailboxes 
//      1. Generic       - accepts any data type (int,bit,str..) [default type]
//      2. Parameterized - accepts only a particular data_type
// 

// Syntax:
//      mailbox #(<type>)<mailbox_name>

 