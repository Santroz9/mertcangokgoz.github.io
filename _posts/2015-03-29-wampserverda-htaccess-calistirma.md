---
layout: post
title: WampServer’da .htaccess Çalıştırma
date: 2015-03-29 14:14:27.000000000 +03:00
type: post
published: true
status: publish
categories: windows
description: Localde çalışmalar yaparken .htaccess kullanmak isteyebilirsiniz.Yaptığınız bir eklenti olabilir yada kurduğunuz bir wordpress olabilir nasıl göründüğünü
---
Localde çalışmalar yaparken . **htaccess** kullanmak isteyebilirsiniz.Yaptığınız bir eklenti olabilir yada kurduğunuz bir **wordpress** olabilir nasıl göründüğünü localde görmek ve çalışmanızın nasıl gittiğini anlamak istiyorda olabilirsiniz bunu yapmak için wampserver kullanıyorsanız yapmanız gerekenler oldukça basit. **WampServerın** saatin yanında bulunan tray simgesine tıklıyorsunuz karşınıza bir takım ayarlar çıkıcak buradan **Apache \> Apache Modülleri** yolunu takip ediyorsunuz.

![wampservertrayicons](/assets/wampservertrayicons.png)

Buraya geldiğinizde karşınıza pek çok modül çıkıcak aşağı doğru ilerlediğinizde ise **rewrite\_module** görüceksiniz bu seçeneğe tıklayın daha sonra **WampServer** yeniden başlatın.Böylelikle artık . **htaccess** dosyaları sisteminizde çalışır hale gelecek

![wampserverhtaccesscalistirma](/assets/wampserverhtaccesscalistirma.png)
