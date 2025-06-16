#!/bin/bash
REPO_ROOT=$(git rev-parse --show-toplevel)
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
BRANCH_NAME=demo-$(date +%Y%d%m)-$(whoami)

cd "$REPO_ROOT"

echo "==> Setting up branch a demo branch named ${BRANCH_NAME}"
git clean -f
git branch -D temp 2>/dev/null || true
git branch -D $BRANCH_NAME 2>/dev/null || true
git checkout -b temp
git branch -D main
git checkout main
git branch -D temp
git pull
git checkout -b $BRANCH_NAME

echo "==> Applying patch and creating a commit"
git apply --whitespace=fix "${SCRIPT_DIR}/dockerfile.patch"
npm cache clean --force
npm install express@4.17.1 --save
git commit -sam "reset repo to introduce vulns for demo"

echo "==> Configure / ensure use of local builder"
docker buildx use desktop-linux

echo "==> Configuring Scout"
docker scout config organization demonstrationorg