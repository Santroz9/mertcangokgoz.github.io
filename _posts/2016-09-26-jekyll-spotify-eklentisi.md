---
layout: post
title:  Jekyll Spotify Eklentisi
date: 2016-09-26
type: post
categories: jekyll
description: Jekyll için bir süredir kafamda bir eklenti vardı spotify için hiç kimse birşeyler yapmamıştı gördüklerim de çok teferruatlı olduğu için en basit şekilde nasıl yaparıza kafa yordum ve aşağıdaki gibi bir eklenti
---

Jekyll için bir süredir kafamda bir eklenti vardı spotify için hiç kimse birşeyler yapmamıştı gördüklerim de çok teferruatlı olduğu için en basit şekilde nasıl yaparıza kafa yordum ve aşağıdaki gibi bir eklenti ortaya çıkıverdi kullanımı oldukça basit olan bu eklenti ile istediğiniz gibi spotify linklerinizi dinlenebilir bir hale sokabilirsiniz sırf bunu yaparak bile blog açabilirsiniz mesela

Herneyse direk olarak aşağıdaki dosyayı `_plugins` klasörüne atım içerisindeki kullanım talimatlarına göre kullanabilirsiniz.

{% gist MertcanGokgoz/16dfcee705979f0bb91c5f0df0eb8ccf %}

Aynı zamanda direk rubygem den sisteme dahil ederekte kullanma imkanınız bulunuyor.

Gemfile içerisine aşağıdaki satırı ekliyorsunuz

```ruby
gem 'jekyll-spotify'
```

ardından `bundle` yada `bundle install` komutu aracılığı ile sisteme dahil ediyorsunuz. En olmadı aşağıdaki kodu çalıştırarakta bu işlemi yapabilirsiniz.

```ruby
gem install jekyll-spotify
```

`_config.yml` dosyasına ise aşağıdaki satırı eklemeyi unutmuyorsunuz.

```ruby
gems: [jekyll-spotify]
```

öptüm bye <3
