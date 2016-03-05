---
layout: post
title: Ubuntu 15.04 Vivid Vervet Sürümüne Geçiş
date: 2015-05-01 14:51:49.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Ubuntu 14.10 Utopic Unicorn Sürümünden Ubuntu 15.04 Vivid Vervet Sürümüne geçiş yapmak için yapmanız gerekenler oldukça basit olmakla birlikde
---

# Masaüstü Sürümleri İçin

**Ubuntu 14.10 Utopic Unicorn** Sürümünden **Ubuntu 15.04 Vivid Vervet** Sürümüne geçiş yapmak için yapmanız gerekenler oldukça basit olmakla birlikde birazcık **ubuntu** bilginiz varsa güncelleme işlemini kolaylıkla yapabilirsiniz aslına bakarsanız ubuntu kullanıyorsanız zaten yapabilmeniz lazım.

**CTRL + ALT + T** Tuş kombinasyonları ile Terminale yani uç birimi açalım sonrasında komutlar ile yönetici hesabına geçişimizi tamamlayalım

    sudo su
    sudo apt-get update && sudo apt-get dist-upgrade

Komutunu uygulayalım ardından birkaç işlem yapacak sistem hemen aşağıdaki komutu verelim

    sudo update-manager -d

karşınıza işte kullandığınız sistem **Ubuntu 14.10** sistemi **Ubuntu 15.04** yükseltmek istediğinizden eminmisiniz diye bir seçenek çıkacak **Upgrade** tuşuna basıyorsunuz.Sonra lisans sözleşmesi gibi birşey gelecek karşınıza oradaki yazıları okuyacak haliniz elbetde olmayacağı için direk olarak **Upgrade** tuşuna basın siz

![ubuntu15.04upgradegorsel1](/assets/ubuntu15.04upgradegorsel1-e1430341196495.jpg)

Bu aşamadan sonra sistem uzunca bir süre aşağıdaki gibi bir pencere açacak ve bekletecek sizi bir kaç işlem yapacak güncellenecek ve yükseltilecek paketleri kontrol edecek ve koyulacak işe

![ubuntu15.04yukseltme](/assets/ubuntu15.04yukseltme-e1430341281610.jpg)

Tüm aşamalar tamamlandıktan sonra onaylamanızı isteyeceği bir pencere daha açacak size ve gerçekten kurulumu gerçekleştirmek istiyormusun diye soracak sende gözünü kararttığın için **Start Upgrade** tuşuna basacaksın ve işleme başlayacak sistem

![ubuntu15.04yukseltme2](/assets/ubuntu15.04yukseltme2-e1430341386627_ndm9qy.jpg)

Şimdi geldik zurnanın caaart dediği yere burada internet hızınıza göre bu işlem uzayıp gideceği için **belli bir süre veremiyorum** şu vakitde biter diye ama işleme başladığında şöyle bir görüntü oluşacak

![ubuntu15.04yukseltme3](/assets/ubuntu15.04yukseltme3-e1430341468534.jpg)

Kurulum aşaması tamamlandıktan sonra aşağıdaki gibi bir pencere açacak size ve diyecek ki eski paketleri kaldırayımmı abi ? sizde diyeceksiniz ki bunlar sistemde yer kaplıyordur durması olmaz kaldır bakalım diyorsunuz 1 dk süren bir temizleme aşaması ile karşı karşıya kalıyorsunuz ama eski paketleriniz kaldırıldığı için sisteminizde hatrı sayılır bir yer açılıyor yaklaşık **600 MB** civarında olması lazım tabi değişedebilir bilemeyiz.

![ubuntu15.04yukseltme4](/assets/ubuntu15.04yukseltme4-e1430341605338.jpg)

Bu aşamadan sonra ise sistemi yeniden başlatmanızı isteyecek **Evet** diyip devam ediyoruz.Ve sisteminiz bir üst sürüm olan **Ubuntu 15.04 Vivid Vervet** geçmiş oluyor artık yeni sisteminizin keyfini çıkartabilirsiniz.

# Server Sürümleri İçin

Server sürümlerde açılacak pencere olmadığı için ve elinizde komut satırı olduğu için gireceğiniz komutlar çok önemli yükseltma aşamasına geçebilmeniz için aşağıdaki adımları uygulamanız yetecek ve kurulumu yapabileceksiniz tabi sisteminizde ne kullanıyorsunuz bilemeyiz bu yüzden kabaca bir anlatım yapacağım

    sudo apt-get install update-manager-core

Komutu ile güncelleme yardımcısı arkadaşı sisteme dahil ediyoruz sonra kurulumu yapacak olduğumuz sürümü seçmek adına ufak bir ayar yapmamız gerekecek

    sudo nano /etc/update-manager/release-upgrades

açtığımız dosya içerisinde bir sürü satır olacak bunlardan bazıları açıklama kısmı takılmayın oralara ayarı şu şekilde yapıp devam edelim.

    [DEFAULT]
    # Default prompting behavior, valid options:
    #
    # never - Güncellemenin yapılmayacağını belirtme
    # normal - Normal Ubuntu sürümleri
    # lts - Uzun destek süresüne sahip olan sürüm.
    Prompt=normal

Server kullandığımız için **LTS** kullanmamız akıllıca olmazdı Masaüstü sürümü kullansaydık belki iş görürdü ancak ben Normal sürümü seçiyorum.her yeni çıkan sürüme kolaylıkla geçebileyim hemde bir sıkıntı yaşamayalım ayrıca **Ubuntu 15.04 Vivid Vervet** sürümü LTS olmadığı içinde yükseltme işlemi çalışmaz bunuda göz önünde bulundurmanızda fayda var

    sudo do-release-upgrade -d

Son olarak yukarıdaki komut ile yükseltme işlemini başlatıyoruz.Sistem hızına ve sunucunun internet hızına göre değişecek bir kurulum aşaması ile karşılaşacaksınız sonrasında ise zaten gerekenleri kendi yapacağı için arkanıza yaslanabilirsiniz.
