---
layout: post
title: dupeGuru ile Ubuntu Sistem temizliği
date: 2015-01-10 19:52:05.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Ubuntu işletim sisteminde aslında temizliğe falan gerek yoktur sonuçta linux bu windows kadar başınızı ağrıtmaz sıkıntı çıkartmaz
---
Ubuntu işletim sisteminde aslında temizliğe falan gerek yoktur sonuçta linux bu windows kadar başınızı ağrıtmaz sıkıntı çıkartmaz.Ama birden aynı dosyayı birden fazla yere kopyaladıysanız yada aynı dosyayı farklı yerlere indirdiyseniz yada ne bileyim bir şekilde aynı dosyanın ikincisinden farklı bir dosya yolunda varsa silmek istiyorsanız ubuntuda ne yapacaksınız şimdi size bunu göstermek istiyorum.dupeGuru duplicate olmuş yani çoğalmış çoğaltılmış fazlalaştırılmış dosyaların temizliğinde yada hepsinin tek bi çatı altında toparlanmasını sağlar.Python ile yazılmış olduğu içinde gerçek anlamda efektif bir şekilde çalışır.Böylelikle hiç sıkıntı çekmeksiniz herhangi bir dosyayı boyutu ne olursa olsun gereken işlemi yapabilirsiniz.

Kurulumu ise çok basittir.

    sudo apt-add-repository ppa:hsoft/ppa
    sudo apt-get update
    sudo apt-get install dupeguru-se

Paketlerini ekleyip komutu veriyoruz ve kurulumumuz tamamlanıyor.Sonrasında uygulamayı açmamız gerekiyor bunu arama ile bulabilirsiniz hemen bakarsınız bulamazsınız o zaman komut satırına şunu yazmanız yeterli

    dupeguru_se

daha sonra uygulamamız açılıyor hemen karşımıza aşağıdaki ekran geliyor.

![ubuntudupegurugorsel1](/assets/ubuntudupegurugorsel1.png)Öncelikli olarak + simgesi ile taramanın yapılacağı klasörü seçmeniz gerekiyor.Seçtiğiniz klasörün içerisinde ne kadar dosya var ise uygulamanında tarama süresi ona göre artacak misal aşağıdaki gibi bir sonuç çıkmış olsun

![ubuntudupegurugorsel2](/assets/ubuntudupegurugorsel2.jpg)

bu dosyalara ne yapılacağını yukarıdaki actions butonu ile seçebilirsiniz.

![ubuntudupegurugorsel3](/assets/ubuntudupegurugorsel3.jpg)

isterseniz geri dönüşüm kutusuna taşıyabilirsiniz istersenizde başka bir yere taşıyabilirsiniz yada silebilirsiniz en olmadı kopyalayabilirsiniz.yada ne yapacağınız size kalır istediğinizi yapabilirsiniz.Silmeyi seçersenizde aşağıdaki gibi yapmanız yeterli

![ubuntudupegurugorsel4](/assets/ubuntudupegurugorsel4.jpg)

silinen şeylerin çetelesini tutmanızda önemli bu yüzden Symlink seçmemiz gerekiyor sonra tamamen silindiğinde diğer dosyanın yolundan dosyaya ulaşabilirsiniz.Dikkat edin önemli dosyalarınızı silerseniz sonra başınız ağrır.Gerekli olan diğer detaylar için [resmi sitesini](http://www.hardcoded.net/dupeguru/) ziyaret edebilirsiniz.
