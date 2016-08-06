---
layout: post
title: Centos 7 Üzerine Node.js Kurulumu
date: 2015-02-16 14:43:49.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Bir önceki makalemizde centos 6 için node.js kurulumu yapmıştık tabiki bilgi sahibi olmadığımız içinde ufak bi anlatım yapamamıştık.Node.js sunucu
---

Bir önceki makalemizde centos 6 için **node.js** kurulumu yapmıştık tabiki bilgi sahibi olmadığımız içinde ufak bi anlatım yapamamıştık. **Node.js** sunucu tarafında javascript ile uygulama geliştirmeye yarar ulan niye javascript bi ton yazılım dili var suyumu çıktı diğerlerinin diyorsanız öyle demeyin **javascript** hem basit hemde kolaylıkla&nbsp; ölçeklenebiliyor yani projeniz var ama iş yapmak istiyorsanız ve sorunu direk çözmek istiyorsanız.server tarafında javascript ile ortaya çıkan node.js sizin için ideal

Gelelim kurulumuna 2 şekilde kurulumu yapabilirsiniz.İlk olarak kaynakdan sistem için derleme yaparak ikincisi ise direk olarak sisteme **EPEL** paketlerini ekleyerek bana soracak olursanız kaynakdan derlemeniz daha iyi olacaktır çoğu uygulamada olduğu gibi _%15 oranında ek performans alma imkanınız doğacak_

    wget http://nodejs.org/dist/v0.12.0/node-v0.12.0.tar.gz

Sunucumuza dosyamızı indirerek başlayabiliriz kurulumumuza sonrasında **tar.gz** içerisinden dosyalarımızı çıkartalım

    tar xvf node-v0.12.0.tar.gz

Çıkartmış olduğumuz dosyalarımızı derleyeceğimiz için klasör içerisine girişimizi yapalım ve derleme işlemine geçelim

    cd node-v0.12.0

Sonrasında aşağıdaki adımları sırasıyla uygulayalım

    ./configure
    make
    sudo make install

derleme işlemi sisteminizin hızına göre değişiklik gösterecektir istediğiniz bir sürümü kurmadıysanız ve sisteminizde hali hazırda var olan bir sürüm hakkında bilgi almak istiyorsanız.

    node --version

çıktı olarak size o an kurduğunuz node sürümünü yada daha önceden sistemde kurulu olan node sürüm numarasını verecektir.

Ben bunlarla uğraşamam kardeşim benim bilgim kısıtlı daha kolay bir yolu yokmu bunu kurmanın diyen arkadaşlar için ise **EPEL** Paketi içerisinden kurulumunu kolaylıkla yapabiliriz.

İlk olarak sisteme **EPEL** paketini bi ekleyelim

    sudo yum install epel-release

Paket ekleme işleminin ardından **node.js** kuruyoruz.

    sudo yum install nodejs

Böylelikle kurulum tamamlanmış oluyor ancak uygulama geliştirirken node paket yöneticisi kullanacak olabilirsiniz.Derleme sırasında kurulu olarak geldiği için pek bir sıkıntı yok ancak EPEL üzerinden kurduğumuzda **NPM** kurulu gelmemekte

    sudo yum install npm

Komutu ile kolaylıkla kurabilirsiniz sonrasında komut satırı ile istenilen paketleri ekleyip çıkartabilirsiniz.
