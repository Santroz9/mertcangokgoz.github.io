---
layout: post
title: Microsoft Hyper-V Sanal Makine Kurulumu
date: 2014-07-04 14:23:00.000000000 +03:00
type: post
published: true
status: publish
categories: Windows
description: Hyper-v uygulaması vmware ye alternatif olarak kullanılabilen oldukça başarılı bir sanallaştırma uygulamasıdır.Günümüzde çoğu sunucu üzerin
---
Hyper-v uygulaması vmware ye alternatif olarak kullanılabilen oldukça başarılı bir sanallaştırma uygulamasıdır.Günümüzde çoğu sunucu üzerindede Hyper-V ile sanallaştırma gerçekleştirilmektedir.Tabi böyle söyleyerek sanallaştırma devi vmwareyide yabana atmamak lazım bilgisayar kullanıcıları arasında popüler olarak kullanılmaktadır.Hyper-V den kullanması daha kolay ve bazı sistemlerde kurulumları kendisi yapmaktadır Hyper-V de ise tüm ayarlamaları genel olarak kullanıcıya bırakır.Bugün sizlere Hyper-V kullanarak sanal bir makine oluşturmayı anlatacağım Windows 8 ve Windows 8.1 kullanıyorsanız vmware yerine Hyper-V kullanmanızı şiddetle tavsiye ediyorum hem kullanıcı arayüzü hemde esnekliği açısından vmwareden 1 adım öndedir.Özellikle belirtmek istiyorum Hyper-V de vmwaredeki gibi dosya sürükleyip bırakma gibi bir özellik bulunmamaktadır bunun için ayrı kurallar gerekmektedir.

İlk olarak programımızı açarak işe başlayalım sağ tarafta bulunan menüden yeni diyelim ve ayarlamalarımıza hızlıca bir giriş yapalım öncelikle ilk çıkan kısımdan sanal makinenizin ismini belirleyebiliyorsunuz kafanıza göre bir isim yazabilirsiniz önerim işletim sisteminin adı ve amacı farklı bir yere sanal makineyi depolamak istersenizde gene bu kısımdan ayarlamalarını yapabilirsiniz.

![hyper-vdesanalmakineolusturma1](/assets/hyper-vdesanalmakineolusturma1.png)

ikinci aşamada ise neslini belirlememiz gerekiyor.Genel kullanım için ben 1.nesli seçtim genel olarak hyper-v nin önceki sürümlerinide desteklemekte 2.nesil seçerseniz donanımsal ve driversel pek çok şey yok zaten kullanım amaçlarıda farklı bu noktada.

![hyper-vdesanalmakineolusturma2](/assets/hyper-vdesanalmakineolusturma2.png)

Bu kısımda ise sanal makinemizin Ramını ayarlamamız gerekiyor. 1 GB den düşük vermemeye özen gösterin tabi linux ise 256 mb bile verebilirsiniz dert değil.birden fazla sanal makine açacaksanızda ramı bol bol kullanmamaya çalışın işletim sistemlerinin önerilen ram miktarları üzerine çıkmamanız önerilir.

![hyper-vdesanalmakineolusturma3](/assets/hyper-vdesanalmakineolusturma3.png)

Bu kısımda ise sanal makinemizin bağlanacağı sanal ağ kartını göstermemiz gerekiyor

![hyper-vdesanalmakineolusturma4](/assets/hyper-vdesanalmakineolusturma4.png)

ben her zaman daha sonra oluşturup seçiyorum siz öncedende oluşturabilirsiniz bunun için yapmanız gerekenler oldukça basit aslında Sağ tarafta bulunan sanal anahtar yöneticisine giriş yapıyoruz.

![hyper-vsanalanahtaryoneticigorsel1](/assets/hyper-vsanalanahtaryoneticigorsel1-e1404443425559.png)

Görüldüğü üzere 3 adet seçilebileceğiniz sanal anahtar tipi var bunlar sırasıyla iç,dış,özel olarak adlandırılıyor.

- Dış = hali hazırda var olan networke giriş yapmanıza olanak sağlar
- İç = sanal sunucu ile fiziksel olarak kurulu olan sunucu arasında köprü görevi görür ve bir birlerinin iletişimini sağlar
- Özel = sanal sunucuların kendi aralarındaki iletişimi sağlar

Aşağıdaki gibi ben bir dış&nbsp; ağ oluşturdum böylelikle sanal makinamızıda internete çıkartabileceğiz sonraki adımda ise uygula diyip gerekli ayarın yapılmasını sağlıyoruz bu esnada internetiniz kesilebilir telaşlanmayın eğer yanlış bir ayarlama yaparsanız internet bağlantınızın tamamen kopacağını bilmenizde fayda var geri getirmek için sanal anahtarı kaldırmanız yeterlidir.

![hyper-vsanalanahtaryoneticigorsel2](/assets/hyper-vsanalanahtaryoneticigorsel2-e1404443923140.png)

İşlemlerimizi bitirmeden önce son olarak sanal makineye disk bağlamamız gerekiyor ancak biz sıfırdan kurulum yaptığımız için onuda yeni oluşturuyoruz. ne kadar alan kullanıcaksanız ona göre ayarlama yapabilirsiniz bunun dışında nereye kayıt edeceksenizde seçmeyi unutmayın.

![hyper-vdesanalmakineolusturma5](/assets/hyper-vdesanalmakineolusturma5.png)

Bir sonraki adımımızdada sistemimize kurmak istediğimiz işletim sistemini seçiyoruz istersek CD,DVD den istersek iso dosyasından sistemi kurabilirsiniz.

![hyper-vdesanalmakineolusturma6](/assets/hyper-vdesanalmakineolusturma6.png)

Sonunda işlemlerimiz bitti özel kısmına ulaşabildik buradada sistemimizde yaptığımız ayarların kısa bir özetini bizlere sunuyor.Gereken ayarlamalar yada kafanıza yatmayan birşey olursa direk olarak geri gelip düzeltebilirsiniz.

![hyper-vdesanalmakineolusturma7](/assets/hyper-vdesanalmakineolusturma7.png)

Son dediğimiz anda 3 ila 5 dk arası süren bir kurulum aşaması olacak bu esnada işletim sistemini kurmayacak sadece sanal makineyi ayarlayıp size teslim edecek.

![hyper-vdesanalmakineolusturma8](/assets/hyper-vdesanalmakineolusturma8.png)

tadaaaa Sistemimiz hazır...

![hyper-vdesanalmakineolusturma9](/assets/hyper-vdesanalmakineolusturma9-e1404444305264-766x576.png)

NOT: Anlatımlar Windwos 8.1 üzerinde kurulu olan Hyper-V üzerinden yapılmıştır ve bu kurulum windows server 2012 üzerinde bulunan hyper-v için de geçerlidir.(Ağ ayarları değişiklik gösterebilir.)
