---
layout: post
title: TCPDump Nasıl Kullanılır
date: 2014-06-29 23:36:37.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: TCPDump Linux işletim sistemlerinde sıkça kullanılan bir paket analiz programından başka bir şey değildir ve kullanan kişiye detaylı
---

**TCPDump** Linux işletim sistemlerinde sıkça kullanılan bir paket analiz programından başka bir şey değildir ve kullanan kişiye detaylı bir paket analizi sunmaktadır.Bulunduğu ağdaki gelen ve giden paketleri çok detaylı bir şekilde gözlemleyebilirsiniz.Paketleri yakalamak için ise linux kütüphanesi içerisindeki "libpcap" kullanır.Windows için sürümü bulunmaktadır ancak şuan için windows ile işimiz yok **SSH** üzerinden bir paket analiz programı arıyorsanız işte tam uygulamasına denk geldiniz.Eğer Desktop sürüm bir linux kullanıyorsanız o zaman daha kolay olan Wireshark kullanmanızı tavsiye ediyorum.

# **Centos 6 Üzerine TCPDump Kurulumu**

    yum install tcpdump

Kurulumu ile centos üzerine oldukça basit bir şekilde kurabilirsiniz diğer sistemler için kurulum parametreleri değişiklik göstersede genel olarak aynı.

# **TCPDump Parametreleri**

Sizlere genel olarak kullanılan komutlardan bahsetmek istiyorum en çok işinize yarayacak olan komutları burada ele alacağız hepsini yazmaya kalksak bya sürecek tamamına ulaşmak için terminal e

    man tcpdump

yazmanız yeterlidir.

- **-D** = Dinlenebilecek tüm arayüzlerin çıktısını verir.
- **-i**"arayüz" = Belirtilen arayüzün dinlenmesini sağlar.
- **-v** = Paketin Protokol içeriğini de göstererek analiz yapar.
- - **vv** = Paketlerdeki NFS ve SMB içeriğinide gösteren detaylı bir analiz yapar.
- **-vvv** = Paketlerin telnet içeriklerinide gösteren detaylı bir analiz yapar.
- **-q** = Paketlerin temel bilgilerini analiz eder.
- **-c**"sayı" = Belirtilen adetde paket dinlemesi yapar
- **-n**"ip adresi" = Belirtilen adrese gelen ve giden tüm paketleri gösterir
- **-n dst**"ip adresi" = Belirtilen adrese giden paketleri gösterir
- **-n scr**"ip adresi" = Belirtilen adrese gelen paketleri gösterir
- **-n port**"port numarası" = Belirtilen porta göre filtreleme yapar
- **-n dst port**"port numarası" = Hedef porta göre filtreleme yapar
- **-n src port**"port numarası" = Kaynak porta göre filtreleme yapar
- **-n dst net**"ağ adresi" = Belirtilen adrese giden paketleri gösterir
- **-n src net**"ağ adresi" = Belirtilen adrese gelen paketleri gösterir
- **-n net**"ağ adresi" = Belirtilen adrese gelen ve giden paketleri gösterir
- **-p** = seçici olmayan moddan çıkış
- **-e** = L2 bilgilerinide ekleyerek analiz yapar
- **-w**"dosya ismi" = dinlenen paketleri kayıt etmek

# Örnek bir Analiz Çıktısı

# ![paketanalizitcpdumpgorsel1](/assets/paketanalizitcpdumpgorsel1.png)

**TCPDump** bir özelliği de ddos saldırılarında gerektiği zaman hangi ip den ve hangi port dan saldırının geldiğini kolaylıkla tespit edebilirsiniz özellikle **UDP** saldırıları diyebilirim.Bunun dışında DNS saldırılarındada oldukça başarılı bir biçimde ekrana düşmekte ve hangi pakete göre filtreleme yapacağınızı buna göre seçebilirsiniz.Bunun dışında sadece linux dede değil windows sistemlerdede tcpdump kullanabilirsiniz wireshark kadar olmasada windowsdada oldukça başarılıdır.
