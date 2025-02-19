#!/bin/zsh

# Function to check git status in a directory
check_git_status() {
  local dir=$1
  cd "$dir" || return

  if [ -d ".git" ]; then
    echo "Checking $dir..."
    local indent="    "
    # Check for uncommitted changes
    if ! git diff-index --quiet HEAD --; then
      echo "\033[0;31m$indent Uncommitted changes found in $dir\033[0m"
    else
      echo "\033[0;32m$indent No uncommitted changes in $dir\033[0m"
    fi

    # Check if changes are pushed to origin
    local local_commit=$(git rev-parse @)
    local remote_commit=$(git rev-parse @{u})
    local base_commit=$(git merge-base @ @{u})

    if [ "$local_commit" = "$remote_commit" ]; then
      echo "\033[0;32m$indent All changes are pushed to origin in $dir\033[0m"
    elif [ "$local_commit" = "$base_commit" ]; then
      echo "$indent Changes are not pushed to origin in $dir"
    elif [ "$remote_commit" = "$base_commit" ]; then
      echo "$indent Changes are ahead of origin in $dir"
    else
      echo "$indent Changes have diverged in $dir"
    fi
  else
    echo "$dir is not a git repository"
  fi
}

# Main script
main() {
  local base_dir=$1

  if [ -z "$base_dir" ]; then
    echo "Usage: $0 <base_directory>"
    exit 1
  fi

  for dir in "$base_dir"/*/; do
    check_git_status "$dir"
  done
}

main "$1"

#  zsh ./system-setup/scripts/check-git.zsh ~/workspace/gh