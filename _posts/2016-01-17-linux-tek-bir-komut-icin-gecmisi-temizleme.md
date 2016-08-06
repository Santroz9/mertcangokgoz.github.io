---
layout: post
title: Linux Tek Bir Komut için Geçmişi Temizleme
date: 2016-01-17 13:05:43.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Bash terminalde yazmış olduğunuz komut tek tek numaralandırılarak geçmiş tutulur.Bu geçmiş sistemde siz silene kadar tutulmaya devam eder belirli
---
**Bash** terminalde yazmış olduğunuz komutlar tek tek numaralandırılarak geçmiş tutulur.Bu geçmiş sistemde siz silene kadar tutulmaya devam eder belirli aralıklarla silinmesi güvenlik açısından önemlidir.Ancak hepsini silmek istemiyorsanız ve(veya)bazılarını seçip silmek istiyorsanız aşağıdaki yöntemi kullanabilirsiniz.

Geçmişte tutulan tüm komutları listelemek için;

    history

bu komutun bize çıktısı şu şekilde olacaktır.

![komuthistory](/assets/komuthistory.png)

Görmüş olduğunuz gibi sistemde daha önceden kullanmış olduğum komutların hepsi listelendi.Bunlardan belirlediklerin izi silmek isterseniz sol tarafında bulunan numaraları bir yere kayıt etmek yada o anlık aklınızda tutmanız gerekiyor daha sonrasında ise

    history -d kayıt numarası

Şeklinde silebilirsiniz örneğin yukarıdaki kayıtlardan **81** ve **82** numaralı kayıtları silmek için şu şekilde bir yol izlenebilir.

    history -d 81 && history -d 82

silinip silinmediğini tekrar aşağıdaki komutu vererek sıra numarasını takip ettiğinizde geçmişten silindiğini göreceksiniz.

    history

Tüm komut geçmişini temizlemek isterseniz yapacağınız işlem şu şekildedir.

    history -c

böylelikle sistem üzerinde tutulan tüm komut geçmişini temizlemiş olduk.Bash terminal geçmişinde tutulan komutları tek tek silebileceğiniz gibi toplu bir şekilde de silebilir daha sonradan kullanım için işinize yarayacak olanları bırakabilirsiniz.
