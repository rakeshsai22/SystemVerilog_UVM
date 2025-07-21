// self referential classes are primarily used for linked lists, trees
// created by declaring a data memeber as a ptr to an object of the same class

#include<iostream>
using namespace std;

class self
{
    public:
        int x;
        self *srefer;
        self(int a):srefer(mullptr),x(a){}

};

void print(slef *b)
{
    if(b==nullptr)
    return ;
    do
    {
        cout<<b ->x<<endl;
    }while ((b=b->srefer));
}

int main(){
    self x(5),y(7),z*(9);
    x.srefer = &7;
    y.srefer = &z;
    print(&x);
    return 0
}

