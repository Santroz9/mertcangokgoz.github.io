---
layout: post
title: Centos 6 Üzerine Teamspeak server kurulumu
date: 2014-02-21 20:00:27.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Arkadaşlar teamspeak server bilindiği gibi oyun tutkunu bir çok bireyin kullanıyor olduğu anlık sesli görüşme uygulamasıdır clan savaşlarında,guild
---
Arkadaşlar **teamspeak** server bilindiği gibi oyun tutkunu bir çok bireyin kullanıyor olduğu anlık sesli görüşme uygulamasıdır clan savaşlarında,guild konuşmalarında temel olarak kullanılmaktadır adından da anlaşılacağı üzere takımınız ile yada topluluk ile sesli görüşmenize olanak sağlıyor. Ancak linux server üzerine kurulumu konusunda sıkıntı yaşayan arkadaşlar olduğunu görüyoruz lafı fazla dolandırmadan **centos** üzerine **teamspeak** 3 nasıl kurulur size kısaca anlatmak istiyorum.

### Gerekenler

1. Centos 6.x bir sunucu
2. En az 256 Mb ram
3. Çok az bir miktar sabır

İlk olarak sunucumuza root olarak giriş yapıyoruz bu aşamadan sonra sunucumuzu ilk almışsak ve direk olarak teamspeak kurmayı hedeflediyse öncelikle güncelleme yapmamız çok önemli bu yüzden aşağıdaki komutları vererek sistemimizi önce güncelliyor sonrada gerekli olan ekipmanları sistemimize kuruyor olacağız

    yum install -y perl nano wget
    yum update

İşlemimiz tamamlandıktan sonra centos sistemimize gereken **EPEL** ve **IUS** kaynaklarını kurmak sonrasında unzip htop ve sırasıyla mysql için gerekenleri kurmamız lazım bunun için ise

    rpm -Uvh http://dl.iuscommunity.org/pub/ius/stable/Redhat/6/x86_64/epel-release-6-5.noarch.rpm
    rpm -Uvh http://dl.iuscommunity.org/pub/ius/stable/Redhat/6/x86_64/ius-release-1.0-11.ius.el6.noarch.rpm
    yum update -y
    yum install htop unzip -y
    yum install mysql mysql55 mysql55-devel mysql55-libs mysql55-server mysqlreport mysqltuner cronie cronie-anacron crontabs postfix -y

Sonrasında 1 adet veritabanı oluşturmamız ve ayarlamalarını yapmamız gerekiyor bunun için ise aşağıdaki komutları kullanabilirsiniz.

    create database teamspeak;
    grant all on teamspeak.* to 'teamspeak'@'localhost' identified by 'buraya sifreniz gelecek';
    grant all on teamspeak.* to 'teamspeak'@'127.0.0.1' identified by 'buraya sifreniz gelecek';
    flush privileges;

Oluşturduğumuz veritabanına ufak bi güvenlik ayarı yapıp otomatik başlamasını sağlıyoruz ardından sisteme yeni bir kullanıcı tanımlıyoruz.

    chkconfig mysqld on
    mysql_secure_installation
    adduser teams22
    passwd teams21

kullanıcı tanımlaması yaptıktan sonra root kullanıcı yerine oluşturmuş olduğunuz kullanıcıya giriş yaparak işlemin geri kalanını onunla devam ettiriyoruz

    su teamspeak
    cd ~/
    wget http://teamspeak.gameserver.gamed.de/ts3/releases/3.0.8/teamspeak3-server_linux-amd64-3.0.8.tar.gz
    tar zxvf teamspeak3-server_linux-amd64-3.0.8.tar.gz
    cd teamspeak3-server_linux-amd64

tar.gz den çıkartma işleminden hemen sonra **"nano ts3server.ini"** diyerek yeni bir adet ts3server.ini dosyası oluşturuyoruz. içerisine aşağıdakileri ekliyoruz ve **CTRL + X** diyerek kayıt edip kapatıyoruz.

    machine_id=
    default_voice_port=9987
    voice_ip=0.0.0.0
    licensepath=
    filetransfer_port=30033
    filetransfer_ip=0.0.0.0
    query_port=10011
    query_ip=0.0.0.0
    query_ip_whitelist=query_ip_whitelist.txt
    query_ip_blacklist=query_ip_blacklist.txt
    dbplugin=ts3db_mysql
    dbpluginparameter=ts3db_mysql.ini
    dbsqlpath=sql/
    dbsqlcreatepath=create_mysql/
    dbconnections=10
    logpath=logs
    logquerycommands=0
    dbclientkeepdays=30
    logappend=0

