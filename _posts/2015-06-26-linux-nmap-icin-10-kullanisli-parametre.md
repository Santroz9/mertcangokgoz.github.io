---
layout: post
title: Linux Nmap için 10 Kullanışlı Parametre
date: 2015-06-26 13:29:39.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Nmap hangi hostların ve servislerin çalıştığını belirlemekte kullanılan bir araçtır.Nmap aracılığı ile sistemde hangi servisin hangi hostda
---

**Nmap** hangi hostların ve servislerin çalıştığını belirlemekte kullanılan bir araçtır. **Nmap** aracılığı ile sistemde hangi servisin hangi hostda çalıştığını bulabilir ve buna göre bir saldırıda bulunabilir. **Nmap** Ağ haritası çıkartırken çok işe yarıyor hangisi ana host hangisi bunun yancısı yada bir siteye güvenlik taraması yapacaksınız ama izleyeceğiniz yolu bilmiyorsunuz işte bu noktada işinize yarayabilir.

Nmap ile neler bulunabilir.

- Host üzerinde çalışan tüm servislerin bulunması
- Host kullandığı işletim sistemi ve kernel numarası
- Hostda açık olan tüm portlar
- Taranan kaynak İP üzerinde bulunan diğer herşey

# Peki nasıl kurulur bu Nmap ?

    sudo apt-get install nmap

Kurulumumuz tamamlandı gelelim parametrelere oldukça kullanışlı 10 adet parametreyi sizin için derledim;

## 1.Alt Ağ'da Arama Yapmak

Tanımladığınız aralıkdaki tüm ipleri kontrol eder, ping atar ve gelen yanıta göre host varmı yokmu size bilgi verir.

    nmap -sP 23.101.0.0/24

## 2.Açık Portların Bulunması

1000 den fazla porta istek göndererek gelen yanıta göre portun açık olup olmadığı hakkında size bilgi verir.Ön tanımlı kullanım şeklidir.Sadece **TCP** portlarını çözümler.

    nmap 23.101.0.0/24

## 3.Ana Bilgisayar Adının Çözümlenmesi

Tanımlanan aralık içerisindeki tüm hostların ana bilgisayar adını çözümlemeye imkan tanır.

    nmap -sL 23.101.0.0/24

## 4.TCP ve UDP Portlarının Taranması

2000 yakın **TCP** ve **UDP** portlarını tarar ve açık olanlarını size bildirir.

    nmap -sS -sU -PN 23.101.42.175

## 5.Tüm Portların Taranması

1 den 65535 kadar olan tüm portları tarar ve size bildirir. **TCP** ve **UDP** karışık bir şekilde taramayı gerçekleştirmektedir.

    nmap -sS -sU -PN -p 1-65535 23.101.42.175

## 6.TCP Portlarının taranması

Sadece **TCP** de çalışan açık portları ve kullandığı servisleri size bildirir.

    nmap -sT 23.101.42.175

## 7.Süper Hızlı Tarama

Hızlı bir şekilde sık kullanılan 100 portu tarar ve size kullandığı servisleri de dahil ederek bildirir.

    nmap -T4 -F 23.101.42.175

## 8.Agresif Tarama

Hızlı taramanın aksine aşırı şekilde yavaştır ve rahatsız edici bir şekilde tarama yapar güvenlik duvarına takılma riskiniz yüksektir.

    nmap -T4 -A 23.101.42.175

## 9.Ayrıntılı Tarama

Benim en nefret ettiğim ama kimi zaman kullandığım bir parametre aşırı şekilde detaylı bir tarama gerçekleştirir.Nınısının nınısını yazar boş beleş gereksiz ne varsa görebilirsiniz ama işinize yarar şeyler çıkabilir.Firewall Takılma riskiniz yüksektir.

    nmap -T4 -A -v 23.101.42.175

## 10.İşletim Sistemi Taraması

Sistemde hangi işletim sistemi kullanılıyor ve bu kullanılan işletim sistemindeki kernel sürümü ney işte bu sorularınızın cevabını bu parametre ile bulabilirsiniz.

    nmap -O 23.101.42.175

**Nmap** hakkında bilmeniz gereken 10 hayati parametreyi sizler için açıklama fırsatı bulduk.Unuttuğumuz yada ben şu işlemi yapacaktım ama bu makalede bulamadığım dediğiniz konuyu yorum şeklinde yazabilirsiniz.
