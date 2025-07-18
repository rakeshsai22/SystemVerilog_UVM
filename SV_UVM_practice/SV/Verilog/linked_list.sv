// Code your design here
// Define a node class
class Node;
    int data;
    Node next;

    function new(int val);
        data = val;
        next = null;
    endfunction
  
endclass

// Linked List class
class LinkedList;
    Node head;
  	Node prev = null;
    Node curr = null;

    function new();
        head = null;
    endfunction

    // Insert at end
    function void insert_end(int val);
        Node new_node = new(val);

        if (head == null) begin
            head = new_node;
        end else begin
            Node temp = head;
            while (temp.next != null) begin
                temp = temp.next;
            end
            temp.next = new_node;
        end
    endfunction

    // Delete by value
    function void delete_value(int val);
        if (head == null) return;

        if (head.data == val) begin
            head = head.next;
            return;
        end
      prev = head;
         
      curr = head.next;

        while (curr != null) begin
            if (curr.data == val) begin
                prev.next = curr.next;
                return;
            end
            prev = curr;
            curr = curr.next;
        end
    endfunction

    // Display the list
    function void display();
        Node temp = head;
        $display("Linked List Contents:");
        while (temp != null) begin
            $write("%0d -> ", temp.data);
            temp = temp.next;
        end
        $display("NULL");
    endfunction
endclass

