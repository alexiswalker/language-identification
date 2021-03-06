#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
ll t,a,b;

ll gcd(ll A, ll B){
  if(B == 0)
    return A;
  return gcd(B, A%B);
}

int main(){
  cin >> t;
  while(t--){
    cin >> a >> b;

    ll aux = gcd(a,b);
    while(b != 1 && aux != 1){
      b /= aux;
      aux = gcd(a,b);
    }

    if(b == 1)
      puts("YES");
    else
      puts("NO");
  }

  return 0;
}