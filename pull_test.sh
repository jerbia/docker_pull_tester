#!/bin/bash

SECONDS=0

### Usage
function display_usage() {
       	echo "=== Aqua Parallel Puller Test Utility ==="
       	echo -e "\nUsage:\n$0 [arguments] <image file>\n"
       	echo -e "Arguments:"
       	echo -e "  --pull_and_delete        Pull image and delete immidiatly"
       	echo -e "  --pull_all_and_delete    Pull all images and then delete them"
       	echo -e ""
}


### Pull image and delete it immidiatly after pull
function pull_and_delete_immediately() {
       	while read IMAGE_NAME
       	do
       		echo "docker pull $IMAGE_NAME"
       		docker pull $IMAGE_NAME
       		echo "docker rmi -f $IMAGE_NAME"
       		docker rmi -f $IMAGE_NAME
       	done < $1
}

### Pull image and delete it immidiatly after pull
function pull_all_and_delete() {
        while read IMAGE_NAME
        do
       		echo "docker pull $IMAGE_NAME"
                docker pull $IMAGE_NAME
        done < $1
       	while read IMAGE_NAME
        do
       		echo "docker rmi -f $IMAGE_NAME"
                docker rmi -f $IMAGE_NAME
        done < $1
}

### Main
if [ "$1" == "--pull_and_delete" ]
then
       	pull_and_delete_immediately $2
elif [ "$1" == "--pull_all_and_delete" ]
then
       	pull_all_and_delete $2
else
        display_usage
        exit
fi

duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
