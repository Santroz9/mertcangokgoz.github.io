---
layout: post
title: Froxlor Sunucu Yönetim Paneli
date: 2015-10-16 17:14:03.000000000 +03:00
type: post
categories: linux
description: Froxlor çoklu-kullanıcı hizmetlerini yönetmek için kullanılan bir sunucu yönetim paneli. Alan adı hizmetleri, e-posta hesapları ve web sunucusu
---

**Froxlor** çoklu-kullanıcı hizmetlerini yönetmek için kullanılan bir sunucu yönetim paneli.Alan adı hizmetleri, e-posta hesapları ve web sunucusu vb işler için cpanel veya webmine iyi bir alternatiftir.

## Özellikleri

- Oluşturulan alan adları başına SSL tanımlayabilme ve buna bağlı olarak kullanılacak portu seçme imkanı
- Oluşturulan alan adları başına İP adresi atama ve buna bağlı olarak kullanılacak domaini seçebilme
- Tüm yönetim işlevleri yanında sisteme Ticket sistemi entegre edilmiştir böylelikle bir sorun oluştuğunda direk olarak sistem yöneticisine kullanıcılar ulaşabilmektedir.
- Özelleştirilebilir temalar ile kendi temalarınızı oluşturabilirsiniz.
- Farklı php.ini dosyaları oluşturabilirsiniz.Böylelikle istediğiniz zaman php.ini değiştirerek ayarları hemen aktif edebilirsiniz.
- Tüm http, e-posta ve ftp trafik logları saklanır ve interaktif grafikler aracılığıyla ile takip edilebilir.
- web-ftp sayesinde dosya indirme ve gönderme işlemlerini tarayıcı üzerinden kolaylıkla yapabilirsiniz.

## Froxlor Nasıl Kurulur

Froxlor debian sistemler üzerinde sorunsuz çalıştığı bilinmektedir ayrıca test edilmiştir.Sisteminizde Mysql,Apache ve python paketlerinin kurulu olması gerekmektedir.

    sudo add-apt-repository "deb http://debian.froxlor.org wheezy main"
    sudo apt-get update
    sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-key FD88018B6F2D5390D051343FF6B4A8704F9E9BBC

Sisteme froxlorun kurulumunu gerçekleştirmemizi sağlayacak paketleri dahil ettik aşağıdaki komut aracılığı ilede yönetim panelini kurabilirsiniz.Ayrıca **php5-curl** paketinide kurmanız gerekmektedir.

    sudo apt-get install froxlor php5-curl

Komutları verdiğiniz zaman karşınıza ilk olarak mysql kurulum ekranı gelecek bu ekrandan **mysql** kullanımı için admin şifresini ayarlamanız gerekiyor.Kolay bir şifre koymayın

![mysqlrootpass1](/assets/mysqlrootpass1.png)

web taraflı klasör oluşturulsunmu diye tarafınıza soracak ihtiyacınız olmayacağı için açmayın

![directorycreate1](/assets/directorycreate1.png)

sonrasında **postfix** ayarına geliyor sura burada **"Internet Site"** seçin böylelikle ayarları otomatik olarak yapacak **SMTP** kurulumları vs

![postfixconfigure1](/assets/postfixconfigure1.png)

Sizden **hostname** isteyebilir ayarlamasını yapınız türkçe karakter kullanmamaya özen gösterin ardından **FTP** ayarlamalarını yapmanız için bir ekran gelir.bu ekrandan **standalone** yi seçip onaylayın.

![proftpdconfiguration1](/assets/proftpdconfiguration1.png)

Ardından kurulu olan apacheyi yeniden başlatmanız yeterli olacak kurulum sisteminizin hızına ve sizin tecrübelerinize göre farklılık gösterebilir.

    sudo /etc/init.d/apache2 restart

Kurulum tamamlandıktan sonra sitenize ister alan adınızdan istersenizde ip adresinden erişebilirsiniz.Panelinizi kullanmak için **"/froxlor"** girmeniz yeterli

![floxlorgorsel1](/assets/floxlorgorsel1.jpg)

**Start install** butonuna basıyoruz kurulum ekranı geliyor ve kurulumu otomatik olarak gerçekleştiriyor.

![floxlorinstall1](/assets/floxlorinstall1.png)

kurulumun 2.aşamasına geçiş yapıyoruz burada **froxlor** için **mysql** ayarlarını vermemiz gerekiyor.

![mysqlfloxorsettings](/assets/mysqlfloxorsettings.jpg)

bu aşamadan sonra kurulum tamamen bitmiş olacak artık panelinize giriş yapabilirsiniz.

![successfull1](/assets/successfull1.png)

Ayarlamış olduğunu kullanıcı adı ile giriş yapıyorsunuz ve artık istediğiniz herşeyi yapabilirsiniz.Kullanıcı tanımlayıp sunucunuzda müşterilerinizi barındırabilirsiniz.

![loginscreen](/assets/loginscreen.png)

Giriş yaptınız karşınızda aşağıdaki gibi bir panel karşılayacak sizi oldukça güzel ve grafiksel olarak iyi tasarlanmış kullanımıda oldukça kolay sitenizi bu panelden yönetebilirsiniz.

![panelscreen1](/assets/panelscreen1.jpg)

Froxlor yönetim paneli konusunda bilmeniz gereken bir noktada dosyaların **/var/www/froxlor** yada **/var/www/html/froxlor** bulunabilecek olması iki dizinide kontrol etmeniz önerilir tanımlanan ayarları kullanırsanız **/var/www/html/froxlor** dizininde olduğunu göreceksiniz.
