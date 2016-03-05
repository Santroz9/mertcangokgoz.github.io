---
layout: post
title: Nginx WebServer Güvenliği
date: 2014-08-26 20:42:43.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Sistemi az kasan ve yüksek performans veren çoğu yüksek trafiği olan sitenin kullandığı bir altyapıdır.peki nginx ne yapar da bu kadar sistem
---
Sistemi az kasan ve yüksek performans veren çoğu yüksek trafiği olan sitenin kullandığı bir altyapıdır.peki **nginx** ne yapar da bu kadar sistem kaynaklarını iyi kullanır.Nginx geleneksek sunucu sistemlerinin aksine iş parçacıklarını farklı bir şekilde değerlendirir kategorize eder ve ona göre çalışır yani tamamını ele alıpda işlem yapmaz parça parça işlem yapar daha ölçeklenebilirdir.Nginx i hali hazırda wordpress,github,hulu gibi aşırı yüksek trafikli siteler kullanıyor bi bildikleri var illaki aynı anda milyonlarca adam girdimi apache gibi kitlenmesin diye engin abimize başvurmuşlar misler gibi şimdi bu engin abimiz arada açık verebiliyor vermese bile biz totomuzu koruyalım sonra sıkıntı çıkmasın diye popüler olan güvenlik yöntemlerinden 20 sini sizin için toparladım.Burada anlatacaklarım genel olarak tüm linux sistemlerinde sorunsuz çalışır ama söylememde fayda var anlatımlarımı her zaman ki gibi **Centos/RHEL** için yaptım.

Varsayılan Nginx yolu ve port

