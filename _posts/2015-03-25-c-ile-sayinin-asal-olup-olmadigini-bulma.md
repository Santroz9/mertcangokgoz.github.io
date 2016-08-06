---
layout: post
title: C ile Sayının Asal Olup Olmadığını Bulma
date: 2015-03-25
type: post
categories: programlama
description: C programlama dilinde girilen sayının asal olup olmadığını modulus işlemi ile kolaylıkla bulabiliriz.Asal bulma işlemi için yazmış olduğum
---

C programlama dilinde girilen sayının asal olup olmadığını modulus işlemi ile kolaylıkla bulabiliriz.Asal bulma işlemi için yazmış olduğum kodu aşağıda bulabilirsiniz.

```c
{% raw %}
    #include<stdio.h>

    int main(void){
    	int x, b, a,asalbulan;
    	printf("Herhangi bir sayi giriniz n");
    	scanf("%d",&x);
    	for(asalbulan=2; asalbulan <= x- 1; asalbulan++){
    		b = x % asalbulan;
    		if(b==0){
    			a++;
    		}
    	}
    	if(a==0){
    		printf("Girdiginiz Sayi Asaldir");
    	}else{
    		printf("Girdiginiz Sayi Asal Degildir");
    	}
    	return 0
    }
{% endraw %}
```

Çıktı Örneği

![cilesayininasalligininkontrolu](/assets/cilesayininasalligininkontrolu.jpg)
