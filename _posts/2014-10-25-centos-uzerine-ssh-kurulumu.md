---
layout: post
title: Centos Üzerine SSH Kurulumu
date: 2014-10-25 15:37:56.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Bu Makalemizdede OpenSSH yani herkesin bildiği SSH kuralım normalinde VPS,VDS,Dedicated alırsınız size verilir falan ama kendinize
---
Bu Makalemizde de **OpenSSH** yani herkesin bildiği **SSH** kuralım normalinde VPS,VDS,Dedicated alırsınız size verilir falan ama kendinize ait bi sunucu aldınız diyelim birşey kurdurmadınız ve elinizde **KVM** yetkisi var diyelim genelde otomasyon sistemleri buna bile ihtiyaç duymuyor ama biz en fakiri&nbsp;olalım. **KVM** bağlantısı ile bağlanalım artık hangi **KVM** ise bilemem sonra komut satırını alırız elimize ve aşağıdakileri yazar devam ederiz

Kurulum parametremiz

    yum -y install openssh-server openssh-clients

Kurulumu otomatik yapıcak bunun dışında dokunmanızı gerektiren birşey yok bağlanmak içinde root kullanıcı adını kullanacaksınız sistemi kurarken yapmışsınızdır birşeyler geçmişsinizdir bi kıyak hadi hadi :)

    chkconfig sshd on
    service sshd start

Otomatik açılması içinde ekliyoruz ve başlatıyoruz **SSH** yi ohhh ne güzelde başladı ha şimdi ne yapacaz 22 portunu firewall dan tüm iplere açıcaz&nbsp;açmayın da göreyim bağlanmıyorsa da bağlanmıyor çıldırır durursunuz.

    -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
    service iptables save

Bundan sonra yapacağınız işler size kalıyor güvenlik işlemleri yada alacağınız önlemler aşırı derecede önemli şifrelerinizi dandik şeyler yapmayın kısa olmasın mantık çerçevesi içerisinde güzel şifreler oluşturun

Çalışıyomu çalışmıyomu diye kontrol içinde yanlış yazmadıysam şu iş görecektir.

    netstat -tulpn | grep :22

Sorun falan olursa haber vermeniz yeterli