- **/usr/local/nginx/conf/** nginx in tüm configlerinin bulunduğu klasör yoludur.burada bulunan **"nginx.conf"** ana config dosyamızdır.
- **/usr/local/nginx/html/** Ön tanımlı dosya ve klasör yolu web sitenizde gösterilecek dosyalar burada olacak
- **/usr/local/nginx/logs/** Ön tanımlı nginx sistem log klasörü
- Ön tanımlı **HTTP** port **80**
- Ön tanımlı **HTTPS** port **443**

Şimdi yaptınız ayarlamaları o kadar yaptınız çalışacakmı diye bi bakmanız lazım boşu boşuna nginx resetleyip siteyi çökertmeye luzum yok nginx işte bu konuda çok iyi nginx ayarlamalarını test ettirebilirsiniz.

    /usr/local/nginx/sbin/nginx -t

Alttaki gibi bir yazı çıkarsa şanslısınız nginx resetleyerek devam edebilirsiniz ama hata verirse hiç reset atmayın sorunu bulup çözün sonra reset atarsınız bu ne acele yahu

    the configuration file /usr/local/nginx/conf/nginx.conf syntax is ok
    configuration file /usr/local/nginx/conf/nginx.conf test is successful

## **1.SELinux Sisteminizde aktif olsun**

Şimdi yum komutumuz ile 2 paket kurmamız lazım ama baştan söyleyim enforcing şeklinde açmayacağız yoksa başımızı ağrıtır bunun yerine permissive yapacaz ki uyarı verse bile sorun olmayacak

    yum install policycoreutils setroubleshoot
    nano /etc/selinux/config

Şu şekilde değiştiriyoruz.selinux tiğini targeted yapıyoruz çünkü sadece DNS,Apache,Nginx için kullanacağız.

    SELINUX=permissive
    SELINUXTYPE=targeted

yaptığımız işlemlerin geçerli olabilmesi için sistemi resetlememiz gerekiyor

    reboot
&nbsp;
Dikkat edin yapacağınız hata sunucuyu uçuracaktır SSH bağlanamayabilirsiniz yapacağınız en kötü sorun bu olur.

## **2.Disk yetkilerini Kısıtlayın**

Nasıl disk oluşturacağınızı anlatmak isterdim ama herşeyi devletden beklemeyin oluşturun /etc/fstab da benim zamanında yapmış olduğum satırı sizlerle paylaşacağım önemli olan satır sonlarında bulunan komutlar zaten

    LABEL=/nginx /nginx ext3 defaults,nosuid,noexec,nodev 1 2

kısıtlamalarımızı yaptık bi tık daha güvenliğimizi arttırdık.

## **3.Ufak çaplı DDOSlardan korunun**

Ben bu ayarları internetden bulup kullandım nedir ne değildir yazıyor.Ancak teker teker açıklamayacağım ufak çaplı ddoslardan koruduğunu bilin yeter.Büyük çapta saldırı alıyorsanız ama işinize asla yaramaz

    nano /etc/sysctl.conf

Dosyayı aşağıdaki gibi düzenliyip kayıt ediyoruz.

    # Avoid a smurf attack
    net.ipv4.icmp_echo_ignore_broadcasts = 1

    # Turn on protection for bad icmp error messages
    net.ipv4.icmp_ignore_bogus_error_responses = 1

    # Turn on syncookies for SYN flood attack protection
    net.ipv4.tcp_syncookies = 1

    # Turn on and log spoofed, source routed, and redirect packets
    net.ipv4.conf.all.log_martians = 1
    net.ipv4.conf.default.log_martians = 1

    # No source routed packets here
    net.ipv4.conf.all.accept_source_route = 0
    net.ipv4.conf.default.accept_source_route = 0

    # Turn on reverse path filtering
    net.ipv4.conf.all.rp_filter = 1
    net.ipv4.conf.default.rp_filter = 1

    # Make sure no one can alter the routing tables
    net.ipv4.conf.all.accept_redirects = 0
    net.ipv4.conf.default.accept_redirects = 0
    net.ipv4.conf.all.secure_redirects = 0
    net.ipv4.conf.default.secure_redirects = 0
    net.ipv4.ip_forward = 0
    net.ipv4.conf.all.send_redirects = 0
    net.ipv4.conf.default.send_redirects = 0


    # Turn on execshild
    kernel.exec-shield = 1
    kernel.randomize_va_space = 1

    # Tuen IPv6
    net.ipv6.conf.default.router_solicitations = 0
    net.ipv6.conf.default.accept_ra_rtr_pref = 0
    net.ipv6.conf.default.accept_ra_pinfo = 0
    net.ipv6.conf.default.accept_ra_defrtr = 0
    net.ipv6.conf.default.autoconf = 0
    net.ipv6.conf.default.dad_transmits = 0
    net.ipv6.conf.default.max_addresses = 1

    # Optimization for port usefor LBs
    # Increase system file descriptor limit
    fs.file-max = 65535

    # Allow for more PIDs (to reduce rollover problems); may break some programs 32768
    kernel.pid_max = 65536

    # Increase system IP port limits
    net.ipv4.ip_local_port_range = 2000 65000

    # Increase TCP max buffer size setable using setsockopt()
    net.ipv4.tcp_rmem = 4096 87380 8388608
    net.ipv4.tcp_wmem = 4096 87380 8388608

    # Increase Linux auto tuning TCP buffer limits
    # min, default, and max number of bytes to use
    # set max to at least 4MB, or higher if you use very high BDP paths
    # Tcp Windows etc
    net.core.rmem_max = 8388608
    net.core.wmem_max = 8388608
    net.core.netdev_max_backlog = 5000
    net.ipv4.tcp_window_scaling = 1

## **4.Kullanılmayan Modülleri Kaldırın**

Nginx hafif ve yüksek performanslı bir webserver olabilir ancak kullanmadığımız modülleri tutmanın ne anlamı var bu yüzden kullanmadıklarınızı kaldırın gitsin.ben mesela autoindex ve ssı kullanmıyorum durmasının ne anlamı var.dikkat edin nginx tekrar derliyor olacağız hatalı bir işlem yapmayın derleyemezsiniz mazallah.

    ./configure --without-http_autoindex_module --without-http_ssi_module
    make
    make install

tekrar söylüyorum işinize yaramayan **Nginx modüllerini kaldırın.**

## **5.Mod\_Security Kullanın(backend Apache ise)**

    yum install mod_security

Kuruluma he dedikten sonra kurulum bitince

    nano /etc/httpd/modsecurity.d/modsecurity_crs_10_config.conf

aşağıdaki gibi değiştirip kayıt edin

    SecRuleEngine On

sonra apacheye restart atın işleminiz tamamdır.

    service httpd restart

Çalıştığını anlamak istiyorum kardeşim ben bune böyle kuru kuru anlatıyorsun diyenlere

    tail -f /var/log/httpd/error_log

Komutunu öneriyorum sonrasında aşağıdaki gibi başlayan bi satır gözlemlemeleri gerekecek

    ModSecurity for Apache/....

## **6.SELinux Nginx İçin Zorlayın**

şimdi yukarıda ne dedik targeted olarak ayarladık dedik heh işte orda dns apache gibi tanımlı servislerde çalışıyor ama bu şey nginx için özel ayar istiyor illa yapacan yoksa çalışmıyor.

    yum -y install selinux-policy-targeted selinux-policy-devel

sistem için gerekli şeyleri yukarda kurmadıysanız şimdi kurdunuz varsayıyorum. ve nginx için kullanılacak olan dosyamızı indiriyoruz.

    cd /root
    wget http://sourceforge.net/projects/selinuxnginx/files/se-ngix_1_0_10.tar.gz/download?use_mirror=softlayer-ams
    tar -zxvf se-ngix_1_0_10.tar.gz

Sonrasında dosyayı derlememiz falan gerekiyor aşağıdaki komut ile halledebilirsiniz.

    cd se-ngix*/nginx
    make

