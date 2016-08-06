---
layout: post
title: Ubuntuya Kurulması Gereken 5 Uygulama
date: 2014-06-13 01:38:31.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Ubuntunuzu kurdunuz aklınıza kuracak birşey gelmiyor ise doğru yere bakıyor olacaksınız.Ubuntunun güzel yanlarından birisi bahsettiğim
---
Ubuntunuzu kurdunuz aklınıza kuracak birşey gelmiyor ise doğru yere bakıyor olacaksınız.Ubuntunun güzel yanlarından birisi bahsettiğim gibi az programa ihtiyaç duymamızdı işte 5 adet her işimize yarayacak olan uygulamaların kurulumuna sırasıyla verilen adımları uygulamanız programları kurmanız için yeterli olacaktır.

# Sisteminizi Güncelleyin

Sisteminizi her ne kadar yeni indirip kurduysanız da mutlaka güvenlik güncellemeleri yada bir takım değişiklikler gelmiş olabilir bunları uygulamak için aşağıdaki parametreleri terminal yardımıyla uyguluyoruz.

    sudo apt-get update
    sudo apt-get upgrade

![ubuntuguncellemegorsel1](/assets/ubuntuguncellemegorsel1-e1402594880990.png)

# 1. Ubuntu Tweak

Sisteminiz için olmazsa olmaz bir uygulamadır ubuntunun 12.04 sürümünden beri benim vazgeçilmezimdir sisteminizde ince ayarları yapmanıza olanak sağlar.Bir çok sistem ayarlarını ve masaüstü ayarlarını değiştirebilirsiniz.

### Kurulum

    sudo add-apt-repository ppa:tualatrix/next
    sudo apt-get update
    sudo apt-get install ubuntu-tweak


# ![ubuntutweakgorsel1](/assets/ubuntutweakgorsel1.png)

# 2.VLC Player

Linux Pek çok media tipini açsada hala mkv ve h264 destegi bulunmamaktadır.Desteklemediği pek çok uzantıdaki video dosyasını oynatmak için vlc yi kullanabilirsiniz bunun yanında ubuntunun kendi media oynatıcısından benim gibi sıkıldıysanızda kurabilirsiniz.

### Kurulum

    sudo apt-get install vlc

![vlcarkadasimhosgeldingorsel1](/assets/vlcarkadasimhosgeldingorsel1-e1402595977354-869x576.png)

# 3.Uzak Masaüstü TeamViewer

Ubuntu kullandığımız için sorunlar olabilir bu yüzden forumlardan bilgili insanlardan yardım almanız gerekebilir.Yada başka arkadaşlarınızın yardıma ihtiyacı olabilir.

### Kurulum

    http://download.teamviewer.com/download/teamviewer_linux.deb

indirip direk olarak açınız

![teamviewergorsel1](/assets/teamviewergorsel1.png)

# 4.Tor Browser

Gizliliğinizi ve anonim kimliğinizi korumanıza yardımcı olan Tor u sisteminizden kesinlikle eksik etmemenizde fayda var zira yaşadığımız zamanlar pek hoş değil güvenlik hem sizin için hemde çevrenizdekiler için önemlidir.

### Kurulum

    sudo add-apt-repository ppa:webupd8team/tor-browser
    sudo apt-get update
    sudo apt-get install tor-browser

![torbrowsergorsel](/assets/torbrowsergorsel-e1402612000104-913x576.png)

# 5.BleachBit

Windowsdaki gibi bir temizleme aracına ihtiyaç duyuyorsanız bleachbit tam sizin aradığınız uygulama gereksiz gördüğü tüm kayıtları siler ve düzenler güncellemelerden kalan .deb kırıntılarını ve logların silinmesine yardımcıdır.

### Kurulum

    sudo apt-get install bleachbit

![bleachbitgorsel1](/assets/bleachbitgorsel1.png)
