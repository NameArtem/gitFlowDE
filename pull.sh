# !/bin/bash
######################
# bash pull.sh -r branch remote
# $1 - rebase( -r = rebase | -nr = no rebase)
# $2 - set up another branch
# $3 - if branch set up, you have to set up origin
######################
### variables
#
CUR_DIR=$(pwd)
BASE_DIR=$(git rev-parse --show-cdup)
BRANCH=$(git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

if [ $1 == "-r" ]; then
	REBASE="--rebase" 
else
	REBASE=""
fi

if [ -z $3 ];then
	REMOTE="origin"
else
	REMOTE=$3
fi

if [ -z $2 ]; then
	read -p "You will pull $BRANCH. Do you want to continue (yes / no)?" answ
	case $answ in
		[Yy]* ) echo "Continue..."; ;;
		[Nn]* ) echo "Set up branch"; read -p "You will pull $BRANCH. Do you want to continue (yes / no)?" BRANCH;;
		* ) echo "Please answer yes or no";;
	esac
fi

# pop stashes
if [[ ! "$stash" =~ "No local changes to save" ]]; then
	echo "Popping stash..."
	git stash pop
fi


# update remote
# echo "Fetching from $REMOTE..."

echo "Fetching from $REMOTE..."
git fetch $REMOTE $BRANCH
# git fetch $REMOTE


# pull, using rebase if configured
if [ -z $REBASE ]; then
	git pull $REBASE $REMOTE $BRANCH
else
	git pull $REMOTE $BRANCH
fi 

git submodule update


echo "Done"
exit 0