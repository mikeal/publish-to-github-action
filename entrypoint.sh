#!/bin/sh

# check values
if [ -z "${GITHUB_TOKEN}" ]; then
    echo "error: not found GITHUB_TOKEN"
    exit 1
fi

# initialize git
remote_repo="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git config user.name "Automated Publisher"
git config user.email "publish-to-github-action@users.noreply.github.com"
git show-ref # useful for debugging
git branch --verbose

# install lfs hooks
git lfs install

# publish any new files
git add -A
timestamp=$(date -u)
git commit -m "Automated publish: ${timestamp} ${GITHUB_SHA}" || exit 0

git branch tmp
git checkout master
git merge tmp
git push "${remote_repo}" master
