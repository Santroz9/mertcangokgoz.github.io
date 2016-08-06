---
layout: post
title: Web Siteleri için Favicon ve Diğerleri
date: 2016-02-04 18:22:51.000000000 +02:00
type: post
categories: programlama
description: Web siteleri için önemli olan bir nokta favicon kullanımıdır eskiden olsa kullanmasanız da olur derdim ama günümüzde bu görseller ile pek çok iş yerine
---

Web siteleri için önemli olan bir nokta **favicon** kullanımıdır eskiden olsa kullanmasanız da olur derdim ama günümüzde bu görseller ile pek çok iş yerine getirilebiliyor özellikle **OS X** ve apple tabanlı sistemlerde tabi son zamanlarda windows da bundan nasibini aldı ve kullanımına özen gösterilmesini istiyor.

Google bile **favicon** kullanımını özendirmek amaçlı **seo** açısından önemli olduğunu söylemişti gel gelelim bunların nasıl yapıldığına.

Tüm cihazlar için tek **.ico** dosyası oluşturma işlemini aşağıdaki kod ile yapabilirsiniz.Bunu oluşturmak için ise 2 yöntemimiz var.Siz başka şekilde yapmayı biliyorsanız o şekilde de düzenleyebilirsiniz.Windows dahil tüm sistemlerdeki tarayıcılarda şu şekilde düzenleyebilirsiniz.

OSX için

    brew install imagemagick

Debian/Ubuntu için

    sudo apt-get install imagemagick

En son olarak elimizdeki tüm **png** dosyalarını **favicon.ico** dönüştürüyoruz.

    convert favicon-16.png favicon-24.png favicon-32.png favicon-48.png favicon-64.png favicon.ico

tüm her şey tamamlandığında belirtilen boyutların hepsini içeren bir **favicon.ico** dosyanız olacak sitenize bunu yerleştirmeyi unutmuyorsunuz.Onuda şu şekilde yapabilirsiniz.

    <link rel="shortcut icon" sizes="16x16 24x24 32x32 48x48 64x64" href="favicon.ico">

![mobilegorselicon](/assets/mobilegorselicon.jpg)

İphone Android telefonlarda ise telefonda icon kullanımı önemli hele ki **İOS** da&nbsp;Apple Mobile Application&nbsp;şeklinde siteyi eklemek için bile bu ikon kullanılabiliyor.

    <link rel="apple-touch-icon" sizes="57x57" href="favicon-57.png">
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="favicon-57.png">
    <link rel="apple-touch-icon" sizes="72x72" href="favicon-72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="favicon-114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="favicon-120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="favicon-144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="favicon-152.png">

Ayrıca bunların en altına eklemeniz gereken bir satır daha bulunuyor.Apple Mobile Uyumluluğu için gerekiyor.

    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

![microsoft-256](/assets/microsoft-256.png)

Windows 8 ve üstü sistemlerde ise pinned tab olarak adlandırılan bu özellik bir takım eklemeler yapılarak düzenlenebiliyor.Üstelik kullanıcılar siteyi pinned şekilde eklerlerse otomatik olarak isim ve logoyu alabiliyor ve kullanabiliyorlar.Kullanımı ise şu şekilde

    <meta name="application-name" content="Mertcan">
    <meta name="msapplication-TileImage" content="favicon-144.png">
    <meta name="msapplication-TileColor" content="#2A2A2A">

El ile yazmak oldukça zor olacağı için bunu [otomatik olarak oluşturan bir siteden](http://www.buildmypinnedsite.com/en) faydalanacağız gerekli eklemeleri yaparak otomatik kodu alıp sitenizin gerekli yerlerine ekleyebilirsiniz.Böylelikle bu özellikten kolay bir şekilde faydalanabilirsiniz.
