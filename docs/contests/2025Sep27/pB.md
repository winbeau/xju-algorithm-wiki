---
hide:
- toc 
---

# Problem B: 美丽排列 

## 📝 题目描述

构造一个相邻元素差值大于1的排列

## 🔑 算法模块

## 💡 思路分析
联想到奇数序列和偶数序列相差为2

注意 `n=4` 的情况即可

## 🖥️ 代码实现

```cpp
#include <iostream>
#include <vector>

#define endl "\n"

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int n;
    cin >> n;

    if (n == 1) {
        cout << 1 << endl;
        return 0;
    }
    if (n <= 3) {
        cout << "NO SOLUTION" << endl;
        return 0;
    }

    for (int i = 2; i <= n; i += 2) {
        cout << i << " ";
    }
    for (int i = 1; i <= n; i += 2) {
        cout << i << " ";
    }
    cout << endl;

    return 0;
}
```

## ⏱️ 复杂度分析

## 📚 拓展

