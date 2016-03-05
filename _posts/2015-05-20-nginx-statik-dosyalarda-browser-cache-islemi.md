---
layout: post
title: Nginx Statik Dosyalar'da Browser Cache İşlemi
date: 2015-05-20 15:26:44.000000000 +03:00
type: post
published: true
status: publish
categories: Nginx
description: Sitenizi Nginx alt yapısına taşıdıysanız apacheden kalma browser cache özelliklerinin hiç birini kullanamazsınız ancak nginx bunu yapmak
---

Sitenizi **Nginx** alt yapısına taşıdıysanız apacheden kalma **browser cache** özelliklerinin hiç birini kullanamazsınız ancak nginx bunu yapmak için size bir kolaylık sunar aslında hemen sitenizin ayar dosyasına ulaşın genelde yolu **/etc/nginx/sites-aveilable** gibi bişeydir buradan komutlar ile dosyayı açın ve **server blockları** içerisine aşağıdaki komutları yapıştırıp kayıt edin

    location ~* \.(3gp|gif|jpg|jpeg|png|ico|wmv|avi|asf|asx|mpg|mpeg|mp4|pls|mp3|mid|wav|swf|flv|exe|zip|tar|rar|gz|tgz|bz2|uha|7z|doc|docx|xls|xlsx|pdf|iso)$ {
    		gzip_static off;
    		#add_header Pragma public;
    		add_header Cache-Control "public, must-revalidate, proxy-revalidate";
    		access_log off;
    		expires 30d;
    		break;
    	}

        	location ~* \.(js)$ {
    		#add_header Pragma public;
    		add_header Cache-Control "public, must-revalidate, proxy-revalidate";
    		access_log off;
    		expires 30d;
    		break;
            }

        	location ~* \.(css)$ {
    		#add_header Pragma public;
    		add_header Cache-Control "public, must-revalidate, proxy-revalidate";
    		access_log off;
    		expires 30d;
    		break;
            }

        	location ~* \.(html|htm|txt)$ {
    		#add_header Pragma public;
    		add_header Cache-Control "public, must-revalidate, proxy-revalidate";
    		access_log off;
    		expires 1d;
    		break;
            }

        	location ~* \.(eot|svg|ttf|woff)$ {
    		#add_header Pragma public;
    		add_header Cache-Control "public, must-revalidate, proxy-revalidate";
    		access_log off;
    		expires 30d;
    		break;
            }

Sonrasında Nginx servisini yeniden başlattığınızda artık statik dosyalarınız tarayıcı tarafından cache edilecek ve gerek pagespeed gerekse gtmatrix gibi sitelerde hata almayacaksınız.
