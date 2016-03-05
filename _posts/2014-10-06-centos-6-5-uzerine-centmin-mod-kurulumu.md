---
layout: post
title: Centos 6.5 Üzerine Centmin Mod Kurulumu
date: 2014-10-06 12:19:11.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: panellere çoğu zaman ihtiyaç yoktur ayrıyetten sistemleri zaten panellerde çokça kastırmaktadır.Şimdi sizlere bir kurulum betiği olarak
---
Yeni web sitesi kuracak olabilirsiniz yada eski siteniz gelişmiştir sistem kaynakları yetmiyordur ve sistemi hem efektif bir şekilde kullanmak hemde panellerden sıkılmış olabilirsiniz.İşte bu noktada benim gözüme çarpan internet ortamında panelsiz kurulum ve kullanım konusunda makalenin az olması kaldı ki panellere çoğu zaman ihtiyaç yoktur ayrıyetten sistemleri zaten panellerde çokça kastırmaktadır.Şimdi sizlere bir kurulum betiği olarak 3 yıl önce ortaya çıkan Centmin Modu tanıtmak istiyorum.Öncelikle kesinlikle bir panel değildir sadece çabuk kurulum için oluşturulmuş ve halende geliştirilmekte olan muazzam bir scriptdir.Üşeniyorsanız bazı şeyleri kurmaya ve compile etmeye bu scripti kurup geçin **Centos 6.5** üzerinde muazzam bir etkiye sahip ayrıca sistem kaynaklarını sorunsuz bir şekilde kullanmanıza olanak sağlar. **512MB** ramlı **VPS** de bile rahatlıkla **10k** tekil site barındırabilirsiniz.

Kurulumu ise oldukça basittir.

Öncelikle belirteyim kurulumu yaparken dosyaları tmp gibi bi yere indirmeyin sonrasında vay efendim ben kuramadım bu yazdığın makalede bi ... yaramıyor deme

    yum -y install bc wget unzip nano yum-plugin-fastestmirror
    cd /usr/local/src
    wget http://centminmod.com/download/centmin-v1.2.3-eva2000.07.zip

Son sürüm olan centminmodu indiriyorsun sonrasında ise bu zipi açman ve kurman gerekiyor o zaman yapman gereken ise şöyleki

    unzip centmin-v1.2.3-eva2000.07.zip
    cd centmin-v1.2.3mod
    chmod +x centmin.sh

Kurmak için son aşamaya geldik dosya izinlerinide ayarladık herşeyimiz baktık tam

    ./centmin.sh

Komutunu verip çalıştırıyoruz.Karşımıza aşağıdaki gibi kurulum ekranı çıkıyor.

![centminmodkurulumugorsel1](/assets/centminmodkurulumugorsel1-e1412586729804.png)

Bu Ekranda yapmanız gerekenler ise Öncelikle olarak 1.Seçeneği seçmek ve kurulmasını beklemek sistem özelliklerine göre 5-20 DK ya yakın sürebilir 512MB sistemde yaklaşık olarak 14 DK sürmektedir.Kişisel kullanım için muazzam bir scriptdir ve tüm herşeyi tek script ile yapabilme imkanına sahipsiniz.

Kurulum tamamlandıktan sonra ufak bi temizlik için ise

    yum clean all
