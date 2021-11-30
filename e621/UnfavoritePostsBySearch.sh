#!/usr/bin/env bash

USERNAME=""
PASSWORD=""
SEARCH=""

OUTPUT=$(curl -A "advanced-rest-client" -u $USERNAME:$PASSWORD https://e621.net/posts.json\?tags=$SEARCH\&limit=320 | grep -oP '(?<="id":)\d+')
declare -a LIST=($OUTPUT)

COUNT="${#LIST[@]}"
POS=0

for i in "${LIST[@]}"
do
    sleep 1s
    let POS++
    curl -A "advanced-rest-client" -u $USERNAME:$PASSWORD -X "DELETE" https://e621.net/favorites/$i.json
    echo "$i - [$POS/$COUNT]"
done