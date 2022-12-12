#!/bin/bash
echo "Enter the URL:"
read url
str="https://"
regex='^(https?)://'
if [[ ! $url =~ $regex ]]
then
 url=$str$url
fi
 git clone "$url" && cd $(basename "$url" .git) || 
 cd $(basename "$url" .git) && git pull
 echo "building... "
 echo "---docker compose down---"
 docker-compose down
 echo "---docker compose build---"
 docker-compose build
 echo "---docker compose up---"
 docker-compose up
 echo "pushing... "
 git push origin main
