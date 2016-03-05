---
layout: post
title: Dropbox Uploader ile Backup Alma
date: 2014-07-31 18:30:34.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Dropbox Uploader ile Dedicated,VPS,VDS gibi kullandığınız sistemlerde rahatlıkla uzak sunucuya yedeklerinizi atabilir ve rahat bir nefes
---
Dropbox Uploader ile Dedicated,VPS,VDS gibi kullandığınız sistemlerde rahatlıkla uzak sunucuya yedeklerinizi atabilir ve rahat bir nefes alabilirsiniz.Pek çoğumuz yedekler konusunda gerçekten sorumsuz bir şekilde ya kendi bilgisayarımızda yada yedekleri aynı sunucu üzerinde farklı bir dizinde tutuyoruz haliyle hem bu bir güvenlik açığı oluyor hemde tamamen sunucuda bir hasar oluştuğu zaman yedeklerimizin çöpe gitmesine neden oluyor bu tarz durumlara düşmemek için Dropbox Uploader tam size göre ayda 1 yada günlük şekillerde istediğiniz gibi ayarlayabilirsiniz. Dilerseniz cronjob ayarlayıp gerekli zamanlarda yedeğinizin yüklenmesini sağlayabilirsiniz.

**Bu Scripti neden kullanmalıyız ?**

- Bash Script olduğundan dolayı tüm linux sistemlerinizde sorunsuz bir şekilde kullanmanıza olanak sağlar ve sadece sisteminizde cURL olması yeterlidir.
- Güvenlidir kullanıcı adı ve şifresi girmenize gerek kalmaz Dropbox API Sayesinde sisteminize ulaşsalar bile yedeklerinizi göremezler ve(veya) ulaşamazlar.

**Özellikleri**

1. Çapraz Platform
2. Resmi Dropbox API Desteği
3. hiçbir şifreye gerek duyulmaz ve kayıt edilmez
4. Adım adım yapılandırma sihirbazı ile kolay kurulum
5. Sıkıştırılmış dosya yükleme özelliği
6. uploada özel Shell wildcard
7. Paylaşma linki oluşturabilme
8. Sil / Taşı / Yeniden Adlandır / Kopyala / Dosyaları Listele
9. dosya ve dizin indirebilme ve işlemler yapabilme özelliği
10. sunucuya yedekleri indirebilme özelliği

    apt-get install git
    git clone https://github.com/andreafabrizi/Dropbox-Uploader/
    curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o dropbox_uploader.sh
    chmod 777 dropbox_uploader.sh
    ./dropbox_uploader.sh

başlattığınız zaman yapılandırma sihirbazı başlatılacak&nbsp; bundan sonra gerekli adımlayı uyguladığınız taktirde işleminiz başarılı bir şekilde tamamlanacaktır.izinleri full dropbox verecekseniz eğer hesabınız yeni olmalı diğer türlü başka yedekleriniz var ise sıkıntıya düşebilir.benim başka yedeklerim olduğu için app izni vermeyi makul gördüm.Onayı verdikten sonra ise kurulum tamamlanacak tabi bir tek şart ile api ye izin vermeniz gerekiyor onunda linkini uygulama size verecek zaten.

![dropboxabackupyapmagorsel2](/assets/dropboxabackupyapmagorsel2.png)

Oluşturma ekranımızı yukarıdaki verilen yönergelere uyarak oluşturuyoruz. oluştuturken datastore seçeneğini seçiyoruz ki yüklerken sorun yaşatmasın bize

![dropboxabackupyapmagorsel1](/assets/dropboxabackupyapmagorsel1-e1406814599373-582x576.png)

Başarıyla oluşturduk APİ mizi ve gerekenleri sisteme giriyoruz.Onaylıyoruz.herşey tamam olduktan sonra kullanılacak komutlar aşağıdaki gibidir.

![dropboxabackupyapmagorsel2.2](/assets/dropboxabackupyapmagorsel2.2.png)

Kullanımı

    ./dropbox_uploader.sh COMMAND [PARAMETERS]...

    [%%]: Optional param
    <%%>: Required param

- upload: dosya eğer 150MB den büyük bir boyuta sahip ise 4 MB parçalar halinde yüklenecektir.Bir sorun oluşursa 3 kere yüklemeye çalışır yükleyemez ise hata verir.Eğer dosyanız 150MB den düşük ise direk olarak yükleme yapar.
- download: seçilen dosyanın indirilme işlemi
- delete: seçilen dosyanın silinme işlemi
- move: dosya taşıyabilir yada yeniden isim verebilirsiniz.
- copy: başka dizine dosya kopyalayabilirsiniz.
- mkdir: dropbox içerisinde klasör açmasına olanak sağlar
- list: dropbox içerisinde dosya ve klasörleri listeler.
- share: dosyaların paylaşma linkini üreterek çıktısını size verir.
- info: hesap hakkında bilgi verir.
- unlink : hesabınızdan yetkilendirmeyi kaldırır.

Parametreler

1. -f = belirli bir dosyadan yapılandırma yapmak için kullanılır
2. -s = var olan dosyaları atlayıp indirme veya yükleme
3. -d = debug yapmak için kullanılır
4. -q = sessiz moddur hata mesajları çıkmaz
5. -p = yüklemeyi yükleme çubuğu şeklinde gösterir
6. -k = SSL sertifikasını kontrol etmeden işlem yapar(Güvenliksizdir)

## **Örnekler**

    ./dropbox_uploader.sh upload /etc/passwd /myfiles/passwd.old
    ./dropbox_uploader.sh upload *.zip /
    ./dropbox_uploader.sh download /backup.zip
    ./dropbox_uploader.sh delete /backup.zip
    ./dropbox_uploader.sh mkdir /myDir/
    ./dropbox_uploader.sh upload "My File.txt" "My File 2.txt"
    ./dropbox_uploader.sh share "My File.txt"
    ./dropbox_uploader.sh list

Çalıştığını söyledikleri sistemler

- GNU Linux
- FreeBSD 8.3/10.0
- MacOSX
- Windows/Cygwin
- Raspberry Pi
- QNAP
- iOS
- OpenWRT
- Chrome OS
- OpenBSD

Linux tabanlı tüm sistemlerde çalışmaktadır...

Ayarlamalarımı yaptım crontab ayarlaması yapacam diyorsanız.Günlük yedekleme için aşağıdaki gibi kullanabilirsiniz.

    crontab-e
    001** /bin/bash/root/dropbox_uploader.sh
