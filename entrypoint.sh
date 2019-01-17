#!/bin/sh
echo '=================== Update all submodules ==================='
git submodule init
git submodule update --recursive --remote
echo '=================== Build site ==================='
HUGO_ENV=production hugo -v -d dist
echo '=================== Publish to GitHub Pages ==================='
cd dist
remote_repo="https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" && \
remote_branch="gh-pages" && \
git init && \
git config user.name "${GITHUB_ACTOR}" && \
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com" && \
git add . && \
echo -n 'Files to Commit:' && ls -l | wc -l && \
timestamp=$(date +%s%3N) && \
git commit -m "Automated deployment to GitHub Pages on $timestamp" > /dev/null 2>&1 && \
git push --force $remote_repo master:$remote_branch > /dev/null 2>&1 && \
rm -fr .git && \
cd ../
echo '=================== Done  ==================='
