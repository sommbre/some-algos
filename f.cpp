#include <bits/stdc++.h>
#define gc getchar
#define gcu getchar_unlocked
#define fi first
#define se second
#define pb push_back
#define mod ((ll)1e9 + 7)
typedef long long ll;
using namespace std;
//===============================================================================================

int n, m, k, t;
void zad(void);

//===============================================================================================
int main()
{
	scanf("%d", &t);
	for (int i = 0; i < t; i++)
		zad();
}
//===============================================================================================
void zad(void)
{
	scanf("%d %d %d", &n, &m, &k);
	if (((n + 1 <= 2 * k) && (m + 1 <= 2 * k)) || ((n & 1) && (m & 1)))
		printf("Yuto\n");
	else
		printf("Platina\n");
}