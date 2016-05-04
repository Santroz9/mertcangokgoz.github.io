---
layout: post
title: C ile Decimal'den Binary Dönüştürme İşlemi
date: 2015-06-09
type: post
categories: Programlama
description: C ile Ondalık sayıları ikilik sayı sistemine yani bilgisayarın anlayabildiği bir biçime dönüştürmek istiyorsanız.Aşağıdaki
---

C ile Ondalık sayıları ikilik sayı sistemine yani bilgisayarın anlayabildiği bir biçime dönüştürmek istiyorsanız.Aşağıdaki kod örneğini kullanabilirsiniz.Uygulama size girmiş olduğunuz ondalık sayının ikilik sayı sistemindeki halini yazacaktır.

```c
{% raw %}
    #include<stdio.h>

    int main(){
    	long int decimalNumber,remainder,quotient;
    	int binaryNumber[100],i=1,j;

    	printf("Ondalik Sayi Giriniz: ");
    	scanf("%ld",&decimalNumber);

    	quotient = decimalNumber;
    	while(quotient!=0){
    		binaryNumber[i++]= quotient % 2;
    		quotient = quotient / 2;
    	}

    	printf("Ondalik Sayinin ikiliye Donusturulmus Hali %d: ",decimalNumber);
    	for(j = i -1 ;j> 0;j--)
    		printf("%d",binaryNumber[j]);

    	return 0;
    }
{% endraw %}
```
