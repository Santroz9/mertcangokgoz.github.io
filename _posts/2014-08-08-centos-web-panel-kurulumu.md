---
layout: post
title: Centos Web Panel Kurulumu
date: 2014-08-08 12:43:46.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Centos web panel adındanda anlaşıldığı üzere Centos geniliştiricilerinin yapmış olduğu ve centos üzerinde muazzam bir stabilite ile çalışan bir kontrol
---

Centos web panel adındanda anlaşıldığı üzere Centos geniliştiricilerinin yapmış olduğu ve centos üzerinde muazzam bir stabilite ile çalışan bir kontrol panelidir.Centos web panel kolay kullanımı ve hızlı olmasıyla kullanıcıların dikkatini kendine çekmeyi başlardı SSH ile yapılabilen neredeyse tüm işlemleri bu panel sayesinde yapabilirsiniz.Dedicated,VPS,VDS serverlarınızda güvenle kullanabilirsiniz hemde ücretsiz olarak.

## Özellikleri

- **Web Server**
- **Varnish Cache server (improve your server performances by 3x)**
- **Compiles Apache from source (improves up to 15% on performances)**
- Apache server status, configuration
- Edit apache vhosts, vhosts templates, include configuration
- Rebuild all apache Virtual hosts with one click
- **suPHP & suExec (improved security)**
- **Mod Security + OWASP rules (one click install, easy management)**
- **PHP**
- Compiles PHP from source (improves up to 20% on performances)
- PHP switcher (switch between PHP versions like: 5.2, 5.3, 5.4, 5.5)
- Simple php editor
- PHP addons with one click
- PHP.ini editor & PHP info & List modules
- **User Management**
- Add, List, Edit adn Remove Users
- User Monitoring (list users open files, listening sockets…)
- Shell access management
- User Limit Managment (Quota and Inodes)
- **DNS**
- FreeDNS (Free DNS Server, no need for additional IPs)
- Add, Edit, List and Remove DNS zones
- Edit nameserver IPs
- DNS zone template editor
- **Email**
- postfix & dovecot
- MailBoxes, Alias
- Roundcube webmail
- Postfix Mail queue
- **System**
- Hardware Information (CPU core and clock info)
- Memory Information (Memory usage info)
- Disk Info (Detailed Disk status)
- Software Info (kernel version, uptime…)
- Services Status (Quick services restart eg. Apache, FTP,Mail…)
- ChkConfig Manager (Quick list and manage your services)
- Network port usage
- Network configuration
- SSHD configuration
- **Monitoring**
- Live Monitoring (Monitor services eg. top, apache stats, mysql…)
- Use Java SSH Console within panel
- Services Configuration (eg. Apache, PHP, MySQL…)
- Run shell commands in screen/background
- **Security**
- **CSF Firewall (Best Linux Firewall)**
- SSL generator
- **SQL**
- MySQL Database Managment
- Add local or remote access user
- Live Monitor MySQL process list
- Create, Remove database
- Add additional users per database
- MySQL server configuration
- PhpMyAdmin (database managment)
- **Additional options**
- TeamSpeak 3 Manager (Voice servers)
- Shoutcast Manager (Shoutcast streaming servers)
- Auto-update
- Backup manager
- File Manager

Kurulumumuzu yapmak için sistemin Centos 6 olması gerekmektedir.Sitesinde bahsettiği gibi centos 5 de çalışmaktadır ancak tam olarak test etmemişler test etmek size kalmış...

    cd /usr/local/src
    wget http://dl1.centos-webpanel.com/files/cwp-latest.sh
    chmod 777 cwp-latest.sh
    sh cwp-latest.sh

Komutundan sonra bizi sistem hızımıza göre bi sabır testi bekliyor.2Gb ramlı bir sunucuda yaklaşık 40 dk sürmektedir.

![centoswebpanelgorsel1](/assets/centoswebpanelgorsel1.png)

![centoswebpanelgorsel2](/assets/centoswebpanelgorsel2.png)

Sırasıyla sisteme kurduğu tüm modülleri teker teker derlemektedir bu yüzdende uzun sürüyor ancak sistem açısından gayet makul oluyor.

![centoswebpanelgorsel3](/assets/centoswebpanelgorsel3.png)

Kurulumun son aşamasına geldiyseniz benim gibi bu şekilde bi ekranla karşılaşırsınız.Sonrasında ENTER dediğinizde sisteminiz uzun bi reboot sürecine geçecek sonrasında verilen parametreler ile panele girebilirsiniz.Dikkat edin oradaki bilgileri kayıt etmezseniz sonrasında sıkıntı çekebilirsiniz.
