#!/bin/bash
export LC_ALL=C

usage() {
    echo """
    ./setup_project <project_name>
    """
}

PROJECT_NAME=$1
if [ -z $PROJECT_NAME ]; then usage; exit 1; fi

echo "Setting up project: $PROJECT_NAME"

# list of all files that contain template code for project setup
files=( conf/entrypoint.sh conf/supervisor.intranet.conf conf/uwsgi.ini docker-compose.yml Dockerfile project_dir/urls.py project_dir/settings.py project_dir/wsgi.py project_dir/templates/base.html project_dir/templates/index.html )

# Iterate files and replace template code with the project name
for f in "${files[@]}"
do
    sed -i '' -e "s/<project_name>/$PROJECT_NAME/" ${f}
done

# Rename config files
mv conf/nginx.project_name.conf conf/nginx.$PROJECT_NAME.conf
mv conf/supervisor.project_name.conf conf/supervisor.$PROJECT_NAME.conf

# Finally move project dir to new name
mv project_dir $PROJECT_NAME

echo "Finished setting up Project, get to work!"
