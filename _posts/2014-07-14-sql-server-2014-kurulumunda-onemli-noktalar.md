---
layout: post
title: SQL Server 2014 Önemli Kurulum Bilgileri
date: 2014-07-14 15:42:50.000000000 +03:00
type: post
published: true
status: publish
categories: Programlama
description: Dün bildiğiniz üzere kurulumun nasıl yapıldığını anlatmıştık bugün ise SQL Server 2014 üzerinde yapılacak olan bazı işlemler ile önemli
---

[SQL Server 2014 kurulumun](https://mertcangokgoz.com/windows-sql-server-2014-kurulumu/) nasıl yapıldığını anlatmıştık bugün ise **SQL**  **Server**  **2014** üzerinde yapılacak olan bazı işlemler ile önemli olan noktalara değinmek istiyorum.

# Named instance

Kurulumda bu kısmı bildiğiniz gibi değiştirmemiş ve **MSSQLSERVER** olarak bırakmıştık bunun dışında kendimizde bir isim belirleyebiliriz.Böylelikle kurulumda kullanmış olduğumuz instance sistem tarafından kullanılacaktır.

**SQL** Server da bunun dışında birden fazla instance kurmak mümkündür. Böylece yapılan bir program default instance üzerinde çalışırken yazmış olduğunuz herhangi bir otomasyon programı da belirlediğiniz ikinci instance noktasından çalışmaya başlayacaktır.

# Server Configuration

Bildiğiniz gibi anlatımımızda burayı direk olarak hızlı bir şekilde geçmiştik ancak veritabanımızda Türkçe karakter ve genel olarak kullanacağımız dili bu sekmede iken belirtmelisiniz.

![SQLServer2014OnemliYerler1](/assets/SQLServer2014OnemliYerler1-e1405341501749-762x576.png)

Yukarıdaki görmüş olduğunuz **Turkish\_CI\_AS** seçili olmak zorundadır ikisinde birden sonrasında ise **custom** diyerek ayarları aşağıdaki gibi yapıyoruz.

![SQLServer2014OnemliYerler2](/assets/SQLServer2014OnemliYerler2.png)

Bu sayede sistemde birden çok **SQL** işlemi yapabilir ve Türkçe karakter sorunlarını bu sayede çözebilirsiniz.
