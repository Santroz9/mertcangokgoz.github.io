---
layout: post
title: SSHGuard kullanarak SSH Brute Force saldırılarını engellemek
date: 2013-10-13 18:20:42.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: SSHGuard C dili ile yazılmış hızlı ve hafif bir uygulamadır günlük aktiviteleri takip ederek büyük çaptaki saldırılara karşı sisteminizi korumaya
---

[SSHGuard](http://www.sshguard.net/) C dili ile yazılmış hızlı ve hafif bir uygulamadır günlük aktiviteleri takip ederek büyük çaptaki saldırılara karşı sisteminizi korumaya yardımcı olur.Eğer bir kişi sürekli olarak SSH üzerinden sunucuya ulaşmaya çalışır ise uygulama sizin yerinize iptables düzenlemesi yaparak saldırı alınan ip adresini engeller.Daha sonra ise saldırı durduğu zaman engellenen ip adresini serbest bırakır.

![sshguardimages1](/assets/sshguardimages11.jpg)

# SSHGuard Kurulumu

centos 5 üzerine ben kurulumu yaptığımdan dolayı aşağıdaki adımları yaparken göz önünde bulundurunuz

> rpm -ivh http://flexbox.sourceforge.net/centos/5/i386/sshguard-1.5-2.el5.i386.rpm

Diğer sistemler de kullanmak isteyenler [Tıklayın](http://pkgs.org/download/sshguard)

# SSHGuard için iptables/Netfilter yapılandırması

SSHGuard için ipfilterde yapılandırma dosyası yoktur.yapılacak tek şey engelleme kurallarını engellemek için SSHGuarda izin vermek ve gereken ayarlamaları yapmaktır.

ipv4 için

> iptables -N sshguard

ipv6 için

> ip6tables -N sshguard

Girişleri güncelledikten sonra --dport özelliğini kullanarak portları da koruyabilirsiniz yada portlara erişimi tamamen kapatmak isteyebilirsiniz.

## Saldırganlara karşı tüm trafiğin engellenmesi

ipv4 için

> iptables -A INPUT -j sshguard

ipv6 için

> ip6tables -A INPUT -j sshguard

## Saldırganlara karşı SSH, FTP, POP, IMAP belirli hizmetlerin engellenmesi

ipv4 için

> iptables -A INPUT -m multiport -p tcp --destination-ports 21,22,110,143 -j sshguard

ipv6 için

> ip6tables -A INPUT -m multiport -p tcp --destination-ports 21,22,110,143 -j sshguard

Sonrasında kuralları kayıt edip çıkın

> service iptables save

- Mümkün olduğunda tüm SSH trafiğini sunucuya kabul etmeyin
- Varsayılan güvenlik duvarı ayarlarını mutlaka kendinize göre düzenlemeyi unutmayın

## Bir kaç iptables Örneği

#### SSHGuardın kötü dediği herşeyi yasaklatmak

> iptables -A INPUT -j sshguard

#### Trafiğe açmak isterseniz

> iptables -A INPUT -p tcp --dport 22 -j ACCEPT
> iptables -A INPUT -p udp --dport 53 -j ACCEPT
> iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> iptables -A INPUT -p tcp --dport 443 -j ACCEPT

##### Herşeyi Yasaklamak için

> iptables -P INPUT DROP
# iptables/netfilter kullanmadan SSHGuard yapılandırma

eğer detaylı bir şekilde iptables kullanmak istemezseniz aşağıdaki komutları kullanarak sshguard izinleri dışında kimsenin işlem yapamamasını sağlayabilirsiniz.

> iptables -F
> iptables -X
> iptables -P INPUT ACCEPT
> iptables -P FORWARD ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -N sshguard
> iptables -A INPUT -j sshguard

Son olarak da kayıt ediyoruz ve işlemimiz tamamlanıyor.

> service iptables save
