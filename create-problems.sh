#!/bin/bash
# script: create_problems.sh
# 功能：复制 template.md 多份到指定目录，命名 pA.md、pB.md ...

# 1. 询问创建目标目录
read -p "请输入目标目录（相对于 docs/，例如 contests/2025Sep28/）: " target_dir

# 拼接完整路径
full_path="./docs/$target_dir"

# 如果目录不存在，创建
if [ ! -d "$full_path" ]; then
    mkdir -p "$full_path"
    echo "已创建目录：$full_path"
fi

# 2. 询问题目数量
read -p "请输入要创建的题目数量: " problem_count

# 检查输入是否为正整数
if ! [[ "$problem_count" =~ ^[1-9][0-9]*$ ]]; then
    echo "题目数量必须为正整数！"
    exit 1
fi

# 3. 复制 template.md
for ((i=0; i<problem_count; i++)); do
    # 生成文件名：pA、pB、pC...
    file_name="p$(printf \\$(printf '%03o' $((65 + i)))).md"
    dest_file="$full_path/$file_name"

    if [ -e "$dest_file" ]; then
        echo "文件 $dest_file 已存在，跳过。"
    else
        cp template.md "$dest_file"
        echo "已创建 $dest_file"
    fi
done

echo "完成 ✅"

