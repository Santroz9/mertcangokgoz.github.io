#!/bin/bash

# PR degilse calistir.
if [ $TRAVIS_PULL_REQUEST == "true" ]; then
  echo "this is PR, exiting"
  exit 0
fi

# hatalari goster
set -e

# dizin temizle
rm -r ./_site

# derle bro
bundle exec jekyll build
touch .nojekyll

# html kodlarini guzellestir
find ./_site -name "*.html" -exec bundle exec htmlbeautifier {} \;

# html kodlarini kontrol et
bundle exec htmlproof ./_site --disable-external --check-html --verbose

# temizlik
rm -rf ../mertcangokgoz.github.io.master

#master branch clone islemi
git clone https://${GH_TOKEN}@github.com/MertcanGokgoz/mertcangokgoz.github.io.git ../mertcangokgoz.github.io.master

# master branch tasima islemi
cp -R _site/* ../mertcangokgoz.github.io.master

# olusturulan icerik master branche gonderilecek
cd ../mertcangokgoz.github.io.master
git config user.email "mertcan.gokgoz@gmail.com"
git config user.name "MertcanGokgoz"
git add -A .
git commit -a -m "Generated Jekyll site by Travis CI #$TRAVIS_BUILD_NUMBER"
#guvenlik icin push ciktisi gosterilmeyecek
git push --quiet origin master > /dev/null 2>&1
