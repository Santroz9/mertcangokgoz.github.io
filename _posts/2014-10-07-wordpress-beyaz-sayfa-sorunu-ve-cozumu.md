---
layout: post
title: Wordpress Beyaz Sayfa Sorunu ve Çözümü
date: 2014-10-07 17:45:49.000000000 +03:00
type: post
published: true
status: publish
categories: Genel
description: Wordpress Dünyanın en iyi CMS yani içerik yönetim sistemidir deniliyor haklılar tamam eyvallah ama hala şu beyaz sayfa sorununu çözmüş değiller
---
Wordpress Dünyanın en iyi CMS yani içerik yönetim sistemidir deniliyor haklılar tamam eyvallah ama hala şu beyaz sayfa sorununu çözmüş değiller yada sorunun nerden kaynaklandığını bi yere bi wiki sayfasına falan yazmış değiller hal böyle olunca çözmekde bize düşüyor.Ancak çözmek o kadarda kolay olmayacak çünkü deneme yanılma ile yapacağız ama ben size deneyeceklerimizi şöyle bi sıralamak istiyorum.

- Wordpress sitemizde bulunan herhangi bir cache eklentisinin cachelerini temizliyoruz.Hepsi yapmaz ama popüler olan w3 total cache var özellikle bunu kullanan sitelerde çokca görülmekte eklentinin klasör ismini değiştirip siteyi açın yada admin panele girebiliyorsanız cache temizleyin tamamdır düzelecektir zaten.

- Sorun Son kurduğunuz birşeyden kaynaklanıyor ise bulmanız kolay biraz düşünün son kurduğunuzu yada son yaptığınız işlemi sonrasında geri alın düzelecektir fazla kasmaya gerek yok eklentiden ise son kurduğunuzun ismini değiştirin yada plugins klasörünün ismini değiştirin panele ulaşın gerini zaten yaparsınız

- yedek attınız ve siteniz bir anda beyaz sayfa olmuşsa durumun çözümü basittir dosya izinleri perte çıkmış demektir bunun için ise klasörlerin izinlerini 755 yapmanız yetecektir.değilse yapın öyleyse bir sonraki çözümümüze geçelim bakalım onda sorununuz düzelicekmi

- Misal wp-config.php de bir düzenleme yaptınız site patladı ve beyaz sayfa sorunu oluştu o zaman ne yapıyoruz.wp-config.php yi bilgisayarımıza indiriyoruz ve notepad++ ile açıyoruz illaki her web sitesi olan kişilerde ve geliştiricilerde bu güzelim uygulama bulunur yoksa bir tane edinmenizde fayda var sayfayı açıyorsunuz sonrasında kodlama biçimi diye bir mevzu göreceksiniz bunu UTF-8 yapıyorsunuz boomlu boomsuz hiç girmeyin oraya ANSI olarakda düzelebilir deneyeceksiniz artık

- Temanızdan kaynaklanıyor olabilir %15 bir oranla o zaman temalarınızın bulunduğu dizine gidin kullandığınız temanın adını değiştirin ve sitenize erişin sonrasında yapacağınız ayarlamaları kendiniz bilirsiniz onu biz bilemeyiz.Sizin bileceğiniz bir iş

- Yeni Hosting yada sunucuya geçtiyseniz ve durum oluştuysa en son %1 lik bir ihtimal php.ini den dolayıdır. safe\_mod u siteniz için kapatmalarını söyleyebilirsiniz sitenizin güvenliği düşecektir ama sorun çözülebilir belli olmaz

- Sitenizin eskiyedeğinden sadece DB yi alıp gerisini silebilirsiniz son ve kesin sonuçu bu şekilde alabilirsiniz sırıfdan temiz kurulum yaparsanız sorun ortadan kesinlikle kalkacaktır.bi zahmetde kalksın yani hala inat edipde beyaz sayfa verecek halide yok varsa artık bi duş falan alın yani ne bileyim...

Hadi bunların hepsini yaptınız sorununuz hala çözülmedi ise öncelikle size helal olsun demek istiyorum Wordpressi güzel bozmuşsunuz.Bundan sonra ise diyeceğim profesyonel destek almanızdır.İnternette pek çok bu işi yapan arkadaş mevcut onlar sorununuzu çözebilir diye umut ediyorum.
