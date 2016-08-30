---
layout: post
title: Toggl Masaüstü Uygulaması Bağımlılık Sorunu
date: 2016-08-30
type: post
categories: linux
description: Toggl proje yönetimin temel yapıtaşlarından biri olan zaman yönetimi konusunda geliştirilmiş bir uygulamadır. Bir işte ne kadar süre geçirdiğinizi bu uygulama ile kolaylıkla
---

Toggl proje yönetimin temel yapıtaşlarından biri olan zaman yönetimi konusunda geliştirilmiş bir uygulamadır. Bir işte ne kadar süre geçirdiğinizi bu uygulama ile kolaylıkla öğrenebilirsiniz. Sadece web üzerinden yayın yapmıyor toggl aynı zamanda masaüstü uygulamaları ilede destek sağlıyor.

Toggl masaüstü sürümlerine ulaşmak için [Tıklayın](https://support.toggl.com/toggl-on-my-desktop/) Linux için olan `.deb` uzantılı olan paketi indiriyorsunuz. Sisteminiz Debian tabanlı bir sistem değilse kaynaktan derleyebilirsiniz.

Ardından uygulamayı açtığınızda aşağıdaki saçma bir hatayı verecek bu uygulamayı yapan arkadaşlar paketi oluştururken hangi akılla bağımlılığı eklemediklerini bi sorguladım

```console
error while loading shared libraries: libgstapp-0.10.so.0: cannot open shared object file: No such file or directory
```

Tabi bu sorunun çözümü bir kaç geliştirici paket kurmak ve libgstreamer kurmaktan geçiyor. Uygulamayı paketleyen arkadaş umarım bir sonraki sürümde bunu paketlerine eklemeyi unutmazlar.

```console
sudo apt-get install -y xorg-dev qtcreator libxss-dev libqt5webkit5-dev libgstreamer0.10-0 libgstreamer-plugins-base0.10-0
```

Öptüm bye <3
