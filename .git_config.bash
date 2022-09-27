# Git config

git config --global user.name 'Mayuresh Vaze'
git config --global user.email 'mayur_vaze@yahoo.co.in'
git config --global core.excludesfile '~/.gitignore_global'
git config --global commit.template '~/.smCommitMsg'

# Git Aliases

git config --global alias.co checkout
git config --global alias.ci 'commit -m'
git config --global alias.st status
git config --global alias.br branch
git config --global alias.ri 'rebase -i'
git config --global alias.cp 'cherry-pick'
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.force 'push --force-with-lease'
git config --global alias.hard 'reset --hard'
git config --global alias.soft 'reset --soft'
git config --global alias.amd 'ci --amend'
git config --global alias.amd- 'amd --no-edit'
git config --global alias.pop 'stash pop'
