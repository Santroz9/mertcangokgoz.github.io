---
layout: post
title: Ubuntu 14.04 Üzerine VNC Kurulumu
date: 2015-01-27 14:48:42.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Centos üzerine VNC kurulumu makalemizde anlatmıştım.Şimdi Sıra geldi Ubuntu kullanan kullanıcılar için VNC kurmaya centos gibi aşırı kolay
---
**Centos** üzerine **VNC** kurulumu makalemizde [anlatmıştım](https://mertcangokgoz.com/centos-6-4-uzerine-vnc-server-kurulumu.html).Şimdi Sıra geldi Ubuntu kullanan kullanıcılar için **VNC** kurmaya centos gibi aşırı kolay olduğunu belirtmek isterim.Linux sunucularda uzaktan yönetiminde önemini vurgulamadan geçmek istemiyorum özellikle SSH kullanamayan ve sunucusunu yönetmek isteyen arkadaşlar için birebir.

Öncelikle işlemi yapabilmeniz için SSH kullanmanız gerekiyor VNC kurulumu bittiğinde **SSH** kullanmanıza gerek kalmayacak rahatlıkla istediğinizi yapabileceksiniz ama kurmak içinde biraz SSH kullanmanızda fayda var

İlk olarak sistemde kurulu olan vnc varmı yokmu bakmanız lazım aşağıdaki komut işinizi görecektir.

    dpkg -l | grep vnc

Çıktı olarak benim karşıma şöyle birşey çıkıyor.

![ubuntuvnckurulumugorsel1](/assets/ubuntuvnckurulumugorsel1.png)

herhangi bi vnc uygulaması gözükmüyor standart olarak **API** bulunuyor onunda bize zararı yok. **Ubuntu Server** kullanacağınız içinde Desktop görünümü olmayacak hal böyle oluncada bi desktop görmemiz lazım bizim bunun için ne kurabiliriz ya sunucudan yedek alıp desktop kurucaz üzerine sonra sistem kurucaz yada direk server tabanlı ubuntuya masaüstü kurucaz.size hangisi kolay geliyor ise onu yapabilirsiniz.

    sudo apt-get install gnome-core xfce4 firefox
    sudo apt-get install vnc4server

Kurulumu başarıyla tamamladıktan sonra kurulum harbiden olmuşmu diye şöyle bi bakalım tekrar aynı komutu verip çıktımıza bakıyoruz ve görüyorum ki tertemiz bir şekilde kurulmuş hiç sıkıntısı yok

![ubuntuvnckurulumugorsel2](/assets/ubuntuvnckurulumugorsel2.png)

Şimdi sisteme bi kullanıcı ataması yapalım root ile bağlanmak olmaz bide zaten root ile bağlanamayız böyle şeyler yapmayın biz güzelce kullanıcımızı ekleyelim

    adduser kullanıcıadınız

Ben bi kullanıcı adı oluşturdum tanımlamayı yaptım yeni şifremi girdim diğer bilgilerimi atış serbest modunda randomladım.

![ubuntuvnckurulumugorsel3](/assets/ubuntuvnckurulumugorsel3.png)

Oluşturmuş olduğumuz yeni kullanıcı ile bağlanmamız gerekecek sisteme ki vncyi açıp ayarlarını yapabilelim bunun için aşağıdaki komutu veriyoruz.

    su mert

Şifremizi vs girdik ve mert kullanıcı adıyla sisteme giriş yaptım siz artık neyle giriş yaparsanız size kalmış onada karışamayız yani

    vncserver

Komutunu verdik bir süre bekliyoruz ve bize bir döküm çıkartıyor.

![ubuntuvnckurulumugorsel4](/assets/ubuntuvnckurulumugorsel4.png)

yeni bi xstartup oluşturmamız lazım eskisinin yedeğini hemen alalım

    cp ~/.vnc/xstartup ~/.vnc/xstartup.bak
    > ~/.vnc/xstartup
    nano ~/.vnc/xstartup

yedeğimiz tamam nano ile xstartup içerisine giriyoruz.Ve aşağıdaki kodları yapıştırıp kayıt ediyoruz.

    #!/bin/sh
    unset SESSION_MANAGER
    unset DBUS_SESSION_BUS_ADDRESS
    startxfce4 &

    [-x /etc/vnc/xstartup] && exec /etc/vnc/xstartup
    [-r $HOME/.Xresources] && xrdb $HOME/.Xresources
    xsetroot -solid grey
    vncconfig -iconic &

_eski açmış olduğunuz vncserveri kapatmanız gerekiyor bunun için aşağıdaki kodu girmelisiniz.Bu kodun sonundaki rakam kaç tane vncserver açıldığını gösterir yani oturum sayısını yukarıda görmüş olduğunuz gibi bende 5.olduğu için ben 5.yi kapatıyorum._

    vncserver -kill :5

vncserverin başlangıç ayarını yapacağımız için

    su
    nano /etc/init.d/vncserver

ve bu aşamadan sonra vncserver için yeni başlanıç betiği oluşturmak lazım internetden bulabilirsiniz ubuntuya özgü olan betiği oda aşağıdaki gibi

    #!/bin/bash

    unset VNCSERVERARGS
    VNCSERVERS=""
    [-f /etc/vncserver/vncservers.conf] && . /etc/vncserver/vncservers.conf
    prog=$"VNC server"
    start() {
     . /lib/lsb/init-functions
     REQ_USER=$2
     echo -n $"Starting $prog: "
     ulimit -S -c 0 >/dev/null 2>&1
     RETVAL=0
     for display in ${VNCSERVERS}
     do
     export USER="${display##*:}"
     if test -z "${REQ_USER}" -o "${REQ_USER}" == ${USER} ; then
     echo -n "${display} "
     unset BASH_ENV ENV
     DISP="${display%%:*}"
     export VNCUSERARGS="${VNCSERVERARGS[${DISP}]}"
     su ${USER} -c "cd ~${USER} && [-f .vnc/passwd] && vncserver :${DISP} ${VNCUSERARGS}"
     fi
     done
    }
    stop() {
     . /lib/lsb/init-functions
     REQ_USER=$2
     echo -n $"Shutting down VNCServer: "
     for display in ${VNCSERVERS}
     do
     export USER="${display##*:}"
     if test -z "${REQ_USER}" -o "${REQ_USER}" == ${USER} ; then
     echo -n "${display} "
     unset BASH_ENV ENV
     export USER="${display##*:}"
     su ${USER} -c "vncserver -kill :${display%%:*}" >/dev/null 2>&1
     fi
     done
     echo -e "\n"
     echo "VNCServer Stopped"
    }
    case "$1" in
    start)
    start $@
    ;;
    stop)
    stop $@
    ;;
    restart|reload)
    stop $@
    sleep 3
    start $@
    ;;
    condrestart)
    if [-f /var/lock/subsys/vncserver]; then
    stop $@
    sleep 3
    start $@
    fi
    ;;
    status)
    status Xvnc
    ;;
    *)
    echo $"Usage: $0 {start|stop|restart|condrestart|status}"
    exit 1
    esac

