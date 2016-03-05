---
layout: post
title: ISPConfig 3 DNS Ayarları
date: 2013-09-16 00:30:27.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Beklide hepinize en zor gelen ispconfig 3 de dns ayarlarıdır ama bu ayar sanıldığı kadar zor değil çünkü ispconfig 3 ün kolay anlaşılır arayüzü
---

Beklide hepinize en zor gelen **ispconfig** 3 de dns ayarlarıdır ama bu ayar sanıldığı kadar zor değil çünkü **ispconfig** 3 ün kolay anlaşılır arayüzü sayesinde bu sorunu kolaylıkla çözeceğiz ve kendi **NS** kayıtlarımız ile sitemizi yayınlayabileceğiz oluşturduğumuz bu ana ns kaydı ile aynı server üzerinde barınan diğer sitelere de kendi **NS** kaydımızı oluşturmuş olacağız.

Öncelikle panelimize aşağıdaki port numarası ile bağlanıyoruz.

    http://www.siteadiniz.com:8080

modüller sekmesinden DNS seçiyoruz ve devam ediyoruz.

![ispdnsayarlari](/assets/ispdnsayarlari1.png)

Açılacak olan panelden Sol köşede **“Add DNS-Zone”** linkine tıklıyoruz.

![ispconfigcnsayarlari](/assets/ispconfigcnsayarlari-1024x3831.png)

karşımıza **dns** ayarlayabileceğimiz yer geliyor bu kısmı **dns** kaydı oluşturmak istediğiniz **domaine** göre ayarlamanız gerekmektedir.

![ispconfig3dnsayarleri](/assets/ispconfig3dnsayarleri1.png)

gereken yerleri dolduruyoruz ve oluşturuyoruz.burada herkesin unuttuğu bir şey var bu bilgileri oluşunca **DNS** kayıtları tamamlandı sanmayın **NS1** ve **NS2** için **A** Kaydı oluşturmamız gerekiyor.Panelden domaini seçiyoruz.

![configayarlari1](/assets/configayarlari11.png)

**DNS** Zone ayarlarına giriyoruz buradan **“Records”** kısmına giriş yapıyoruz. 2 Adet NSler için **A** Kaydı Mail kullanıcaksakda 1 adet **CNAME** oluşturmamız gerekiyor ben mail kullanmayacağımdan dolayı sadece **NSleri** oluşturmayı seçtim

![configayarlari2](/assets/configayarlari21.png)

**DNS Zone** nizin böyle gözükmesi gerekiyor A kaydı eklerden gereken yerleri doğru bir şekilde girmeniz gerekmektedir.

Bundan sonrası ise domain'i aldığınız firmada A kaydı oluşturmanız gerekmektedir tekrardan.Ben bu örnek için godaddy kullandım siteye giriş yapacak domain yönetim yerine geliyoruz. Buradan da **“DNS Zone File”&nbsp;** kısmına giriş yapmamız gerekiyor.&nbsp; **“Edit”** diyerek kayıtlarımızı oluşturmaya başlayalım.

2 Adet A kaydı oluşturmamız gerekiyor bunlardan ilki **NS1** ikincisi **NS2** ve ip adresi de sunucunuzun ip adresi yani root sunucunun ip adresi olmalıdır.

![config3ayarlari3](/assets/config3ayarlari3-1024x2711.png)

**godaddy** de **hostname** oluşturmamız gerekmektedir ki işlemimizin en son aşaması

![ispconfig3dnsayarlari22](/assets/ispconfig3dnsayarlari22-1024x5671.png)

yukarıdaki gibi ayarları yapınız.(ip adresiniz ana server ip si)sonrasında kayıt edip **DNSlerin** oturmasını bekliyoruz.Ve evet sonunda **DNS** lerimizin kaydı oturdu(yaklaşık 1 saat ile 24 saat alırken ilk kez girdiğim için hemen aldı ama tam oturması 24 saat)

![ispconfigdnsayarlarison](/assets/ispconfigdnsayarlarison1.png)

hepsinden emin olmak için **dig** komutu verelim

![ispconfig3dnsayarlaritest](/assets/ispconfig3dnsayarlaritest1.png)

evet çıkan sonuca bakıyoruz **root** serverimizin **ipsi** çıkıyor işlem tamamlandı…
