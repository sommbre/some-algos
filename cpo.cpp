#include <bits/stdc++.h>
using namespace std;
int r, c, wynik, a1, a2;
char x;
int poziomo[1000006], pionowo[1000006];
int main()
{
    cin >> r >> c;
    for (int i = 0; i < r; i++)
    {
        for (int j = 0; j < c; j++)
        {
            cin >> x;
            if (x == 'S')
            {
                poziomo[i] = 1;
                pionowo[j] = 1;
            }
        }
    }
    for (int i = 0; i < r; i++)
    {
        if (poziomo[i] == 0)
        {
            wynik += c;
            a1++;
        }
    }
    for (int j = 0; j < c; j++)
    {
        if (pionowo[j] == 0)
        {
            wynik += r;
            a2++;
        }
    }
    wynik = wynik - (a1 * a2);
    cout << wynik;
}