İzinlerini çalıştırılabilir bir hale getiriyoruz.ve vncserver başlatıyoruz.

    chmod +x /etc/init.d/vncserver
    service vncserver start

Son olarak yapılması gereken ekran çözünürlüğünün tanımlanması ve hangi kullanıcı adının hangi oturuma ulaşacağının belirlenmesi işlemi

    mkdir -p /etc/vncserver
    nano /etc/vncserver/vncservers.conf

Oluşturmuş olduğumuz **"/etc/vncservers/vncservers.conf"** içerisine aşağıdakini ekliyoruz.

    VNCSERVERS="5:mert"
    VNCSERVERARGS[1]="-geometry 1024x768"

burada dikkat etmemiz gereken nokta oturumun hangi kullanıcıya olacağı ve oturumun hangi çözünürlükte açılacağı bunu kendinize göre ayarlayabilirsiniz ve daha efektif kullanıma getirebilirsiniz.İşlemlerimiz burada sonlanırken kurulumları tamamladıktan sonra güncelleme komutumuzu vermemizde gerekiyor _ki başlangıça eklensin her yeniden başlatmada sıkıntı çıkartmasın el ile açmak zorunda kalmayalım_

    update-rc.d vncserver defaults 99

Son olarakda sunucuyu tamamen aç kapa yapmak için aşağıdaki komutu veriyoruz.

    reboot

Tüm işlemler sorunsuz bir şekilde tamamlandıysa ve çalışır bir hale geldiyse sunucu **TightVNC** , **RealVNC** , yada **UltraVNC** hangisini seviyorsanız sisteminize indirip kuruyorsunuz ve güzelce bağlanıyorsunuz.

Benim Kullandığım **VNC** programı ise [http://www.realvnc.com/download/viewer/](http://www.realvnc.com/download/viewer/)
