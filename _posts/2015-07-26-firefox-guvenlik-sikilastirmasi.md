---
layout: post
title: Firefox Güvenlik Sıkılaştırması
date: 2015-07-26 03:17:05.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: Firefox üzerinde oldukça fazla durmaktayım bunun nedeni özellikle güvenlik açıkları konusunda oldukça hassas davranması gerekse virüslerin direk
---

**Firefox** üzerinde oldukça fazla durmaktayım bunun nedeni özellikle güvenlik açıkları konusunda oldukça hassas davranması gerekse virüslerin direk olarak firefox hedef alsa bile çalışma olasılıklarının düşük olması bunun yanı sıra kullanıcıya daha çok imkan sağlıyor.Bu makalemizde size özellikle **Firefox** üzerinde yapılabilecek kritik güvenlik ayarlarını göstereceğim sızıntıları engelleyeceğiz ve gizliliğimizi bir tık daha ileri taşıyacağız bu konu hakkında yazdığım 2.makale bu makalede biraz daha sistem içerisine gideceğiz ve bir takım ek önlemler alacağız.

İlk olarak firefox da kullanacağınız eklentiler;

1. CanvasBlocker -\> [https://addons.mozilla.org/nl/firefox/addon/canvasblocker/](https://addons.mozilla.org/nl/firefox/addon/canvasblocker/)
2. Adblock Edge -\> [https://addons.mozilla.org/nl/firefox/addon/adblock-edge/](https://addons.mozilla.org/nl/firefox/addon/adblock-edge/)
3. Disconnect.me -\> [https://addons.mozilla.org/en-US/firefox/addon/disconnect/?src=external-product-icon](https://addons.mozilla.org/en-US/firefox/addon/disconnect/?src=external-product-icon)
4. HTTPS-Everywhere -\> [https://addons.mozilla.org/nl/firefox/addon/https-everywhere/](https://addons.mozilla.org/nl/firefox/addon/https-everywhere/)
5. Self-Destructing Cookies -\> [https://addons.mozilla.org/nl/firefox/addon/self-destructing-cookies/](https://addons.mozilla.org/nl/firefox/addon/self-destructing-cookies/)

Eklentileri tek tek kurdunuz filtreleri tek tek yüklediniz.tüm canvasları blockladığınıza göre gelelim ana yapılacaklara. Normal bir internet kullanıcısı internetde gezer video izler facebookda dolaşır arkadaşlarını dürter yada twitterda tweet atar ama potansiyel kötücüller bu arkadaşı beklemektedir.Biz elimizden geldiği kadar sızıntıları önleyelim ayarlarımızı yapalım.Firefoxdaki ayar sayfasına ulaşalım bunun için **about:config** komutunu adres girdiğiniz çubuğa yazın gelen uyarıya he deyip geçin ve işlemlerimize başlayalım.Yapacaklarınız oynadığınız online oyunları etkileyebilir web sitelerinde gireceğiniz sitelerdeki bazı özelliklerin çalışmamasına neden olabilir.

    #DNS sorguları tanımlanan dns üzerinden akması için yapılacak işlemler
    network.http.sendRefererHeader -> 0
    network.proxy.socks_remote_dns > TRUE

    #konum bilgilerinin kapatılması mutlaka önerilir
    geo.enabled > FALSE
    geo.wifi.uri (string => http://localhost)

    #güvenli arama fonksiyonlarının ayarlanması
    browser.safebrowsing.enabled > FALSE
    browser.safebrowsing.malware.enabled > FALSE
    browser.download.manager.scanWhenDone > FALSE

    #yazarken yapılan aramanın kapatılması
    browser.search.suggest.enabled > FALSE

    #PDF ayarları
    pdfjs.disabled > TRUE
    plugins.click_to_play > TRUE

    #Videoların otomatik başlamasını önleme(HTML5 videolar için)
    media.autoplay.enabled > FALSE

    #ön tanımlı olarak gelen sync özelliklerini kapatmak
    services.sync.engine.tabs -> FALSE
    services.sync.engine.prefs -> FALSE
    services.sync.engine.passwords -> FALSE
    services.sync.engine.history -> FALSE
    services.sync.engine.bookmarks -> FALSE
    services.sync.engine.addons -> FALSE

    #herdaim gizli sekme açılmasını sağlama
    browser.privatebrowsing.autostart -> TRUE

    #DOM disk alanının sıfırlanması ve kapatılması işlemi
    browser.cache.offline.enable -> FALSE
    browser.cache.disk.enable -> FALSE
    browser.cache.offline.capacity -> 0

    #WEBRTL açığının giderilmesi
    media.peerconnection.enabled -> FALSE

    #WEBGLnin kapatılması
    webgl.disable -> TRUE

Bu işlemleri yaptıktan sonra video oynatıcısını yani flash playeri de kapatmamız gerekiyor bunun yanında javayıda kapatacağız.Bunun için yapmanız gerekenler

Menu \> Add-ons \> Plugins

yoluna gidiyorsunuz burada tüm **java** yazan ve tüm **flash** yazanları kapatıyoruz. Örnek olarak;

![firefoxgizlilikgorsel1](/assets/firefoxgizlilikgorsel1.jpg)

Bunların yanında haliyle sistemde kurulu olan **Adobe Flash Playeri** kaldırıyoruz. Zaten siz kaldırmazsanızda bir sonraki firefox versiyonunda flash player kapalı gelecek sıfırıncı gün açıklarından başka türlü kulturmanın yolu yok

Bu işlemler sonrasında iyide bir dns seçmemiz gerekiyor bunun için size artık açık seçik ip adreslerinden bahsetmeyeceğim yada ne bileyim şunu kullanın demeyeceğim bu işinde suyu çıktı biraz daha kuvvetli bir yapısı olan **DNSCrypt** kullanacağız böylelikle araya giren çıkan olmayacak

Anlatımımı bu sefer Windows üzerinden yapacağım.İlk olarak uygulamayı indirelim.Ben sizin için toparladım hepsini aşağıdaki bağlantıdan indirebilirsiniz.Yada [resmi sitesinden indirip kurabilirsiniz.](http://dnscrypt.org/#dnscrypt-windows)

[Derlenmiş haline ulaşmak için tıklayınız.](https://mertcangokgoz.com/Downloads/DNSCrypt.zip)

İndirdiğiniz uygulama içerisinde bazı dns servisleri bulunmaktadır bunlardan faydalanabilirsiniz.İstediğinizi seçmekte özgürsünüz ama benim önerim **oVPN** sitesinin DNS sunucularını kullanmaktır.Şu ana kadar gördüğüm en güvenli ve uptime en yüksek servislerden bir tanesidir.

yönetici olarak programı açtığınızda ayarları yapmanız gerekiyor bunun için ilk önce config sekmesinden aşağıdaki gibi bir dns sunucusu seçiyoruz.

![dns sunucusu secimi](/assets/2_x8mh6p.png)

Ben özellikle beğendiğim **OVPN** sitesinin sunucularını kullanacağım.Daha sonra ise NICs sekmesine geçiyorsunuz.

![dns crypt gorsel](/assets/dnscryptgorsel2.png)

Bu kısımdan yapmanız gereken sisteminizdeki kullandığınız ağları seçmek daha sonra **İnstall** butonuna basmak ben daha önceden kurduğum için **Unistall** aktif ancak sisteme ilk defa kuruyorsanız size direk install gözükecektir.daha sonra çalıştırıyoruz ve işlemimiz tamamlanıyor.Artık **DNS sorgularımız** daha güvenli bir hale geldi bundan sonrasında **VPN** kullanarak bağlantınızı güvenli hale getirebilirsiniz.yada istediğiniz bir yapılandırma ile devam edebilirsiniz.
