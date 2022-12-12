#!/bin/bash

echo "~~~ Let's set up our Inception! ~~~"

echo ""
echo "Please enter path to folder where your wordpress and mariadb files will be saved..."
echo "Something like \"/mnt/nfs/homes/amarchan/Documents/inception/backup\""
echo "-->"
read path

if [ ! -d "$path" ]; then
    echo "Couldn't find repository. Please make sure it exists and have the matching rights."
    exit 1
fi

echo "$path" > srcs/requirements/backup_config/backup_path.txt

cp srcs/requirements/tools/yml_replacer.yml srcs/docker-compose.yml

# replace 'path/to/data' by the path entered by the user in srcs/docker-compose.yml
# s --> substitute
# g --> "global", iow : for every string corresponding to $path
cat srcs/docker-compose.yml | sed "s+pathtodata+$path+g" > srcs/docker-compose.yml.tmp
mv srcs/docker-compose.yml.tmp srcs/docker-compose.yml

echo "~~~ Set up done! ~~~"