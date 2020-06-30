# !/bin/bash
######################
# bash mergeTo.sh branch
# $1 - branch
######################
### variables
#

######################

CURRENT_BRANCH=$(git branch -vv | egrep "^\*" | awk '{ print $2 '})

if [ $1 ]; then
	
  echo "Usage: $1 [branchname]"
  
  TO_BRANCH=$!
  
else
		
  TO_BRANCH=$(git branch -vv | egrep "^\*" | awk '{ print $2 '} | grep -Po '\w+' | head -1)
  
fi

ACTION=$(git branch -vv | egrep "^\*" | awk '{ print $4 '})

echo "tracking=$ACTION"

if [[ ! "$ACTION" =~ "origin" ]]; then
  git checkout $TO_BRANCH
  git rebase $CURRENT_BRANCH || exit 1
else
  echo "This branch exists remotely, not rebasing"
fi

echo "Merge $TO_BRANCH into $CURRENT_BRANCH"
git checkout $CURRENT_BRANCH
git merge $TO_BRANCH || exit 1

echo
echo "Done"


exit 0




