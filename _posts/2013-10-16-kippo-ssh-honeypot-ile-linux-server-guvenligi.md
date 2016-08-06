---
layout: post
title: Kippo SSH Honeypot ile Linux Server Güvenliği
date: 2013-10-16 04:54:32.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Birinin sizin sunucunuza erişmeye çalıştığını nasıl anlarsınız genel olarak loglara bakarsınız ancak bu uygulama onu bile yapmamanızı sağlayacak
---
Birinin sizin sunucunuza erişmeye çalıştığını nasıl anlarsınız ? genel olarak loglara bakarsınız ancak bu uygulama onu bile yapmamanızı sağlayacak python ile yazılmış bu yazılım saldırganı sitenizden uzak tutmaya yetecek gibi gözüküyor.

Özelliklerine gelecek olursak

- Sahte dosya sistemi oluşturarak ekleme ve silme işlemlerini asıl sistemi etkilemesini engelleyebilirsiniz /aynı debian 5 kurulumu gibi sahte dosya sistemi kurarsınız
- Sahte dosya içerikleri eklemenize imkan sağlar /etc/passwd gibi yada /etc gibi dosyaları koruyabilirsiniz.
- Oturumlarda yapılan tüm işlemler gerçek zamanlı olarak kayıt altına alınırlar
- Sadece wget ile indirilebilecek biçimde dosyalar kayıt eder
- Gerçek SSH ye bağlandığını sanan saldırgan sitenizi kurcalamaya başlayacak ancak başarılı olamayacaktır.

Kippo yazarından

**"By running kippo, you're virtually mooning the attackers. Just like in real life, doing something like that, you better know really well how to defend yourself!"**

[![kippogorsel](/assets/kippogorsel1.png)](https://mertcangokgoz.com/wp-content/uploads/2013/10/kippogorsel1.png)

fazla uzatmadan olayımıza geçelim öncelikle ben bu testleri ubuntu da yapıyorum.

      sudo apt-get install python-dev openssl python-openssl python-pyasn1 python-twisted

bu kurulum internet ve sistem hızına göre değişecek 22 ye yakın bileşen kurulduktan sonra ssh portumuzu değiştirmeye geldi sıra portu rastgele sayılardan oluşan 4 haneli sayılardan yapmamız gerekiyor benim burada vereceğim örneği kullanmayınız

      nano /etc/ssh/sshd\_config

22 olan port numarasını ben 4698 yaptım ve ardından ssh yi yeniden başlatıyoruz.

      sudo service ssh restart

hemen önce bir subversion kuralım

      sudo apt-get install subversion

Kullanıcı oluşturmamız gerekiyor buradan sonraki işleri root olarak yapmamalısınız

      useradd -d /home/kippo -s /bin/bash -m kippo -g sudo

kullanıcı oluşturulduktan sonra

      su kippo

komutu ile kullanıcıya bağlanıyoruz.Home klasörüne cd komutu ile girişimizi yaptıktan sonra dosyayı indiriyoruz

      svn checkout http://kippo.googlecode.com/svn/trunk/ ./kippo

sonra config dosyamızı düzenlememiz lazım bunun için mv komtuna ihtiyacımız var

> mv kippo.cfg.dist kippo.cfg

> nano kippo.cfg

dosyamızı düzenlemek için hazır hale getirdik...

> ssh\_port = 2222

olan yeri

> ssh\_port = 22

Olarak değiştiriyoruz...

ve son olarakta dosyamızı çalıştırmaya geliyor sıra...

      ./start.sh

komutunu verdikten sonra arkamıza yaslanıyoruz ve gelen saldırıları izliyoruz kişinin yapacak fazla bir seçeneği yok gibi gözüküyor sistemi kullanarak tam olarak neyin ne olduğunu görmeye çalışacağım ve bu makalede ilk Türkçe makale olarak google kayıtlarına girecek sanırım :)
