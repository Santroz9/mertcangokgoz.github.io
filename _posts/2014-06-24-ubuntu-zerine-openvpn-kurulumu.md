---
layout: post
title: Ubuntu Üzerine OpenVPN Kurulumu
date: 2014-06-24 11:43:31.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Güvenliğinizi ve gizliliğinizi sağlamak istiyorsanız ve ülkenizin yapmış olduğu yasaklamalardan kurtulmak istiyorsanız işte tam yerine geldiniz.Bu
---

Güvenliğinizi ve gizliliğinizi sağlamak istiyorsanız ve ülkenizin yapmış olduğu yasaklamalardan kurtulmak istiyorsanız işte tam yerine geldiniz.Bu makalemizde sizlere Ubuntu üzerine OpenVPN kurulumunu nasıl gerçekleştireceğinizi açıklayacağım.Sonrasında kurulumu yaparak hem güvenli bir internete kavuşacaksınız hemde sansürlemelerden ve kısıtlamalardan kurtulacaksınız.Ama bunu yaparken biraz sermayeye ihtiyacınız var elinizi biraz taşın altına koymanız gerekiyor kişisel **VPN** sahibi olacaksınız sonuçta herşeyin bir bedeli var.

Öncelikle bize bir adet Sunucu yada **VPS** gerekiyor internette gezerek çok cuzi miktarlara VPS edinebilirsiniz.Bunlardan Özellikle 2 tanesini sizlere önerebilirim çünkü en stabil, sorunsuz ve güvenilir firmalar arasındadırlar

