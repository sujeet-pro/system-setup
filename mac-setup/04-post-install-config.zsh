git config --global user.name "Sujeet Jaiswal"
git config --global user.email "sujeet.profession@gmail.com"
git config --global init.defaultBranch main
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Generate a new SSH key, to put on GitHub/Bitbucket
ssh-keygen -t ed25519 -b 256 -N "" -q -f ~/.ssh/test_key
