#!/bin/bash

# PR degilse calistir.
if [ $TRAVIS_PULL_REQUEST == "true" ]; then
  echo "this is PR, exiting"
  exit 0
fi

# hatalari goster
set -e

# derle bro
echo "Site Olusturuluyor"
bundle exec jekyll build
touch .nojekyll

# html kodlarini guzellestir
echo "htmlbeautifier Calistiriliyor"
find ./_site -name "*.html" -exec bundle exec htmlbeautifier {} \;
echo "htmlbeautifier Tamamlandi"
sleep 1
echo "htmlproofer Calistiriliyor"

# html kodlarini kontrol et
bundle exec htmlproofer ./_site --disable-external --check-html --verbose
echo "htmlbeautifier Tamamlandi"
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