Gene Çalışmıyor ise dökümanlarda şöyle bi komut gördüm işinize yarayacaktır baya bi adamın derdine derman olmuş sonuçta

    /usr/sbin/semodule -i nginx.pp

## **7.Güvenlik Duvarı Kurallarını belirleyin**

Gene internetten bulduğum bir güvenlik duvarı shını atmak istiyorum tek tek yapacaklarımızı yapıyor diye arşivime ekledim şimdi kim uğraşacak bunları tek tek el ile yazmaya direk olarak bunu bi .sh olarak kayıt edip sistemde çalıştırın.yada kendinize göre düzenleyip çalıştırabilirsiniz.

    #!/bin/bash
    IPT="/sbin/iptables"

    #### IPS ######
    # Get server public ip
    SERVER_IP=$(ifconfig eth0 | grep 'inet addr:' | awk -F'inet addr:' '{ print $2}' | awk '{ print $1}')
    LB1_IP="204.54.1.1"
    LB2_IP="204.54.1.2"

    # Do some smart logic so that we can use damm script on LB2 too
    OTHER_LB=""
    SERVER_IP=""
    [["$SERVER_IP" == "$LB1_IP"]] && OTHER_LB="$LB2_IP" || OTHER_LB="$LB1_IP"
    [["$OTHER_LB" == "$LB2_IP"]] && OPP_LB="$LB1_IP" || OPP_LB="$LB2_IP"

    ### IPs ###
    PUB_SSH_ONLY="122.xx.yy.zz/29"

    #### FILES #####
    BLOCKED_IP_TDB=/root/.fw/blocked.ip.txt
    SPOOFIP="127.0.0.0/8 192.168.0.0/16 172.16.0.0/12 10.0.0.0/8 169.254.0.0/16 0.0.0.0/8 240.0.0.0/4 255.255.255.255/32 168.254.0.0/16 224.0.0.0/4 240.0.0.0/5 248.0.0.0/5 192.0.2.0/24"
    BADIPS=$( [[-f ${BLOCKED_IP_TDB}]] && egrep -v "^#|^$" ${BLOCKED_IP_TDB})

    ### Interfaces ###
    PUB_IF="eth0" # public interface
    LO_IF="lo" # loopback
    VPN_IF="eth1" # vpn / private net

    ### start firewall ###
    echo "Setting LB1 $(hostname) Firewall..."

    # DROP and close everything
    $IPT -P INPUT DROP
    $IPT -P OUTPUT DROP
    $IPT -P FORWARD DROP

    # Unlimited lo access
    $IPT -A INPUT -i ${LO_IF} -j ACCEPT
    $IPT -A OUTPUT -o ${LO_IF} -j ACCEPT

    # Unlimited vpn / pnet access
    $IPT -A INPUT -i ${VPN_IF} -j ACCEPT
    $IPT -A OUTPUT -o ${VPN_IF} -j ACCEPT

    # Drop sync
    $IPT -A INPUT -i ${PUB_IF} -p tcp ! --syn -m state --state NEW -j DROP

    # Drop Fragments
    $IPT -A INPUT -i ${PUB_IF} -f -j DROP

    $IPT -A INPUT -i ${PUB_IF} -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
    $IPT -A INPUT -i ${PUB_IF} -p tcp --tcp-flags ALL ALL -j DROP

    # Drop NULL packets
    $IPT -A INPUT -i ${PUB_IF} -p tcp --tcp-flags ALL NONE -m limit --limit 5/m --limit-burst 7 -j LOG --log-prefix " NULL Packets "
    $IPT -A INPUT -i ${PUB_IF} -p tcp --tcp-flags ALL NONE -j DROP

    $IPT -A INPUT -i ${PUB_IF} -p tcp --tcp-flags SYN,RST SYN,RST -j DROP

    # Drop XMAS
    $IPT -A INPUT -i ${PUB_IF} -p tcp --tcp-flags SYN,FIN SYN,FIN -m limit --limit 5/m --limit-burst 7 -j LOG --log-prefix " XMAS Packets "
    $IPT -A INPUT -i ${PUB_IF} -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

    # Drop FIN packet scans
    $IPT -A INPUT -i ${PUB_IF} -p tcp --tcp-flags FIN,ACK FIN -m limit --limit 5/m --limit-burst 7 -j LOG --log-prefix " Fin Packets Scan "
    $IPT -A INPUT -i ${PUB_IF} -p tcp --tcp-flags FIN,ACK FIN -j DROP

    $IPT -A INPUT -i ${PUB_IF} -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP

    # Log and get rid of broadcast / multicast and invalid
    $IPT -A INPUT -i ${PUB_IF} -m pkttype --pkt-type broadcast -j LOG --log-prefix " Broadcast "
    $IPT -A INPUT -i ${PUB_IF} -m pkttype --pkt-type broadcast -j DROP

    $IPT -A INPUT -i ${PUB_IF} -m pkttype --pkt-type multicast -j LOG --log-prefix " Multicast "
    $IPT -A INPUT -i ${PUB_IF} -m pkttype --pkt-type multicast -j DROP

    $IPT -A INPUT -i ${PUB_IF} -m state --state INVALID -j LOG --log-prefix " Invalid "
    $IPT -A INPUT -i ${PUB_IF} -m state --state INVALID -j DROP

    # Log and block spoofed ips
    $IPT -N spooflist
    for ipblock in $SPOOFIP
    do
             $IPT -A spooflist -i ${PUB_IF} -s $ipblock -j LOG --log-prefix " SPOOF List Block "
             $IPT -A spooflist -i ${PUB_IF} -s $ipblock -j DROP
    done
    $IPT -I INPUT -j spooflist
    $IPT -I OUTPUT -j spooflist
    $IPT -I FORWARD -j spooflist

    # Allow ssh only from selected public ips
    for ip in ${PUB_SSH_ONLY}
    do
            $IPT -A INPUT -i ${PUB_IF} -s ${ip} -p tcp -d ${SERVER_IP} --destination-port 22 -j ACCEPT
            $IPT -A OUTPUT -o ${PUB_IF} -d ${ip} -p tcp -s ${SERVER_IP} --sport 22 -j ACCEPT
    done

    # allow incoming ICMP ping pong stuff
    $IPT -A INPUT -i ${PUB_IF} -p icmp --icmp-type 8 -s 0/0 -m state --state NEW,ESTABLISHED,RELATED -m limit --limit 30/sec -j ACCEPT
    $IPT -A OUTPUT -o ${PUB_IF} -p icmp --icmp-type 0 -d 0/0 -m state --state ESTABLISHED,RELATED -j ACCEPT

    # allow incoming HTTP port 80
    $IPT -A INPUT -i ${PUB_IF} -p tcp -s 0/0 --sport 1024:65535 --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
    $IPT -A OUTPUT -o ${PUB_IF} -p tcp --sport 80 -d 0/0 --dport 1024:65535 -m state --state ESTABLISHED -j ACCEPT


    # allow outgoing ntp
    $IPT -A OUTPUT -o ${PUB_IF} -p udp --dport 123 -m state --state NEW,ESTABLISHED -j ACCEPT
    $IPT -A INPUT -i ${PUB_IF} -p udp --sport 123 -m state --state ESTABLISHED -j ACCEPT

    # allow outgoing smtp
    $IPT -A OUTPUT -o ${PUB_IF} -p tcp --dport 25 -m state --state NEW,ESTABLISHED -j ACCEPT
    $IPT -A INPUT -i ${PUB_IF} -p tcp --sport 25 -m state --state ESTABLISHED -j ACCEPT

    ### add your other rules here ####

    #######################
    # drop and log everything else
    $IPT -A INPUT -m limit --limit 5/m --limit-burst 7 -j LOG --log-prefix " DEFAULT DROP "
    $IPT -A INPUT -j DROP

    exit 0

