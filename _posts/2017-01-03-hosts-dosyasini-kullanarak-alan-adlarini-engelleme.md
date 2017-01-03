---
layout: post
title: Hosts dosyasını kullanarak alan adlarını engelleme
date: 2017-01-03
type: post
categories: linux
description: Tarayıcılarda reklamları veya alan adlarını engellemek için kullanılan popüler bir yöntem reklam engelleme eklentileridir 
---

Tarayıcılarda reklamları veya alan adlarını engellemek için kullanılan popüler bir yöntem reklam engelleme eklentileridir bunlar dışında bazı donanımsal çözümlerde bulunur. Ancak alternatif bir yöntem olarak, işletim sisteminizin hosts dosyasını kullanabilirsiniz. Bu dosya, host adlarının IP adreslerine eşleştirilmesine yarar. 

Alan adlarını `0.0.0.0` IP adresine yönlendirirsek ip adresleri çözümlenemeyeceği için bağlantı sağlanamaz. Bu sayede engelleme işlemi yapabiliriz. 

Bu iş için internette benim en çok denk geldiğim Steven Black kardeşimizin `hosts` reposunu kullanabiliriz. Bunun için

```
git clone https://github.com/StevenBlack/hosts.git
cd hosts
```

Yerel hosts dosyanızda herhangi bir girdiniz varsa bunları bu depodaki hosts dosyasına ekleyin.

Adblocking alan adı dosyalarını en yeni sürümüne güncellemek ve myhosts girdilerini son bir `hosts` dosyası oluşturmak için şu komutu kullanabilirsiniz

```
./makeHosts
```

Güncelleme işlemi bittikten hemen sonra eski `hosts` dosyasını yenisi ile değiştirmeniz yeterli. Ancak ne olur ne olmaz diye eski `hosts` dosyasını yedeklemeyi unutmayın

```
sudo cp /etc/hosts /etc/hosts.bak
sudo cp hosts /etc/hosts
```

Hemen ardından network servisini yeniden başlatmanız yeterli

```
systemctl restart network.service
```

İşlemimiz başarılı bir şekilde tamamlandı bundan sonra engellenen sitelere bir şekilde denk gelirseniz yönlendirmeden dolayı siteye erişim sağlayamayacaksınız.

### Peki neden `127.0.0.1` yerine `0.0.0.0` adresine yönlendirdik

Geleneksel olarak çoğu ana bilgisayar dosyası, yerel makineye IP bağlantısı kurmak için geri döngü adresi olan 127.0.0.1'i kullanır.

Geçersiz, bilinmeyen veya geçerli olmayan bir hedef belirlemek için kullanılan yönlendirilemez bir meta-adresi olarak tanımlanan `0.0.0.0`'ı kullanmayı tercih ediyoruz.

0.0.0.0'ı kullanmak, genel olarak daha hızlıdır, muhtemelen zaman aşımı çözümlemesi için beklemez. Aynı zamanda, yerel bilgisayarda çalışıyor olabilecek bir web sunucusuna da müdahale etmemiş olur.