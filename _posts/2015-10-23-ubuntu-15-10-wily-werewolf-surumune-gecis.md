---
layout: post
title: Ubuntu 15.10 Wily Werewolf Sürümüne Geçiş
date: 2015-10-23 22:25:25.000000000 +03:00
type: post
categories: Linux
description: 22 Ekim günü Ubuntu 15.10 sürümü resmi olarak kullanıma sunuldu acısıyla tatlısıyla 9 aylık bir periyot sonunda 15.04 üzerine bir güncelleme gelmiş
---

22 Ekim günü **Ubuntu 15.10** sürümü resmi olarak kullanıma sunuldu acısıyla tatlısıyla 9 aylık bir periyot sonunda 15.04 üzerine bir güncelleme gelmiş oldu.Güncelleme ile sistem içerisinde kullanılan pek çok uygulama güncellenmiş oldu

- Kernel 4.2 Sürümü kullanılmaya başlandı
- MATE sürümü güncellendi
- Intel Broxton desteği getirildi
- NV-DIMM desteği
- F2FS dosya şifreleme desteği

Ayrıca güncelleme diğer ubuntu sürümlerinide desteklemekte Lubuntu/Kubuntu/Xubuntu kullanan arkadaşlarda bu güncellemeden faydalanabilirler 15.04 Sürümünde yapılması gereken son güncellemeleri yapalım ve varsa yeni sürümleri kontrol ettirelim.

    sudo apt-get update && sudo apt-get dist-upgrade

İşlem bittikten sonra sisteminizde güncelleştirme varsa yapılacaktır.Yoksa gözükmüyorsa sisteminizi yeniden başlatınız ardından komut satırına yetkili kullanıcı girişi yaparak aşağıdaki komutu veriniz böylelikle güncellemeyi yapabileceksiniz.

    sudo update-manager -d

![ubuntupgrade15.10gorsel1](/assets/ubuntupgrade15.10gorsel1.png)

Görüldüğü gibi güncellememiz bulundu **Upgrade** butonuna tıkladığımız anda yükseltme işlemine başlayacak.Tabi öncelikle sizden Sürüm notlarını okumanızı isteyecek

![ubuntupgrade15.10gorsel2](/assets/ubuntupgrade15.10gorsel2.png)

Okumayıp geçebilirsiniz.Ama okumanızı öneririm ne kurduğunuzu bilmeniz önemli hataları fark edebilmeniz önemli bilinmedik hatalar sistem kararlılığını oldukça tehlikeye atmaktadır. **Upgrade** bastığımızda ise aşağıdaki gibi bir ekran gelecek artık sisteminiz güncelleştirilmeye başlayacak.

![ubuntupgre15.10gorsel3](/assets/ubuntupgre15.10gorsel3.png)

Sisteminizdeki paket yoğunluğuna ve sisteminizin güncelliğine göre upgrade edilecek paket sayısı değişmektedir.Kurulum sırasında **/boot** alanı %90 dolu olduğundan kurulamıyor gibi bir hata ile karşılaşırsanız.Yapmanız gereken adımlar şu şekildedir.

    sudo apt-get autoremove

ardından riskli bir işlem olan **/boot** alanındaki eski kernel sürümlerini temizlemeye geldi sıra bu aşamada yapacaklarınız sisteminizde **ciddi sorunlara yol açabilir lütfen dikkatli olunuz.**

    dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/(.*)-([^0-9]+)/1/")"'/d;s/^[^]* [^]* ([^]*).*/1/;/[0-9]/!d' | xargs sudo apt-get -y purge

Bu işlemlerden sonra **/boot** alanında yer açılmış olacaktır.Yükseltme işlemine kaldığınız yerden devam edebilirsiniz.
