---
layout: post
title: DNSCrypt ve Unbound kullanarak DNS Trafiğini Şifrelemek
date: 2016-11-22
type: post
categories: linux
description: Günlerden bir gün bu arkadaşınız demiş benim DNS sorgularım niye plaintext olarak yapılıyor. Başlamış düşünmeye demiş ben bunu şifreleyim de
---

Günlerden bir gün bu arkadaşınız demiş benim DNS sorgularım niye plaintext olarak yapılıyor. Başlamış düşünmeye demiş ben bunu şifreleyim de dış mihraklar göremesin hemen aşağıdaki adımları sırasıyla uygulamış ve bu arkadaş artık mutluymuş. Ama bu işlemleri aşağıdaki müzik eşliğinde yapıyormuş ve bu onun hoşuna gidiyormuş

<iframe width="640" height="360" src="https://www.youtube-nocookie.com/embed/783-HfoDahI" frameborder="0" allowfullscreen></iframe>

Müzik eşliğinde aşağıdaki adımları uyguluyorsunuz.

```
apt-get install unbound dnscrypt-proxy
```

uygulama kurulumlarımız artık tamam sıra geldi konfigürasyonları tamamlamaya ilk olarak `dnscrypt-proxy` uygulamasını kurcalıyoruz.

```
mertcan@0x2e88ce4:~/Desktop$ cat /etc/default/dnscrypt-proxy 
# What local IP the daemon will listen to, with an optional port.
# The default port is 53. If using systemd, this is not used and must be
# specified in dnscrypt-proxy.socket.
DNSCRYPT_PROXY_LOCAL_ADDRESS=127.0.0.31:53

# Remote DNS(Crypt) resolver.
# You can find a list of resolvers at
# /usr/share/dnscrypt-proxy/dnscrypt-resolvers.csv.
DNSCRYPT_PROXY_RESOLVER_NAME=cisco

# Extra flags to pass to dnscrypt-proxy
DNSCRYPT_PROXY_OPTIONS=""
```

`DNSCRYPT_PROXY_RESOLVER_NAME=` değerine karşılık gelen kullanacak olduğunuz dns sağlayıcısıdır. Ben bu ayarlamayı yaparken `cisco` tercih ettim.

bunun dışında özel bir lokal adres kullanacaksanız bunu da `DNSCRYPT_PROXY_LOCAL_ADDRESS=127.0.0.31` adresini düzenleyerek yapabilirsiniz.

Süreci başlatıyorsunuz

```
systemctl start dnscrypt-proxy
```

Sıra geldi DNS sorgularını ön belleğe aldıracağımız, hayatımızı düzene sokacağımız, güvenliğimizi biraz daha arttıracağımız DNS çözümleyicisini dürteceğiz zaten kurulumunu yapmıştık ayarlamalarınıda şu şekilde yapıyoruz.

önce gerekli olan `root.hints` dosyasını indirip klasörde yerini aldıralım.

```
wget -c ftp://ftp.internic.net/domain/named.cache -O /etc/unbound/root.hints
```

Ön tanımlı olarak Unbound DNS uygulaması DNSSEC yapısını aktif ettiği için bunu ek olarak ayarlamamıza gerek yok `unbound.conf.d` klasörü içerisine geçişinizi yapın ve aşağıdaki gibi bir dosya oluşturun ben kendi adımı kullandım

```
nano mertcan.conf
```

Ve içerisini aşağıdaki gibi doldurdum.

```
server:
  root-hints: "/etc/unbound/root.hints"
  interface: 127.0.0.69
  access-control: 127.0.0.69/8 allow
  private-address: 127.0.0.69/8

  harden-short-bufsize: yes
  harden-large-queries: yes

  cache-max-ttl: 86400
  cache-min-ttl: 3600
  do-ip4: yes
  do-ip6: no
  do-udp: yes
  do-tcp: yes
  hide-version: yes
  hide-identity: yes
  harden-glue: yes
  prefetch: yes
  prefetch-key: yes
  do-not-query-localhost: no
  harden-dnssec-stripped: no
  logfile: "/var/log/unbound.log"
  val-log-level: 2
  verbosity: 1

forward-zone:
  name: "."
  forward-addr: 127.0.0.31
```

Kullanacak olduğum ip adresi `127.0.0.69` olduğu için `interface: 127.0.0.69` olarak düzenlemeyi yaptım ve `access-control` ile `private-address` için aynı şekilde düzenledim. Forward kısmında ise Dnscrypt için ayarladığımız ip adresini ekledim ki oraya yönlendirsin.

Hemen ardından kayıt edip çıktım ve kendi DNS çözücü mü DNSCrypt ile ayarlamış oldum. Bu sayede DNS engellemelerinin önüne geçtim ve Cache yapısı sayesinde DNS sorgularını kısaltmayı başardım.

İşlemler bittikten sonra sizi şuraya alıyoruz ve DNS'yi nasıl ekleyeceğinizi gösteriyoruz. [Network Manager Bir Kanser Hücresi](https://mertcangokgoz.com/network-manager-bir-kanser-hucresi/)

öptüm bye <3