---
hide:
    - toc 
---

# Problem G: 数字反转

## 📝 题目描述

字符串反转

## 🔑 关键

STL 使用/编码能力

## 💡 思路分析

## 🖥️ 代码实现

```cpp
#include <iostream>
#include <algorithm>
#include <string>

#define endl "\n"

using namespace std;

void f(string &str) { // 自实现反转
    for (int i = 0, j = (int)str.size() - 1; i < j; i++, j--) {
        swap(str[i], str[j]);
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    string s;
    cin >> s;
    reverse(s.begin(), s.end());
    cout << s << endl;

    return 0;
}
```

## ⏱️ 复杂度分析

## 📚 拓展

