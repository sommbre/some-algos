#include<bits/stdc++.h>
using namespace std;
int n, k, a[1000006], wynik1, wynik2;
int main()
{
    cin >> n >> k;
    for (int i = 1; i <= n; i++)
    {
        cin >> a[i];
        wynik1 += a[i];
    }
    for (int i = 1; i <= n; i++)
    {
        if ((a[i] + a[i + 1]) < k)
        {
            a[i + 1] = k - a[i];
        }
        wynik2 += a[i];
    }
    wynik2 = wynik2 - wynik1;
    cout << wynik2 << endl;
    for (int i = 1; i <= n; i++)
    {
        cout << a[i] << " ";
    }
}
