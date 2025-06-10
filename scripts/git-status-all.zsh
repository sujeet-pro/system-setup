# Git status all repositories function
git-status-all() {
  local max_depth=${1:-1}
  local original_dir=$(pwd)
  
  for dir in $(find . -maxdepth "$max_depth" -type d ! -name "."); do
    if [ -d "$dir/.git" ]; then
      echo "Checking git status in $dir..."
      cd "$dir"
      
      local indent="    "
      
      # Check for uncommitted changes
      if ! git diff-index --quiet HEAD -- 2>/dev/null; then
        echo "\033[0;31m$indent✗ Uncommitted changes found\033[0m"
      else
        echo "\033[0;32m$indent✓ No uncommitted changes\033[0m"
      fi
      
      # Check for staged changes
      if ! git diff-index --quiet --cached HEAD -- 2>/dev/null; then
        echo "\033[0;33m$indent⚠ Staged changes found\033[0m"
      fi
      
      # Check for untracked files
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        echo "\033[0;33m$indent⚠ Untracked files found\033[0m"
      fi
      
      # Check if changes are pushed to origin
      local upstream=$(git rev-parse --abbrev-ref @{u} 2>/dev/null)
      if [ -n "$upstream" ]; then
        local local_commit=$(git rev-parse @)
        local remote_commit=$(git rev-parse @{u} 2>/dev/null)
        local base_commit=$(git merge-base @ @{u} 2>/dev/null)
        
        if [ "$local_commit" = "$remote_commit" ]; then
          echo "\033[0;32m$indent✓ All changes are pushed to origin\033[0m"
        elif [ "$local_commit" = "$base_commit" ]; then
          echo "\033[0;34m$indent↓ Changes need to be pulled from origin\033[0m"
        elif [ "$remote_commit" = "$base_commit" ]; then
          echo "\033[0;35m$indent↑ Changes are ahead of origin (need to push)\033[0m"
        else
          echo "\033[0;31m$indent↕ Changes have diverged from origin\033[0m"
        fi
      else
        echo "\033[0;33m$indent⚠ No upstream branch configured\033[0m"
      fi
      
      cd "$original_dir"
      echo "---"
    else
      echo "$dir is not a git repository, skipping..."
      echo "---"
    fi
  done
}

# Alias for git-status-all
alias gsa='git-status-all'

# Example usages:
# `git-status-all 1` or `gsa 1` - check status of all repositories in the current directory
# `git-status-all 2` or `gsa 2` - check status of all repositories in the current directory and subdirectories
# `git-status-all 3` or `gsa 3` - check status of all repositories in the current directory and subdirectories and subdirectories and so on

