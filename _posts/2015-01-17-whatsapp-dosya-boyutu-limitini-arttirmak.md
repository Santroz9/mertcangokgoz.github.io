---
layout: post
title: WhatsApp Dosya boyutu limitini arttırmak
date: 2015-01-17 15:30:15.000000000 +02:00
type: post
published: true
status: publish
categories: genel
description: Whatsapp bilindiğü üzere 700 milyon kullanıcının aktif olarak kullandığı günyanın en yaygın anlık mesajlaşma uygulamasıdır.Uygulama haddinden
---
**Whatsapp** bilindiğü üzere 700 milyon kullanıcının aktif olarak kullandığı günyanın en yaygın anlık mesajlaşma uygulamasıdır.Uygulama haddinden fazla mesaj,resim,video gönderilebilmekte ancak bunların her birinin bir sınıra tabi olduğunu elbetteki biliyorsunuzdur bunun nedenide _700 milyon_ adamın aynı anda yüksek boyutlu dosyalar gönderdiği zamanki yaratacağı sıkıntıdan ibaret olduğunu düşünüyorum.Ancak bizim yapacağımız bir kaç ufak değişiklik ile bu dosya gönderim boyutunu **2 GB** ye kadar yükseltebileceğimizi herhalde bilmiyordunuz.İlk olarak bize gerekli olan bir adet rootlanmış Android telefon

Şimdi Google Play giriş yapıyoruz ve herhangi bir Root dizin gösteren uygulamayı indiriyoruz bu **Root Explorer** yada **Root Browser** olabilir siz hangisini tercih edersiniz bilemem benim tercihim **Root Browser** den yana ve bu işlemlere başlamadan önce Whatsapp uygulamanızın kurulu ve hali hazırda birileriyle konuşmanızın bitmiş olması gerekli şimdi **Root Browser** yardımı ile sistem dosyalarına geçiş yapıyoruz.

Şimdi **data** klasörüne giriyorsunuz sonra alt taraflara ilerlediğinizde bi **data** klasörü daha karşınıza çıkıcak orayada giriş yapıyorsunuz._Sonra karşınıza com. ile başlayan bir sürü klasör çıkacak bunlar kurduğunuz uygulamaların ve sistemdeki diğer uygulamaların ayar dosyaları ve bilgilerin saklandığı yerdir._

![whatsappdosyalimitkaldirmagorsel3](/assets/whatsappdosyalimitkaldirmagorsel3-e1421328031622-324x576.jpg)

Buradan **com.whatsapp** klasörünü buluyorsunuz klasörün yanında yöresinde **whatsapp** nin simgesini göreceksiniz zaten tıklayıp içerisine giriyorsunuz.Daha sonra içerisindeki klasörlerden **shared\_prefs** giriş yapıyorsunuz karşınıza şunlar çıkacak

![whatsappdosyalimitkaldirmagorsel2](/assets/whatsappdosyalimitkaldirmagorsel2-e1421328140706-324x576.jpg)

Burada bizim değişiklik yapacağımız dosyamız **com.whatsapp\_preferencess.xml** her hangi bir text editör ile açıyorsunuz.Ve aşağıdaki satırı buluyorsunuz.

![whatsappdosyalimitkaldirmagorsel1](/assets/whatsappdosyalimitkaldirmagorsel1-e1421328227790-324x576.jpg)

Satırlarımız şunlar

    <int name="media_limit_mb" value="16" />

bu satırı text editörünüz aracılığı ile aşağıdaki gibi yapıyorsunuz

    <int name="media_limit_mb" value="2048" />

Kayıt edip çıkıyorsunuz.Sonrasında telefonuzu **yeniden başlatmanız** gerekiyor.Bu işlemlerin bitiminde Whatsapp ile 2GB ye kadar dosya gönderebileceksiniz arkadaşlarınızın _internet paketlerini_ bitirmeniz için farklı bir yöntem :)
