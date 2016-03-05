---
layout: post
title: VestaCP Mail Server Ayarları
date: 2014-07-24 17:55:21.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: VestaCP nin belkide en kötü yanı mail server ayarlamalarını tam yapmaması ve firewall kurallarına portları eklememesi hal böyle
---
**VestaCP** nin belkide en kötü yanı mail server ayarlamalarını tam yapmaması ve firewall kurallarına portları eklememesi hal böyle olunca sorun vuku buluyor ve sonrasında ne mail gönderebiliyoruz nede mail alabiliyoruz.Ama bu sorunun çözümü oldukça basit ben bu kurulumu yaparken Projelerimden biri olan **VPN** Sisteminin paneli olarak vesta kullanmayı seçtim çünkü **SSH** üzerinden tek tek Nginx mysql ve exim ile devecot ayarlarını yapacak vaktim yoktu.

Örnek olarak kullanılacak olan domain [restrictedvpn.com](https://restrictedvpn.com)

Öncelikle **VestaCP** kurulu Değilse [Buradan kuruyoruz](https://mertcangokgoz.com/vesta-kontrol-panel-kurulumu/).Burada önemli olan **PTR** kayıtlarınızın site adresinize göre olmasıdır.Normalde böyle bir şeye gerek yok ancak **vestaCP** nedense **PTR** kaydınında site ismi ile olmasını uygun görmekte.Ki bunu yaparken de **hostname** nin sitenizin ismi ile aynı olması ve **DNS** lerinizinde aynı olması gerekmektedir.Sanırım yönlendirme ayarlarını kendisi yapmıyor.

Önce domaini aldığınız yerden sunucunuzun ip adresiyle nsleri bi güzel register ediyoruz. ben name.com kullandığım için benimkiler bu şekilde oldu

![vestacpmailserverayarlarigorsel1](/assets/vestacpmailserverayarlarigorsel1-e1406199587584-923x576.jpg)

Bu aşamadan sonra **VestaCP** aracılığıyla yeni web domain diyerek **vhost** oluşturma işlemini başarıyla yapıyoruz.Sitenizin özelliğine göre ayarlayabilirsiniz.

￼

Şimdi Geldik en önemli Kısma **DNS** ayarlarımızı kendi belirlediğimiz **DNS** sunucularına yönlendirme işi bunuda **vestaCP** de **DNS** çatısı altındaki sizin eklediğiniz domainin hemen üst kısmında list record diye bir buton olacak onu kullanacak aşağıdaki sayfaya geliyorsunuz ve en altta bulunan 2 **localhost.tld** yi kendi domain aldığınız yerde belirlediğiniz **NSlere** göre ayarlamanız gerekmektedir.

![vestacpmailserverayarlarigorsel3](/assets/vestacpmailserverayarlarigorsel3-e1406200036604-624x576.png)

bunu yapabilmeniz için aynı **DNS** kısmında domaininize göre eklenen **DNS**  record tipini değiştirmelisiniz bunun içinde **"Edit"** kısmına gelip template kısmını **"child-ns"** yapmalısınız.

![vestacpmailserverayarlarigorsel4](/assets/vestacpmailserverayarlarigorsel4-e1406200344634-555x576.png)

son olarak list **record** diyoruz ve değişmiş olduğunu göreceksiniz değişmemiş ise el ile ayarlayınız.

![vestacpmailserverayarlarigorsel5](/assets/vestacpmailserverayarlarigorsel5-e1406200461971-622x576.jpg)

böylelikle ayarlarımız son buluyor.Ancak aynı sunucuda **vestacp** ile birden çok site barınacak sa her oluşturduğunuzda bu ayarları yapmak zorundasınız bunu yapmamak için ise Paketler sekmesinden default olanın **ns** ayarlarını değiştirmek.

![vestacpmailserverayarlarigorsel6](/assets/vestacpmailserverayarlarigorsel6.png)

Bu kısımda bulunan **Nameserversların** ana domain nslerine göre düzenlenmesi lazım bunun içinde

![vestacpmailserverayarlarigorsel7](/assets/vestacpmailserverayarlarigorsel7-e1406200764196-735x576.jpg)

Sonra **NSleri** domaininize yönlendiriyorsunuz.tamamen yönlenmesi 24 saati bulabileceğini unutmamanız gerekmektedir.Şimdi ise geldik Firewall ayarlarına burada önemli olan gerekli portlara izin vermektir.Bunun için ilk önce **SSH** dan girişimizi yapıyoruz.

    #web server
    iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
    iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
    #SMTP protokol
    iptables -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
    iptables -A INPUT -p tcp -m tcp --dport 465 -j ACCEPT
    #POP3 Traffic
    iptables -A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
    iptables -A INPUT -p tcp -m tcp --dport 995 -j ACCEPT
    #İMAP protokol
    iptables -A INPUT -p tcp -m tcp --dport 143 -j ACCEPT
    iptables -A INPUT -p tcp -m tcp --dport 993 -j ACCEPT

Kurallarımızı ekledik eklendiğinden emin olmak için ise şu komutumuzu bi verelim

    iptables -L -n

Yaptığımız bu ayarlamaları bi kayıt edelim ki sonradan uğraştırmasın bizi

    iptables-save | sudo tee /etc/sysconfig/iptables

son olarak da sisteme işlemesi adına iptableye restart atıyoruz.

    service iptables restart

Yaptığımız ayarların olduğunu var sayarak **SMTP** test aracı ile bi test yapalım

- [MXBoxTool](http://mxtoolbox.com/diagnostic.aspx)

hostname ayarlarımıza geldi sıra bunun içinde wikipedia da geçen [FQDN](https://en.wikipedia.org/wiki/Fully_qualified_domain_name) uyumluluğu ile oluşturacağız bunu ki sonradan hem mail hemde sistemde sıkıntı çıkartmasın

    root@srv1.restrictedvpn:~# hostname
    srv1.restrictedvpn.com
    root@srv1.restrictedvpn:~# v-change-sys-hostname restrictedvpn.com
    root@srv1.restrictedvpn:~# hostname
    restrictedvpn.com

ve dediğim gibi **PTR** kayıtlarının düzenlenmesi gerekmektedir bunuda sunucunuzu alan yere yaptıracaksınız full managed ise sistemden kendiniz yapmanız gerekmektedir bazı sistemlerde de otomatik oluşturulmaktadır misal  **digitalocean**.Böylelikle işlemlerimiz tamamlanıyor.Artık sunucunuza rahatlıkla mail alıp mail gönderebilirsiniz.
