#!/bin/sh

# check values
if [ -z "${GITHUB_TOKEN}" ]; then
    echo "error: not found GITHUB_TOKEN"
    exit 1
fi

# initialize git
remote_repo="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
echo "test1"
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git remote add publish-origin "${remote_repo}"
git show-ref # useful for debugging
echo "test2"
# publish any new files
git add -A
timestamp=$(date -u)
echo "test3"
git commit -m "Automated publish: ${timestamp} ${GITHUB_SHA}"
echo "test4"
git push origin master
echo "test5"
