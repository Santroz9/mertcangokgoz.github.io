---
layout: post
title: Temel Linux Komutları
date: 2016-06-18
type: post
categories: Linux
description: Bilinmesi ve unutulmaması gereken temel linux komutlarının derlenmiş bir halidir.Kullandığım bu komutları bende arada
---

Bilinmesi ve unutulmaması gereken temel linux komutlarının derlenmiş bir halidir.Kullandığım bu komutları bende arada unuttuğum için referans olmasını istedim bulup buluşturdum düzenledim ve tamamladım.

### Sistem


| Komut          | Açıklama                                                    |
|:---------------|:------------------------------------------------------------|
| `uname -a`       | Sistem bilgisi(çekirdek sürümü, tarihi ve mimarisi)         |
| `uname -r`       | Çekirdek sürümü                                             |
| `uptime`         | Sistemin ne kadar zamandır açık olduğunu ve yükü gösterir   |
| `hostname`       | sistemin adı                                                |
| `last reboot`    | Son kapanma listesi çalışma düzey değişikliği dahil         |
| `date`           | tarih hakkında bilgi verir                                  |
| `cal`            | takvim                                                      |
| `w`              | hangi kullanıcı o anda hangi komutu çalıştırdığını görürüz. |
| `whoami`         | o anki kullanılan kullanıcı adını verir                     |
| `finger mertcan` | kullanıcı hakkında bilgi verir                              |

### Donanım

| Komut                 | Açıklama                                 |
|:----------------------|:-----------------------------------------|
| `dmesg`                 | Kernel mesajlarını verir                 |
| `cat /proc/cpuinfo`     | İşlemci hakkında bilgi verir             |
| `cat /proc/meminfo`     | Bellek(RAM) hakkında bilgi verir         |
| `cat /proc/interrupts`  | CPU Çekirdek sistem kesme listesi        |
| `lshw`                  | Sistemin donanım konfigurasyon bilgileri |
| `lsblk`                 | Disk Bölümleme tablosu                   |
| `free -m`               | Sistemde kullanılan ram bilgisi          |
| `lspci -tv`            | PCI cihazlarını listeler                 |
| `lsusb -tv`             | USB cihazlarını listeler                 |
| `dmidecode`             | BIOS donanım bilgisi                     |
| `hdparm -i /dev/sda`    | disk hakkında bilgi verir                |
| `hdparm -tT /dev/sda`   | kullanılan disk için okuma hız testi     |
| `badblocks -s /dev/sda` | Ulaşılamayan block tespiti               |

### Kullanıcılar

| Komut           | Açıklama                                                                 |
|:----------------|:-------------------------------------------------------------------------|
| `id`              | kullanıcı id bilgisi                                                     |
| `last`            | sisteme en son giriş yapmış kullanıcıların bugünden geriye doğru listesi |
| `who`             | sisteme kayıtlı kullanıcılar                                             |
| `groupadd`        | sisteme yeni bir grup oluşturur                                          |
| `useradd mertcan` | sisteme bir kullanıcı ekler                                              |
| `userdel mertcan` | sistemden bir kullanıcı siler                                            |
| `usermod`         | kullanıcı izinlerini değiştirme                                          |


### Dosya

| Komut             | Açıklama                                         |
|:------------------|:-------------------------------------------------|
| `ls -la`            | dosyaları listeler (a gizli olanlar, l detaylı)  |
| `pwd`               | mevcut dizin                                     |
| `mkdir`             | dizin oluşturma                                  |
| `rm`                | Dosya sil                                        |
| `rm -r`             | Dizin sil                                        |
| `rm -f`             | zorlayarak sil                                   |
| `rm -rf`            | dizini silmeye zorla                             |
| `cp`                | dosyayı kopyala                                  |
| `cp -r home1 home2` | home1 isimli dizini home2 ye taşı yoksa oluştur  |
| `mv`                | dosyaları taşıma                                 |
| `ln -s `            | kısayol oluştur                                  |
| `touch`             | dosya oluştur                                    |
| `cat`               | dosya içeriğinin tümünü oku                      |
| `more`              | dosyanın içeriğini sayfalayarak göster           |
| `head`              | dosya içeriğinin ilk 10 satırını göster          |
| `tail `             | dosya içeriğinin son 10 satırını göster          |
| `tail -f `          | dosyanın içeriğinin son 10 satırını anlık göster |

