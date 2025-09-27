# Problem A: A + B

## 📝 题目描述

多组 a + b

## 🔑 关键考点

## 💡 思路分析

## 🖥️ 代码实现

!!! note "C语言"
    ```cpp
    #include <stdio.h>

    int main() {
        int a, b;
        while (~scanf("%d %d", &a, &b)) {
            printf("%d\n", a + b);
        }
        return 0;
    }
    ```


!!! note "C++"
    ```cpp
    #include <iostream>

    using namespace std;

    int main() {
        int a, b;
        while (cin >> a >> b) {
            cout << a + b << endl;
        }
        return 0;
    }
    ```

!!! note "Python"
    ```python
    import sys

    for line in sys.stdin:
        a, b = map(int, line.split())
        print(a + b)
    ```

## ⏱️ 复杂度分析

## 📚 拓展

