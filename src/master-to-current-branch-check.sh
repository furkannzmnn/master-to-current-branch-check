#!/bin/sh

masterCommit=$(git rev-list -n 20 master)
currentBranch=$(git rev-parse --abbrev-ref HEAD)
currentCommit=$(git rev-list -n 100 "${currentBranch}")

echo "${masterCommit}"
echo "${currentBranch}"
echo "${currentCommit}"

for commit in ${masterCommit}; do
  if ! echo "${currentCommit}" | grep -q "${commit}"; then
    echo "Commit ${commit} is not in ${currentBranch}."
    echo "Please merge ${currentBranch} on top of ${commit}."
    exit 1
  fi
done
