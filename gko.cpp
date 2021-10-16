#include<bits/stdc++.h>
using namespace std;
int a1, b1, a2, b2, a3, b3;
int main()
{
    cin >> a1 >> b1 >> a2 >> b2 >> a3 >> b3;


    if (a2 + a3 <= a1 && b1 >= max(b2, b3))
    {
        cout << "TAK";
        return 0;
    }
    if (a2 + b3 <= a1 && b1 >= max(b2, a3))
    {
        cout << "TAK";
        return 0;
    }
    if (a3 + b2 <= a1 && b1 >= max(a2, b3))
    {
        cout << "TAK";
        return 0;
    }
    if (b3 + b2 <= a1 && b1 >= max(a2, a3))
    {
        cout << "TAK";
    }
    else cout << "NIE";

}
