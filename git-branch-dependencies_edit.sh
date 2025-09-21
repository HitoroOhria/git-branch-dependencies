#!/bin/bash

git_root_dir_path=$(git rev-parse --show-toplevel)

GIT_BRANCH_DEPENDENCIES_FILE="git-branch-dependencies.yaml"
GIT_BRANCH_DEPENDENCIES_FILE_PATH="$git_root_dir_path/.git/$GIT_BRANCH_DEPENDENCIES_FILE"

if [ ! -f "$GIT_BRANCH_DEPENDENCIES_FILE_PATH" ]; then
  touch "$GIT_BRANCH_DEPENDENCIES_FILE_PATH"
fi

git_branches=$(git branch --format="%(refname:short)")

truncate -s 0 "$GIT_BRANCH_DEPENDENCIES_FILE_PATH"
for branch in $git_branches; do
  echo "- $branch: []" >> "$GIT_BRANCH_DEPENDENCIES_FILE_PATH"
done