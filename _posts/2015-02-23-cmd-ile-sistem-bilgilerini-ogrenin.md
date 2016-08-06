---
layout: post
title: CMD ile Sistem bilgilerini öğrenin
date: 2015-02-23 14:39:00.000000000 +02:00
type: post
published: true
status: publish
categories: windows
description: "İlk kez windows bir sistemde komut satırı ile bilgi edinmenin bu kadar kolay olduğunu öğrendim ve yazmak istedim çünkü hiçbir program kurmadan"
---
İlk kez **windows** bir sistemde komut satırı ile bilgi edinmenin bu kadar kolay olduğunu öğrendim ve yazmak istedim çünkü hiçbir program kurmadan komutlarla anakart bilgisini öğrenebiliyorsunuz.Mesela sürücüleri kuracaksanız yada güncellemek istiyorsanız işinize oldukça yarayacak.

Peki hangi konularda bilgi alabilirsiniz.

- Manufacturer
- Model
- Name
- PartNumber
- Slotlayout
- Serialnumber
- Poweredon

Gibi bilgileri cmd aracılığı ile sorgulayabilir ve sisteminizin bilgilerine kolaylıkla ulaşabilirsiniz.

Kullanmak için ise **Windows Tuşu + R** kombinasyonu ile çalıştır kısmına "cmd" yazıp açılan terminalde yukarıdaki komutlardan bir veya birden çoğunu **WMİC** kullanarak yazdırmak

![windowsanakartbilgisiprogramsiz](/assets/windowsanakartbilgisiprogramsiz.png)

Kullandığımız komut ise

    wmic baseboard get product,Manufacturer,version,serialnumber

Komut satırı dışında bilgileri almak için yardımcı programlar kurabilirsiniz.
