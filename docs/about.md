---
hide:
    - toc
---

# 贡献指南

感谢你愿意为 **XJU Algorithm Wiki** 做贡献！  
本 Wiki 的目标是整理校内月赛题目与题解，方便同学们复习与查阅。  

如在使用或贡献过程中遇到问题，可以联系管理员：**geneva4869@163.com**  

---

## 📥 1. 获取项目代码

请先将项目 clone 到本地：

```bash
git clone https://github.com/winbeau/xju-algorithm-wiki.git
cd xju-algorithm-wiki
```

---

## ✍️ 2. 撰写题解

1. 如果你要为一场新比赛创建题解文件，可以使用脚本生成：

   ```bash
   ./create-problems.sh
   ```

   * 脚本会询问目标目录（例如 `contests/2025Sep27/`）
   * 输入题目数量后，会自动从 `template.md` 复制对应的 `pA.md, pB.md ...` 文件
   * 已存在的文件不会被覆盖

2. 使用 **Markdown** 编写题解即可。推荐包含以下部分：

   * 题目简述或链接
   * 思路分析
   * 复杂度分析
   * 拓展/类似题

---

## 📝 3. 提交更新

编写完成后，提交更改：

```bash
# 添加更改
git add docs/contests/2025Sep27/pA.md

# 提交说明
git commit -m "添加 2025Sep27 比赛 Problem A 题解"

# 推送到远程
git push origin main
```

---

## 📚 4. Git 常用命令速查

| 命令                          | 作用       |
| ----------------------------- | ---------- |
| `git clone URL`               | 克隆远程仓库到本地   |
| `git pull`                    | 拉取远程仓库最新内容 |
| `git add file.md`             | 添加某个文件到暂存区 |
| `git add .`                   | 添加所有更改到暂存区 |
| `git commit -m "说明"`        | 提交更改并写说明   |
| `git push origin main`        | 推送到远程主分支   |
| `git status`                  | 查看当前更改状态   |
| `git log --oneline`           | 查看简洁提交历史   |
| `git checkout -b branch-name` | 创建并切换到新分支 |
| `git branch`                  | 查看本地分支       |

---

## ✅ 建议

* 使用 **简洁明确的 commit message**（如 `添加 2025Sep27 Problem A 题解`）
* 尽量遵循已有的目录结构与题解模板
* 贡献前可先 `git pull`，避免冲突

---


