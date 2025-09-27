---
hide:
- toc 
---

# Problem D: 非递减数组 

## 📝 题目描述

把 $n$ 个整数的数组变成非递减的

## 🔑 算法模块

贪心

## 💡 思路分析

!!! note "贪心策略" 
    把每一个元素与前一个元素比较，若大于等于则不操作，若小于则补差值

!!! success "贪心策略证明"
    - 易知对于每一个元素，执行以上贪心策略是最优的
    - 而从首元素开始，每次的贪心策略均基于前一个最优结果，故局部最优递推出全局最优


## 🖥️ 代码实现

```cpp
#include <iostream>

#define endl "\n"

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int n, pre = 0;
    long long ans = 0;
    cin >> n;
    for (int i = 0, x; i < n; i++) {
        cin >> x;
        if (pre <= x) {
            pre = x;
        } else {
            ans += pre - x;
        }
    }
    cout << ans << endl;

    return 0;
}
```

## ⏱️ 复杂度分析

## 📚 拓展

