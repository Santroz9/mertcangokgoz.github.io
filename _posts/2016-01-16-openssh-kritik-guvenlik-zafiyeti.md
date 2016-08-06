---
layout: post
title: OpenSSH Kritik Güvenlik Zafiyeti
date: 2016-01-16 07:56:36.000000000 +02:00
type: post
categories: guvenlik
description: OpenSSH projesinde 15 Ocak itibari ile tespit edilmiş ve sunucu tarafındaki gizli anahtarların çalınmasına yol açabilecek olan kritik güvenlik
---

**OpenSSH** projesinde 15 Ocak itibari ile tespit edilmiş ve sunucu tarafındaki gizli anahtarların çalınmasına yol açabilecek olan kritik güvenlik zafiyeti **CVE-2016-0777** ve **CVE-2016-0778** kodu ile yayınlanmıştır.Etkilenmiş olan sistemlerde bu açıktan faydalanmak için aşağıdaki uygulamayı kullanmak mümkün

[CVE-2016-0777 Exploit](http://bit.ly/1QcwhPI)

Bu zafiyetten etkilenen işletim sistemleri ise şunlardır;

- CentOS Linux 7.x
- RHEL (RedHat Enterprise Linux) 7.x
- Debian Linux (squeeze, wheezy, jessie, stretch, and sid release)
- Ubuntu Linux 15.10
- Ubuntu Linux 15.04
- Ubuntu Linux 14.04 LTS
- Ubuntu Linux 12.04 LTS
- SUSE Linux Enterprise Server 12 (SLES 12)
- SUSE Linux Enterprise Server 12 Service Pack 1 (SLES 12 SP1)
- SUSE Linux Enterprise Server 11 Service Pack 4 (SLES 11 SP4)
- SUSE Linux Enterprise Server 11 Service Pack 3 (SLES 11 SP3)
- openSUSE 13.2
- openSUSE Leap 42.1

Etkilenen sürümler ise 4.7 ile 7.1 arasındaki tüm sürümler olarak tespit edilmiştir.

Bu Zafiyetden etkilenmemek amacıyla sisteminizde aşağıdaki değişiklikleri gerçekleştirdiğiniz taktirde güncelleme yayınlanana kadar korunmuş olacaksınız.

**FreeBSD**

    sudo -s
    echo 'UseRoaming no' >> /etc/ssh/ssh_config

Tüm Linux Sistemler

    sudo su
    echo 'UseRoaming no' | sudo tee -a /etc/ssh/ssh_config

**MacOS** Sistemler

    echo "UseRoaming no" >> ~/.ssh/config

**OpenBSD**

    su -
    echo -e 'Host *\nUseRoaming no' >> /etc/ssh/ssh_config

### CVE-2016-0778 Zafiyetinden kurtulmak için ise

Sistemlerinizi güncellemeniz yeterlidir.böylelikle CVE-2016-0778 zafiyetinden kolaylıkla korunabilirsiniz.

**Debian** Tabanlı Sistemler

    sudo apt-get update
    sudo apt-get upgrade

**CentOS**

    sudo yum update

**FreeBSD**

    freebsd-update fetch
    freebsd-update install
