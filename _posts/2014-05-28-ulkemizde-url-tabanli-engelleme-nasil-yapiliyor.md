---
layout: post
title: "Ülkemizde URL Tabanlı Engelleme Nasıl Yapılıyor ?"
date: 2014-05-28 01:23:27.000000000 +03:00
type: post
published: true
status: publish
categories: guvenlik
description: Bloğumda düşüncelerimi bilgi birikimimi yayınlamayı planlarken bunu akademik bir url ile yapmayı planlıyordum.Ancak internetde gördüm ki biraz
---

Bloğumda düşüncelerimi bilgi birikimimi yayınlamayı planlarken bunu akademik bir dil ile yapmayı planlıyordum.Ancak internetde gördüm ki biraz daha insanlara içden yaklaşmak gerekiyormuş.Yani up uzun bir makale yazıpda okuyan kişinin sonuna kadar gelmesini tabiki akademik bir dil ile pek fazla mümkün değil zaten görmüş olduğunuz gibi yazılarım genelde orta düzeyde bir anlatıma sahip çoğu yazımdada ruh halimi anlıyorsunuzdur.Öncelikle bu gün deyineceğimiz konu ülkemizde yeni yasa ile yürürlüğe giren&nbsp; [URL](http://en.wikipedia.org/wiki/Uniform_resource_locator) Tabanlı filtreleme olacak diyeceksiniz yahu bu yasa geçeli çok zaman oldu ve çoğu yerde [URL](http://en.wikipedia.org/wiki/Uniform_resource_locator) ye girdiğimiz zaman direk 404 Not found yada sayfa yüklenemedi hataları ile karşılaşıyoruz dediğinizi duyar gibiyim yapılan bu filtrelemeyi tabikide DNS ile geçmenizi yada geçebilmenizi beklemiyorum.

Araştırmalarımızı yapmamız için öncelikle bize bir adet linux (önerim kali linux) kurulu sistem gerekiyor.Windows ile gerekli olan analizi tam olarak gerçekleştirmem benim için pek mümkün değildi açıkcası araştırmamı yaparken tabiki bana [URL](http://en.wikipedia.org/wiki/Uniform_resource_locator) si yasaklı bir link gerekiyordu hemen youtubeye yöneldim ve Başbakan erdoğanın internete sızdırılan ses kayıtlarından pek çoğunu denedim hangisine girmeyecek acaba diye %98 ini açtım ancak bir tanesinde sayfa yüklenemiyor hatasını gördüm ve aradığım kanı bulduğumu fark ettim.Hemen işe koyulma vakti gelmişti dedim ve kolları sıvadım kahvemi laptobumun yanına aldım.

- İlk önce sisteme tcpdump adlı uygulamayı kurmamız gerekiyordu hemen sitesine yöneldim ve işleme başladım.ama kali linux kullandığımı bir an unuttuğum için böyle bir işe giriştiğime lanet ettim çünkü içerisinde zaten kurulu idi
- hemen sonrasında youtubenin DNS kayıtlarına bir göz atmamız gerekiyordu paket analizi yaparken kafamızın karışmaması hangi ip nin hangi yoldan ne amaçla geldiğini birazda olsa gözümüzün alışması gerektiğini düşündüm dig komutunu vererek DNS kayıtlarını izledim.

![tcpdumpimage1](/assets/tcpdumpimage1-e1401206842151-638x576.png)

- hemen ardından türkiyeye ulaşmadan önce hangi yerlerden gelerek youtubeyi biz evimizde görüntülüyoruz dedim( [traceroute](http://en.wikipedia.org/wiki/Traceroute)). Karşımıa bol yıldızlı bir döküm geldi haliyle göremedik

2 adet linkimiz hazır halde elimde duruyordu biri yasaklı olan [URL](http://en.wikipedia.org/wiki/Uniform_resource_locator) biriside hali hazırda yasaklanmamış olan [URL](http://en.wikipedia.org/wiki/Uniform_resource_locator) idi ilk olarak tcdump programını kıvama getirmemiz gerekiyordu tabi ki

**Kullanacağımız komut**

      tcpdump -v -vv

komutumuzu verdik karşımıza ip port protokol hakkında bilgiler geldi.

![tcpdumpimage2](/assets/tcpdumpimage2.png)Şimdi bizim aramamız gereken net.http yada net.https olarak youtubenin ip ve portu bunu sayfa yenileyerek anlayacağız tabi emin olmak içinde ip ye bi whois atmak daha iyi olacaktır yanlış ip adresini takip etmek istemeyiz.Şöyle bi izlediğimizde muc03s07-in-f14.1e100.net.https: Flag[P],cksum 0 şeklinde ilerleyen bi paketimiz olacak tabi bu değişken hepsinde aynı olmuyor buradan hareketle analizimize devam ediyoruz.

![tcpdumpimage3](/assets/tcpdumpimage3.png)

şimdi orada görüldüğü üzere bi http üzerinden youtubeye ulaştığımızda paketlerin hatalı olduğunu [TTL](http://en.wikipedia.org/wiki/Time_to_live)(yaşam süresi) değerlerinin bir anda düştüğünü görüyoruz.Çoğu zaman bu normal karşılanır sistem hataları networkünüzde oluşabilen problemler vs dedim ancak engellenmiş bir [URL](http://en.wikipedia.org/wiki/Uniform_resource_locator) ye ulaşmaya çalıştığımda karşıma şöyle bir ekran geldi

![tcpresetprotocol](/assets/tcpresetprotocol.png)

görür görmez tcpdump tekrar bakmak istedim çünkü youtubenin durduk yere bağlantıyı sıfırlamasının bir anlamı yoktu ancak gelen paketler neredeyse hemen hemen aynıydı sadece bir fark bulunuyordu incorret olarak gelen ve hatalı olarak gelen paket sayısı yüksekti protokol üzerindeki RST paketini hatırladım(tcpdump da yanlış hatırlamışyorsam Flags[R] olacaktı) birden gözüme ilişir diye bakarken kali linux de bu paketlerin firewall tarafından droplandığı konusunda bir yazı gördüm dedim bu böyle olmaz hemen wireshark a geçtim.

![tcpdumpimage4](/assets/tcpdumpimage4.png)

Wireshark geçtiğimde bir süre youtubede gezinip paketlere baktım herşey normaldi sonra yasaklı bulduğum url yi tarayıcıya girdim **"http://"** olan linkin yasaklı olduğu **"https://"** ise yasaklı olmadığını fark ettim.Peki bu ne demek oluyor diye soracaksınız.Siz bu sorunuzu bana yöneltmeden önce paketleri nasıl filtreleyeceğinize bir bakalım komutumuz;

      tcp.flags.reset==1

![wiresharkpacketanlysis](/assets/wiresharkpacketanlysis1-e1401228955305-1024x554.png)

Bu demek oluyor ki [URL](http://en.wikipedia.org/wiki/Uniform_resource_locator) ye ulaşmadan önce İSS araya girerek sayfanın [TTL](http://en.wikipedia.org/wiki/Time_to_live) (yaşam süresini)değiştiriyor ve RST paketi gönderiyor. Gönderilen bu paketde **"bağlantı sıfırlandı"** hatasını almanıza neden oluyor. Kısacası engellenmiş ve filtrelenmiş oluyor. Buraya kadar herşey normal aslında ama işin garip tarafı Turk Telekomun yada BTK TİB herneyse erişimi sadece http trafiği üzerinden kapatabiliyor olması yani şifreli gelen bağlantıları hala okuyamadıklarını görüyoruz. http üzerinden ise gelen requestlere göre filtreleme yapıyor yüksek ihtimal ile ya bir [DPİ](http://en.wikipedia.org/wiki/Deep_packet_inspection) yada kullanılan bir [firewall](http://en.wikipedia.org/wiki/Firewall_%28computing%29) bunu başarılı bir şekilde yapıyor ancak bu işlemler yapılmaya başlanalı internetde bir yavaşlık devamlı bir sorun çıkma durumu var.Sanırım TİB görevlileri kullandıkları sistemi tam olarak ölçeklendiremiyorlar.

Şimdi diyeceksiniz bir sonraki adımda ne olur. **"Ortadaki adam"** diye bi saldırı şekli var ingilizce adıyla **"Man in the Middle"** bu olay yapılmaya kalkılırsa bir şekilde mitm saldırısı gerçekleştirilecek sonrasında ise ne http nede https de anonim olarak takılabilirsiniz yada sansürü aşabilirsiniz.(VPN ve diğer tunelleme protokolleri şuan için hariç tabikide)

dipnot: Yukarıdaki bahsi geçen tüm bilgiler yaptığım araştırmalar sonucu yazılmış olup gerçekliği tartışılır.