### İşlem

| Komut             | Açıklama                                                                            |
|:------------------|:------------------------------------------------------------------------------------|
| `ps`                | Çalışan süreçler                                                                    |
| `ps aux | grep program adı` |tüm telnet süreçlerinin id bilgisi                                |
| `pmap -x PID`       | İşlemin bellek haritası                                                             |
| `top`               | Temel sistem durumu, çalışmakta olan süreçler ne kadar bellek/işlemci kullandıkları |
| `kill`              | işlemi bitir                                                                        |
| `killall`           | bütün işlemleri bitir                                                               |
| `pkill -f telnet`   | işlemi bitir                                                                        |
| `bg`                | durdurulmuş işleme arkaplanda devam et                                              |
| `fg`                | arkaplanda yapılan işlemi ön plana getir                                            |


### İzinler

| Komut                                          | Açıklama                                                      |
|:-----------------------------------------------|:--------------------------------------------------------------|
| `chattr +i dosyaadı`                             | dosyalar silinemez dokunulmaz olur                            |
| `chattr -i dosyaadı`                             | dokunulmazlığını kaldırma                                     |
| `chattr +a dosyaadı `                            | Varolan satırları korur, altına satır eklenmesine izin verir. |
| `chmod 777 `                                     | her şey okunabilir, yazılabilir ve çalıştırılabilir.          |
| `chmod 644`                                      | sadece okunabilir                                             |
| `chmod 755`                                      | sadece sahibi okur, yazar ve çalıştırılabilir.                |
| `chown owner-user`                               | dosyanın sahibini değiştirir                                  |
| `chown owner-user:owner-group`                   | dosyanın sahibini ve grubunu değiştirir                       |
| `chown -R kullanıcıadı:kullanıcıadı dizin/dosya` | kullanıcıya dizinleriyle birlikte erişim izni verir           |

### Ağ

| Komut                                   | Açıklama                                                         |
|:----------------------------------------|:-----------------------------------------------------------------|
| `ip addr show`                            | tüm network interfaceslerini listeler ve ip adreslerini gösterir |
| `ip address add 192.168.0.12 dev enp4s0`  | belirtilen interfaces ip adresi ekler                            |
| `ethtool enp4s0`                          | ethernetin durumu hakkında bilgi verir                           |
| `ping 192.168.0.12`                       | ip adresine echo isteği atar                                     |
| `dig mertcangokgoz.com`                   | Alan adı hakkında DNS bilgilerini verir                          |
| `dig -x`                                  | geriye doğru arama işlemi                                        |
| `host mertcangokgoz.com`                  | host adını alıp makine adına bakar                               |
| `hostname -i`                             | yerel ip adresini gösterir                                       |
| `wget https://mertcangokgoz.com/test.bin` | dosya indirir                                                    |
| `netstat -tupl`                           | aktif dinlenilen portları listeler                               |
| `ifconfig -a`                             | Bilgisayardaki bulunan interfaces elemanlarını listeler          |

### Arşivleme

| Komut                           | Açıklama                                        |
|:--------------------------------|:------------------------------------------------|
| `tar -cf homebackup.tar home`     | homebackup.tar adlı bir arşiv dosyası oluşturur |
| `tar -xf homebackup.tar`          | homebackup.tar adlı arşivi ayrıştırır           |
| `tar -czf homebackup.tar.gz home` | gzip sıkıştırması kullanılarak arşiv oluşturur  |
| `gzip home`                       | home.gz olarak arşiv dosyası oluşturur          |

### Kurulum

