---
hide:
    - toc 
---

# Problem J: 两个等差数列

## 📝 题目描述

给定两个等差数列，求 L，R区间内两数列交集元素的数量

## 🔑 算法模块

## 💡 思路分析

1. 纯暴力枚举，为降低时间复杂度，枚举公差大的数列元素，检查其是否存在于另一数列
    
    设 $a_1 > a_2$ ，则时间复杂度 $O(\frac{R - L}{a_1})$ **$R-L ≤ 4 \times 10^9$**  **$0 < a_1 ≤2 \times 10^9$** 
    
    发现当 $a_1$ 较大时程序可行【区间系数，枚举元素少】
    
    以 **$10^3$** 为界，当 **$a_1>10^3$** 时纯暴力枚举，当 **$a_1 \leq 10^3$** 时另寻他法
    
    时间复杂度 $O(\frac{R - L}{a_1})$ ，$a_1 > 10^3~~ \Rightarrow ~~
    \frac{R - L}{a_1} < 4 \times 10^6$ 
    
2. 观察发现若 $x$ 是两数列交集元素，则 $x+a_1a_2$ 、$x+ka_1a_2$ 也是交集元素
    
    在 $L \to L+a_1a_2$ 范围内枚举所有元素判断其是否为交集元素
    
    计算每个交集元素 $x$ 的 $a_1a_2$ 公差后续个数 $cnt = \lfloor \frac{R - x}{a_1a_2} \rfloor + 1$
    
    时间复杂度 $O({a_1a_2})$ ，$a_2 \leq a_1 \leq 10^3~~ \Rightarrow ~~
    a_1a_2 \leq 10^6$ 
    
3. 两部分操作时间复杂度均为 $10^6$ 级别，可以通过

## 编码思路：

1. 读取数据
2. 由于 $k' \geq 0 \Rightarrow  a_1k'+b_1 \geq b_1$ 且 $l' \geq 0 \Rightarrow a_2l'+b_2 \geq b_2$
    
    推出合法左端点 $L = max(L, ~max(b_1, ~b_2))$
    
3. 保证 $a_1 \geq a_2$
    
    当 $a_1 \leq 10^3$ 时，枚举交集头部元素计算数量
    
    当 $a_1 > 10^3$ 时，枚举数列元素统计数量

## 🖥️ 代码实现

```cpp
#include <iostream>
#include <cstdint>

#define int long long

using namespace std;

int32_t main() {
    int a1, b1, a2, b2, L, R, ans = 0;
    cin >> a1 >> b1 >> a2 >> b2 >> L >> R;
    L = max(L, max(b1, b2));
    if (a1 < a2) swap(a1, a2), swap(b1, b2);

    if (a1 <= 1000) {
        for (int xh = L, XH = min(L + a1 * a2 - 1, R); xh <= XH; xh++) {
            if ((xh - b1) % a1 != 0 || (xh - b2) % a2 != 0) continue;
            ans += (R - xh) / (a1 * a2) + 1;
        }
    } else {
        for (int i = (L - b1 + a1 - 1) / a1, I = (R - b1) / a1; i <= I; i++) {
            int x = a1 * i + b1;
            if (x < L || x > R) continue;
            ans += !((x - b2) % a2);
        }
    }

    cout << ans << endl;

    return 0;
}
```

## ⏱️ 复杂度分析

$O(10^6)$

## 📚 拓展

