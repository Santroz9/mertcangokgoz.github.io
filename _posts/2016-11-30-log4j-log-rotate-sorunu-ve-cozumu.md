---
layout: post
title: Log4j Rotate Sorununu Çözme
date: 2016-11-30
type: post
categories: linux
description: log4j de bir sorun olduğu ve uygulama loglarının rotate olmayıp sistemi şişirdiğini ve sorunlara neden olduğu yazıyordu
---

Yazın Staj yaparken iş kayıtlarıma log4j de bir sorun olduğu ve uygulama loglarının rotate olmayıp sistemi şişirdiğini ve sorunlara neden olduğu yazıyordu. Kolay bir şekilde çözebileceğimizi düşündüm ancak işin içinde java olduğu için xml vs uğraşmak zorunda kaldım biraz yeni gördüğüm bir uygulama olduğu içinde her ne kadar zorlansamda aşağıdaki şekilde sorunu çözmeyi başardım.

```
log4j.rootLogger=INFO, loggerId
log4j.appender.loggerId=org.apache.log4j.rolling.RollingFileAppender
log4j.appender.loggerId.rollingPolicy=org.apache.log4j.rolling.TimeBasedRollingPolicy
log4j.appender.loggerId.rollingPolicy.ActiveFileName=worker.log
log4j.appender.loggerId.rollingPolicy.FileNamePattern=worker-.%d{yyyyMMdd}.log.gz
log4j.appender.loggerId.layout=org.apache.log4j.PatternLayout
log4j.appender.loggerId.layout.ConversionPattern=%d [%t] %-5p (%F:%L) - %m%n
```

 Log kurallarına yukarıda ki satırları ekliyorsunuz servisleri yeniden başlattığınızda ise sorun çözülmüş oluyor tabi günlük rolling yapılacağı için olup olmadığını anlama konusunda beklemeniz gerekiyor.
