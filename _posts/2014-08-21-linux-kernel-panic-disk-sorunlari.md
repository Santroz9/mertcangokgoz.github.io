---
layout: post
title: Linux Kernel Panic Disk Sorunları
date: 2014-08-21 12:26:50.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Linux Sistemlerde hayatımda en çok korktuğum hataların başında sanırım karnal panic mod geliyor.Çünkü adındanda anlaşıldığı gibi bunu görür görmez
---
Linux Sistemlerde hayatımda en çok korktuğum hataların başında sanırım **kernel** &nbsp;panic mod geliyor.Çünkü adındanda anlaşıldığı gibi bunu görür görmez sizde panik olmaya başlıyorsunuz çünkü sistem bu hale geldimi yapabileceğiniz pek birşey kalmıyor kısacası sistem azıcık hış oluyor bu hatayı gördüğünüzde yapmanız gereken tek şey kalıyor datalarınızı alıp sisteme format atmak bunun dışında uygulayacağınız çoğu işlem sistemi tamamen düzeltmeyecektir.

öncelikle bu durum neden oluşuyor diyeceksiniz cevabımız ise **linux** disk yazması sırasında oluşabilen bir sorundan dolayı bu durum karşımıza çıkar genelde burada olan şey kernel dosyasının aslında bozulmaması ama koskoca diskin dosya bütünlüğünü görememesi buna neden olan şey ise disk de oluşan bad sector durumu ben diskime güveniyorum diyebilirsiniz ama linux pert olmuş sen güvensen ne olur önemli olan sistemin güvenmesi yapılacak olan şey ise sistemde kurulu olan işletim sistemi neyse aynı sürüme ait bir **live CD** nizin olması sunucunuz var ise her firmanın sağladığı gibi panic moda geçirebilirsiniz yada popüler olan rescue mod.

ilk önce vereceğimiz komut

    sudo fdisk -l

Bu komutu niye verdik aslında gerek yoktu diyen arkadaşlarımız olabilir haklısınız bu komutu verme nedenimiz ana diskin hangisi olduğunu anlayabilmemiz gereksiz yere başka diski onarma işlemine geçirmeyelim boşa vakit kaybı olmasın diski mount etmeye çalışırdık ancak panic modda bu mümkün değil sadece tamir etmeye çalışmamız mümkün

disk biçimimiz **EX4** olduğu için aşağıdaki komutumuzu iteliyoruz.Sorunu otomatik bulması ve onarmaya çalışması için

    fsck.ext4 -y /dev/sda2

**-y** ye kafanız takılmasın yesin kısaltılmış hali -y vermezseniz tamir edilsinmi edilmesinmi ne yapılsın diye sizden hicazet alacak onayı verdikten sonra ise sistem ne yapacak diski mount etmenize imkan sağlayacak sorununuz geçecek mi kesin olmamakla birlikte belki geçer belki geçmez bilinmez ama diski mount edebileceksiniz ve datalarınızı kurtarabileceksiniz Farklı bir **linux** dağıtımı ile **live CD** olarak açtığınızda dosyalarınızı rahatlıkla yedekleyebileceksiniz.Gönül istemezdiki size bunu resimli anlatalım evet yanlış yazmadım istemiyor gönlüm bu lanet hatayı görmeye allah kimsenin başına bu sorunu göstermesin ayrıca bu makalede yazmış olduğum sadece disk sorunlarından ortaya çıkan panic mod içindir.Hata genelde neyemi benziyor işte...

![kernelpanicmodegorsel1](/assets/kernelpanicmodegorsel1.jpg)
