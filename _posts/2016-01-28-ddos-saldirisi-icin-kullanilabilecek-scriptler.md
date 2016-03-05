---
layout: post
title: Ddos Saldırısı İçin Kullanılabilecek Scriptler
date: 2016-01-28 15:12:36.000000000 +02:00
type: post
categories: Güvenlik
description: Vakti zamanında kullanmış olduğum ve halen çalışmakta olan Ddos kaynak kodlarını artık paylaşma zamanın geldiğini düşünmekteyim.C dili ile yazıldığı
---

Vakti zamanında kullanmış olduğum ve halen çalışmakta olan **Ddos** &nbsp;kaynak kodlarını artık paylaşma zamanın geldiğini düşünmekteyim. **C** dili ile yazıldığı için oldukça etkili ve bir o kadarda hızlıdır.Lakin kodlar **booter** sistemlerine yazıldığı için sürelidir sınırsız bir şekilde kullanamazsınız.

**Ddos** için kullanılacak olan tüm kaynak kodları&nbsp;derlemek için aşağıdaki adımları izlemeniz gerekmektedir.

    sudo apt-get update
    sudo apt-get install gcc
    sudo gcc betikadi.c -pthread -o betikadi

Derleme işlemi sırasında bağımlılıklardan dolayı uyarı mesajları verebilir.Bu durumda bir sıkıntı olmayacağı gibi kodlar&nbsp;sorunsuz bir şekilde çalışacaktır.Bazı betikler **reflection.txt** dosyası istemektedir.

Kullanabileceğiniz kaynak kodları

- [Chargen](https://gist.github.com/MertcanGokgoz/5b6d65c5361a53053cdd)
- [Dominate](https://gist.github.com/MertcanGokgoz/9624753faf3a63718602)
- [Heatbeat](https://gist.github.com/MertcanGokgoz/5ff0b0e87ac6754025a0)
- [mDNS](https://gist.github.com/MertcanGokgoz/a4fb0e6e7870278e4a50)
- [Netbios](https://gist.github.com/MertcanGokgoz/88b32b6529014e9a0929)
- [TriGemini Multi Attack](https://gist.github.com/MertcanGokgoz/c6cf6923fa3cb79945be)
- [TeamSpeak 3](https://gist.github.com/MertcanGokgoz/e188d800ba73096c6cd3)
- [Quake 3 Attack](https://gist.github.com/MertcanGokgoz/ff4ece88c299d186dbfd)
- [Improve SSYN](https://gist.github.com/MertcanGokgoz/b76cedb0945ca0b038e7)
- [STCP](https://gist.github.com/MertcanGokgoz/a79bcd7ecca47e53b7b4)
- [SSDP](https://gist.github.com/MertcanGokgoz/2649b8ef07354c97d81e)
- [SYN](https://gist.github.com/MertcanGokgoz/21231aac9c095694f45a)
- [UDP](https://gist.github.com/MertcanGokgoz/f707de3310e5447078a2)
- [50X](https://gist.github.com/MertcanGokgoz/52b6c6b0d3a1cd2d4e02)
- [ARME](https://gist.github.com/MertcanGokgoz/3c7395dfa05f8a6bc7b2)
- [RUDY](https://gist.github.com/MertcanGokgoz/acb8d110ad173f40cf9d)
- [SLOWLORIS](https://gist.github.com/MertcanGokgoz/f87c176d0647071169cb)
- [TCP](https://gist.github.com/MertcanGokgoz/28104abc89386134df2b)
- [SSYN2](https://gist.github.com/MertcanGokgoz/e8e66d50f02fb54ac1d8)
- [SUDP](https://gist.github.com/MertcanGokgoz/1db5c603301088c9525f)
- [SUDP2](https://gist.github.com/MertcanGokgoz/6e42cd29ed1c19da4415)
- [UDP2](https://gist.github.com/MertcanGokgoz/e05b9729125bfcda13f0)

Bu Kaynak kodlarından doğa bilecek her türlü sistemsel ve (veya) yasal sorunlardan kodları&nbsp;kullanan kişiler **sorumludur**.
