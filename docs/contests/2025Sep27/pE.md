---
hide:
    - toc 
---

# Problem E: 数字螺旋

## 📝 题目描述

根据数字螺旋规律，对于每一次询问快速输出结果

## 🔑 关键

找规律

## 💡 思路分析

1. 先列表

    $$
    \begin{align*}
    & (1, 1)-1 \\
    & (1, 2)-2 ~~ (2, 2)-3 ~~ (2, 1)-4 \\
    & (3, 1)-5 ~~ (3, 2)-6 ~~ (3, 3)-7 ~~ (2, 3)-8 ~~ (1, 3)-9\\
    \end{align*}
    $$

    发现对角线 $i=j$ 的位置上值为每个 '⌋' 最大

    根据高中数学中数列相关知识，可推出 $val_k = val_1 + k^2 - k ~~~~~(val_1 = 1)$ 

2. 通过列表又发现两坐标加和从对角线位置分别递减(每次 $\pm 1$)
    
    同时与对应元素值也是每次 $\pm 1$)

3. 分类讨论奇偶即可

## 🖥️ 代码实现

```cpp
#include <iostream>

#define endl "\n"

using namespace std;

void solve() {
    long long x, y;
    cin >> x >> y;
    long long mk = max(x, y);
    long long val = 1 + mk * mk - mk;
    long long dif = 2 * mk - x - y;
    if (mk % 2 == 0 && x < y || mk % 2 == 1 && x > y) {
        cout << val - dif << endl;
    } else {
        cout << val + dif << endl;
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int t;
    cin >> t;
    while (t--) solve();

    return 0;
}
```

## ⏱️ 复杂度分析

## 📚 拓展

