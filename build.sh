#!/bin/bash

# only proceed script when started not by pull request (PR)
if [ $TRAVIS_PULL_REQUEST == "true" ]; then
  echo "this is PR, exiting"
  exit 0
fi

# hatalari goster
set -e

# derle bro
jekyll build

# temizlik
rm -rf ../mertcangokgoz.github.io.master

#master branch clone islemi
git clone https://${GH_TOKEN}@github.com/MertcanGokgoz/mertcangokgoz.github.io.git ../mertcangokgoz.github.io.master

# master branch tasima islemi
cp -R _site/* ../mertcangokgoz.github.io.master

# commit and push generated content to `master' branch
# since repository was cloned in write mode with token auth - we can push there
cd ../mertcangokgoz.github.io.master
git config user.email "mertcan.gokgoz@gmail.com"
git config user.name "MertcanGokgoz"
git add -A .
git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"
git push --quiet origin master > /dev/null 2>&1
