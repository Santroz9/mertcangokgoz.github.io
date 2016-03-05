---
layout: post
title: CloudLinux ve Centos için cPanel Kurulumu
date: 2015-07-09 22:53:34.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: cPanel dünyada ve Türkiye'de linux işletim sistemlerini yönetmek için kullanılan oldukça popüler bir kontrol panelidir. Kolaylıkla sitelerinizi
---

**cPanel** dünyada ve Türkiye'de linux işletim sistemlerini yönetmek için kullanılan oldukça popüler bir kontrol panelidir. Kolaylıkla sitelerinizi yönetebilir siteleriniz arası aklınıza gelebilen her şeyi neredeyse hemen hemen yapabilirsiniz.Ancak kurduğunuz bu panel 2 ye ayrılmıştır bunlardan ilki **WHM** bu kısımda sisteminizi yönetebilir eklentiler kurabilir güvenlik ayarlamaları yapabilir ve sisteme kullanıcı tanımlayarak birden çok siteyi sunucu üzerinde barındırabilirsiniz. İşte bu noktada devreye **cPanel** giriyor kullanıcıların kendi sistemlerini yönetmesi ve gereken ayarlamaları yapabilmelerine imkan sağlıyor.

## Minimum Sistem gereksinimleri

- 1GB Bellek
- 20GB Disk alanı
- Hali hazırda perl uygulamasının kurulu olması
- CentOS 7/6/5 , RHEL 6/5 , CloudLinux 6/5 sistemlerinden herhangi birisinin kurulu olması yeterlidir.

## Ana Bilgisayar Adı Tanımlanması(Hostname)

Bu kısımda düzenleyeceğiniz **hostname** ile sisteminize giriş yapacak **WHM/cPanel** kullanacağız bu yüzden yapacağınız bu işlemler sonunda bir yere not edin yada unutmayacağınız bir şeyler yazın örnek olarak bir firmanız var ve sunucularınıza farklı isimler vermek istiyorsunuz. Bunun için şöyle bir yol izleyebilirsiniz venus.mertcangokgoz.com yada mercy.mertcangokgoz.com sistem yada sunucu adlarında değişiklik olabilir standartlara uyumlu olması yeterli

    hostname venus.mertcangokgoz.com

bu aşamadan sonra kalıcı bir hale gelebilmesi için  **/etc/sysconfig/network** deki ana bilgisayar adını kalıcı olarak değiştirmeniz gerekiyor. İçerisine tanımlamayı yapmanız yeterli şöyleki

    HOSTNAME=venus.mertcangokgoz.com

Şimdi bu Ana bilgisayar adına ip adresini atayalım ki daha sonradan dışarıdan bu yola ulaşabilelim. **/etc/hosts** herhangi bir metin editörü ile açın içerisine şu tanımlamayı mutlaka yapın

    sunucu ip adresi venus.mertcangokgoz.com

## SELinux Devredışı bırakın

Kurulum işlemi gerçekleştirilirken Selinuxün açık olması kurulum esnasında bazı komutların çalışmamasına sebep olacaktır.Özellikle enforce modu da sıkıntılar çıkıyor bazı komutlar işlemiyor bu yüzden en iyisi devre dışı bırakmak bunun için ise

    setenforce 0

komutunu verdik kapattık ama kalıcı olmasını istiyoruz bunun için **/etc/sysconfig/selinux** herhangi bir metin editörü ile açıyoruz ve aşağıdaki değişikliği yapıyoruz.

    SELINUX=disabled

## WHM/cPanel Kurulumu

Yukarıda bahsettiğim işletim sistemlerinden bir tanesine sahipseniz **WHM/cPanel** kolaylıkla kurabilirsiniz.Bunun için tek yapmanız gereken aşağıdaki kurulum parametresini girmek daha sonra gerekli olan tüm herşeyi kendisi otomatik olarak yapacaktır. Size de kurulumun keyfini çıkartmak kalıyor.

    cd /home
    curl -o latest -L http://httpupdate.cpanel.net/latest
    sh latest

Sistem hızınıza göre kurulum süresi uzayıp kısalabilir genelde ise kurulum 1 saat yada 45 dakika sürmekte kurulumlar tamamlandıktan sonra tanımlamış olduğunuz hostname ile panelinize giriş yapabilirsiniz.

    https://venus.mertcangokgoz.com:2087/

## Lisans Aktifleştirme

Tüm aşamaları yaptıktan sonra size yaklaşık 15 günlük bir deneme sürümü verir.Bu sürümü kullandıktan sonra sistemde hiçbir işlem yapamazsınız yeni lisans almak içinde yeni bir ip adresi gerekmektedir.Bu yüzden herhangi bir yerel satıcıdan lisans alıp paneli kullanmaya devam edebilirsiniz.Aldıktan sonra ise aktifleştirme işlemini aşağıdaki komut ile yapabilirsiniz.

    /usr/local/cpanel/cpkeyclt

Daha sonrasında ise durumu [buradan kontrol edebilirsiniz.](https://verify.cpanel.net/)
