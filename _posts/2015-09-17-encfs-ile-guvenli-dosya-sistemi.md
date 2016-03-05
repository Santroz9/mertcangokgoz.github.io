---
layout: post
title: EncFS ile Güvenli Dosya Sistemi
date: 2015-09-17 12:05:40.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: EncFS Açık kaynak kodlu bir Encrypttion uygulamasıdır.Fuse library kullanır yani dizin içerisindeki veriyi başka bir yollarda saklar.Ayrıca
---

![sifreligorsel1](/assets/sifreligorsel1.jpg)

**EncFS** Açık kaynak kodlu bir **Encrypttion** uygulamasıdır._Fuse library_ kullanır yani dizin içerisindeki veriyi başka bir yollarda saklar.Ayrıca EncFS bir dosya sistemi türü değildir sadece dosyaları şifrelemek için kullanılan ve asıl kullanılan dosya sistemi üzerinde oluşturulan bir yapıdır.Verilerinizi meraklı gözlerden korumak istiyorsanız kullanabilirsiniz.Hali hazırda kullanılan LUKS yapısına alternatif olarak görülmektedir.Güvenlidir lakin bir takım güvenlik açıklarının olduğu söylenmektedir.Her ne kadar açıklar olsada yetkililer hemen bu bulunan açıkları kapatmaktadırlar. **AES** ve **Blowfish** cipher desteği bulunmaktadır.küçük boyuttaki verileri şifrelemek için özellikle kullanılabilir.

Sistemimize **EncFS** kurulumuyla işleme başlayalım

Debian tabanlı sistemler için

    sudo apt-get install encfs

Centos/RHEL

    yum install -y fuse-encfs

Kurulumlar tamamlandığı zaman her iki sistme içinde gerçerli olan komut yardımıyla kernel tanımlaması yapıyoruz.Burada tanımlamayı yaparken **FUSE** modülünü kullanıyoruz

    modprobe fuse

bu aşamadan sonra yapmamız gereken 2 adet klasör oluşturmak bunlardan ilki verinin şifreli olarak tutulacağı klasör ikincisi ise verilerin şifrelenmemiş halleri bulunacak.İkinci bölüme atılan her dosya şifrelenip birinci bölümde tutulacaktır.(klasör isimlerini istediğiniz gibi verebilirsiniz.)

    mkdir -p ~/encrypted
    mkdir -p ~/decrypted

**EncFS** uygulamamızı sistemde bi mount etme işlemi gerçekleştireceğiz bu sıradada ayarları yapacağız

    encfs ~/encrypted ~/decrypted

Komutu çalıştırdığımız zaman karşımıza bir takım bilgilendirmeler ve uygulayacağımız adımların olduğu bir bölüm gelecek aşağıdaki örnek yapılandırma ile işleminize devam edebilirsiniz.

    # encfs /root/encrypted /root/unencrypted
    Creating new encrypted volume.
    Please choose from one of the following options:
     enter "x" for expert configuration mode,
     enter "p" for pre-configured paranoia mode,
     anything else, or an empty line will select standard mode.
    ?> p

    Standard configuration selected.

    Configuration finished. The filesystem to be created has
    the following properties:
    Filesystem cipher: "ssl/aes", version 3:0:2
    Filename encoding: "nameio/block", version 3:0:1
    Key Size: 192 bits
    Block Size: 1024 bytes
    Each file contains 8 byte header with unique IV data.
    Filenames encoded using IV chaining mode.
    File holes passed through to ciphertext.

    Now you will need to enter a password for your filesystem.
    You will need to remember this password, as there is absolutely
    no recovery mechanism. However, the password can be changed
    later using encfsctl.

    New Encfs Password:
    Verify Encfs Password:

Modu **p** yardımıyla önceden hazırlanan ayarlar ile yapılandır diyoruz en son olarakda şifremizi giriyoruz ve artık dosyalarımız şifrelenmeye hazır.Oluşturduğumuz alanı görmek ve özelliklerine bakmak için

    df -h

komutunu vermeniz yeterli nereye oluşturulduğu boyutu ne kadar alan kullandığı gibi detaylı bilgileri sizelere sunacaktır.Şimdi ufak bir test işlemi gerçekleştirmek için şifresiz bölümümüz olan decrypted bölümüne gidelim tipik test etlemenleri olan foo ve bar oluşturalım.

    echo "fooooo" > foo
    echo "bar" > bar

dosyalarımız oluştu bakalım doğru oluşmuşmu diye bi komutumuzu verelim.

    ls -la

Örnek çıktımız şu şekilde

    root@0x2e88ce4:~/decrypted$ ls -l
    total 8
    -rw-rw-r-- 1 root root 10 2015-09-13 12:47 bar
    -rw-rw-r-- 1 root root 10 2015-09-13 12:47 foo
    root@0x2e88ce4:~/decrypted$

buraya atılan tüm dosyalar şifreli bir şekilde **encrypted** klasöründe tutulur demiştik şimdi oluşturduğumuz bu dosyanın ne şekilde gözüktüğüne bir bakalım.

    cd ~/encrypted
    ls -l

Örnek çıktımız şu şekilde

    root@falko-desktop:~/encrypted$ ls -l
    total 8
    -rw-rw-r-- 1 root root 26 2013-07-20 17:47 ,B8fReOT8S4b37B980A1BItHg6x250
    -rw-rw-r-- 1 root root 26 2013-07-20 17:47 c2qzAmsTeEklyJeQprwPimYubA725
    root@falko-desktop:~/encrypted$

işlemimiz tamamlandıktan sonra umount işlemini yapmamız gerekiyor yoksa başımıza iş açabilir bunun için yapılması gerekenler şu şekildedir.Ana dizine geçiş yapıp **şifrelenmemiş** dizini çıkartıyoruz ki gözükmesin.

    cd
    fusermount -u ~/decrypted

listede varmı yokmu diye kontrol etmek için ise

    df -h

komut sonrasında **EncFS** kullanılan dizinleri görmemeniz gerekiyor.Görüyorsanız yukarıdaki işlemleri tekrarlayarak **umount** işlemini gerçekleştirin.Dosyalarınıza tekrar ulaşmak isterseniz ise yukarıdaki mount komutunu tekrar verip oluşturduğunuz şifrenizi girerseniz tekrar aynı bölüme ulaşabilirsiniz.

    encfs ~/encrypted ~/decrypted
