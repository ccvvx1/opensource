cat > wlw.sh <<EOF
#!/bin/bash

# ����Ƿ��ṩ�˸��ļ���·������
if [ \$# -ne 1 ]; then
  echo "���ṩ���ļ���·����Ϊ������"
  exit 1
fi

# �������в����л�ȡ���ļ���·��
root_folder="\$1"

# �������ļ����µ��������ļ���
find "\$root_folder" -type d -name '.git' -exec sh -c '
  # ��ȡ��ģ�����ڵ��ļ���
  submodule_dir=\$(dirname "{}")

  # ��ȡ��ģ��� URL ��·��
  submodule_url=\$(git -C "\$submodule_dir" config --get remote.origin.url)
  submodule_path="\$submodule_dir"

  # ��ȡ��ģ��ĵ�ǰ��֧
  submodule_branch=\$(git -C "\$submodule_dir" rev-parse --abbrev-ref HEAD)

  # ��ȡ��ģ��ĵ�ǰ commit SHA ֵ
  submodule_commit=\$(git -C "\$submodule_dir" rev-parse HEAD)

  # ��ӡ��ģ����Ϣ������ URL��·������֧�� SHA ֵ
  echo "Submodule Path: \$submodule_path"
  echo "Submodule URL: \$submodule_url"
  echo "Submodule Branch: \$submodule_branch"
  echo "Submodule Commit SHA: \$submodule_commit"
  echo "----------------------------------"
' \;
EOF
