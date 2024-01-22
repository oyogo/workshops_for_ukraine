#!/bin/bash
# Calculate the sum of two integers with pre initialize 
LOG_LOCATION=/path/to/logfiles/folder/
exec > $LOG_LOCATION/bashscript_log_file.log 2>&1   


################
# Uncomment if you want the script to always use the scripts
# directory as the folder to look through
#REPOSITORIES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPOSITORIES=`pwd`

IFS=$'\n'

for REPO in `ls "$REPOSITORIES/"`
do
  if [ -d "$REPOSITORIES/$REPO" ]
  then
    echo "Updating $REPOSITORIES/$REPO at `date`"
    if [ -d "$REPOSITORIES/$REPO/.git" ]
    then
      cd "$REPOSITORIES/$REPO"
      git status
      echo "Pulling"
      git pull
    else
      echo "Skipping because it doesn't look like it has a .git folder."
    fi
    echo "Done at `date`"
    echo
  fi
done

