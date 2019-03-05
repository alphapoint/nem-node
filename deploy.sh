#!/bin/bash
echo ${TRAVIS_JOB_NUMBER}
echo ${TRAVIS_TAG}
VERSION=`grep '"version":' package.json | sed 's/.*: "//' | sed 's/",//'`
echo "tagging nem-node with version: " ${VERSION}
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin devopsdockerreg.azurecr.io
docker tag nem-node devopsdockerreg.azurecr.io/nem-node:${VERSION}
docker tag nem-node devopsdockerreg.azurecr.io/nem-node:latest
echo "pushing devopsdockerreg.azurecr.io/nem-node:"${VERSION}
docker push devopsdockerreg.azurecr.io/nem-node:${VERSION}
docker push devopsdockerreg.azurecr.io/nem-node:latest