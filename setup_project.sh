#!/bin/sh

usage() {
    echo """
    ./setup_project <project_name>
    """
}

PROJECT_NAME=$1

if [ -z $PROJECT_NAME ]; then usage; exit 1; fi

echo "Setting up project: $PROJECT_NAME"

LC_ALL=C find ./ -type f -exec sed -i '' -e "s/<project_name>/$PROJECT_NAME/" {} \;
mv project_dir $PROJECT_NAME

echo "Finished setting up Project, get to work!"
