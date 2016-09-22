---
layout: post
title: Virtualbox Kernel Driver Sorunu 
date: 2016-09-22
type: post
categories: linux
description: Genelde EFI olarak BIOS kullanan kişilerin sistemlerinde gözükebilen kimi zamanda hatalı kurulumdan dolayı virtualbox uygulamasını
---

Genelde EFI olarak BIOS kullanan kişilerin sistemlerinde gözükebilen kimi zamanda hatalı kurulumdan dolayı `virtualbox` uygulamasını başlatırken hatalar ile karşılaşabilirsiniz genellikle en çok olan hata aşağıdaki gibidir.

```
Kernel driver not installed (rc=-1908)  The VirtualBox Linux kernel driver (vboxdrv) is either not loaded or there is a permission problem with /dev/vboxdrv. Please reinstall the kernel module by executing

'/etc/init.d/vboxdrv setup'  

as root. If it is available in your distribution, you should install the DKMS package first. This package keeps track of Linux kernel changes and recompiles the vboxdrv kernel module if necessary.
```

Tabi bahsedilen bu çözümü yapsanızda çözülmeyecek çünkü `init.d` içerisinde `vboxdrv` diye bir şey bulunmuyor.

Çünkü yeni sürüm virtualbox da şu şekilde bir hata mesajı döndürecek

```
The VirtualBox Linux kernel driver (vboxdrv) is either not loaded or
there is a permission problem with /dev/vboxdrv. Please install
virtualbox-dkms package and load the kernel module by executing

'modprobe vboxdrv'

as root. If it is available in your distribution, you should install
the DKMS package first. This package keeps track of Linux kernel
changes and recompiles the vboxdrv kernel module if necessary.

where: suplibOsInit what: 3 VERR_VM_DRIVER_NOT_INSTALLED (-1908) - The
support driver is not installed. On linux, open returned ENOENT.
```

haliylede otomatik olarak bu işlemi yerine getirebileceksiniz çünkü bu sefer uygulama çalışacak ancak biz genede işlemlerimizi garantiye almak için şu şekilde bir yol izleyeceğiz

```
sudo dpkg-reconfigure virtualbox-dkms
sudo dpkg-reconfigure virtualbox
sudo modprobe vboxdrv
```

Bunları yaptıktan sonra `modprobe vboxdrv` aşamasını hata vermeden geçerseniz işleminiz tamam demektir. BIOS olarak EFI kullanılıyorsa tekrardan sıkıntı çıkacak bunuda çözmek için BIOS ayarlarınıza geliyorsunuz ve ` Secure Boot` seçeneğini kapatıyorsunuz.

Tekrardan `modprobe vboxdrv` komutu veriyoruz ve sorunsuz bir şekilde tamamlanıyor. Bu aşamadan sonra doyasıya sanal makine açabilirsiniz.

Her şeyin başı bu EFI BIOS olduğu için her zaman dediğim gibi kullanmanızı önermiyorum.

öptüm bye <3
