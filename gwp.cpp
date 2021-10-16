#include <bits/stdc++.h>
using namespace std;
int m, n;
int mniejsza;
int main()
{
    cin >> n >> m;
    mniejsza = min(n, m);

    if (mniejsza % 2 == 0)
    {
        cout << "Maciek";
        return 0;
    }
    if (mniejsza % 2 != 0)
    {
        cout << "Adrian";
        return 0;
    }

}
