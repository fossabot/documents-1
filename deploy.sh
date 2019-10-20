#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# 不需要jekyll
touch .nojekyll

# 如果是发布到自定义域名
echo "dongfeng.40huo.cn" > CNAME

git init
git add -A
git commit -m "deploy"

# 如果发布到 https://<USERNAME>.github.io
git push -f https://40huo:${GITHUB_TOKEN}@github.com/dongfeng-project/documents.git master:gh-pages

cd -