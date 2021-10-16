#include <bits/stdc++.h>
using namespace std;
long long n, m, a[1000006], wynik;
int main()
{
    cin >> n >> m;
    for (int i = 1; i <= m; i++)
    {
        cin >> a[i];
    }
    for (int i = 1; i <= m; i++)
    {
        wynik += a[1] - 1;
        break;
    }
    for (int i = 1; i <= m - 1; i++)
    {
        if (a[i] < a[i + 1])
        {
            wynik += (a[i + 1] - a[i]);
        }
        if (a[i] > a[i + 1])
        {
            wynik += (n - a[i] + a[i + 1]);
        }
    }
    cout << wynik;
}