oluşturmamız gereken son dosyamızı da **"nano ts3db\_mysql.ini"** komutunu vererek **ts3db\_mysql.ini** dosyamızı oluşturuyoruz içerisine aşağıdakileri yazıyoruz gereken yerleri kendinize göre doldurun.

    [config]
    host=localhost
    port=3306
    username=teamspeak
    password=yukaridaki islemde olusturdugunuz sifreyi buraya girin
    database=teamspeak
    socket=

veritabanı bağlantımızı gerçekleştirmek adına son bir aşamamız kaldı libmysqlclient adlı dosyamızı kurmamız lazım bunun içinde teamspeak forumuna göz atıyoruz ve ekdeki dosyayı sunucuya çekiyoruz ve gereken komutlar ile işlemimizi sonlandırıyoruz.

    wget http://forum.teamspeak.com/attachment.php?attachmentid=2488&d=1264152146
    unzip attachment.php?attachmentid=2488
    ln -s libmysqlclient.so.15.0.0 libmysqlclient.so.15

İşlemimizi sonlandırıyoruz şimdi sunucumuzu başlatmaya geldi sıra yapmış olduğumuz **ts3server.ini** yi referans alarak sunucuyu başlatmamız gerekiyor bunun için aşağıdaki komutu kullanabilirsiniz...

    ./ts3server_startscript.sh start inifile=ts3server.ini

sunucuyu yeniden başlatma ihtiyacı duydunuz ve bu işlemi yaptıktan sonra teamspeak serverini başlatmanız gerekiyor işte bunu otomatik bir şekilde yapamak için bir kaç ufak ayarımız daha kaldı bunun için yapmamız gereken ilk olarak **"./ts3server\_startscript.sh stop"** komutunu vererek sunucusunu durduruyoruz. sonrasında otomatik başlatma dosyamızı oluşturmak için **"nano /etc/init.d/teamspeak"** komutunu veriyoruz bu bize init.d kısmında teamspeak için bir service oluşturmamıza yarayacak bu sayede sunucuyu her yeniden başlatma işleminde el ile değil otomatik olarak server başlatılacak

    #!/bin/bash
    # /etc/init.d/teamspeak

    ### BEGIN INIT INFO
    # Provides: teamspeak
    # Required-Start: $local_fs $remote_fs
    # Required-Stop: $local_fs $remote_fs
    # Should-Start: $network
    # Should-Stop: $network
    # Default-Start: 2 3 4 5
    # Default-Stop: 0 1 6
    # Short-Description: Teamspeak 3 Server
    # chkconfig: 2345 94 05
    # Description: Starts the Teamspeak 3 server
    ### END INIT INFO

    #Settings
    SERVICENAME='Teamspeak 3'
    SPATH='/home/teamspeak/teamspeak3-server_linux-amd64'
    SERVICE='/home/teamspeak/teamspeak3-server_linux-amd64/ts3server_startscript.sh'
    OPTIONS='inifile=ts3server.ini'
    USERNAME='buraya olusturdugunuz kullanici adiniz'

    ME=`whoami`
    as_user() {
    if [$ME == $USERNAME] ; then
    bash -c "$1"
    else
    su - $USERNAME -c "$1"
    fi
    }

    mc_start() {
    echo "Starting $SERVICENAME..."
    cd $SPATH
    as_user "cd $SPATH && $SERVICE start ${OPTIONS}"
    }

    mc_stop() {
    echo "Stopping $SERVICENAME"
    as_user "$SERVICE stop"
    }

    #Start-Stop here
    case "$1" in
    start)
    mc_start
    ;;
    stop)
    mc_stop
    ;;
    restart)
    mc_stop
    mc_start
    ;;
    *)
    echo "Usage: /etc/init.d/teamspeak {start|stop|restart}"
    exit 1
    ;;
    esac

    exit 0

ekledikten sonra **CTRL + X** diyoruz ve kayıt edip kapatıyoruz. şimdi ise en son aşamamıza yeniden başlatmayı sisteme eklememiz lazım bunun için ise aşağıdaki komutları sırasıyla veriyoruz ve işlemimiz sonlanıyor...

    chmod +x /etc/init.d/teamspeak
    chkconfig --add teamspeak
    chkconfig teamspeak on

Serveri başlatmak için ise aşağıdaki komutu vermeniz yeterli bundan sonra her yeniden başlatmanızda otomatik olarak ts serverde kendini başlatacaktır...

    /etc/init.d/teamspeak start

yada

    service teamspeak start

## Zaman Hatası alırsanız...

    rm -f /etc/localtime
    ln -s /usr/share/zoneinfo/America/New_York /etc/localtime

komutunu vermeniz ve **teamspeak** yeniden başlatmanız yeterli.
