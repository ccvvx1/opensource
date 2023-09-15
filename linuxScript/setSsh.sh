ssh-keygen -t rsa -b 4096 -C "694497013@qq.com"
ssh-keyscan -t rsa github.com >>~/.ssh/known_hosts
ssh-keyscan -t rsa gitee.com >>~/.ssh/known_hosts
cat ~/.ssh/id_rsa.pub

