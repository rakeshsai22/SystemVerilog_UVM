#include<iostream>
using namespace std;

class Node{
    private:
        int data;
        Node *next;

        public:
            Node()
            {
                data = 0;
                next = NULL;
            }
            Node(int data){
                data = data;
                next = NULL;
            }

            ~Node();
            int get();
            {
                return data;

            }

            // insert a node
            void insert(Node *node);

            // display list
            friend void display(Node *);
};

void Node::insert(Node *node){
    // node ptr to catch the last node
    Node *last = this;
    while(last->next) {
        last = last->next;
    }
    last->next = node;
    
}

void display(Node *first){
    Node *traverse;
    cout << "elements of the ll are:"<<endl;
    for(traverse = first;traverse;traverse= traverse->next){
        cout<<traverse->data;
    }
    cout<<endl;
}

int main(){
    Node *first = NULL;
    Node *node;

    for (int i=1;i<10;i++){
        node = new list(i);
        if(first == NULL){
            first=node;
        }
        else 
            first->insert(node);

    }
    display(first);
}