| Komut                     | Açıklama   |
|:--------------------------|:-----------|
| `yum install paket adı`     | paketi kur |
| `yum remove paket adı`      | paketi sil |
| `apt-get install paket adı` | paketi kur |
| `apt-get purge paket adı`   | paketi sil |

### Derleme

Temelde tüm derleme işlemleri aşağıdaki komutlar aracılığı ile yapılmaktadır.

| Komut        | Açıklama |
|:-------------|:---------|
| `./configure`  |          |
| `make`         |          |
| `make install` |          |

### Arama

| Komut                              | Açıklama                                       |
|:-----------------------------------|:-----------------------------------------------|
| `grep ifade dosya`                   | dosya içerisinde geçen ifadeyi aratır          |
| `grep -r ifade dosya`                | özyineli bir şekilde belirtilen ifadeyi aratır |
| `locate dosya`                       | belirtilen dosyayı aratır                      |
| `find /home/mertcan -name "mertcan"` | adında mertcan geçen dosyaları aratır          |
| `find /home/mertcan -size 100k`      | 100k dan büyük olan dosyaları aratır           |

### SSH

| Komut                      | Açıklama                                         |
|:---------------------------|:-------------------------------------------------|
| `ssh kullanıcı@host`         | belirtilen makineye bağlanır                     |
| `ssh kullanıcı@host -p port` | belirtilen makineye belirtilen port ile bağlanır |
| `telnet host`                | telnet portu ile makineye bağlanır               |

### Dosya Transferi

| Komut                                                 | Açıklama                                       |
|:------------------------------------------------------|:-----------------------------------------------|
| `scp kullanıcı@host:aktarılacakdosya.txt /home/mertcan` | belirtilen makineye dosya transferi yapar      |
| `rsync -a /home/mertcan /yedekler`                      | kaynak ve hedef arasında senkronizasyon sağlar |

### Disk Kullanımı

| Komut                                        | Açıklama                                                            |
|:---------------------------------------------|:--------------------------------------------------------------------|
| `df -h --diskler hakkındaki son durum görülür` |                                                                     |
| `df -i`                                        | boş inode durumu görüntülenir                                       |
| `fdisk -l`                                     | disk tipleri ve boyutlarını görüntüler                              |
| `du -ah`                                       | dizinlerin kullandıkları alanı okunaklı olarak gösterir             |
| `du -sh`                                       | dizinin kullandığı toplan alanı gösterir                            |
| `findmnt`                                      | dosya sistemindeki bağlı tüm dizinleri detaylı bir şekilde gösterir |
| `mount /dev/sda /mnt`                          | diski /mnt ye bağlar                                                |

### Dizin

| Komut    | Açıklama                    |
|:---------|:----------------------------|
| `cd`       | birinci seviye dizine gider |
| `cd ..`    | bir üst dizine gider        |
| `cd dizin` | belirtilen dizine gider     |

### Bonus

| Komut                                                             | Açıklama                                         |
|:------------------------------------------------------------------|:-------------------------------------------------|
| `history -c`                                                        | komut satır geçmişini temizler                   |
| `clamscan -r -z --remove --verbose /home`                           | Virüs tarama ve silme işlemi                     |
| `du -h --max-depth=1 | sort -hr` |Dizinlerin toplam boyutlarını gösterir |
| `find /home/mertcan/ -type f -exec grep -H 'yazı' {} \;`            | dizin içerisinde yaziyı aratır                   |
| `dd if=debian.iso of=/dev/sdb`                                      | iso kalıbını USB veya DVD ye yazdırma            |
| `shred —verbose —random-source=/dev/zero —iterations=5 /dev/sda`    | ultra güvenli disk silme                         |
| `find -type f -exec chmod 644 {} \;`                                | tüm dosya izinlerini 644 yapar                   |
| `openvpn --config client.ovpn`                                      | VPN sunucusuna bağlantı sağlar                   |
| `sensors`                                                           | donanım parçalarının ısılarını verir             |
| `rm -rf /`                                                          | ecelinize susadıysanız kullanabilirsiniz         |
