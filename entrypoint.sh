#!/bin/sh
echo '=================== Create deploy key to push ==================='
mkdir /root/.ssh
# echo -e "StrictHostKeyChecking no" > ~/.ssh/config
ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts
cat /root/.ssh/known_hosts
echo `echo ${GIT_DEPLOY_KEY} | base64 -d` > /root/.ssh/id_rsa
sha256sum /root/.ssh/id_rsa
chmod 400 /root/.ssh/id_rsa
ssh -T -v git@github.com
# echo '=================== Update all submodules ==================='
# git submodule init
# git submodule update --recursive --remote
# echo '=================== Build site ==================='
# HUGO_ENV=production hugo -v -d dist
# echo '=================== Publish to GitHub Pages ==================='
# cd dist
# remote_repo="git@github.com:${GITHUB_REPOSITORY}.git" && \
# remote_branch="gh-pages" && \
# git init && \
# git remote add deploy $remote_repo && \
# git checkout $remote_branch || git checkout --orphan $remote_branch && \
# git config user.name "${GITHUB_ACTOR}" && \
# git config user.email "${GIT_EMAIL}" && \
# git add . && \
# echo -n 'Files to Commit:' && ls -l | wc -l && \
# timestamp=$(date +%s%3N) && \
# git commit -m "Automated deployment to GitHub Pages on $timestamp" > /dev/null 2>&1 && \
# git push deploy $remote_branch --force --verbose && \
# rm -fr .git && \
# cd ../
# echo '=================== Done  ==================='
