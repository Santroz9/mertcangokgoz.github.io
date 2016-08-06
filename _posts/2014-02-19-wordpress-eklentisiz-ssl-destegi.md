---
layout: post
title: Wordpress Eklentisiz SSL Desteği
date: 2014-02-19 12:44:09.000000000 +02:00
type: post
published: true
status: publish
categories: guvenlik
description: Türkiye'de Tarih 18.02.2014 gösterirken cumhurbaşkanımız tarafından internet yasası onaylandı bende bunu fırsat bularak bloğumu SSL desteği
---

Türkiye'de Tarih 18.02.2014 gösterirken cumhurbaşkanımız tarafından internet yasası onaylandı bende bunu fırsat bularak blogum da **SSL** desteği ekleyerek gelen kullanıcıların daha güvenli bir şekilde ulaşmak istedikleri bilgilere ulaşmasını sağlamaya çalıştım. İnternet'in neredeyse %30 kadarı kullanıcıların bilgilerini çalmayı hedeflemiş durumda sitemizi gezerken bu gibi durumları düşünmemeniz açısından **SSL** desteğini aktif etmiş bulunuyoruz.Özellikle Wordpress bloglarında kullanmak isteyen webmaster arkadaşlarımıza bu konuda bir nebze yardım etmek gerektiğini düşünüyorum bu işi eklenti kullanmadan &nbsp;tamamen eklentisiz bir şekilde yapmamız ve sitemizin CPU,RAM değerlerini zıplatmadan **"https"** desteğini getirmemiz mümkün

Öncelikle Size 1 adet SSL sertifikası lazım bunun için herhangi bir yerden SSL alabilirsiniz ancak benim tavsiyem kurulumunu bilmiyorsanız. Hosting firmanızdan bunu talep etmenizdir onlar bir kaç saat içerisinde sitenize **"https"** özelliğini açmış olacaklar ve sadece size bir kaç ufak ayarlama kalmış olacak ancak kendinize ait sunucunuz var ise kurulumunu web serverınıza göre yapmanız gerekiyor.SSL sertifikanız var olduğunu düşünerek işleme geçelim hemen

ilk olarak sitemizde 443 portu aktif mi diye kontrol etmemiz gerekiyor bunun için çeşitli siteler bulunuyor ama **SSL** yi aldığınız yerin kontrol sayfasını kullanmanız sizin için daha iyi olacaktır.bu aşamadan sonra **wp-config.php** dosyasını açıyoruz ve aşağıdaki satırları ekliyoruz.

    define( 'WP_SITEURL', 'https://mertcangokgoz.com' ); //Sitemizin URL sini "http"den"https" olarak değiştiriyoruz.
    define( 'WP_HOME', 'https://mertcangokgoz.com' ); //home URL sini "http"den"https" olarak değiştiriyoruz.
    define( 'FORCE_SSL_LOGIN', true ); // login sayfasını SSL ye zorla
    define( 'FORCE_SSL_ADMIN', true );//admin sayfası icin SSL ye zorla

Bu işlemleri yaptıktan sonra sitemizin başına https yazarak girebilmemiz gerekiyor. Girmez ise telaşlanmayın eklediğiniz satırları tekrardan http olarak değiştirmeniz sitenize girebilmeniz için yeterli olacaktır.bu işlemlerden hemen sonra sitenizde biraz yavaşlık görebilirsiniz bunun nedeni https üzerinden iletilmeyen yada iletilirken zorlanan linklerden dolayıdır.Bunu düzeltmek için ise siteniz içerisinde geçen **"http:"** tamamını **"https:"** olarak değiştirmeniz he hepsini **SSL** olarak kullanıcıya iletmenizdir.

yani yapacak olduğunuz şey **CTRL+U** ya basarak sayfa kaynağını görüntülemeniz sonrasında **CTRL+F** tuşunu kullanarak **src="http:"** şeklinde arama yapmaktır ve karşınıza bir çok http protokolünü kullanan link çıkacaktır bunları teker teker değiştirmelisiniz.

Sonrasında isterseniz Eklenti kullanabilirsiniz ama şahsen kullanılmasını önermiyorum boş yere Wordpressimizin kasmasına neden olmayalım

1. [Really Simple SSL](https://wordpress.org/plugins/really-simple-ssl/)
2. [SSL İnsecure Content Fixer](https://wordpress.org/plugins/ssl-insecure-content-fixer/)

Plugini kurduktan sonra otomatik olarak tüm **"http"** ler **"https"** olarak değişecektir ama zorlayarak bu işlemi yaptığı için sitenizin geç açılmasına neden olabilecektir.Eklentisiz yapacağınız işlemlerde manuel olarak sitenizde yer alan httplerin tamamını https yapmanız gerekiyor biraz zahmetli olarak gözüksede en stabil olan ve eklentisiz en iyi yöntem budur.

Peki Tüm ayarlamaları yaptınız sitenizin tamamen güvenli olduğunu nasıl anlayacaksınız işte bu noktada [WhyNoPadlock](https://www.whynopadlock.com/) sitesi imdadımıza yetişmektedir.Sitenizde **SSL** nin tam olarak aktif olduğunu taramaya yardımcı olan bir sitedir ve 60 saniye içerisinde sitenizin durumunu size gösterecektir.

Örnek

![whynopadlock](/assets/whynopadlock.png)

Bu tüm işlemleri yaptıktan sonra yüksek ihtimal cache eklentiniz adam gibi çalışmayacaktır bunun içinde çözümümüz var mevcut cache eklentinizden memnun değilseniz benim site tavsiyem&nbsp; [Emre Vona](http://profiles.wordpress.org/emrevona/)&nbsp;arkadaşmızın geliştirmiş olduğu ve günden günede gelişmekte olan bir eklenti olan [WP Fastest Cache](https://wordpress.org/plugins/wp-fastest-cache/) uygulamasını kullanmanızdır SSL ile tamamen uyumlu olarak geliştirilen eklenti hem sitenizi kasmıyor hemde gerçekten hatrı sayılır bir oranda sayfa hızınızı artırıyor. [
](http://profiles.wordpress.org/emrevona/)
