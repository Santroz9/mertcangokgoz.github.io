---
layout: post
title: Vmware Sanal Bilgisayar Kurulumu
date: 2014-07-01 19:55:17.000000000 +03:00
type: post
published: true
status: publish
categories: windows
description: vmware workstation üzerine sanal bilgisayar kurulumunu nasıl yaparız bunu anlatmak istedim aslında internet de bir sürü anlatım var ancak güncel
---

vmware workstation üzerine sanal bilgisayar kurulumunu nasıl yaparız bunu anlatmak istedim aslında internet de bir sürü anlatım var ancak güncel bir adet de bizim veritabanımızda bulunsun kullanmak isteyenlerin işine yarasın dedim.Öncelikle son sürümü indirerek başlayın bu anlatımı yaparken ben versiyon 10 kullandım.

Programımızı açıyoruz ana ekrandan hemen "Create a New Virtual Machine" diyoruz ve adımları yapıyoruz tabi herkes gibi önerilen ayarlardan devam etmeyeceğiz biraz detaylandıracağız ki sonradan bir sıkıntı çıkmasın

![vmwarevirtualcomputergorsel1](/assets/vmwarevirtualcomputergorsel1-e1404226780356-830x576.png)

Direk olarak kurulum ekranı karşımıza çıkacak burada 2 seçenek var ilki önerilenler ile kurulum ikincisi ise özel kurulum yani bizim ayarlamaları yapabileceğimiz kurulumdur.Biz ikinci seçeneği seçip devam ediyoruz.

![vmwarevirtualcomputergorsel2](/assets/vmwarevirtualcomputergorsel2.png)

Bu kısma geldiğimizde bize sürüm seçtiriyor ne iş için kullanıcaksanız sanal makinanızı ona göre sürümü seçebilirsiniz ben genel olarak versiyon 10 da devam ediyorum değiştirmiyorum diğer sürümlerde özellikler değişmekde özellikle verebileceğiniz ram ve hdd miktarları düşebiliyor bazı sürümlerde ise ek donanım yada özellik yapılamama gibi bir durumda söz konusu

![vmwarevirtualcomputergorsel3](/assets/vmwarevirtualcomputergorsel3.png)

sonrasında kuracağımız isoyu seçiyoruz cd den veya dvd den kuracakseniz ona göre ayarlamaları yapabilirsiniz.Ben kuruluma Ubuntu 14.04 Desktop iso su seçerek devam ediyorum.daha sonra kurmak istiyorsanız en alttaki seçeneği seçip sistemi sonrada kurabilirsiniz.

![vmwarevirtualcomputergorsel4](/assets/vmwarevirtualcomputergorsel4.png)

Ben ubuntu kurduğum için benden sonraki aşamada bir kullanıcı ismi ve parola belirlememi istiyor bunun nedeni de sonuçda bir linux dağıtımı kuruyor olmamız.

![vmwarevirtualcomputergorsel5](/assets/vmwarevirtualcomputergorsel5.png)

Kurulum yerini ve dosyanın adını belirlememiz gerekiyor sırada, istediğinizi yapabilirsiniz ve istediğiniz dosya yolunu seçebilirsiniz.tek sıkıntı Türkçe karakter kullanmayın hata verebiliyor.

![vmwarevirtualcomputergorsel6](/assets/vmwarevirtualcomputergorsel6.png)

Bu ayarları olduğu gibi bırakabilirsiniz çünkü sunucu kurmuyoruz sonuçta bu bölümde işlemci ve kullanacağı çekirdek başına işlem miktarını ayarlayabilirsiniz.

![vmwarevirtualcomputergorsel7](/assets/vmwarevirtualcomputergorsel7.png)

Geldik sanal makinamızın can damarı olan ram atama kısmına birden fazla sanal bilgisayar açacaksanız ramınızı orantılı kullanmak zorundasınızdır benim 32 GB ram kapasitem olduğu için varsayılan olarak her zaman 2 gb ayarlamaktayım sizde sisteminizin kapasitesine göre ayarlama yapabilirsiniz.

![vmwarevirtualcomputergorsel8](/assets/vmwarevirtualcomputergorsel8.png)

Belkide en önemli ayardır ancak ben o kadar önemsemiyorum.Sonuç da sunucu kurmuyoruz sanal bir bilgisayar kuruyoruz o yüzden köprü modun da olmasında fayda var

![vmwarevirtualcomputergorsel9](/assets/vmwarevirtualcomputergorsel9.png)

Bu kısımdada okuma ve yazmayı kontrol edecek olan sistem saniyede 640 mb okuma ve yazmaya imkan tanıyan LSI Logic seçiyoruz.HDD tipine ve göre değişiklik yapabilirsiniz ama önerilen ayarı kullanmanızda fayda var

![vmwarevirtualcomputergorsel10](/assets/vmwarevirtualcomputergorsel10.png)

Kurduğunuz sanal sunucunun disk tipini belirlemek isteyebilirsiniz ben burada SCSI seçtim satadan bir nebze daha fazla okuma yazma hızı imkanı sağlıyor ve önerilen olarakda zaten SCSI var direk bir sonraki aşamaya geçmenizi öneririm.

![vmwarevirtualcomputergorsel11](/assets/vmwarevirtualcomputergorsel11.png)

yeni disk oluştur seçeneğini seçip devam ediyoruz çünkü yeni bir makine kuruyoruz.fiziksel disk seçimi yaparak sakın olaki kurmayın direk olarak HDD ye ulaşması pek iyi olmaz sizin açınızdan.

![vmwarevirtualcomputergorsel12](/assets/vmwarevirtualcomputergorsel12.png)

Ne kadar disk alanı kullanmasını istiyorsanız sisteminizin bunu aşağıdaki ayar bölümü ile yapabilirsiniz.birden çok kuracaksanız 20 gb parçalar şeklinde oluşturabilirsiniz.Dosyalarda bölünme fazla olmasın diye multiple yerine benim gibi single disk modunu seçebilirsiniz.

![vmwarevirtualcomputergorsel13](/assets/vmwarevirtualcomputergorsel13.png)

ayarladığınız diskinizin adını buradan ayarlayabilirsiniz Türkçe karakter kullanmamaya özen gösterin ne olur ne olmaz.

![vmwarevirtualcomputergorsel14](/assets/vmwarevirtualcomputergorsel14.png)

ve son olarak da ayarlarını yaptığınız sanal bilgisayarın özelliklerinin ön izlemesini yapıyoruz aklınıza yatmadıysa değiştirebilesiniz geriye gitmeyesiniz diye kolaylık da yapmış adamlar. Her şey tamamsa makineyi başlatabilirsiniz unutmamanız gereken bir şey var

![vmwarevirtualcomputergorsel15](/assets/vmwarevirtualcomputergorsel15.png)

Kurulumumuz böylelikle sona erdi sanal bilgisayarınızı doya doya kullanabilirsiniz. Vmware sisteminizin yettiği yere kadar sanal bilgisayar kurabilirsiniz ve kontrol edebilirsiniz. kişisel kullanım için&nbsp;yapılan ayarlar idealdir.
