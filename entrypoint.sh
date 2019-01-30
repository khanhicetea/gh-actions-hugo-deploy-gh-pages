#!/bin/sh
echo '=================== Create deploy key to push ==================='
mkdir ~/.ssh
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
cat ~/.ssh/known_hosts
ssh -T git@github.com
echo `echo ${GIT_DEPLOY_KEY} | base64 -d` > ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa
#stat ~/.ssh/id_rsa
#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_rsa
echo '=================== Update all submodules ==================='
git submodule init
git submodule update --recursive --remote
echo '=================== Build site ==================='
HUGO_ENV=production hugo -v -d dist
echo '=================== Publish to GitHub Pages ==================='
cd dist
remote_repo="git@github.com:${GITHUB_REPOSITORY}.git" && \
remote_branch="gh-pages" && \
git init && \
git remote add deploy $remote_repo && \
git checkout $remote_branch || git checkout --orphan $remote_branch && \
git config user.name "${GITHUB_ACTOR}" && \
git config user.email "${GIT_EMAIL}" && \
git add . && \
echo -n 'Files to Commit:' && ls -l | wc -l && \
timestamp=$(date +%s%3N) && \
git commit -m "Automated deployment to GitHub Pages on $timestamp" > /dev/null 2>&1 && \
git push deploy $remote_branch --force --verbose && \
rm -fr .git && \
cd ../
echo '=================== Done  ==================='
