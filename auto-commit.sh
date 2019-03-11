#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

set -e

NOTIFY="$HOME/projects/scripts/common/tg-notify.sh"

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

  [[ -x $NOTIFY ]]  && $NOTIFY "$(basename $0 .sh)" "Changes detected, synchronized to GitHub"
fi

git push origin master

