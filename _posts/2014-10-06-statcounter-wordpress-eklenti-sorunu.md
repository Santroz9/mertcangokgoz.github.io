---
layout: post
title: StatCounter Wordpress Eklenti Sorunu
date: 2014-10-06 15:05:01.000000000 +03:00
type: post
published: true
status: publish
categories: guvenlik
description: StatCounter ve sitesi wordpress olupda kod ile uğraşmadan direk olarak Eklenti aracılığı ile kullanmak isteyenlerin WP 4.0 güncellemesi
---
StatCounter ve sitesi wordpress olupda kod ile uğraşmadan direk olarak Eklenti aracılığı ile kullanmak isteyenlerin WP 4.0 güncellemesi ile gelen musibet bir sorununu uzun zamandır anlatmak istiyordum eklentiyi geliştiren arkadaşa 2 gün önce raporlansada sorun hala bi tarafına takmamış ve güncellemeyi yapmayıp.İşte destek hattına gelin biz çözelim gibi şeyler söylüyordu.Bu hatayı bende aldığım için ve eski ayarları kullanmak istemeyip yenilemek istediğim için kolları sıvadım

öncelikle FTP ye bağlanıp aşağıdaki yola gidiyorsunuz.

    "wp-content/plugins/official-statcounter-plugin-for-wordpress"

Buraya gelindikten sonra "StatCounter-Wordpress-Plugin.php" her hangi bir dosya editörü ile açıyorsunuz.

Satır 227 de bulunan aşağıdakini şu şekilde değiştirmeniz gerekmekte...

![statcounterwppluginerror1](/assets/statcounterwppluginerror1.png)

Bu gözüken satırda bir form oluşturulmuş ve methodu post olarak ayarlanmış ve aksiyon olduğu zaman nereye yönlendirileceği belirtilmiş sorun şu ki WP 4.0 sürümünde böyle bir action tanımlaması yapmanız mantıklı değil zaten page= şeklinde plugins içerisindeki klasörde bulunan .php ye gitmez yetkilendirme hatası gayet tabi verir.Vermez ise zaten güvenlik açığınız var demektir kapatmak için ise...

    define('DISALLOW_FILE_EDIT', true);

Şimdi ayarlamalarımızdan sonra oluşan yeni form action durumu ise şu şekildedir...

![statcounterwppluginerror2](/assets/statcounterwppluginerror2.png)

Bu şekilde kayıt ettikten sonra işlemimiz tamamdır.Şimdi Eklentinin ayar sayfasına geliyorsunuz artık ayarlarınızı yapabilirsiniz ve sorununuz ortadan kalkıcaktır.Ayrıca eklentide düzgün bir şekilde çalışıyor olacaktır.
