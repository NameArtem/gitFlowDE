# !/bin/bash
######################
# bash push.sh -type remote branch
# $1 - -type (-c = common (push into origin remote and current branch) | -s = specify (push into some remote and branch))
# $2 - remote
# $3 - branch
######################
### variables
#
PBRANCH=$(git show-branch | grep '*' | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed 's/.*\[\(.*\)\].*/\1/' | sed 's/[\^~].*//')

if [ -n $1 ]; then 

	if [ $1 == '-c' ]; then
		
		BRANCH=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
		REMOTE="origin"

	elif [ $1 == '-s' ]; then
		
		if [ -n $2 ] || [ -n $3 ]; then
			echo ""
			echo "You didn't set up remote/origin"
			read -p "Set up remote name:   " REMOTE
			echo ""
			read -p "Set up branch name:   " BRANCH
			echo ""
		
		else
			
			BRANCH=$3
			REMOTE=$2
		fi 
		
	else
		echo ""
		exit 0
	fi
	
else
	echo ""
	exit 0
fi
	
#push process
git add .

read -p "Do you want to specify message for commit?(yes / no)?" answ

case $answ in
	[Yy]* ) read -p "Commit message: " COMMIT; ;;
	[Nn]* ) COMMIT="Commit at $(date +"%r %a %d %h %y")";;
	* ) echo "Please answer yes or no";;
esac
echo ""
echo "Commit message will be $COMMIT";
echo ""

git commit -am "$COMMIT"

git push --set-upstream $REMOTE $BRANCH  2>&1

refs=$(echo $push | awk '{ print $3}' | sed 's/\.\./\.\.\./')

if [ -z "PBRANCH" ]; then
    PBRANCH="master"
fi

refs="$PBRANCH...$BRANCH"
echo "Pushed a branch '$BRANCH' remotely"
echo ""
echo "Pushed to"
echo $(git remote show $remote -n | grep Push | awk '{ print $3 }')




exit 0