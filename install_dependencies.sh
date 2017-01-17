#!/bin/bash
set -ev

HUGO_VERSION=$1

if [[ ! -s tools/hugo ]] ; then
  wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz
  tar -xzf hugo_*.tar.gz
  mkdir -p tools
  cp hugo*/hugo* tools/hugo
  rm -rf hugo_*
fi

tools/hugo version
npm install # Temporary workaround since travis does not have yarn out of the box
