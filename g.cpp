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

int n, m, spec;
ll k, ans;
int t[1000009];

//===============================================================================================
int main()
{
	scanf("%d %d %lld", &n, &m, &k);
	for (int i = 0, temp; i < n; i++)
	{
		scanf("%d", &temp);
		t[temp]++;
	}
	for (int i = 1000005; i > 0; i--)
	{
		while (t[i])
		{
			if (m >= i)
			{
				t[i]--;
				t[0]++;
				m -= i;
			}
			else
				break;
		}
		if (t[i])
		{
			t[m]--;
			break;
		}
	}
	for (int i = 1000005; i > 0; i--)
	{
		if (!k)
			break;
		if (k >= t[i])
		{
			t[i - 1] += t[i];
			k -= t[i];
			t[i] = 0;
		}
		else
		{
			t[i - 1] += k;
			t[i] -= k;
			k = 0;
		}
	}
	for (int i = 1000005, j = 0; i > 0; i--)
	{
		j += t[i];
		ans += (ll)j * (ll)i;
	}
	printf("%lld\n", ans);
}
//===============================================================================================