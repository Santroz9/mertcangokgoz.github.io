---
layout: post
title: 1Gb Sunucular için Mysql Optimizasyonu
date: 2014-08-02 23:23:24.000000000 +03:00
type: post
published: true
status: publish
categories: programlama
description: 1GB sunucunuz yada VPS iniz varsa ve sitenizi yayına sokmak istiyorsunuz ve mysqliniz sıkıntı çıkartıyor çöküyor,kitleniyor,şişiyor ve sorunlar
---
1GB sunucunuz yada VPS iniz varsa ve sitenizi yayına sokmak istiyorsunuz ve mysqliniz sıkıntı çıkartıyor çöküyor,kitleniyor,şişiyor ve sorunlar yaşatmaya başladıysa size bu vereceğim ayarlar bir nebze olsun rahatlatmaya yarayacaktır.Ayrıca mysql tarafından sistem kaynaklarınızın daha efektif bir şekilde çalışmasınada olanak sağlayacaktır.

Öncelikle eski my.cnf dosyasının bir yedeğini alın ne olur ne olmaz diye bunun için

    cp /etc/my.cnf /etc/my.cnf.old

bu sayede eski configlerinizi silmemiş olacaksınız sorun çıkarsa ismini my.cnf olarak değiştirmeniz yeterli olacaktır.

editleme işini yaparken istediğiniz editörü kullanabilirsiniz pico,vim,nano seçin birisini ben nano kullanacağım

    nano /etc/my.cnf

nano editör sisteminizde kurulu değilse aşağıdaki komut ile kolaylıkla kurabilirsiniz.

    yum install nano

İçerisini temizledikten hemen sonra aşağıdaki satırları ekliyoruz.

    [mysqld]
    max_connections = 200
    key_buffer = 32M
    myisam_sort_buffer_size = 32M
    join_buffer_size = 1M
    read_buffer_size = 1M
    sort_buffer_size = 2M
    table_cache = 1024
    thread_cache_size = 286
    interactive_timeout = 25
    wait_timeout = 1000
    connect_timeout = 10
    max_allowed_packet = 16M
    max_connect_errors = 10
    query_cache_limit = 1M
    query_cache_size = 16M
    query_cache_type = 1
    tmp_table_size = 16M


    [mysqld_safe]
    open_files_limit = 8192

    [mysqldump]
    quick
    max_allowed_packet = 16M

    [myisamchk]
    key_buffer = 64M
    sort_buffer = 64M
    read_buffer = 16M
    write_buffer = 16M

    local-infile=0

Şimdi biraz daha karmaşıklaştırmamız gerekecek optimizasyon işini tam olarak ve daha güzel bir şekilde yapabilmemiz için yardımda almamız hoş olurdu.Bu yüzden aşağıdaki betiğide sistemimizde çalıştıyoruz.

    wget https://mertcangokgoz.com/Downloads/mysqltuning.sh
    chmod 777 mysqltuning.sh
    service apache restart
    service nginx restart
    service mysqld restart
    //sistemimizde bulunan tüm servisleri yeniden başlatıyoruz.

24 saat veya 48 saat sonrasında

    sh mysqltuning.sh

komutunu sisteme veriyoruz size çıktı verecek sizde my.cnf ayarlamalarınızı buna göre yapabilirsiniz.
