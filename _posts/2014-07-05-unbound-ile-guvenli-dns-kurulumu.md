---
layout: post
title: Unbound ile Güvenli DNS Kurulumu
date: 2014-07-05 23:46:02.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: Unbound güvenlik ön planda tutularak yazılmış bir DNS sunucusudur.Bildiğiniz üzere Türk telekom vakti zamanında DNS manipülasyonu yaparak insanları fişlemiş
---

Unbound güvenlik ön planda tutularak yazılmış bir DNS sunucusudur.Bildiğiniz üzere Türk telekom vakti zamanında DNS manipülasyonu yaparak insanları fişlemiş(tam olarak bilemiyoruz.)bununla birlikte insanlara medya,kurum ve kuruluşlarda konu ile ilgili bilgilendirme yapılmamıştır insanlarda google DNS kullandığını zannedip ip adreslerini değiştirmemiş ve benim tabirimle fişlenmeye devam etmişlerdir [Googlenin blog sayfasında](http://googleonlinesecurity.blogspot.ca/2014/03/googles-public-dns-intercepted-in-turkey.html) çıkan ve yetkililerin yaptığı açıklama pek hoş olmamıştı hatırlarsınız.Bunu ne şekilde değiştirebilirim diye düşünüyorsanız kendi DNS sunucunuzu kurmanız ve kullanmanızdan geçiyor diyebilirim UDP 53 kapatıldığında ise buda mümkün olmayacağından buna şükredin diyebilirim.Uzun lafın kısası şuanda burada anlatacaklarım kişisel bilgisayarınızda kullanabilmeniz içindir

Öncelikle baştan belirtmek istiyorum Kullanacağımız uygulama sisteminizde bir DNS sunucusu oluşturmaktadır.UDP 53 kullanan her hangi bir uygulamanız var ise baştan belirteyim onu silmeniz gerekecek.

# Windows İçin

Windowsda Kurulum aşırı derecede kolaydır.Gerekli olan uygulamayı [indiriyoruz.](https://unbound.net/download.html) Sonrasında yönetici olarak açmanız gerekiyor.Kurulum bittikten sonra işimiz dahada kolaylaşıyor hemen DNS ayarlarımıza geliyoruz. Eğer kullandığınız bir DNS varsa 2 sinide siliyorsunuz sonrasında DNS ayarlarını aşağıdaki gibi yapıyorsunuz.

![unboundkurulumugorsel1](/assets/unboundkurulumugorsel1-e1404590603451.png)

Kayıt edip çıkışımızı yapıyoruz.Ardından CTRL +R yapıyoruz çalıştır kısmına **"cmd"** yazıp başlatıyoruz.

      ipconfig /flushdns

Komutunu uyguluyoruz.Sonrasında Sistemimiz %98 Unbound u kullanmaya başlıyor.Bundan emin olmak için ise Aşağıdaki test sitelerini kullanabilirsiniz.

- [http://dnssec.vs.uni-due.de/](http://dnssec.vs.uni-due.de/)
- [http://test.dnssec-or-not.net/](http://test.dnssec-or-not.net/)

Eğer oradada test başarılı olursa güvenli dns kurulumunuz başarılı olmuş demektir.doya doya internetde gezebilirsiniz.

# Linux Sistemler İçin(Ubuntu etc.)

sistemde bulunan hazır repodan kuruyoruz.

      sudo apt-get update && sudo apt-get install unbound

Kurulum tamamlandıktan sonra root yetkilerinin elimize geçmesi lazım bunun içinde

      sudo -i

root olarak giriş yaptıktan sonra unbound bulunduğu klasöre atlamamız labım bunun için

      cd /etc/unbound

şimdi gerekli olan cache dosyasını indirmeye geldi sıra aşağıdaki linkden indirebilirsiniz.

      wget ftp://ftp.internic.net/domain/named.cache

şimdi ise TLS anahtarını oluşturmamız lazım bunun için aşağıdaki komutu veriyoruz.

      unbound-control-setup

isminde unbound geçen herşeyin sahip izni vermemiz lazım diğer izinler gereksiz ve güvenliğimizi tehdit edecektir.

      chown unbound:root unbound\_\*

Şimdi ise adında unbound geçenlerin izinlerini 440 yapıyoruz.

      chmod 440 unbound\_\*

hemen ardından eski config dosyamızı yedekliyoruz

      mv /etc/unbound/unbound.conf/etc/unbound/unbound.conf.default

içerisine ekleyeceğimiz ayarlar aşağıdadır kendinize göre değiştirebilirsiniz.

      > cat > /etc/unbound/unbound.conf <<-EOF
      > server:
      > access-control: 127.0.0.0/8 allow
      > access-control: 192.168.42.0/24 allow
      > auto-trust-anchor-file: "/var/lib/unbound/root.key"
      > verbosity: 1
      > statistics-interval: 120
      > num-threads: 1
      > interface: 0.0.0.0
      > outgoing-range: 512
      > num-queries-per-thread: 1024
      > msg-cache-size: 16m
      > rrset-cache-size: 32m
      > msg-cache-slabs: 4
      > rrset-cache-slabs: 4
      > cache-max-ttl: 86400
      > infra-host-ttl: 60
      > infra-lame-ttl: 120
      > infra-cache-numhosts: 10000
      > infra-cache-lame-size: 10k
      > do-ip4: yes
      > do-ip6: no
      > do-udp: yes
      > do-tcp: yes
      > do-daemonize: yes
      > logfile: ""
      > use-syslog: no
      > identity: "DNS"
      > version: "1.4"
      > hide-identity: yes
      > hide-version: yes
      > harden-glue: yes
      > do-not-query-address: 127.0.0.1/8
      > do-not-query-localhost: yes
      > module-config: "iterator"
      > local-zone: "localhost." static
      > local-data: "localhost. 10800 IN NS localhost."
      > local-data: "localhost. 10800 IN SOA localhost. nobody.invalid. 1 3600 1200 604800 10800"
      > local-data: "localhost. 10800 IN A 127.0.0.1"
      > local-zone: "127.in-addr.arpa." static
      > local-data: "127.in-addr.arpa. 10800 IN NS localhost."
      > local-data: "127.in-addr.arpa. 10800 IN SOA localhost. nobody.invalid. 2 3600 1200 604800 10800"
      > local-data: "1.0.0.127.in-addr.arpa. 10800 IN PTR localhost."
      > local-zone: "ubuntuprecise.net." static
      > local-data: "ubuntuprecise.net. 86400 IN NS ns1.ubuntuprecise.net."
      > local-data: "ubuntuprecise.net. 86400 IN SOA ubuntuprecise.net. proxy.ubuntuprecise.net. 3 3600 1200 604800 86400"
      > local-data: "ubuntuprecise.net. 86400 IN A 192.168.34.4"
      > local-data: "www.ubuntuprecise.net. 86400 IN A 192.168.34.4"
      > local-data: "ns1.ubuntuprecise.net. 86400 IN A 192.168.34.4"
      > local-data: "mail.ubuntuprecise.net. 86400 IN A 192.168.34.4"
      > local-data: "ubuntuprecise.net. 86400 IN MX 10 mail.ubuntuprecise.net."
      > local-data: "ubuntuprecise.net. 86400 IN TXT v=spf1 a mx ~all"
      > local-zone: "42.168.192.in-addr.arpa." static
      > local-data: "42.168.192.in-addr.arpa. 10800 IN NS ubuntuprecise.net."
      > local-data: "42.168.192.in-addr.arpa. 10800 IN SOA ubuntuprecise.net. proxy.ubuntuprecise.net. 4 3600 1200 604800 864000"
      > local-data: "1.42.168.192.in-addr.arpa. 10800 IN PTR ubuntuprecise.net."
      > forward-zone:
      > name: "."
      > forward-addr: 8.8.8.8
      > forward-addr: 8.8.4.4
      > forward-addr: 208.67.222.222
      > forward-addr: 208.67.220.220
      > remote-control:
      > control-enable: yes
      > control-interface: 127.0.0.1
      > control-interface: 192.168.42.1
      > control-port: 953
      > server-key-file: "/etc/unbound/unbound_server.key"
      > server-cert-file: "/etc/unbound/unbound_server.pem"
      > control-key-file: "/etc/unbound/unbound_control.key"
      > control-cert-file: "/etc/unbound/unbound_control.pem"
      > EOF

yapılan ayarlarda hata olup olmadığını görmek için

      unbound-checkconf /etc/unbound/unbound.conf

her hangi bir hata vermez ise unbound dns sunucumuzu başlatıyoruz sonrasında DNS ayarlarını 127.0.0.1 yapmanız yeterlidir.