## **8.SSL Kullanımına özen gösterin**

SSL kullanmanız güvenliğinizi bir tık daha yukarıya çıkartıcaktır aynı zamanda son zamanlarda googlenin söylediği gibi SEO da önemli bir noktada bulunuyor SSL.

    server {
        server_name example.com;
        listen 443;
        ssl on;
        ssl_certificate /usr/local/nginx/conf/server.crt;
        ssl_certificate_key /usr/local/nginx/conf/server.key;
        access_log /usr/local/nginx/logs/ssl.access.log;
        error_log /usr/local/nginx/logs/ssl.error.log;
    }

Haliyle sistemi yeniden başlatmamız gerekiyor.

    /usr/local/nginx/sbin/nginx -s reload

## **9. PHP de Güvenliğinizi arttırın**

php.ini içerisindeki ayarları aşağıdaki yönergelere göre mutlaka değiştirin.

    # Disallow dangerous functions
    disable_functions = phpinfo, system, mail, exec

    ## Try to limit resources ##

    # Maximum execution time of each script, in seconds
    max_execution_time = 30

    # Maximum amount of time each script may spend parsing request data
    max_input_time = 60

    # Maximum amount of memory a script may consume (8MB)
    memory_limit = 8M

    # Maximum size of POST data that PHP will accept.
    post_max_size = 8M

    # Whether to allow HTTP file uploads.
    file_uploads = Off

    # Maximum allowed size for uploaded files.
    upload_max_filesize = 2M

    # Do not expose PHP error messages to external users
    display_errors = Off

    # Turn on safe mode
    safe_mode = On

    # Only allow access to executables in isolated directory
    safe_mode_exec_dir = php-required-executables-path

    # Limit external access to PHP environment
    safe_mode_allowed_env_vars = PHP_

    # Restrict PHP information leakage
    expose_php = Off

    # Log all errors
    log_errors = On

    # Do not register globals for input data
    register_globals = Off

    # Minimize allowable PHP post size
    post_max_size = 1K

    # Ensure PHP redirects appropriately
    cgi.force_redirect = 0

    # Disallow uploading unless necessary
    file_uploads = Off

    # Enable SQL safe mode
    sql.safe_mode = On

    # Avoid Opening remote files
    allow_url_fopen = Off

## **10.İçeriğiniz ve Dosyalarınız kolay kolay indirilemesin**

adam wget ile çatır çutur sitenizdeki içeriklerden tutam tutam alıyor ise aşağıdaki komutumuz size çok iyi gelicek User-Agentleri yakalıyorsunuz.Sonrasında aşağıdaki gibi düzenliyorsunuz sonrasını onlar düşünsün

    if ($http_user_agent ~* LWP::Simple|BBBike|wget) {
                return 403;
         }

Yapacağınız tüm bu işlemler sizin sistemlerinizin tamamen güvenli yapacağı anlamına gelmez.Sadece sisteminize saldıran kişileri bir nebze zorlamak bazı kişileride engellemek için kullanılmaktadır.Daha iyi güvenlik yapılandırmaları için [Lütfen bizimle iletişime geçin](https://mertcangokgoz.com/iletisim-2)
