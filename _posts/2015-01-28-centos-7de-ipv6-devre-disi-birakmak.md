---
layout: post
title: Centos 7'de IPv6 Devre dışı Bırakmak
date: 2015-01-28 13:41:09.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Centos 7 de ipv6 yı kullanmak istemiyorsanız yapmanız gerekenler çok basit ben ipv4 den alır yürür giderim diyorsanız devre dışı bırakabilirsiniz
---

**Centos 7** de **ipv6** yı kullanmak istemiyorsanız yapmanız gerekenler çok basit ben **ipv4** den alır yürür giderim diyorsanız devre dışı bırakabilirsiniz ben önermiyorum ama ceplik bilgi olarak elinizde bulunsun

Aşağıdaki komutları verelim

    echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
    echo 1 > /proc/sys/net/ipv6/conf/default/disable_ipv6

Bu komutlar ile IPv6 kapanmış olacak olurda bi sorun çıkarsa

    nano /etc/ssh/sshd_config

"AddressFamily"buluyorsunuz sonra aşağıdaki gibi değiştiriyorsunuz

    AddressFamily inet

yada başındaki # kaldırıyoruz ve aşağıdaki gibi yapıyoruz

    ListenAddress 0.0.0.0

ayarların etkin olması için

    systemctl restart sshd
