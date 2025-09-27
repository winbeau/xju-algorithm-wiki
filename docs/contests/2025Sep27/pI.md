---
hide:
    - toc 
---

# Problem I: 静态RMQ 

## 📝 题目描述

静态 RMQ (Range Minimum Query) 【区间最值查询】

## 🔑 算法模块

ST表/可持久化线段树

## 💡 思路分析

## 🖥️ 代码实现

```cpp
#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>

#define endl "\n"

using namespace std;

class ST {
public:
    ST(vector<int>& arr) : n(arr.size()), k(log2(n) + 1),
    st(n, vector<int>(k)), lg2(n + 1) {

        for (int i = 2; i <= n; i++) lg2[i] = lg2[i / 2] + 1;

        for (int i = 0; i < n; i++) st[i][0] = arr[i];

        for (int j = 1; j < k; j++) {
            for (int i = 0; i + (1 << j) <= n; i++) {
                st[i][j] = min(st[i][j - 1], \
                st[i + (1 << (j - 1))][j - 1]);
            }
        }
    }

    int query(int l, int r) {
        int k = lg2[r - l + 1];
        return min(st[l][k], st[r - (1 << k) + 1][k]);
    }

private:
    int n, k;
    vector<vector<int>> st;
    vector<int> lg2;
};

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int n, q, a, b;
    cin >> n >> q;

    vector<int> arr(n);
    for (int i = 0; i < n; i++) cin >> arr[i];

    ST st(arr);

    while (q--) {
        cin >> a >> b;
        cout << st.query(a - 1, b - 1) << endl;
    }

    return 0;
}
```

## ⏱️ 复杂度分析

## 📚 拓展

