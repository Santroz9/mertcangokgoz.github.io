---
layout: post
title: Ubuntu Desktop 14.04 LTS Kurulumu
date: 2014-07-07 16:12:32.000000000 +03:00
type: post
published: true
status: publish
categories: genel
description: Bu Makalemizde sizlere ubuntu 14.04 Desktop LTS sürümünün nasıl kurulduğunu resimli bir şekilde göstermek istiyorum kurulumu oldukça basit
---

Bu Makalemizde sizlere ubuntu 14.04 Desktop LTS sürümünün nasıl kurulduğunu resimli bir şekilde göstermek istiyorum kurulumu oldukça basit olan ubuntu işletim sistemini Windows sisteminizin yanına kurarakda kullanabilirsiniz ancak benim burada anlatacaklarım tamamen sisteminizi Ubuntu olarak kurmanıza yardımcı olmak için hazırlanmıştır.

ilk olarak bizi kurulumun hangi dil ile devam edilmesini seçmemiz adına bir menü geliyor ben buradan türkçeyi seçtim istediğiniz bili seçebilirsiniz.

![ubuntu14.04kurulumugorsel1](/assets/ubuntu14.04kurulumugorsel1-e1404506635443-770x576.jpg)

Bu aşamada ise ne kadar yer kaplayacağını ve internetinizin olup olmadığını kontrol ediyor mp3 ve türevleri için seçeneği işaretlerseniz interneti kullanması gerekecek internetsiz bir bilgisayara kuruyorsanız bu konuda dikkatli olmanızda fayda var

![ubuntu14.04kurulumugorsel2](/assets/ubuntu14.04kurulumugorsel2-e1404516172862-768x576.jpg)

Geldik en önemli kısımıa burada diskimizi nasıl yapılandıracağımız çok önemli o yüzden başka birşey diyip koruluma kendi parametrelerimiz ile devam etmemiz daha sağlık olacak hemde sizler linux dosya sistemi konusunda bir nebze bilgi sahibi olacaksınız.

![ubuntu14.04kurulumugorsel3](/assets/ubuntu14.04kurulumugorsel3-e1404519383439-769x576.jpg)

Anlatımı yapmış olduğum sistem sanal bir makine üzerinde olduğu için 32 gb alan ayırmıştım ve görüldüğü üzere içerisinde disk bölüm tablosu yok hemen yeni disk bölüm tablosu diyoruz ve yeni bir bölüm ayarlıyoruz.

![ubuntu14.04kurulumugorsel4](/assets/ubuntu14.04kurulumugorsel4-e1404519468675-767x576.jpg)

Yeni disk tablosu dediğimiz anda aşağıdaki gibi HDD nizin kapasitesi kadar boş alan oluşması gerekmekte.

![ubuntu14.04kurulumugorsel5](/assets/ubuntu14.04kurulumugorsel5-e1404519546316-772x576.jpg)

Şimdi Linuxun en önemli ayarlamalarından biri dediğimiz diskin yapılandırılması olayına. Oluşturmamız gereken bölümleri aşağıdaki listeden görebilirsiniz.

- Swap Area = Takas alanı oluşturmanız çok ama çok önemlidir.Ram kapasitesini sisteminiz eğer ki geçerse swap alanından kullanmaya başlayacak bu yüzden kesinlikle swap kurulması gerekmektedir.
- Kök Dizin = sistemin kurulacağı ve ayarlamaların yapılacağı bölümdür minimum 10 Gb alan verilmesi önerilir.
- Home = genel olarak dosyalarımızın barınacağı ve kullanıcı olarak işlemlerimizi yapacağımız bölümdür HDDmizin büyük bir çoğunluğunu bu kısma ayırmanız önerilir.
- Ön Yükleme Bölümü = Boot kısmının boyutunu belirlemeniz ve bootun nereye kurulması gerektiğini belirtmeniz gerekmektedir oluşturulması stabilite açısından zorunludur min 1 gb verilmesini öneririm.
- Varsa UEFI ön yükleme bölümü = Sisteminizde UEFI ön yükleme özelliği var ise ubuntunun aşırı bir şekilde hızlı açılmasını sağlamak adına boot kısmının yanına bunuda oluşturmanız gerekmektedir.Zaten sisteminizde UEFI var ise bölüm oluşturmadığınızda ubuntu hata verecektir.

![ubuntu14.04kurulumugorsel6](/assets/ubuntu14.04kurulumugorsel6-e1404519730547-769x576.jpg)

Bir sonraki bölümümüzde bilgisayarımızda kullanılacak olan tarih ve saatin hangi dilime göre ayarlanmasını istiyorsun diye soruyor bize istanbul diyip ilerliyoruz.

![ubuntu14.04kurulumugorsel7](/assets/ubuntu14.04kurulumugorsel7-e1404520675433-770x576.jpg)

Sonrasında Klavyemizi seçiyoruz bizim klavye Türkçe ve Q olduğu için seçimimizi aşağıdaki gibi yapıyoruz.Sonrasında ı,ş,ç,ü gibi harflerde sıkıntı çıkmaması açısından şimdiden ayarlayın derim ben

![ubuntu14.04kurulumugorsel8](/assets/ubuntu14.04kurulumugorsel8-e1404520774254-769x576.jpg)

Bu bölümdede dediği gibi "kimsin gardaş" linux sistemlerde her zaman bi kullanıcı belirleme zorunluluğumuz vardır güvenliğimiz için gereklidir çünkü o yüzden burayı önemseyip ona göre ayarlamalarını yapın sonuç itibariyle izinlerinizi herkese kaptırmak istemezsiniz.

![ubuntu14.04kurulumugorsel9](/assets/ubuntu14.04kurulumugorsel9-e1404520858981-766x576.jpg)

İşlemlerimiz tamam ise devam ediyoruz ve kurulum aşamasına geçiyoruz sisteminizin hızına göre bu işlem biraz sürecektir ama merak etmeyin windows kurar gibi saatler sürmez.

![ubuntu14.04kurulumugorsel10](/assets/ubuntu14.04kurulumugorsel10-e1404521119723-768x576.jpg)

Kurulum bittikten sonra sisteminizi yeniden başlatmanız gerekiyor.Bundan sonra belkide bir daha yeniden başlatmanız gerekmeye bilir sonuç itibariyle aşırı derecede stabil olan bir sistem kullanacaksınız.Güle Güle kullanın şimdiden...

![ubuntu14.04kurulumugorsel11](/assets/ubuntu14.04kurulumugorsel11-e1404521183730-768x576.jpg)

NOT: Bu anlatım Sanal makine üzerinde gerçekleştirilmiş olup bazı kurulum aşamaları gerçekteki kurulumlardan farklı olabilmektedir.Bunun nedenide Kullanıcıların genelde windows sistemlerin yanına Ubuntu kurmak istemesidir eğer böyle bir amacınız var ise Ubuntuyu kurarken en başta belirtilen "Windows ile birlikte kullanacam gardaş ben" kısmını seçerek kurulumu yapınız.
