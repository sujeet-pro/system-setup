# Get the directory where this script is located
SCRIPT_DIR=${${(%):-%x}:A:h}

# Source files relative to this script's location
source "${SCRIPT_DIR}/git-pull-all.zsh"
source "${SCRIPT_DIR}/git-status-all.zsh"