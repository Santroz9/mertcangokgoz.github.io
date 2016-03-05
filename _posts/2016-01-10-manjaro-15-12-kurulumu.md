---
layout: post
title: Manjaro 15.12 Kurulumu
date: 2016-01-10 14:24:21.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Geçtiğimiz Aralık 23 de Manjaro 15.12 sürümünün duyurulması ile birlikte oldukça güzel işlere de imza atıldı. LTS kernel kullanımı gerekse
---

Geçtiğimiz Aralık 23 de **Manjaro** 15.12 sürümünün duyurulması ile birlikte oldukça güzel işlere de imza atıldı. **LTS kernel** kullanımı, Arch linuxu kurulum aşamasında kolaylaştırması açısından oldukça önemli bir yere sahip ayrıca sizi bir takım uğraşlardan kurtarmakta ve diğer dağıtımlar gibi kolaylıkla kurarak pacman ailesine katılımınızı hızlandırmaktadır.

Resmi sitesinden aklınıza yadan masaüstü ekipmanı ile beraber sistemin kurulum dosyalarını [indiriyorsunuz](https://manjaro.github.io/).Daha sonra herhangi bir **USB** bellek içerisine(Microsoftun USB bellekleri önerilmez) aşağıdaki komut aracılığı ile yazdırma işlemimizi yapıyoruz.

```
    dd if=/home/mertcan/Desktop/manjaro-xfce-15.12-x86_64.iso of=/dev/sdb
```

Biraz bekledikten sonra **USB** belleğimiz hazır hale geliyor.Ardından sistemimizde gerekli yedeklemeyi yaptıysak yada bilgileri gözden çıkarttıysak **USB** yi takıyoruz.Kurulum aşamasına direk geçiyoruz.

![manjaroloading](/assets/manjaroloading.png)

**Boot** ettikten sonra direk olarak karşımıza şu şekilde bir ekran gelecek kurulumu bu ekran sayesinde yapacağız kısacası grafiksel bir şekilde arch kurmuş olacağız

![install1](/assets/install1.png)

3 Adet kurulum tipi göreceksiniz bunlardan 2 si bizim işimize yaramayacak.Bunlar ise şu şekilde

- İnstall Cli(komut satırı ile)
- İnstall Calamares(beta süreci önerilmez)

Geriye 1 adet seçenek kalıyor zaten oda **İnstall Manjaro** bu seçeneği seçtikten sonra bize dili seçmemiz için bir ekrana yönlendirecek.Türk olduğumuz için haliyle **Türkçeyi** seçiyoruz

![install2](/assets/install2.png)

Bizden bölge seçmemizi isteyecek Kıbrıs ve Türkiye seçenekleri olacak buradan Türkiyeyi seçiyoruz.

![install3](/assets/install3.png)

Saat ve zaman dilimi ayarlamalarını gerçekleştiriyoruz.

![install4](/assets/install4.png)

Klavyemizin dil seçimini yapıyoruz.Tuş takımlarımızda sıkıntı olmasını istemeyiz.

![install5](/assets/install5.png)

Sistemimiz kurulacak olan özelliklerin neler olması gerektiğini belirten ekranımıza geldik

![install7](/assets/install7.png)

Sıra geldi disk yapılandırma kısmına burada şifreli veya şifresiz olarak 2 seçenek bulunuyor ayrıca ev dizinini şifreleyebilirsiniz de Bunun dışında kendi özel yapılandırmanızı yapabilirsiniz.

![install8](/assets/install8.png)

**LVM** işaretleyip şifreli kuruluma geçerseniz.Karşınıza aşağıdaki gibi bir ekran çıkacak buradan şifrelenecek olan diski seçiyorsunuz ardından şifrenizi giriyorsunuz.Şifreleme işlemi Manjaronun bu sürümünde pek önerilmese sorunsuz bir şekilde kurulumu gerçekleştirmeyi başardım eğer bir takım hatalar alırsanız kurulumu baştan başlatıp şifresiz bir şekilde kurulumu devam ettirmeniz önerilir.

![install9encrypted](/assets/install9encrypted.png)

Eğer ki normal kurulum yapmak istiyorsanız da şu şekilde bir ekran sizi bekliyor olacak yani şifre kısmı niye kapalı diye telaş etmeyin.

![install9normal](/assets/install9norma.png)

Disk yapılandırmasını yaparken her iki kurulumda da **LVM** seçebilirsiniz bu disklerin kolay yönetimini sağlayacağı için işinize oldukça yarayacak.diski daha efektif olarak kullanabileceksiniz.Bu aşamadan sonra karşınıza şu şekilde bir ekran çıkacak

![manjarohostname](/assets/manjarohostname.png)

Bilgileri eksiksiz bir şekilde dolduruyorsunuz.Mümkün olduğunca Türkçe karakter kullanmamaya çalışın.kimi zaman hata verdiğini gözlemlediğim için ileri ki zamanlarda sıkıntı çekmeyin.Tüm bu aşamaları kolaylıkla geçtikten sonra ise sizi aşağıdaki gibi bir ekran karşılayacak ve kurulumunuz başlamış olacak kısa bir süre sonunda sisteminiz hazır hale getirilecek kurulum bittikten sonra **USB** yi sisteminizden çıkartmayı unutmayınız.

![install10final](/assets/install10final.png)

Artık Manjaro 15.12 sisteminize kurulmuş oldu gönül rahatlığı ile sisteminizi kullanabilirsiniz.Hayırlı olması dileklerimle
