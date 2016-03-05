---
layout: post
title: "“ImportError: No module named _tkinter”"
date: 2014-07-28 14:38:13.000000000 +03:00
type: post
published: true
status: publish
categories: Programlama
description: Merhaba arkadaşlar python hakkında bir kaç yazı çizi bişiler ve eğitim niteliğinde şeyler paylaşacağım ancak bundan önce oluşabilecek sorunları
---
Merhaba arkadaşlar python hakkında bir kaç yazı çizi bişiler ve eğitim niteliğinde şeyler paylaşacağım ancak bundan önce oluşabilecek sorunları gidermemiz gerektiğide ayrı bir olay sonra öğrenirken bu hataya değinmek pek hoş olmayacak hemen öğrenelimde sonrasında sıkıntı çıkmasın bu sorunda belirli bir kütüphane eklemek istersen çıkıyor. hatamız

![importerrornomodulehatasi](/assets/importerrornomodulehatasi.png)

Hatada görmüş olduğunuz gibi ne yapacağımızı belirtiyor bize aslında...

> ImportError: No module named \_tkinter, please install the python-tk package

bu hatayı gidermek için ise bize belirttiği paketi sisteme kuruyoruz böylelikle artık turtle yi import ederken sıkıntı çekmiyoruz ve hata almıyoruz.

    sudo apt-get install python-tk

![importerrornomodulehatasi2](/assets/importerrornomodulehatasi2.png)Böylelikle sorunumuzu ortadan kaldırdık turtle kullanırmıyız bilmem ama hatasından kurtulalımda kullanırsak bize musallat olmasın...
