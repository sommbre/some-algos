#include<bits/stdc++.h>
using namespace std;


void sieveOfErathosthenes(int n)
{
    // all the elements of primes true 
        bool primes[n+1];
    memset(primes,true,sizeof(primes));
    for(int p=2; p*p<=n;p++)
    {
        if(primes[p]==true)
        {
            for(int i=p*p; i<=n; i +=p)
            {
                primes[i]=false;
            }
        }
    }
    for(int i=2;i<=n;i++)
    {
        if(primes[i]==true)
        {
            cout<<i<<" ";
        }
    }
}

int main()
{
    int n=50;
    sieveOfErathosthenes(n);
}