# Git pull all repositories function
git-pull-all() {
  local max_depth=${1:-1}
  local original_dir=$(pwd)
  for dir in $(find . -maxdepth "$max_depth" -type d ! -name "."); do
    if [ -d "$dir/.git" ]; then
      echo "Running git pull in $dir..."
      cd "$dir"
      git pull
      cd "$original_dir"
      echo "---"
    else
      echo "$dir is not a git repository, skipping..."
      echo "---"
    fi
  done
}

# Alias for git-pull-all
alias gpa='git-pull-all'

# Example usages:
# `git-pull-all 1` or `gpa 1` - pull all repositories in the current directory
# `git-pull-all 2` or `gpa 2` - pull all repositories in the current directory and subdirectories
# `git-pull-all 3` or `gpa 3` - pull all repositories in the current directory and subdirectories and subdirectories and so on
