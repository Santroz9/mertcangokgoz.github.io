---
layout: post
title: Ubuntu Vm Üzerine Laravel Framework Kurulumu
date: 2016-11-26
type: post
categories: linux
description: Sanal makine üzerine testler için Laravel Framework kuralım dedik olay oldukça basit normalde ben debian yada centos kullanırım
---

Sanal makine üzerine testler için Laravel Framework kuralım dedik olay oldukça basit normalde ben debian yada centos kullanırım ama bu sefer elimde her iki işletim sisteminin isosu yoktu elimizde hazır ubuntu varken kuralım dedik

PHP kuralım

```
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php5.6
```

Hemen ardından composer kardeşi kuralım

```
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
``` 

Composer eşliğinde Laravel kurulumumuzu gerçekleştirelim ve **.bashrc** dosyasına aşağıda vermiş olduğum PATH ekleyelim

```
composer global require "laravel/installer"
export PATH="$PATH:$HOME/.composer/vendor/bin"
```

Geliştirme ortamımız için Apache ve gerekli olanları kuralım

```
sudo apt-get install apache2 libapache2-mod-php5
sudo apt-get install git
sudo apt-get install zip
```

Tasksel aracılığı ile LAMP kuralım

```
sudo apt-get install tasksel
sudo tasksel install lamp-server
```

Modları aktif edelim ve apacheyi yeniden başlatalım

```
sudo phpenmod mcrypt
sudo phpenmod mbstring
sudo a2enmod rewrite
sudo systemctl restart apache2
```

Komut satırından SQL kullanabilirsiniz ama bu canınızı sıkıyor ise bunun yerine **phpmyadmin** de kurabilirsiniz

```
sudo apt-get install phpmyadmin
```

Daha sonradan güncelleme için komut veriyoruz. `composer update --no-scripts`

ve gerekli olan diğer php kütüphanelerini ekliyoruz

```
sudo apt-get install php5.6-mbstring
sudo apt-get install php5.6-xml
```

Bundan sonra ihtiyacınız olan **.env** uzantılı dosya oluşturmak ve laravel projenizi güzelce kullanmak başka yapacağınız bir şey kalmıyor.