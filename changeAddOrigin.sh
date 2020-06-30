# !/bin/bash
######################
# bash changeAddOrigin.sh -a remote_name path
# $1 - -a - add / -c - change / -r -rename 
# $2 - origin | other 
# $3 - path (if -r it is new remote name)
######################
### variables
#
REMOTE_NAME=$2

if [ $1 == '-r' ]; then
	GIT_PATH=$3
else
	GIT_PATH=$3
fi


######################

if [ $1 == '-a' ]; then

	git remote add REMOTE_NAME GIT_PATH
	
	git remote -v

elif [ $1 == '-c' ]; then

	git remote set-url REMOTE_NAME GIT_PATH
	
	git remote -v
	
elif [ $1 == '-r' ]; then

	git remote rename REMOTE_NAME GIT_PATH
	
	git remote -v

else

	echo 'Check first parameter'

fi

exit 0




