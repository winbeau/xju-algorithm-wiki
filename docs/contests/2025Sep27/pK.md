---
hide:
    - toc 
---

# Problem K: 余数 

## 📝 题目描述

长度 $5 \times 10^5$ 的数组初始全为0，操作一次

- 操作1：**`x`** 位置增加 **`y`**

- 操作2：计算满足 **`pos % x == y`** 的位置的元素和值

Codeforces 链接: [CF1207F](https://codeforces.com/contest/1207/problem/F)

## 🔑 算法模块

分治

## 💡 思路分析

1. 暴力操作：
    
    操作1 直接修改 $O(1)$ 
    
    操作2 等差数列 **`for (int i = y; i < maxn; i += x)`** 枚举求和 $O(\frac{maxn}{x})$
    
    当 x 较大时可以接受，当 x 较小时 $\to O(maxn)$ 多次询问超时
    
    进行根号分治 当 $x > \sqrt{maxn}$ 时采用暴力操作 
    
2. 当 $x \leq \sqrt{maxn}$ 时：
    
    维护 **`R[x][y]`** 数组记录满足 **`pos % x == y`** 的位置的元素和值
    
    即维护 **`R[x][pos % x]`** 的值 可知 **`y<=x`**，数组大小 **`R[$\sqrt{maxn}$, $\sqrt{maxn}$]`**
    
    操作2：直接返回 **`R[x][y]`** 值
    
    操作1：修改 x 位置值会导致 **`R[i][x % i]`** 值变化，枚举 **`i ∈ [1, $\sqrt{maxn}$]`**
    
    **注意操作1不论 x 大小均应该维护 `R[x][y]` 数组值**
    
3. 操作时间复杂度分析
    操作1：$O(\sqrt{maxn})$
    
    操作2：$x > \sqrt{maxn}$ 时→ $O(\sqrt{maxn})$          $x \leq \sqrt{maxn}$ 时→  $O(1)$
    

!!! warning "注意"
    `long long` 会超时

## 🖥️ 代码实现

```cpp
#include <iostream>

#define endl "\n"

using namespace std;

const int maxn = 5e5;
const int sqrn = 700;

int a[maxn + 5];
int R[sqrn + 5][sqrn + 5];

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int t, od, x, y;
    cin >> t;
    while (t--) {
        cin >> od >> x >> y;
        if (od == 1) {
            a[x] += y;
            for (int i = 1; i <= sqrn; i++) {
                R[i][x % i] += y;
            }
        } else {
            if (x <= sqrn) cout << R[x][y] << endl;
            else {
                int ans = 0;
                for (int i = y; i <= maxn; i += x) {
                    ans += a[i];
                }
                cout << ans << endl;
            }
        }
    }

    return 0;
}
```

## ⏱️ 复杂度分析

$O(q \sqrt{n})$

## 📚 拓展
