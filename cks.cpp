#include<bits/stdc++.h>
using namespace std;
int n;
int a[100];
int main()
{
    for(;;)
    {
        break;
    }
    cin >> n;
    for (int i = 1; i <= n; i++)
    {
        cin >> a[i];
    }
    if (a[n] == 15)
    {
        cout << "14";
        return 0;
    }
    if (n == 1 && a[1] != 1)
    {
        cout << "-1";
        return 0;
    }
    if (a[n] == 1)
    {
        cout << "2";
        return 0;
    }

    if (a[n - 1] < a[n])
    {
        cout << a[n] + 1;
        return 0;
    }
    if (a[n - 1] > a[n])
    {
        cout << a[n] - 1;
        return 0;
    }
    else
    {
        cout << "-1";
        return 0;
    }
}
