#!/bin/sh
export VER=6.0.0-1
export ARKIME_BRANCH=main

#docker images -a | grep "arkime-build" | awk '{print $3}' | xargs docker rmi

echo "ARKIME DOCKER 8"
docker image build build8 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-8:$VER

echo "ARKIME DOCKER 9"
docker image build build9 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-9:$VER

echo "ARKIME DOCKER 10"
docker image build build10 --platform=linux/amd64 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-10:$VER

echo "ARKIME DOCKER 20"
docker image build build20 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-20:$VER

echo "ARKIME DOCKER 22"
docker image build build22 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-22:$VER

echo "ARKIME DOCKER 24"
docker image build build24 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-24:$VER

echo "ARKIME DOCKER Arch"
docker image build buildArch --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-arch:$VER

echo "ARKIME DOCKER Al2023"
docker image build buildAl2023 --platform=linux/amd64 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-al2023:$VER

echo "ARKIME DOCKER D12"
docker image build buildD12 --platform=linux/amd64 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-d12:$VER

echo "ARKIME DOCKER D13"
docker image build buildD13 --platform=linux/amd64 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-d13:$VER

### ARM

echo "ARKIME DOCKER Al2023 arm"
docker image build buildAl2023 --platform=linux/arm64 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-al2023-arm64:$VER

echo "ARKIME DOCKER 22 arm"
docker image build build22-arm --platform=linux/arm64 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-22-arm64:$VER

echo "ARKIME DOCKER 24 arm"
docker image build build24 --platform=linux/arm64 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-24-arm64:$VER

echo "ARKIME DOCKER D12 arm"
docker image build buildD12 --platform=linux/arm64 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-d12-arm64:$VER

echo "ARKIME DOCKER D13 arm"
docker image build buildD13 --platform=linux/arm64 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-d13-arm64:$VER

echo "ARKIME DOCKER 9 arm"
docker image build build9-arm --platform=linux/arm64 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-9-arm64:$VER

echo "ARKIME DOCKER 10 arm"
docker image build build10 --platform=linux/arm64 --no-cache=true --build-arg ARKIME_BRANCH=$ARKIME_BRANCH --tag andywick/arkime-build-10-arm64:$VER

exit 0

docker push andywick/arkime-build-8:$VER
docker push andywick/arkime-build-9:$VER
docker push andywick/arkime-build-10:$VER
docker push andywick/arkime-build-22:$VER
docker push andywick/arkime-build-24:$VER
docker push andywick/arkime-build-arch:$VER
docker push andywick/arkime-build-al2023:$VER
docker push andywick/arkime-build-d12:$VER
docker push andywick/arkime-build-d13:$VER

docker push andywick/arkime-build-9-arm64:$VER
docker push andywick/arkime-build-10-arm64:$VER
docker push andywick/arkime-build-al2023-arm64:$VER
docker push andywick/arkime-build-22-arm64:$VER
docker push andywick/arkime-build-24-arm64:$VER
docker push andywick/arkime-build-d12-arm64:$VER
docker push andywick/arkime-build-d13-arm64:$VER
