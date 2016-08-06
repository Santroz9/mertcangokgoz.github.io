---
layout: post
title: Ubuntuda Touchpad Nasıl Kapatılır
date: 2015-01-07 14:45:30.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Başlıkta belirttiğim gibi sisteminize mouse taktınız ama touchpad hala aktif mi yada birşeyler yazıyorsunuz bilediğiniz yada eliniz ikide
---
Başlıkta belirttiğim gibi sisteminize mouse taktınız ama touchpad hala aktif mi yada birşeyler yazıyorsunuz bilediğiniz yada eliniz ikide bir touchpade gidiyor ve yazdıklarınız farklı bir hal alıyor ise sizde benim gibi touchpad sevmeyen birisisinizdir ve bunu ubuntuda çözmenin bir yolu elbetteki var kurulum için sisteminizin 14.10 yada 15.04 olması gerekmekte

Kurulum parametremiz

    sudo add-apt-repository ppa:atareao/atareao
    sudo apt-get update
    sudo apt-get install touchpad-indicator

kurulum tamamlandıktan sonra unity de touch diye arama yapınca çıkması lazım yada menüde görebilirsiniz.Ayarlar sekmesine giriyoruz.Sırasıyla aşağıdaki ayarlamaları yapmanızı öneriyorum sonrasında zaten kendisi gerekeni yapacak

![Touchpadubuntudanasilkapatilirgorsel1](/assets/Touchpadubuntudanasilkapatilirgorsel1.png)

![Touchpadubuntudanasilkapatilirgorsel2](/assets/Touchpadubuntudanasilkapatilirgorsel2.png)

![Touchpadubuntudanasilkapatilirgorsel3](/assets/Touchpadubuntudanasilkapatilirgorsel3.png)

![Touchpadubuntudanasilkapatilirgorsel4](/assets/Touchpadubuntudanasilkapatilirgorsel4.png)

Ayarları yaptıktan sonra mouse taktığınızda yada yazmaya başladığınızda otomatik olarak touchpad kapatılacak mouse takıldığında kapat derseniz mouseyi alğıladığında zaten çalışmayacağı için yazarken kapatın tikini kaldırsanızda olur deneye yanıla bulabilirsiniz.
