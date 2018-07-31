PWD2=$(pwd)
  
docker run -it --rm --name Python3Alpine -v "$PWD":$PWD2/ -w $PWD2/ redoracle/docker-container-alpine-linux-python3:latest python3 $1
