---
layout: post
title: Komut Satırı ile Sistem bilgisi almak
date: 2014-10-29 15:50:58.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Komut Satırı ile sistemin özelliklerini ekrana yazdırma gibi bi fantazimiz varmış gibi durmasın GUI sistemler kullanabilirsiniz ama komut satırı
---
Komut Satırı ile sistemin özelliklerini ekrana yazdırma gibi bi fantazimiz varmış gibi durmasın GUI sistemler kullanabilirsiniz ama komut satırı daha iyi diye düşünüyorum ve nasıl yapılır onuda burada anlatacağım yapacak bir şey yok ama güzel yanı tüm sistem bilgisi elinizde olacak misler gibi

1. Kernel Versiyonu
2. İşletim Sistemi adı
3. Host ismi
4. Ağ kart bilgileri
5. işlemci detayları
6. dosya sistem detayları
7. yapısal detaylar
8. BİOS bilgileri ve üretici hakkında bilgiler
9. satıcı bilgileri
10. CPU Mhz
11. Çekirdek sayısı ve detayları
12. HDD boyutu
13. Ram Boyutu
14. Takas alanı detayları
15. İP Adresi
16. MAC Adresi
17. SSH Anahtar bilgisi
18. Saat dilimi
19. Çalışma süresi
20. Sistem seri numarası
21. Sistemin fiziksel yada sanal olup olmadığı

Özellikle benim gibi aldığınız sistemden şüphe ediyorsanız ki Türkiye'deki tüm yer sağlayıcıların da bu şüphemizin olması lazım çünkü Dedicated diye bize&nbsp;VDS iteleyebilir bu kansızlar aman dikkat edin kurumsal firmalar dışında kesinlikle çalışmayın.

Kurmak için

    sudo su
    sudo apt-get install facter

Centos

    yum install facter

Komutumuzu verelim ben ubuntu komutu yaldır yaldır çıktısı ise ne olacak görelim

    sudo facter

centos

    facter

Çıktı olarak karşıma baya uzun birşey çıktı ki neyin ne olduğu anlaşılıyor.

    architecture => amd64
    bios_release_date => 07/31/2013
    bios_vendor => Phoenix Technologies LTD
    bios_version => 6.00
    blockdevice_fd0_size => 0
    blockdevice_sda_model => VMware Virtual S
    blockdevice_sda_size => 21474836480
    blockdevice_sda_vendor => VMware,
    blockdevice_sr0_model => VMware SATA CD00
    blockdevice_sr0_size => 1073741312
    blockdevice_sr0_vendor => NECVMWar
    blockdevice_sr1_model => VMware SATA CD01
    blockdevice_sr1_size => 1073741312
    blockdevice_sr1_vendor => NECVMWar
    blockdevices => fd0,sda,sr0,sr1
    boardmanufacturer => Intel Corporation
    boardproductname => 440BX Desktop Reference Platform
    boardserialnumber => None
    dhcp_servers => {"system"=>"192.168.221.254", "eth0"=>"192.168.221.254"}
    domain => localdomain
    facterversion => 2.1.0
    filesystems => ext2,ext3,ext4,vfat
    fqdn => ubuntu.localdomain
    hardwareisa => x86_64
    hardwaremodel => x86_64
    hostname => ubuntu
    id => root
    interfaces => eth0,lo
    ipaddress => 192.168.221.128
    ipaddress_eth0 => 192.168.221.128
    ipaddress_lo => 127.0.0.1
    is_virtual => true
    kernel => Linux
    kernelmajversion => 3.16
    kernelrelease => 3.16.0-23-generic
    kernelversion => 3.16.0
    lsbdistcodename => utopic
    lsbdistdescription => Ubuntu 14.10
    lsbdistid => Ubuntu
    lsbdistrelease => 14.10
    lsbmajdistrelease => 14
    macaddress => 00:0c:29:b7:67:22
    macaddress_eth0 => 00:0c:29:b7:67:22
    manufacturer => VMware, Inc.
    memoryfree => 3.37 GB
    memoryfree_mb => 3454.36
    memorysize => 3.85 GB
    memorysize_mb => 3945.77
    mtu_eth0 => 1500
    mtu_lo => 65536
    netmask => 255.255.255.0
    netmask_eth0 => 255.255.255.0
    netmask_lo => 255.0.0.0
    network_eth0 => 192.168.221.0
    network_lo => 127.0.0.0
    operatingsystem => Ubuntu
    operatingsystemrelease => 14.10
    osfamily => Debian
    partitions => {"sda1"=>{"uuid"=>"23eb4ae9-b0bb-4222-ae7c-8e1f6dbb64cc", "size"=>"33552384", "mount"=>"/", "filesystem"=>"ext4\" PARTUUID=\"000d2a36-01"}, "sda2"=>{"size"=>"2", "filesystem"=>"dos\" PARTUUID=\"000d2a36-02"}, "sda5"=>{"uuid"=>"e983f262-5106-4e1f-865e-1394f12299f9", "size"=>"8384512", "filesystem"=>"swap\" PARTUUID=\"000d2a36-05"}}
    path => /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    physicalprocessorcount => 1
    processor0 => Intel(R) Core(TM) i7-4700HQ CPU @ 2.40GHz
    processorcount => 1
    productname => VMware Virtual Platform
    ps => ps -ef
    rubysitedir => /usr/local/lib/site_ruby/2.1.0
    rubyversion => 2.1.2
    selinux => false
    serialnumber => VMware-56 4d 40 39 92 02 e1 94-a4 5b 15 1c 2f b7 67 23
    swapfree => 4.00 GB
    swapfree_mb => 4094.00
    swapsize => 4.00 GB
    swapsize_mb => 4094.00
    timezone => EET
    type => Other
    uniqueid => 007f0101
    uptime => 0:03 hours
    uptime_days => 0
    uptime_hours => 0
    uptime_seconds => 205
    uuid => 564D4039-9202-E194-A45B-151C2FB76723
    virtual => vmware

sanallaştırmamız **vmware** sanalda yaptık içim o yüzden rahat ama size **"fiziksel sunucu bu alın"** dediklerinde inanmıyorsanız bu programı kurun bakın bakalım gerçekten doğrumu söylüyorlar...
