# !/bin/bash
######################
# bash createTemplate.sh PROJECT_TYPE -bb branchName
# $1 - project type
# $2 - key for adding of basic branches or not
# $3 - basic (start) branch
######################
### variables
#
DIR=$(pwd)
#
### branches
PROJECT_BRANCHES="dev,feacher,release,held"
ADHOC_BRANCHES="dev,feacher,release,held"
REMOTE="origin"
PROJECT_TYPE=$1

if $3 ; then
	START_BRANCH=$3
else
	START_BRANCH='master'
fi
######################

if [ $1 == "project" ]; then
	
	echo "Adding project template..."
		
	$(cp -r $DIR/template/project/* $DIR)
		
	# add --bare | cloning abilities
	$(git init)
		
	if [ $2=="-bb" ]; then
		echo "Adding project template with basic branch structure..."
		WITHBR=True
		
		for BRANCH in $(echo $PROJECT_BRANCHES | sed -n 1'p' | tr ',' '\n')
			do
				git branch $BRANCH
			done

	else
		echo "Adding project template without branches..."
		WITHBR=False
	fi

elif [ $1 == "adhoce" ]; then 
	
	echo "Adding Ad-Hoc template..."
		
	$(cp -r $DIR/template/adHoc/* $DIR)
		
	# add --bare | cloning abilities
	$(git init)
	
	if [ $2=="-bb" ]; then
		echo "Adding project template with basic branch structure..."
		WITHBR=True
		
		for BRANCH in $(echo $ADHOC_BRANCHES | sed -n 1'p' | tr ',' '\n')
			do
				git branch $BRANCH
			done

	else
		echo "Adding project template without branches..."
		WITHBR=False
	fi

else
	
	echo "You didn't set up a right type of project"
	exit 0
fi

echo 'Dropping to basic templates'
#rm -r $DIR/template

echo 'Adding files to gitignore'
echo 'createTemplate.sh' >> .gitignore
echo 'createSSHKey.sh' >> .gitignore
echo 'changeOrigin.sh' >> .gitignore


# If local exists already, switch to it
if [ -n "$local_branch_exists" ] && [ ! "$local_branch_exists" == '' ]; then
  echo "👓  Switching to existing local branch..."
  git checkout $branch

  # Track remote branch if not already
  if [ -n "$remote_branch_exists" ] && [ ! "$remote_branch_exists" == '' ]; then
    tracking=$(git branch -vv | grep "*" | awk '{ print $4 '})
    # echo "Remote branch exists. Local branch is tracking: $tracking"
    if [[ ! "$tracking" =~ "$remote" ]]; then
      echo "⚒️  Your local branch is not tracking the corresponding remote branch, fixing..."
      git branch --set-upstream-to $branch $remote/$branch
    fi
  # else
  #   echo "Remote branch does not exist, not doing anything"
  fi

# If remote exists, create a local branch that tracks the remote
elif [ -n "$remote_branch_exists" ] && [ ! "$remote_branch_exists" == '' ]; then
  echo "📡  Tracking existing remote branch '$remote_branch_exists'..."
  git checkout -b $branch --track $remote/$branch

# Otherwise create a new local branch
else
  echo "✏️  Creating new local branch..."
  git checkout -b $branch --no-track
fi



