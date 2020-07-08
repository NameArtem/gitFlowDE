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

if [ $3 ]; then
	START_BRANCH=$3
else
	START_BRANCH='master'
fi
######################

# copy all files
shopt -s dotglob

if [ $1 == "project" ]; then
	
	echo "Adding project template..."
		
	$(cp -r $DIR/templates/project/* $DIR)
		
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


if [ START_BRANCH ] ; then
  echo "Switching to existing branch..."
  git checkout $START_BRANCH

  TRACKING=$(git branch -vv | grep "*" | awk '{ print $4 '})
  
  git branch --set-upstream-to $START_BRANCH
  
  git checkout -b $START_BRANCH --track $START_BRANCH

fi



echo 'Dropping to basic templates'
rm -r $DIR/template

echo 'Adding files to gitignore'
echo 'createTemplate.sh' >> .gitignore
echo 'createSSHKey.sh' >> .gitignore
echo 'changeOrigin.sh' >> .gitignore






