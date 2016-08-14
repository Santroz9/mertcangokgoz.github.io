---
layout: post
title:  Jekyll ve Travis-Ci ile Statik Site Oluşturma
date: 2016-08-14
type: post
categories: linux
description:  Jekyll ile statik site oluştururken özellikle Github pages kullanırsanız sizin karşınıza bir takım sorunlar çıkacak bunlardan bir tanesi
---

Jekyll ile statik site oluştururken özellikle Github pages kullanırsanız sizin karşınıza bir takım sorunlar çıkacak bunlardan bir tanesi istediğiniz eklentinin çalışmaması yada sizin bi eklenti geliştirdiğinizde bu eklentiyi kullanamamanız oluyor.

Hal böyle olunca bizimde buna bir alternatif bulmamız gerekiyor. Bazı arkadaşlar kendi lokallerinde build işlemini yapıp atıyor ancak bunu otomatize edebilme imkanımız var Travic-ci sayesinde bu bağımlılıktan kurtulabiliyoruz.

Travis-Ci süreklilik entegrasyonu amacıyla kullanılan şeker mi şeker bir web sitesidir. Normalde projelerde hata tespitini kolaylaştırmak el ile yapılan işlemleri hızlandırmak sürümler arası farklılıkları kolay bir şekilde tespit etmek gibi pek çok işe yarıyor.

Kullanabilmemiz için gerekli olan bağımlılıklar ise şu şekilde

* Git yada herhangi bir sürüm takip uygulaması
* Projemizin test ortamları ile bir şekilde geliştiriliyor olması
* Bu iş için herhangi bir araca ihtiyaç duymak

Şimdi biz burada Travis-ci yi herhangi bir amaç için kullanmayacağız ne projemizi test edeceğiz nede hata tespitinde bulunacağız biz tamamen kendi menfaatlerimiz için travis'i kullanacağız. Build edip git üzerinden göndersin ve github da bunu yayınlasın biz eklentimizi kullanalım.

ilk olarak proje dosyalarınızı hazırlayın sitenizde hangi eklentiyi kullanacaksanız hangi düzenlemeleri yapacaksanız onları kişisel bilgisayarınızda düzenleyin ve bir köşeye atın

Şimdi bize github'da 2 adet branch lazım birinde sitenin proje dosyalarını tutucaz diğerinde ise statik dosyalar travis tarafından gönderilecek

```console
git checkout -b jekyll
```

diyerek master branch yanına yeni bir branch oluşturarak işlemimize başlıyoruz. Ardından dosyalarımızı jekyll alanına gönderiyoruz. Bu aşamada push işleminden önce branch değiştirip push etmeyi unutmayın.

```console
git checkout jekyll
git push origin jekyll
```

Branchlar arası geçişi yaptık gerekli olan tüm dosyaları jekyll branchına gönderdik şimdi master branch'da bi temizlik işlemi yapmamız gerekiyor. Bunun için ise şöyle bir yol izleyebiliriz. Boş bir adet klasör açarız ve içerisine giriş yaparak aşağıdaki adımları izleyebiliriz.

```console
git remote add [remote origin]
touch .gitignore
git add .
git commit -m "Empty
git push origin master -f
```

Bu yaptığımız işlemlerde master branch temizlemiş olduk artık jekyll branch için işlemlere geçebiliriz.

