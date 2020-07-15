# !/bin/bash
######################
# bash addBranch.sh branch task
# $1 - branch (dev, release, held and etc)
# $2 - task (on Jira, on your task manager and etc)
######################
### funcs
#
require_name_arg() {
	if [ -z $1 ]; then
		echo "Missing argument BASE BRANCH NAME"
		exit 0
	elif [ -z $2 ]; then 
		echo "Missing argument TASK NAME"
		exit 0
	else
		echo ""
	fi
}

contains() {
	branches=$(git branch -a)
	
	for b in $branches
	do
	if [ $b == $1 ]; then
	  echo "FOUND"
      echo true
      break
	fi
	done;
	
	echo false
	
    #[[ $branches =~ (^|[[:space:]])$1($|[[:space:]]) ]] && true || false
}
#
#
### testing
#
require_name_arg $1 $2
#
### variables
#

#
USERNAME=$(id -u -n)
BRANCH=$1
TASK=$2
CURRENT_BRANCH=$(git branch --show-current | grep "^$PREFIX")

if [ CURRENT_BRANCH != BRANCH ]; then

	read -p "Created brach is different then current_branch. Do you want to continue (yes / no)?" answ
    case $answ in
        [Yy]* ) echo "Continue..."; ;;
        [Nn]* ) exit 0;;
        * ) echo "Please answer yes or no";;
    esac
fi



######################


STATUS=$(contains $BRANCH)
#echo STATUS
if [ -n $STATUS ]; then
	echo ""
	echo "No branch name exist into DE git flow pattern"
	echo "You can start a new feature branch:"
	echo ""
	echo "    git checkout -b BRANCH_NAME"
	exit 0
fi

# create branch
git checkout -b "$BRANCH-$TASK"

# update branch variable
CURRENT_BRANCH=$(git branch --show-current | grep "^$PREFIX")

# setup the local branch clone for the first time
git fetch -q "$BRANCH" "$CURRENT_BRANCH"
git branch --no-track "$CURRENT_BRANCH" FETCH_HEAD
git pull origin "$BRANCH"
echo "Created local branch $BRANCH based on $REMOTE's $BRANCH."

echo
echo "Summary of actions:"
echo "- A new branch '$BRANCH-$TASK' was created, based on '$BRANCH'"
echo "- You are now on branch '$BRANCH-$TASK'"
echo ""
echo "Now, start committing."
echo ""

exit 0