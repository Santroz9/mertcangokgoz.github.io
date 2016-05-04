---
layout: post
title: C ile String İfadeleri Karşılaştırma
date: 2015-05-14
type: post
categories: Programlama
description: Bu kodumuz ile C üzerine kullanıcıdan alınan 50 karakter uzunluğundaki bir string ifadeyi karşılaştırıyoruz.Eğer
---

Bu kodumuz ile C üzerine kullanıcıdan alınan 50 karakter uzunluğundaki bir string ifadeyi karşılaştırıyoruz.Eğer bir birlerine eşit olurlarsa ekrana Cümleler Eşittir yazdırıyoruz.Değilse Cümleler Bir birlerine eşit değildir olarak yazdırıyoruz.

Örnek Kod

```c
{% raw %}
    #include <stdio.h>
    #include <string.h>

    int main()
    {
    	char a[50], b[50];

    	printf("Birinci Cumleyi Yaziniz\n");
    	gets(a);

    	printf("Ikinci Cumleyi Yaziniz\n");
    	gets(b);

    	if( strcmp(a,b) == 0 )
    		printf("Cumleler Esittir\n");
    	else
    		printf("Cumleler Esit Degildir\n");

    	return 0;
    }
{% endraw %}
```
