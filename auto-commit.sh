#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

set -e

num_dirty="$(git status --porcelain 2>/dev/null| grep -e "^??" -e '^.M' | wc -l)"
push_pending="$(git diff --shortstat 'origin/master')"

if [[ "$num_dirty" -eq 0 && -z "$push_pending" ]]; then
  exit 0
fi

if [[ "$num_dirty" -ne 0 ]]; then
  git add .
  git commit \
    --no-gpg-sign \
    --author "Shou Ya (auto) <shouya@users.noreply.github.com>" \
    -am "Auto commit `date -u`"
  git pull --rebase
fi

git push origin master