- [Linode](https://www.linode.com/)
- [Digitalocean](https://www.digitalocean.com/?refcode=909c94c7b9c2)

Hangi firmadan alırsınız bilemem ancak kurulumu çok kolay olacak çünkü bash script olarak hazırlanmış bir şekilde sizlere sunacağım gerektiği ayarlamaları sizlerde yapabesiniz diye öncelikle yapacağınız şey sisteme bir **Ubuntu** dağıtımı kurmak Sürüm olarak 12.04 ve yukarısını tavsiye ediyorum.

    #!/bin/sh
        set -e

        apt-get update -q
        echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
        echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
        apt-get install -qy openvpn curl iptables-persistent

        cd /etc/openvpn
        [-f dh.pem] || openssl dhparam -out dh.pem 2048

        [-f ca-key.pem] || openssl genrsa -out ca-key.pem 2048
        chmod 600 ca-key.pem
        [-f ca-csr.pem] || openssl req -new -key ca-key.pem -out ca-csr.pem -subj /CN=OpenVPN-CA/
        [-f ca.pem] || openssl x509 -req -in ca-csr.pem -out ca.pem -signkey ca-key.pem -days 365
        [-f ca.srl] || echo 01 > ca.srl

        # Server Config
        [-f server-key.pem] || openssl genrsa -out server-key.pem 2048
        chmod 600 server-key.pem
        [-f server-csr.pem] || openssl req -new -key server-key.pem -out server-csr.pem -subj /CN=OpenVPN/
        [-f cert.pem] || openssl x509 -req -in server-csr.pem -out server-cert.pem -CA ca.pem -CAkey ca-key.pem -days 365

        [-f udp80.conf] || cat >udp80.conf <<EOF
        server 10.8.0.0 255.255.255.0
        verb 3
        duplicate-cn
        key server-key.pem
        ca ca.pem
        cert server-cert.pem
        dh dh.pem
        keepalive 10 120
        persist-key
        persist-tun
        comp-lzo
        push "redirect-gateway def1 bypass-dhcp"
        push "dhcp-option DNS 8.8.8.8"
        push "dhcp-option DNS 8.8.4.4"

        user nobody
        group nogroup

        proto udp
        port 80
        dev tun80
        status openvpn-status-80.log
        EOF

        echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
        sysctl -w net.ipv4.ip_forward=1
        iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
        iptables-save > /etc/iptables/rules.v4

        MY_IP_ADDR=$(curl -s http://myip.enix.org/REMOTE_ADDR)
        ["$MY_IP_ADDR"] || {
        echo "Sorry, I could not figure out my public IP address."
        echo "(I use http://myip.enix.org/REMOTE_ADDR/ for that purpose.)"
        exit 1
        }

        # Client Config
        [-f client-key.pem] || openssl genrsa -out client-key.pem 2048
        chmod 600 client-key.pem
        [-f client-csr.pem] || openssl req -new -key client-key.pem -out client-csr.pem -subj /CN=OpenVPN-Client/
        [-f client.pem] || openssl x509 -req -in client-csr.pem -out client-cert.pem -CA ca.pem -CAkey ca-key.pem -days 365

        [-f client.ovpn] || cat >client.ovpn <<EOF
        client
        nobind
        dev tun
        redirect-gateway def1 bypass-dhcp
        remote $MY_IP_ADDR 80 udp
        comp-lzo yes

        <key>
        `cat client-key.pem`
        </key>
        <cert>
        `cat client-cert.pem`
        </cert>
        <ca>
        `cat ca.pem`
        </ca>
        EOF

        service openvpn restart

Dosya olarak direk sunucusuna çekmek isteyenler olursada

    wget https://mertcangokgoz.com/Downloads/openvpn.sh

Kuruluma gelecek olursak dosyayı direk olarak sunucunuza indirin ardından aşağıdaki komutu vererek çalıştırın.

    chmod 777 openvpn.sh
    ./openvpn.sh yada sh openvpn.sh

Bundan sonra kurulumun bitmesini bekleyin sonrasında sunucunuzun içerisine client.ovpn adında bir dosya belirecek bunu **WinSCP** aracılığı ile bilgisayarımıza aktarıyoruz.

![winscpdosyatransferi1](/assets/winscpdosyatransferi1.png)

Giriş yaparken Güvenli bağlantı şeklinde bağlanmamız gerek sakın olaki **FTP** ile bağlanmayın bağlanacaksanız aranızdaki bağlantının şifreli olacağı bir platformdan çekin dosyayı Güvenliğiniz açısından bu gereklidir.İnternet üzerinde **VPN** hizmeti veren firmaların keyleri değiştirilirse yani devlet tarafından alınırsa decode edilebilir ve kullandığınız **VPN** in içeriği direk olarak okunabilir buda bir güvenlik zafiyeti oluşturacaktır.

![winscpdosyatransferi2](/assets/winscpdosyatransferi2-e1403481175616-897x576.png)

client.ovpn dosyamızda görmüş olduğunuz gibi kök dizin içerisinde bulunan /etc/openvpn klasöründe bulunmakta.Dosyayı hemen sistemimize indiriyoruz ve fark etmişsinizdir _ID yada PW_ ayarlamadık scriptdede yok çünkü sistem ıd pw dışında sadece sertifikalar üzerinden ilerlemektedir.Bunun böyle olmasının sebebi ise personal **VPN** olarak kurmuş olmanızdan kaynaklıdır.Tek bir kişi kullanacağı için güvenlik zafiyeti oluşturmaz.Güvenle kullanabilirsiniz.

Şimdi geldik en son aşamaya **VPN** bağlanma aşamasına burada önemli olan 3.parti uygulamalar kullanmamak resmi sitesinde bulunan **OpenVPN GUI** uygulamasını indirmek linux ve mac için de çözümler mevcut.

- [OpenVPN](https://openvpn.net/index.php/open-source/downloads.html)

Ubuntu Sistem için Kurulum Parametresi

    sudo apt-get install openvpn
    openvpn --config client.ovpn

Direk olarak sisteminize uygun olan sürümü indiriyorsunuz ve kuruyorsunuz sonra ise basit gereken **.ovpn** göstermek ve kurulumu tamamlayıp bağlantıyı sağlamak ip adresinizi kontrol edebilirsiniz.

Windows da **.opvn** yi

      C:\Program Files\OpenVPN\config

kısmına atmak sonrasında bağlanıp işlerinizi halledin...
