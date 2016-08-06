---
layout: post
title: Sistem Program Sorunu Hatasını Gidermek
date: 2015-01-08 15:55:52.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Ubuntu kullanan çoğu arkadaşda aynı problemle karşılaştım ve çözümü yok gibi gözüküyordu en olmadık yerde en önemli işin arasında hemen
---
Ubuntu kullanan çoğu arkadaşda aynı problemle karşılaştım ve çözümü yok gibi gözüküyordu en olmadık yerde en önemli işin arasında hemen sistem size " **System Program Problem detected**" hatasını basıyor.Sonrada sövüp duruyordunuz sanırım ben öyleydim zamanında çözümü bir forum sitesinde gördüm ve türkçe olarak yazmak istiyorum hatamız

![systemprogramhatasiningiderilmesigorsel1]( /assets/systemprogramhatasiningiderilmesigorsel1.png)

Şimdi bu hatayı fazlaca bir süre görüyorsanız korkmayın korkulacak bir hata olmadığını belirteyim.Çözüm ise aşağıdaki gibi yapacaksınız report problem dediğinizde bu şekilde yapacaksınız ve hataları geliştiricilere göndericeksiniz onlarda inceleyecek bir sonraki güncellemede hata falan kalmayacak ancak pc yi her açtığınızda bu gelebilir çünkü hata kısmında bulunacak o dosyalar

![systemprogramhatasiningiderilmesigorsel2]( /assets/systemprogramhatasiningiderilmesigorsel2.png)

yukarıdaki gibi yaparsanız bir kaç kez karşınıza çıkmaz ama çıkadabiliyor.hata raporlarına bi bakmak lazım neler var neler yok diye bunun için

    ls /var/crash/

aşağıdaki herhangi birşey varmı bakarsınız bende şuan için 1 adet dosya bulunuyor oda

    _usr_share_apport_apport-gtk.1000.crash

bunların hepsini tek tek dosya isimleri ile silebiilrsiniz ama öyle bi işsizliğe gerek yok hepsini bir anda silin gitsin bir önemi yok

    sudo rm -fr /var/crash/*

şimdi sisteminizi yeniden başlatın hata gelecek mi bi bakın %99 gelmeyecek çünkü klasörde gönderilecek bir hata kalmadı,Peki bu hatadan tamamen nasıl kurtuluruz ?

öncelikle sistem dosyasını kurcalamamız gerekiyor o yüzden root yetkilerini elinize bi alın ve adımları takip edin

    sudo su
    nano /etc/default/apport

![systemprogramhatasiningiderilmesigorsel3]( /assets/systemprogramhatasiningiderilmesigorsel3.png)

dosyaya girdiğinizde ingilizce bir sürü satır ile karşılaşacaksınız.hata gönderimini kapatacağımız için aşağıdaki gibi yapmalısınız.

    # set this to 0 to disable apport, or to 1 to enable it
    # you can temporarily override this with
    # sudo service apport start force_start=1
    enabled=0

yeni değerini ayarladıktan sonra kayıt edip çıkışımızı yapıyoruz.Sonrasında servisi durdurmamız gerekiyor.

    sudo stop apport

Böylelikle o hatadan kurtulmuş oluyoruz.Ancak size bir tavsiye hatalar ile ilgili bu yaptığımız uygulamayı canınız çok sıkılmadıkça yapmayın çünkü ubuntu geliştiricilerini hatadan haberdar etmezseniz Open Source mantığının zaman pek bi mantığı kalmıyor.

Siz siz olun genede yukarıdakileri yaparken iyice bir düşünün
