for f in .??*
do
  if [ "$f" == ".git" ] || [ "$f" == ".DS_Store" ]; then
    continue
  fi
  ln -sf ~/dotfiles/$f ~/$f

done
echo '\n\n'; figlet -f whimsy installed
