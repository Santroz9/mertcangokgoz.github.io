---
layout: post
title: DNS_PROBE_FINISHED_NO_INTERNET Sorunu
date: 2017-01-15
type: post
categories: windows
description: Son zamanlarda insanımız bu hata ile karşılaşmışlardır diye düşünüyorum. Özellikle Google Chrome kullanan kullanıcılar
---

Son zamanlarda insanımız bu hata ile karşılaşmışlardır diye düşünüyorum. Özellikle **Google Chrome** kullanan kullanıcılar daha çok görmüşlerdir. Aşağıdaki gibi bir görüntüsü de var görmeyenler varsa;

![dns probe hatası](/assets/dns-probe-finished-no-internet-error-detectionbro.jpg)

Bu hatayı anlık görenler olabilir veya devamlı karşısına çıkanlarda olabilir. Aslında bunun bir kaç nedeni var ve karşınıza;

1. Kullandığınız DNS sunucularının performansının kötü olması
2. Ülkenizin sizin üzerinizde baskı, denetimler yapmaya çalışması
3. Virüs bulaşma ihtimalinin olması
4. Daha önceden kullandığınız ve kaldırdığınız VPN uygulamalar(varsa)

Yukarıdaki 4 adet sebepten sadece ilk ikisine sıkça rastlanmakta hal böyle olunca bu sorunun çözümü de pek  fazla değil

İlk olarak benim bulduğum bir kaç çözümü anlatmak istiyorum bunlardan ilki **DNS** adreslerinizi herkesin kullandığından ziyade kimsenin kullanmak istemediği benim tabirim ile "ölücü DNS" adreslerinden faydalanmak bunlar içinde "Opennic DNS" lerini veya "Yandex DNS" yi kullanabilirsiniz. Ardından DNS önbelleğinizi temizleyip yolunuza devam edersiniz. Ancak buda sorununuzu tam anlamıyla çözmez çünkü uzun bir süre sonra tekrar karşınıza bu hata çıkar.

İkinci olarak yerel **DNS** çözümleyici kullanabilirsiniz. Bu iş için Unbound yada Dnscrypt uygulamalarından bir tanesini seçebilirsiniz. Windows tarafında olduğu için `exe` uzantılı dosyayı çalıştırıp kurduktan sonra çift tıklayıp açmanız ve daha sonra DNS adreslerinizi `127.0.0.1` olarak değiştirmeniz yeterlidir. Kullandığınız bilgisayarda bu sorun çözülecektir.

Üçüncü olarak ise paralı **VPN** çözümlerini kullanmak bu sizi sansürlerden ve baskılardan kurtaracaktır. Zaten en temiz çözümde bu **VPN** içerisinde asla ve asla `DNS_PROBE_FINISHED_NO_INTERNET` hatasını almazsınız.

Ayrıca geçici çözümlerden bir taneside windows sistemler için Win+R tuş kombinasyonu ile çalıştır bölümüne ulaşmak ve cmd yazarak aşağıdaki işlemleri gerçekleştirmektir.

```
netsh winsock reset
ipconfig /flushdns
```

Geçici bir yöntemdir kendileri ama iş görür. Yada hepsini unutup Firefox kullanmaya başlayabilirsiniz firefox da bu gibi hataları göremezsiniz çünkü olmasına izin vermez site açılış hızında ufakta olsa bir artış olur ancak gözünüze böyle bir hatayı sokmaz.
