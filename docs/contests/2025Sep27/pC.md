---
hide:
- toc 
---

# Problem C: 长存

## 📝 题目描述

给定 $x$ 、 $y$ ，令 $a\sqrt{b} = \sqrt{\frac{lcm(x, \, y)}{gcd(x, \, y)}$
求 $ab$ 最大值

## 🔑 关键

公式推导

## 💡 思路分析

看到根号就想去掉，即 $a^2 b = \frac{lcm(x, \, y)}{gcd(x, \, y)}$

则 $ab = \frac{lcm(x, \, y)}{a \times gcd(x, \, y)}$

而 $\frac{lcm(x, \, y)}{gcd(x, \, y)}$ 为定值，自然 $a$ 越小 $ab$ 越大

又 $a > 0$ 且 $a \in Z$ 所以当 $a = 1$ 时 $ab$ 最大 


## 🖥️ 代码实现

```cpp
#include <iostream>

#define endl "\n"

using namespace std;

long long gcd(long long a, long long b) {
    if (b == 0) return a;
    return gcd(b, a % b);
}

long long lcm(long long a, long long b) {
    return a * b / gcd(a, b);
}

void solve() {
    int x, y;
    cin >> x >> y;
    cout << 1 << " " << lcm(x, y) / gcd(x, y) << endl;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int T;
    cin >> T;
    while (T--) solve();

    return 0;
}   
```

## ⏱️ 复杂度分析

## 📚 拓展

