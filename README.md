This project is a test utility used to identify the best strategy for pulling & deleting multiple Docker images.
It currently has two "strategies": pulling image and immidiatly deleting it or pulling all images and then deleting them.
The utility will pull the images based on the specified startegy and print the time it took.

You can run the utility on multiple terminals, checking what is the impact of pulling images in parallel.

##Usage:
./parallel.sh [arguments] <image file>

**Arguments:**
  --pull_and_delete        Pull image and delete immidiatly
  
  --pull_all_and_delete    Pull all images and then delete them


Note: the <image file> is a text file with list of images - eacn image name in a seperate line.
