cat > wlw.sh <<EOF
#!/bin/bash

# 检查是否提供了根文件夹路径参数
if [ \$# -ne 1 ]; then
  echo "请提供根文件夹路径作为参数。"
  exit 1
fi

# 从命令行参数中获取根文件夹路径
root_folder="\$1"

# 遍历根文件夹下的所有子文件夹
find "\$root_folder" -type d -name '.git' -exec sh -c '
  # 获取子模块所在的文件夹
  submodule_dir=\$(dirname "{}")

  # 获取子模块的 URL 和路径
  submodule_url=\$(git -C "\$submodule_dir" config --get remote.origin.url)
  submodule_path="\$submodule_dir"

  # 获取子模块的当前分支
  submodule_branch=\$(git -C "\$submodule_dir" rev-parse --abbrev-ref HEAD)

  # 获取子模块的当前 commit SHA 值
  submodule_commit=\$(git -C "\$submodule_dir" rev-parse HEAD)

  # 打印子模块信息，包括 URL、路径、分支和 SHA 值
  echo "Submodule Path: \$submodule_path"
  echo "Submodule URL: \$submodule_url"
  echo "Submodule Branch: \$submodule_branch"
  echo "Submodule Commit SHA: \$submodule_commit"
  echo "----------------------------------"
' \;
EOF
