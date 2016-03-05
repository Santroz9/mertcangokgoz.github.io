---
layout: post
title: Linux Önyükleme Süreci
date: 2015-08-02 19:31:30.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Linux Sistemlerde ön yükleme süreci 6 temel aşamadan oluşmaktadır.Altı aşama sonrasında sistem açılır ve dilediğiniz gibi kullanabilirsiniz peki bu 6
---

Linux Sistemlerde ön yükleme süreci 6 temel aşamadan oluşmaktadır.Altı aşama sonrasında sistem açılır ve dilediğiniz gibi kullanabilirsiniz peki bu 6 süreç içerisinde neler var.

1. BİOS Kontrolü
2. Birinci Aşama önyükleyici
3. İkinci Aşama önyükleyici
4. INIT Aşaması
5. Kullanıcı Ortam Ayarları
6. Giriş Ekranı

Sisteminizde herhangi bir sorun yoksa yada yapılandırmalarınız doğru ise yukarıdaki 6 aşama kolay bir şekilde geçilecek ve sisteminiz sorunsuz bir şekilde açılacaktır.Bu altı aşamanın da bu kadar hızlı yapılıyor olması sizi şaşırtmasın keza windows sistemlerde bu tarz işlemler yapmaktadır.

![linuxonyuklemeislemi](/assets/linuxonyuklemeislemi.jpg)

### 1.BİOS Kontrolü

Sunucu,Masaüstü bilgisayar yada dizüstü bilgisayarınız açılırken ilk önce işlemci giriş/çıkış ve çalıştırılacak basit ekipmanları belirler .Çalışıyor mu her şey yolunda mı diye bakar.Hata varsa neyden kaynaklandığı sizlere gösterir ve **BİOS** donanım ve sistem arasındaki ilişkileri düzenler uyumluluklarını sağlar.Bu aşamada 512 bayt boyutunda ve tamamen makine kodundan oluşan kodlar sistemde tutulur.Tüm yönergeler bu 512 baytlık dosya içerisindedir buna da **MBR** (Master Boot Record) denmektedir.İlk açılma işlemini yerine getirir.Bilgisayar başlatıldığında BIOS’ un ilk işi fare, klavye, HDD gibi sistem aygıtlarını tanıtmak ve kullanıma hazırlamaktır.

### 2.Birinci Aşama Önyükleyici

Boot Loader ilk aşaması **MBR** üzerinde bulunan verilerin doğrulanması yapılacak işlemlerin onaylanmasıdır.Bu aşamadan sonra boot loader kendini belleğe yükler ve ardından gelecek olan boot loader aşamasını beklemeye başlar.

### 3.İkinci Aşama önyükleyici

Beklenen ön yükleyici dosyaları belleğe yerleşmiş olarak bu aşamaya gelir kök bölümünü salt okunur bir hale getirilen bu aşamada modülleri ve gerekli olan yazılımlar sisteme tekrardan dahil edilir.İkinci aşama ön yükleyici bellekte farklı işletim sistemleri veya boot yapılandırılmış mı diye kontrol eder ve bir grafik kullanıcıya sunulur(genelde gördüğünüz kısım budur.). İşletim sistemini bu aşamada seçebilirsin eğer sistemde birden çok işletim sistemi kurulu ise ikinci aşama ön yükleyici devreye girmiş olacaktır.

### 4.INIT Aşaması

Linux işletim sistem çekirdeği(kernel) **/sbin/init** kısımlarını önyükleme işleminin denetimini aktarır. Yani **/sbin/init** kısımları önyükleme işleminin geri kalanını koordine eder ve kullanıcı için bir ortam yapılandırmaya başlar.

### 5.Kullanıcı Ortam Ayarları

Init programı yükler **/etc/fstab** de listelenen tüm hizmetleri ve kullanıcı alanını sisteme dahil eder. Init komutu başladığında, sistem üzerinde otomatik olarak devreye girer ,tüm süreçleri başlatır. İlk olarak ortam yolunu belirler,takas alanını başlatır,dosya sistemlerini kontrol eder ve sistem başlatma için gerekli tüm diğer adımları yürütür. **/etc/rc.d/rc** öncelikli olarak çalıştırılır. Init komutu daha sonra sisteme Sys init çalışma seviyesinde yapılması gerekenleri açıklar. Init programı **/etc/inittab** da ki varsayılan olarak belirlenmiş çalışma seviyesi için uygun dizine bakarak arka plan süreçlerinin tamamının başlatılmasını sağlar.

### 6.Giriş Ekranı

Tüm işlemlerin tamamlandığını gösterir ve kullanıcı bu ekran sayesinde bilgilerini girerek sisteme giriş yapar.Tebrikler başarılı bir şekilde sisteminizi başlatabildiniz.
