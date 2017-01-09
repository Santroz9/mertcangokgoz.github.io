---
layout: post
title: Windows'da MBR nasıl düzeltilir
date: 2017-01-09
type: post
categories: windows
description: Windows 10'u başarıyla kurmuştum linux kurarken bölümlendirme aşamasında bir bölümü yanlışlıkla sildim ve açılışta bir GRUB
---

Windows 10'u başarıyla kurmuştum linux kurarken bölümlendirme aşamasında bir bölümü yanlışlıkla sildim ve açılışta bir GRUB kurtarma ekranına düştüm. yapmaya çalıştığım şey ise Windows 10 önyükleme yapmak için Ana Önyükleme Kaydını sorunsuz bir şekilde oluşturmaktı ve bunu sorunlu bir şekilde yapmış oldum...

Bu sorunu çözmem lazımdı haliyle, tabi sistem benim değil arkadaşımındı ve ben hata yaparak bölümün tekini silmiş ve sistemin içine etmiştim. Ama sorun değildi çözümü ufak bir araştırma ile buldum.

* İlk önce Windows 10 için gereken bir kurtarma USB'si oluşturdum bunu yaparken unetbooting kullandım ISO kalıbını [bu siteden](https://www.microsoft.com/en-us/software-download/windows10ISO) indirdim MS in resmi sayfasıdır kendileri
* Bu USB ile önyükleme işlemini başarılı bir şekilde yaptıktan sonra, Sorun Giderme -> Gelişmiş Seçenekler -> Komut istemini seçtim(Troubleshoot -> Advanced Options -> Command Prompt)

Ardından hiç bir şey olmamış gibi siyah ekranı önüme koydu bende ufak bi araştırma yapmıştım aşağıdaki komutlara ulaştım ve sırasıyla girdim

```
bootrec /rebuildbcd
bootrec /fixmbr
bootrec /fixboot
```

Bu komutlar sayesinde mbr yi düzeltip boot kayıtlarını tekrar yapılandırmasını sağladım. Bir kaç dakika sonra işlem tamamlandı `exit` diyerek çıkışımı yaptım ve sistemi yeniden başlattım

Ardından hiç birşey olmamış gibi Windows 10 karşımıza geldi