[Travis-Ci](https://travis-ci.org/) sitesine github hesabınız ile giriş yapıyorsunuz ve APİ iznini veriyorsunuz. Travisi çalıştıracağınız repoyu site üzerinden aktif hale getiriyorsunuz. Artık travis aktif ettiğiniz repoyu izlemeye başlıyor yaptığınız değişiklikleri PR yada push işlemlerini gözlemliyor ve talimatnameye göre işlem yapıyor.

## build.sh Düzenleme

Bu betiği hazırlarken sitenizin github repo adresini kullanacaksınız bende gördüğünüz gibi `mertcangokgoz.github.io` siz bu kısmı olduğu gibi değiştirerek betiği kullanabilirsiniz. Bir hata çıkmadan sorunsuz kullanabilirsiniz.

Burada dikkat edeceğiniz bir diğer nokta `.travis.yml`nin kullanacak olduğu secure parametresinde şifrelenmiş bir şekilde bulunacak olan github tokenimiz. Oluşturabilmek için sistemimizde travis paketinin kurulu olmasıda gerekiyor.

```console
gem install travis
```

Kurulum tamamlandıktan hemen sonra aşağıdaki komut ile secret keyimizi oluşturabiliriz bu işlemi yaparken github da kullanacak olduğunuz reponun bilgisayarınızdaki halinde yapın otomatik olarak dosyanın içerisine ekleme işlemi gerçekleştirecek.

```console
travis encrypt GH_TOKEN=<github-api-token> --add env.global
```

Betiğimizin son hali şu şekilde

```bash
#!/bin/bash

# PR degilse calistir.
if [ $TRAVIS_PULL_REQUEST == "true" ]; then
  echo "PR Gonderildi. Cikiliyor"
  exit 0
fi

# hatalari goster
set -e

# derle bro
echo "+===================================+"
echo "Site Olusturuluyor"
echo "+===================================+"

bundle exec rake build

echo "+===================================+"
echo "Statik Dosyalar Olusturuldu"
echo "+===================================+"

# temizlik
rm -rf ../mertcangokgoz.github.io.master

#master branch clone islemi
git clone https://${GH_TOKEN}@github.com/MertcanGokgoz/mertcangokgoz.github.io.git ../mertcangokgoz.github.io.master

# master branch tasima islemi
cp -R _site/* ../mertcangokgoz.github.io.master

# Dizine gir
echo "+===================================+"
echo "Dizine Geciliyor"
echo "+===================================+"

cd ../mertcangokgoz.github.io.master
touch .nojekyll

#Gitignore olustur
echo "+===================================+"
echo "Gitignore Olusturuluyor"
echo "+===================================+"

cat >.gitignore <<EOF
.ruby-version
.bundle
.sass-cache
.jekyll-metadata
Gemfile.lock
EOF

echo "+===================================+"
echo "Gitignore Olusturuldu"
echo "+===================================+"

#CNAME Olustur
echo "+===================================+"
echo "CNAME Olusturuluyor"
echo "+===================================+"

echo mertcangokgoz.com > CNAME

echo "+===================================+"
echo "CNAME Olusturuldu"
echo "+===================================+"

#biraz bekle
sleep 2

#Githuba gonder
echo "+===================================+"
echo "Githuba Gonderiliyor"
echo "+===================================+"

git config user.email "mertcan.gokgoz@gmail.com"
git config user.name "MertcanGokgoz"
git add -A .
git commit -a -m "Generated Jekyll site by Travis CI #$TRAVIS_BUILD_NUMBER"

#guvenlik icin push ciktisi gosterilmeyecek
git push --quiet origin master > /dev/null 2>&1

echo "+===================================+"
echo "Githuba Gonderildi"
echo "+===================================+"
```

## Travis için Betik düzenleme

Travis reponuzda bulunan 1 adet dosyayı gözlemliyor `.travis.yml` bu dosya aracılığı ile travisi kontrol edebiliyorsunuz. Sistemde buna göre işlemleri yapıyor ve size sunuyor.

Betik ilk olarak kullanılacak olan dilin ve işletim sisteminin tanımı ile başlıyor.

```console
os: linux
language: ruby
```

ardından sırasıyla jekyll için gerekli olan gemlerin kurulması ile devam ediyoruz.

```console
install:
- bundle install
```

Şimdi deploy aşamasında kullanılacak olan scriptin bağımlılıklarını gidermek ve ön hazırlığı yapmak

```console
before_script:
- sudo apt-get install ditaa
- chmod +x build.sh
```

Şimdi düzenlediğimiz ana scripti çalıştırmaya geldi sıra 

```console
script: "./build.sh"
branches:
  only:
  - jekyll
```

kullanılacak ruby sürümünü belirtelim

```
rvm:
- 2.3.1
```

Ne olup bittiğini mail olarak göndermesi için 2 adet mail belirliyorum. Başarılı olduğunda mail atmayacak ancak başarısız olduğu her zaman her iki mail adresine de mail göndermiş olacak 

```
notifications:
  email:
    recipients:
    - mertcan.gokgoz@gmail.com
    - admin@mertcangokgoz.com
    on_success: never
    on_failure: always
```

Gerekli olan secret bilgilerimizi ve işlemi hızlandırma amacıyla kütüphaneyi ekliyoruz.

```
env:
  global:
    - NOKOGIRI_USE_SYSTEM_LIBRARIES=true
    - secure: [secure-token]
```

## Dikkat edilmesi gerekenler

Github access token oluşturulurken sadece aşağıdaki iznin verilmesi gerekmektedir. Kesinlikle tüm izinleri vermeyin

![githubtokenname1](/assets/githubtokenrepo1.png)

`_config.yml` içerisinde exclude bölümü şu şekilde değiştirilmelidir.

```
exclude: [LICENSE, CNAME, README.md, .gitignore, Gemfile, Gemfile.lock, .travis.yml, .pullapprove.yml, .ruby-version, .bundle, build.sh, vendor, Rakefile]
```

`.gitignore` dosyasının içeriği aşağıdaki gibi düzenlenmelidir.

```
.ruby-version
.bundle
Gemfile.lock
```

`Rakefile` kullanacaksanız aşağıdaki gibi olmalıdır.

```ruby
# coding: utf-8
require "yui/compressor"
require "html_compressor"

task :default => [:build]

desc "Minify CSS"
task :minify_css do
  puts "## Minifying CSS"
  compressor = YUI::CssCompressor.new
  Dir.glob("_site/**/*.css").each do |name|
    puts "Minifying #{name}"
    input = File.read(name)
    output = File.open("#{name}", "w")
    output << compressor.compress(input)
    output.close
  end
end

desc "Minify JS"
task :minify_js do
  puts "## Minifying JS"
  compressor = YUI::JavaScriptCompressor.new
  Dir.glob("_site/**/*.js").each do |name|
    puts "Minifying #{name}"
    input = File.read(name)
    output = File.open("#{name}", "w")
    output << compressor.compress(input)
    output.close
  end
end

desc "Minify HTML"
task :minify_html do
  puts "## Minifying HTML"
  compressor = HtmlCompressor::HtmlCompressor.new
  Dir.glob("_site/**/*.html").each do |name|
    puts "Minifying #{name}"
    input = File.read(name)
    output = File.open("#{name}", "w")
    output << compressor.compress(input)
    output.close
  end
end

desc "Build jekyll locally"
task :build do
  puts "## Building Markdown File"
	system("bundle exec jekyll build")
  puts "## Building Finished"
  # Apply minification tasks
  Rake::Task[:minify_css].execute
  Rake::Task[:minify_js].execute
  Rake::Task[:minify_html].execute
  puts "## Minifying Finished"
end
```

Sistemde her şey otomatik githuba gönderilmesi işlemi