# !/bin/bash
######################
# bash comiber2repo.sh -method integrated_branch integration_branch remote
# $1 - method ( -f = fast | -s = subtree | -o origin method)
# $2 - integrated_branch 
# $3 - integration_branch
# $4 - remote of integrated project
######################
### variables
#
CUR_DIR=$(pwd)
BASE_DIR=$(git rev-parse --show-cdup)
BRANCH=$(git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
CURRENT_PROJECT_NAME=$(git config --local remote.origin.url|sed -n 's#.*/\([^.]*\)\.git#\1#p')
ADDIT_REMOTE="integrated"
ADDIT_BRANCH=$2
INGR_BRANCH=$3
METHOD=$1
NEW_REMOTE=$4



if [ METHOD == "-o" ]; then

	# В git clone проекта lilEtl
	git remote add $ADDIT_REMOTE $NEW_REMOTE
	
	git remote -v
	
	#Переходим в ветку held проекта lilEtl (или актуальную ветку) и создаем интеграционную ветку
	
	git checkout $ADDIT_BRANCH
	
	git pull $ADDIT_REMOTE $ADDIT_BRANCH
	
	git stash pop
	
	git branch -m integration-add

	# Удаляем старый origin проекта и добавляем туда origin проекта TeamEtl
	git remote rm $ADDIT_REMOTE

	# Pull кода из TeamEtl в lilEtl. И ветку integration разворачиваем в lilEtl
	git fetch
	git checkout $INGR_BRANCH
	git pull origin $INGR_BRANCH

	# Теперь ветка integration содержит в себе код проекта lilEtl и готова для интеграции в TeamEtl
	git checkout $ADDIT_BRANCH
	git rebase $INGR_BRANCH –allow-unrelated-histories

	git push origin $INGR_BRANCH

	# Перейти в проект TeamEtl
	git pull origin $INGR_BRANCH

elif [ METHOD == "-s" ]; then
	# через subtree
	# мердж текущей ветки из репозитория lilEtl, который лежит локально в integration текущего проекта
	read -p "Write name of project which you want to add?" ADDIT_PROJECT
	echo ""
	read -p "Write local path to project which you want to add?" ADDIT_PATH
	git subtree add –P $ADDIT_PROJECT $ADDIT_PATH CURRENT_PROJECT_NAME


elif [ METHOD == "-f" ]; then
	git remote add $ADDIT_REMOTE $NEW_REMOTE
	git fetch $ADDIT_REMOTE
	git merge $ADDIT_REMOTE/$ADDIT_BRANCH
	

else
	echo "You won't set up a method of adding"
	exit 0
fi

exit
