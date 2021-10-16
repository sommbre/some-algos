#include<bits/stdc++.h>
using namespace std;
int n;
int x[1000006];
int magnesy;
int grupy;
int main()
{
    cin >> n;
    for (int i = 1; i <= n; i++)
    {
        cin >> x[i];
        if (x[i-1] != x[i])
        {
            grupy++;
        }
    }
    cout << grupy;
}

