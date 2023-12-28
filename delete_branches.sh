#!/bin/bash
#Delete branches script by jquiroz 2023

default_branch="master"

#Check supplied parameter
#If no parameter was supplied, check if the current directory is a git repo 
if [ -z "$1" ]; then
echo "WARNING: No repo was supplied, assuming current directory"
repo_location=$(pwd)
else
if [ -d "$1" ]; then
repo_location=$1
else
echo $1 "is not a valid directory, try again"
exit
fi
fi

if [ ! -d "$repo_location/.git" ]; then
echo $repo_location "does not contain a git repository, exiting..."
exit
fi

#List branches in local repo
cd $repo_location
branches=$(git branch | grep -ve $default_branch)
if [[ -z $branches ]]; then
echo "There no branches (other than $default_branch) in this local repo"
exit
fi

echo "The following local branches will be deleted:"
git branch | grep -ve $default_branch

#Ask user for confirmation
echo "Press enter to continue, or Ctrl C to abort"
read answer
if [[ $answer = "" ]]
then
echo "Deleting non-$default_branch branches from repo" $repo_location
git checkout $default_branch &> /dev/null
git branch | grep -ve $default_branch | xargs -I{} git branch -D {}
fi
exit
