---
layout: post
title:  Debian Tabanlı Sistemler İçin Spotify Kurulum
date: 2016-08-11
type: post
categories: linux
description:  Spotify'ın Linux üzerine özellikle debian tabanlı sistemlere oldukça kolay bir şekilde kurulabiliyor ancak bunu yapamayan yada üşenen
---

Spotify'ın Linux üzerine özellikle debian tabanlı sistemlere oldukça kolay bir şekilde kurulabiliyor ancak bunu yapamayan yada üşenen arkadaşlar için bende tatilde can sıkıntısı üzerine şöyle bir bash script hazırladım herşeyi kendi yapıyor.

Size de kullanıcı adınızı ve şifrenizi girerek müzik dinlemek kalıyor. Kurulum internet hızınıza göre bir kaç dakika alacaktır. Sabırlı olun

Kurulumu şu şekilde yapabilirsiniz.

```console
cd ~ && wget https://git.io/InstallSpotify -O InstallSpotify.sh
chmod +x InstallSpotify.sh
./InstallSpotify.sh
```

Kullandığımız Bash Scriptimizin içeriği ise şu şekilde

{% gist MertcanGokgoz/8f94fc1fcb7faccdfc25bd301cbb0370 %}
