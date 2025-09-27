---
hide:
    - toc 
---

# Problem H: 困牛排序

## 📝 题目描述

找到排好序的最少操作次数

## 🔑 关键

## 💡 思路分析

(暴力枚举)
这是一道思维题，题目让我们找到排好序的最少操作次数

我们不妨模拟一下这个样例

1 3 2 5 4

我们发现我们每次都需要移动前面一个数字，想把他放到一个合适的位置，那么怎么才叫合适呢？

我们显然不能保证把这个数字放到他最后需要在的位置，但是我们可以做到每一次移动可以

把这个数字移动到一个位置，这个位置可以保证后缀序列是个 上升序列

我们每一次都可以这样操作，所以最后整个序列单调上升，那么肯定是正确答案

所以结论出来了，从后往前遍历序列，找到最大的后缀序列是上升的，剩下的数字我们就都需要操作

## 🖥️ 代码实现

```cpp
#include<iostream>

#define endl "\n"

using namespace std;

int a[105];
int n;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    cin>>n;
    for(int i = 1;i <= n; i++) cin >> a[i];
    for(int i = n - 1; i >= 1; i--) {
        if(a[i] <= a[i + 1]) continue;
        cout << i << endl;
        return 0;
    }
    cout << 0 << endl;

    return 0;
}
```

## ⏱️ 复杂度分析

## 📚 拓展

