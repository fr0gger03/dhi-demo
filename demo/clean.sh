#!/bin/bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "==> Commit and clean"
git commit -sam "commit before clean"
git clean -f

echo "==> Delete the current branch, and reset to upstream main"

git checkout temp
git branch -D main
git checkout origin/main
git checkout -b main
git push -u origin main --force