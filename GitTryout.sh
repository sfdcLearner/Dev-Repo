#echo "clone started"
date
REPO_URL="https://github.com/sfdcLearner/Dev-Repo.git"
REPO_NAME="newRepo/Dev-Repo"
#[ -d "$REPO_NAME" ] && echo "Directory /shell/$REPO_NAME exists."
#echo "checking $REPO_NAME/.git"
#[ -d "$REPO_NAME/.git" ] && echo "GIT exists."

if [ -d "$REPO_NAME" ];
then 
    echo "Repo exists!"
    if [ ! -d "$REPO_NAME/.git" ];
    then
        echo "Git doenst exist...clone started"
        git clone $REPO_URL
    else 
        echo "git exists!"
        echo "pulling from git"
        cd "$REPO_NAME"
        git pull
    fi
else
    echo "repo doesn't exist"
    echo "creating repo and cloning"
    mkdir "newRepo"
    cd "newRepo"
    git clone $REPO_URL
fi
echo "process complete"
#cd "newRepo"
#git clone $REPO_URL
date

first_function () {
    echo "my first function"
}

echo "$(first_function)"
# calling function
first_function