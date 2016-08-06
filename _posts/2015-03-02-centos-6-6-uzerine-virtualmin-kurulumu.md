---
layout: post
title: Centos 6.6 Üzerine Virtualmin Kurulumu
date: 2015-03-02 18:15:12.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Benimde oldukça sevdiğim ve kullanmaktan keyif aldığım virtualminin kurulumunu göstermek istiyorum.Virtualmin kurulu sunucunuzda birden çok site
---
Benimde oldukça sevdiğim ve kullanmaktan keyif aldığım virtualminin kurulumunu göstermek istiyorum.Virtualmin kurulu sunucunuzda birden çok site barındırabileceğiniz gibi ayarlamalarınıda kolaylıkla yapabileceksiniz.Arayüz bakımından zor olsada kullanılabilirlik ve stabilite bakımından oldukça iyi tamamen ücretsiz olan virtualmin hakkında daha fazla bilgi almak isterseniz [Resmi sitesini](http://www.virtualmin.com/) ziyaret edebilirsiniz.

İlk olarak kurmadan önce sistemi güncellememiz gerekiyor.

    sudo yum -y update

güncellemeden sonra hostname mizi kontrol etmemiz lazım ve hostname uyumlu olmak zorunda yoksa başınız ağrır

    hostname sv1.mertcangokgoz.com

hemen ardından kurulum parametremizi veriyoruz.bu aşamadan sonra kurulum yaklaşık bi 10 -15 dk sürebilir.

    wget http://software.virtualmin.com/gpl/scripts/install.sh
    sudo sh install.sh

Lisans sözleşmesi vs karşınıza çıkacak y diyip geçiyoruz ve kurulum başlamış oluyor.Kurulduktan sonra ise panele ulaşmak için

**https://sv1.mertcangokgoz.com:10000/** yada **https://sunucuipadresi:10000**

Şeklinde giriş yapabilirsiniz.Giriş yapabilmeniz için tanımlı olan kullanıcı adı ve şifre SSH ye bağlanırken kullandığınız Kullanıcı yani root dur.

![virtualminloginscreen](/assets/virtualminloginscreen.jpg)
