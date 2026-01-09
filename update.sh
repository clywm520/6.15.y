#!/bin/bash

git remote add stable https://mirrors.tuna.tsinghua.edu.cn/git/linux-stable.git
git fetch stable --no-tags --depth 1 refs/tags/v6.15:refs/tags/v6.15 refs/tags/v6.15.11:refs/tags/v6.15.11
git diff v6.15 v6.15.11 > update-to-6.15.11.patch
git apply --check update-to-6.15.11.patch
git apply update-to-6.15.11.patch
git add .
git commit -m "Update Linux kernel from v6.15 to v6.15.11"

# 3. 推送
git push origin main
