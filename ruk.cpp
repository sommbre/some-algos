#include <bits/stdc++.h>
using namespace std;
int w1, k1, w2, k2, wynik, wiersz, kolumna;
int main()
    {
    cin >> w1 >> k1 >> w2 >> k2;

    wiersz = abs(w1 - w2);
    kolumna = abs(k1 - k2);

    wynik = max(wiersz, kolumna);
    cout << wynik;
    }

