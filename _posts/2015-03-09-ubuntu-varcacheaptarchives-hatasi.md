---
layout: post
title: ubuntu /var/cache/apt/archives/ hatası
date: 2015-03-09
type: post
published: true
status: publish
categories: Linux
description: Ubuntu işletim sistemi kullanan arkadaşlar en az bir kez bu hatayı almıştır diye düşünüyorum tabi fazla paket vs kurmadıysanız hatayı görmemişde
---
Ubuntu işletim sistemi kullanan arkadaşlar en az bir kez bu hatayı almıştır diye düşünüyorum tabi fazla paket vs kurmadıysanız hatayı görmemişde olabilirsiniz nedenini bilmediğim bir şekilde arada çıkmakta idi bende uzun bir uğraş ve aramalardan sonra kalıcı çözümünü bulabildim.hatamız ilk olarak aşağıdaki gibi (hatanın çıkış noktası sanal olarak kurmuş olduğunuz ubuntudan kaynaklanmaktadır.Gerçek siteme kurulu olan ve bu hatayı alan arkadaşlarda bu çözümü kullanabilirler)

    D: /var/cache/apt/archives/ subprocess new pre-removal script returned error exit status 1

![apthatagorsel1](/assets/apthatagorsel1.jpg)

Bu hatayı görmüşsen öncelikle bi temizleme aşamasına geçmen gerekiyor.Ubuntu Tweak kurduysanız önceden sistemde birkaç temizlik yaptırabilirsiniz.Bu biraz sistemi rahatlatacaktır tabi virtualbox yada vmware gibi bir uygulama ile sanallaştırdıysanız yüksek ihtimal Ubuntu Tweak kurmamışsınız demektir.

```bash
    sudo apt-get clean
    sudo apt-get update && sudo apt-get upgrade
```

yukarıdaki komut yüzde 80 bu sorunu giderecek eğer çözülmez ise aşağıdaki komutu verebilirsiniz bu komut yüzde 100 olasılıkla çözecektir.tekrar düzenleyecek ve zorlayarak kurulum yapacak

```bash
    sudo dpkg --configure -a
    sudo apt-get -f install
```

bu komut ile hatanızı çözdüğünüzü varsayıyorum eğer gene çözülmez ise sorunu [tarafıma buradan](https://mertcangokgoz.com/soru-cevap) iletebilirsiniz...
