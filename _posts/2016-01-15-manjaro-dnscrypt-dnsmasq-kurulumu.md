---
layout: post
title: Manjaro DNSCrypt ve Dnsmasq Kurulumu
date: 2016-01-15 11:07:49.000000000 +02:00
type: post
categories: linux
description: OpenDNS öncülüğünde geliştirilmeye başlayan ve sorguları şifreleyen bir uygulama olan DNSCrypt Arch tabanlı sistemler de nasıl
---

Hizmet aldığınız **ISS** yerel ağ içinde çözülebilir olmayan herhangi bir etki alanı için IP adresi çözümünü **DNS** sunucuları yardımıyla sağlar.Ancak yapılan bu çözümleme saldırganlar tarafından suistimal edilebilir.Aynı zamanda **ISS** tarafından trafiğiniz izlenebilir yaptığınız **dns** sorguları kayıt altına alınabilir.Neyse ki, gizliliğimizi koruyarak veri bütünlüğünüzü sağlamak için geliştirilen basit bir takım uygulama setleri bulunuyor.

**OpenDNS** öncülüğünde geliştirilmeye başlayan ve sorguları şifreleyen bir uygulama olan **DNSCrypt** Arch tabanlı sistemlerde nasıl kurulacağını göstereceğim. DNS isteklerini ön beklemekte ve kullanımını kolaylaştırmak için ise **Dnsmasq** kullanacağız.

Yüce pacman'ımıza komutumuzu yönlendiriyoruz ve kurulumu yapıyoruz.Siz kurulum için aur da kullanabilirsiniz.

    sudo pacman -S dnscrypt-proxy dnsmasq

Hemen ardından servisi aktif ediyoruz.

    sudo systemctl enable dnscrypt-proxy.socket

Kurulumlar tamamlandıktan ve servisi de aktif ettikten sonra gereken yapılandırmalara geçiyoruz.

    sudo nano /etc/dnsmasq.conf

içerisindeki tüm her şeyi siliyoruz ve aşağıdaki satırları ekliyoruz.

    server=127.0.0.1#1053
    bogus-priv
    domain-needed
    filterwin2k
    interface=lo
    bind-interfaces
    cache-size=512
    no-resolv
    no-negcache

kayıt edip çıkışımızı yapıyoruz.Bu yaptığımız ayarlamayı eş zamanlı olarak **dnscrypt** da yapmamız lazım ki her ikisi de etkili bir biçimde kullanılsın.Hemen aşağıdaki dosya yoluna gidiyoruz ve gerekli olan ayarlamaları yapıyoruz.

    sudo nano /etc/conf.d/dnscrypt-config

DNS sorgularımızı yapacak olduğumuz sunucuları buraya tanımlıyoruz.Sevdiğiniz 2 adet **dns** sunucusunu dosya içerisine tanımlayın ben ovpn firmasının dns hizmetlerinden faydalandığım için benim ayarlamalarım şu şekilde

    DNSCRYPT_LOCALIP=127.0.0.1
    DNSCRYPT_LOCALPORT=1053
    DNSCRYPT_USER=nobody

    DNSCRYPT_PROVIDER_NAME=2.dnscrypt-cert.opennic-dns-ro1.ovpn.to
    DNSCRYPT_PROVIDER_KEY=C665:8FFD:3D64:FC86:DD2C:87D1:0DDA:6069:C0ED:2C71:5E8D:9705:2C21:C12F:8153:EC14
    DNSCRYPT_RESOLVERIP=93.115.92.252

    DNSCRYPT_PROVIDER_NAME2=2.dnscrypt-cert.sweden.ovpn.to
    DNSCRYPT_PROVIDER_KEY2=1014:0662:B5D6:B65B:6F55:4367:A77C:A057:DA1A:CE6A:D9ED:1C1F:040E:80A5:895C:83F5
    DNSCRYPT_RESOLVERIP2=95.215.46.195

    DNSCRYPT_RESOLVERPORT=5353

daha sonra servis içerisine **dnsmasq** tanımlaması yapmamızda gerekiyor yoksa ikisi uyumlu bir şekilde çalışmadığı için sorunlara sebebiyet verecek

    sudo systemctl edit dnscrypt-proxy.service --full

Dosyanızın içeriğinin ne olacağını bilmediğimden bu kısımda örnek vermek istemiyorum ancak servis dosyasının içersin de [unit] altında bir kaç tanımlama olacak bunun altına bir önceki tanımlamadan hemen önce aşağıdaki satırı ekliyoruz.

    Before=dnsmasq.service

Dosya içerisinde port kısmı görürseniz ki göreceksiniz de bunları yukarıdaki tanımladıklarımız ile değiştirmeniz gerekiyor ön tanımlı olarak **53** yazacaktır.Bunun yerine biz **1053** kullandık.Sizde bu şekilde ayarlayacaksınız.

Şimdi ise **dnsmasq** servisini çalıştırmaya geldi sıra

    sudo systemctl enable dnsmasq.service

Tüm bu değişiklikleri yaptıktan sonra servislerin ayarlamaları görmesi için her iki servisi de yeniden başlatıyoruz.Yaptığımız ayarlar geçerli oluyor.

    sudo systemctl restart dnscrypt-proxy.socket
    sudo systemctl restart dnsmasq.socket
