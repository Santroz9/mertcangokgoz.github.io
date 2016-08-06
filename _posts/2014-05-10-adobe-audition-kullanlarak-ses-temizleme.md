---
layout: post
title: Adobe Audition Kullanılarak Ses Temizleme
date: 2014-05-10 22:56:24.000000000 +03:00
type: post
published: true
status: publish
categories: analiz
description: Şimdi soracaksınız "lan böyle bir blog da bu konunun ne işi var" diye haklısınız aslında ancak video çekerken özellikle youtube deki bazı
---

Şimdi soracaksınız "lan böyle bir blog da bu konunun ne işi var" diye haklısınız aslında ancak video çekerken özellikle youtube deki bazı kanallarda seslerde aşırı olarak arka plan sesi bulunmakta halbuki bu seslerden çok kolay bir şekilde kurtulabileceklerini kendilerinin bilmeleri çok hoş bir şey olur ve bizimde kulağımızın içine etmemiş olurlar öncelikle bu işlemi videoyu çekmeden önce yapacaksınız ki sesi eş zamanlı olarak temizlesin ve video kayıt işlemi bittikten sonra tekrardan ses ile uğraşmak zorunda kalmayın montajı yapar istediğiniz yere yüklersiniz. Bende özellikle eğitim videoları çekerken çoğu zaman bunu kullanırım.Temiz bir ses her zaman önemlidir.

İşlemimiz aslında iki aşamadan oluşmaktadır.

1. Adobe Audition ile sesin eş zamanlı olarak temizlenmesi
2. Virtual Audio Cable aracılığı ile Kayıt programına gönderilmesi

Gereken Programlar

- Adobe Audition CS6
- Virtual Audio Cable

Googleden gereken dosyaları temin edebilirsiniz.

İlk olarak internetten yada her hangi bir yerden Adobe Audition uygulamasını indirin Trial bile olabilir hiç fark etmez.

1-New \> MultiTrack Session seçeneğini seçiyoruz.

![1](/assets/aa12.png)

2-Multitrack Session seçtiğimizde karşımıza aşağıdaki yer gelecek ayarları resimdeki gibi yapıyoruz oturum isminizi isteğinize göre yazın bir şeyler ve yeni bir oturum başlatıyoruz.

![2](/assets/aa21.png)

3-karşımıza birden çok kanal track kısmı gelecek bizim işimize ilk bölüm yarayacak.

![3](/assets/aa3.png)

4-Burada bulunan Audio Hardware kısmına geliyoruz.Sesi hangi aygıt'dan kayıt ediyorsanız ilk olarak onu seçiyorsunuz.(mikrofon vb)

![adobe audition audio mastering](/assets/41-839x576.png)

Kurmuş olduğumuz Virtual Audio Cablemizi seçiyoruz böylelikle işlenmiş sesimizi programımıza ulaştırmış olacağız ses çıkışımız o olacak Videoyu çektiğimiz uygulamada da ses giriş kısmını Virtual Audio Cable yapacağız böylelikle sesi oradan alabilecek... Son olarak da Track kısmından R ve I kısımlarını işaretliyoruz sesin düzeylerini görmemiz açısından bu daha iyi olacak...

5- Şimdi Geldik sesimizi filitreleme işlemimize bunun için 3 Filtreye ihtiyacım oldu benim 3 adet bilgisayarın fan sesini ve Aile fertlerinin uzaktan gelen seslerini böylelikle silme fırsatım oldu aşağıda görmüş olduğunuz filtrelerden işimize yarayacak olanları sırasıyla;

- Adaptive Noise Reduction
- Automatic Click Remover
- DeHummer

![6](/assets/aa6.png)

6-İlk olarak Adaptive Noise Reduction seçiyoruz ve present kısmından arka plandan gelen sesin şiddetine göre bir profil seçiyoruz benim arka plandan gelen ses aşırı yüksek olduğu için Heavy Noise yi seçmek zorunda kaldım

![7](/assets/7.png)

7-ikinci olarak eğer mousenizden click yada arkada ufak çıtırtı sesleri yada cızırtıya benzer sesler geliyor ise Automatic Click Remover özelliğinide aşağıda şekilde ekliyoruz.

![8](/assets/8.png)

Bu ayarlamaları yaptıktan sonra programı kapatmamanız gerekmektedir.Kapattığınız zaman sesiniz eski haline dönecektir.Bu yöntemi kullanarak tertemiz ses elde edebilirsiniz.
