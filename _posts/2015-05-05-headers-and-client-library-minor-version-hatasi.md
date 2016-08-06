---
layout: post
title: Headers and client library minor version Hatası
date: 2015-05-05 15:12:06.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: MariaDB kurdunuz herşey güzel giderken yedek almak istediniz ve karşınıza şunun gibi bir hata çıktıysa ki php tabanlı yedek alma uygulamalarında
---
**MariaDB** kurdunuz herşey güzel giderken yedek almak istediniz ve karşınıza şunun gibi bir hata çıktıysa ki **php tabanlı yedek alma uygulamalarında sıkça gözüken bir durumdur**.Aşağıdaki adımı uygulayarak çözüme kavuşturabilirsiniz sorununuzu öncelikle **SSH** yardımı ile giriş yapıyorsuz sisteme sonrasında hatamıza bir bakıyoruz kütüphane hatası eksik birşeyler var diyoruz ve hemen **google** başına geçiyoruz arama yapıyoruz 4 farklı sonuç çıkacak ancak

    WARNING: mysqli::real_connect(): Headers and client library minor version mismatch. Headers:50541 Library:100017

ancak sorunu çözen yöntemimiz ise oldukça kısa olucak buna bende şaşırdım ilk başlarda ama yapacak birşey yoktu **mysql driver kurmayı unutmuşuz** ve kurduğumuzda sorunumuz gidiyor.

Öncelikle php sürümüne bakalım **APİ** sürümü önemli bizim için çünkü bu php tabanlı pek çok uygulama güncel sürüm istiyor ben kurduğumda sistemde

    Client API header version => 5.1.45

Aslında **PHP** sürümümüz 5 ama **APİ** sürümü saçmalamış gelelim yapılacaklara diğer sistemlerde denemedim ama ubuntu tabanlı sisteminiz varsa ve siteniz bunda kurulu ise yada herhangi bir veritabanı işlemi yapıyorsanız aşağıdaki kurulum ile sorunu çözebilirsiniz.

    sudo apt-get install build-essential
    sudo apt-get install php5-mysqlnd

Burada MariaDB nin mysqlnd sürücülerini kurmuş oluyoruz ve sorunu kökten çözmüş oluyoruz. **Kurulu olmaz ise bu şekilde bir uyarıda bulunacaktır işlemleriniz yarıda kesilebilir.**
