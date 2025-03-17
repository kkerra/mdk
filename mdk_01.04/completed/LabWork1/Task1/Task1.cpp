// Task1.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include <iostream>
using namespace std;

int main()
{
    int a, b, x, result;
    cout << "input a:";
    cin >> a;
    cout << "input b:";
    cin >> b;
    cout << "input x:";
    cin >> x;

    __asm {
        mov eax, a;
        imul x;
        add eax, b;
        mov result, eax
    }

    cout << "Result: " << result << "\n";
}