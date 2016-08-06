---
layout: post
title: Centos 7 Üzerine OpenVPN Kurulumu
date: 2015-01-06 15:45:54.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: "İnternetin gidişatı için VPN in mantığını ve önemini bu makalede anlatacak değilim konuya direk girmek lazım VPN şifreli bir network sunar"
---
İnternetin gidişatı için **VPN** in mantığını ve önemini bu makalede anlatacak değilim konuya direk girmek lazım **VPN** şifreli bir network sunar böylelikle güvenliğinizi sağlayabilirsiniz.Tabi Türkiye şartlarında yasakları delik deşik etmek için kullanılıyor.Makalemizde Centos 7 üzerine **OpenVPN** kurulumunu komutlar ile göstermeye çalışacağım elimde çalışan hali hazırda bi centos 7 olsaydı resimli olarak göstermeye çalışacaktım ancak mali sıkıntılar olduğunu unutmamak lazım

epeli eklememiz gerekicek yoksa openvpn paketlerini kuramayız epel eklemek için

    yum install epel-release

bu işlemimizden sonra **OpenVPN** kurulumu için komutumuzu veriyoruz.

    yum install openvpn -y

**OpenVPN** in haberleşmesi ve bağlantıyı şifrelemesi içinde **Easy RSA** kurmamız lazım

    yum install easy-rsa -y

en önemli noktamıza geldik ayar dosyası oluşturmamız lazım ama önce yedek yapalım ve gereken yerlere dosyamızı taşıyalım

    cp /usr/share/doc/openvpn-*/sample/sample-config-files/server.conf /etc/openvpn

hemen sonrasında yapacağımız şey dosyamızı açmak

    nano /etc/openvpn/server.conf

açtığımızda karşımıza bi sürü satır gelecek değiştirmemiz gereken yer var dh diye bi satır göreceksiniz bunun ismini **dh2048.pem** yapıyoruz.

    dh dh2048.pem

işlem bitiminde networkdeki tüm trafiği **VPN** yönlendirmemiz lazım ki bağlantı şifrelensin bunun için ise

    push "redirect-gateway def1 bypass-dhcp"

hemen ardından DNS sunucularını değiştirmek lazım böylelikle işimiz biraz daha kolay olabilir DNS sorgularında sıkıntı çekmemiş oluruz ve birazda sorgularımız hızlanır

    push "dhcp-option DNS 8.8.8.8"
    push "dhcp-option DNS 8.8.4.4"

kullanıcımızı kimsesiz yapalım hemen

    user nobody
    group nobody

yukarıdaki yazanları server.conf dosyamıza kayıt ettikten yada gereken satırları yukarıdaki ayarlara göre değiştirip kayıt ettikten sonra bir sonraki aşamamıza geçebiliriz.Geçtiğimiz bu aşamada sisteme sertifika ürettiriyoruz böylelikle bağlantımız güzel bir şekilde güvenli ve şifreli hale gelecek.

    mkdir -p /etc/openvpn/easy-rsa/keys
    cp -rf /usr/share/easy-rsa/2.0/* /etc/openvpn/easy-rsa
    nano /etc/openvpn/easy-rsa/vars

komutlarınının bitiminde **vars** nano aracılığı ile açmıştık. **KEY\_** ile başlayan bazı satırlar göreceksiniz orda onların hepsini kafanıza göre doldurun.yada doğru bilgilerinizi girin

    . . .
    # These are the default values for fields
    # which will be placed in the certificate.
    # Don't leave any of these fields blank.
    export KEY_COUNTRY="TR"
    export KEY_PROVINCE="TR"
    export KEY_CITY="Ankara"
    export KEY_ORG="mertcan"
    export KEY_EMAIL="nobody@mertcangokgoz.com"
    export KEY_OU="Community"
    # X509 Subject Field
    export KEY_NAME="server"
    . . .
    export KEY_CN=openvpn.umertcangokgoz.com
    . . .

versiyonumuzu kaldıralım belli olmaz uyuşmazlık yapabilir belirli bir isim verelim

    cp /etc/openvpn/easy-rsa/openssl-1.0.0.cnf /etc/openvpn/easy-rsa/openssl.cnf

şimdi sertifikamızı tam olarak oluşturmaya geldi sıra

    cd /etc/openvpn/easy-rsa
    source ./vars
    ./clean-all
    ./build-ca
    ./build-key-server server
    ./build-dh

yukarıdaki işlemlerin tamamlanması yaklaşık bi 3 dknızı alacaktır bu işlemlerin bitiminde oluşan dosyaları openvpn klasörü içerisine kopyalıyoruz.

    cd /etc/openvpn/easy-rsa/keys
    cp dh2048.pem ca.crt server.crt server.key /etc/openvpn

son olarak client tarafında ufak bi ayara

    cd /etc/openvpn/easy-rsa
    ./build-key client

işlemimiz böylelikle kurulum aşamasında sonlanmış oluyor bundan sonra geriye yönlendirme ve yetkilendirme kaldı

    yum install iptables-services -y
    systemctl mask firewalld
    systemctl enable iptables
    systemctl stop firewalld
    systemctl start iptables
    iptables --flush

tertemiz bir firewall ayarlarına merhaba diyoruz ve yapmamız gerekenleri sırasıyla yapıyoruz ilk olarak ip aralıklarını firewall onaylatmak

    iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE

yaptığımız bu onaylatma işlemini kayıt edelimki sonra sıkıntı çıkartmasın başımıza

    iptables-save > /etc/sysconfig/iptables

ip yönlendirmeyi açmamız lazım ipv4 için bunuda aşağıdakileri yaparak halledebilirsiniz.

    nano /etc/sysctl.conf

aşağıdaki gibi yapıyoruz içerisindekini

    net.ipv4.ip_forward = 1

ve bi restart atıyoruz network servisine

    systemctl restart network.service

OpenVPN başlatmaya geldi sıra sabırla bu işlemleri yaptıysanız sona yaklaşmanıza az bir işlem kalmış demektir sabredin

    systemctl -f enable openvpn@server.service
    systemctl start openvpn@server.service

yukarıda clienti ayarlamaktan bahsetmiştim az bir kısmını yapmıştık şimdi onuda sonlandırmamız gerekiyor böylelikle bilgisayarımızdan bağlanabilelim VPN imize

Aşağıdakileri bir şekilde bilgisayarınıza kopyalayın bunu kullanırken **SFTP** ile yapabilirsiniz **WinSCP** önerilir.

    /etc/openvpn/easy-rsa/keys/ca.crt
    /etc/openvpn/easy-rsa/keys/client.crt
    /etc/openvpn/easy-rsa/keys/client.key

yukarıdakileri sisteminize kopyaladıktan sonra .ovpn dosyası oluşturmanız gerekiyor aşağıdaki yönergeyi takip ederek yapabilirsiniz.tek yapılacak olan dosya yollarını ve ip adresini belirleyip kaydetmek

    client
    dev tun
    proto udp
    remote sunucunuzun ip adresi 1194
    resolv-retry infinite
    nobind
    persist-key
    persist-tun
    comp-lzo
    verb 3
    ca dosya yolu/ca.crt
    cert dosya yolu/client.crt
    key dosya yolu/client.key

hata almadan son aşamaya kadar gelebildiyseniz.Windows için OpenVPN kurmak ve yukarıda oluşturmuş olduğunuz .ovpn dosyasını **C:\Program Files\OpenVPN\config** yoluna atmak sonrasında programdan kolaylıkla bağlanabilirsiniz.
