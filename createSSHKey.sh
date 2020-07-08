# !/bin/bash
######################
# bash createSSHKey.sh
######################
### variables
#
EMAIL=$(git config user.email)

######################

ssh-keygen -t rsa -b 4096 -C "$EMAIL"


eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa


# https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account

clip < ~/.ssh/id_rsa.pub

echo ""
cat ~/.ssh/id_rsa.pub
echo ""
echo "Go to Git and CNTL+V into =>"
echo "Settings -> Add SSH and GPG Key -> Add New Key"
echo ""
echo "Note! RSA Key is in memory, use CNTL+V to pass id_RSA"

exit 0