---
layout: post
title: Linux Sistemler için Ajenti Kurulumu
date: 2015-07-12 19:32:50.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Bu makalemizde açık kaynak kodlu ve bir birinden güzel özelliği olan Ajenti kurulumunu göstereceğim oldukça basit olan kurulumunda işletim
---

Bu makalemizde açık kaynak kodlu ve bir birinden güzel özelliği olan **Ajenti** kurulumunu göstereceğim oldukça basit.Kurulum için ise işletim sistemi aslında fark etmiyor.Günümüzde site barındırma işi için kullanılan tüm sistemleri destekliyor.Bunların başında ise;

- Ubuntu
- Debian
- RHEL/CentOS
- FreeBSD

oldukça stabil bir panel olan **Ajenti** kaynak tüketimi konusunda da rakiplerine göre oldukça az kaynak tüketiyor.

## Debian için Kurulum

Aşağıdaki komut ve(veya) komutlar ile **Debian** sistemler için oldukça kolay bir şekilde kurulum gerçekleştirebilirsiniz.

### 1.Yöntem

    wget -O- https://raw.github.com/ajenti/ajenti/1.x/scripts/install-debian.sh | sh

### 2.Yöntem

    wget http://repo.ajenti.org/debian/key -O- | apt-key add -
    echo "deb http://repo.ajenti.org/debian main main debian" >> /etc/apt/sources.list
    apt-get update && apt-get install ajenti
    service ajenti restart

Kurulumlar tamamlandıktan sonra panele **HTTPS** olarak güvenli bir şekilde **8000** portundan ulaşabilirsiniz öntanımlı olarak gelen kullanıcı adı **root** şifre ise **admin** dir.

## Ubuntu için Kurulum

Aşağıdaki komut ve(veya) komutlar ile **Ubuntu** sistemler için oldukça kolay bir şekilde kurulum gerçekleştirebilirsiniz.

### 1.Yöntem

    wget -O- https://raw.github.com/ajenti/ajenti/1.x/scripts/install-ubuntu.sh | sudo sh

### 2.Yöntem

    wget http://repo.ajenti.org/debian/key -O- | sudo apt-key add -
    echo "deb http://repo.ajenti.org/ng/debian main main ubuntu" | sudo tee -a /etc/apt/sources.list
    sudo apt-get update && sudo apt-get install ajenti
    sudo service ajenti restart
    ufw allow 8000

Kurulumlar tamamlandıktan sonra panele **HTTPS** olarak güvenli bir şekilde **8000** portundan ulaşabilirsiniz öntanımlı olarak gelen kullanıcı adı **root** şifre ise **admin** dir.

## RHEL/Centos için Kurulum(Centos 7)

Aşağıdaki komut ve(veya) komutlar ile **RHEL/Centos** sistemler için oldukça kolay bir şekilde kurulum gerçekleştirebilirsiniz.

### 1.Yöntem

    curl https://raw.githubusercontent.com/ajenti/ajenti/1.x/scripts/install-rhel7.sh | sh

### 2.Yöntem

    wget http://repo.ajenti.org/ajenti-repo-1.0-1.noarch.rpm
    rpm -i ajenti-repo-1.0-1.noarch.rpm
    yum install ajenti
    service ajenti restart

Kurulumlar tamamlandıktan sonra panele **HTTPS** olarak güvenli bir şekilde **8000** portundan ulaşabilirsiniz öntanımlı olarak gelen kullanıcı adı **root** şifre ise **admin** dir.

# Centos Üzerindeki Hatalar ve Çözümleri

**1."Package does not match intended download?"** Hatası için yapılmanız gereken aşağıdaki komutu çalıştırmak ve kurulumu tekrar başlatmak

    yum clean metadata

**2."Can't access panel at port 8000?"&nbsp;** Hatası için yapmanız gerekenler ise güvenlik duvarına aşağıdaki komutları vermek sonrasında panele ulaşabileceksiniz.

    firewall-cmd --permanent --zone=public --add-port=8000/tcp
    firewall-cmd --reload

## FreeBSD için Kurulum(Deneysel)

Aşağıdaki komut ve(veya) komutlar ile **FreeBSD&nbsp;** sistemler için oldukça kolay bir şekilde kurulum gerçekleştirebilirsiniz. FreeBSD için geliştirilen deneysel sürümle olmakla beraber bir takım hatalar alabilirsiniz.

    cd /usr/ports/devel/py-gevent; make install clean;
    cd /usr/ports/devel/py-lxml; make install clean;
    cd /usr/ports/devel/py-pip; make install clean;
    cd /usr/ports/net/py-ldap2; make install clean;
    cd /usr/ports/devel/libffi; make install clean;

**Ajenti** nin indirilmesi ve **pip** aracılığı ile kurulması aşaması

    pip install ajenti

**rc.d** scripti ilede işlemleri sonlandırıyoruz.

    wget https://raw.github.com/ajenti/ajenti/1.x/packaging/files/ajenti-bsd -O /etc/rc.d/ajenti

Kurulumlar tamamlandıktan sonra panele **HTTPS** olarak güvenli bir şekilde **8000** portundan ulaşabilirsiniz öntanımlı olarak gelen kullanıcı adı **root** şifre ise **admin** dir.

## Ajenti'ye Ait bir kaç görsel

![ajentianagorsel1](/assets/ajentianagorsel1.png)

![ajentiguvenlikduvari2](/assets/ajentiguvenlikduvari2.png)

![ajentinginx4](/assets/ajentinginx4.png)
