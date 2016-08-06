---
layout: post
title: VestaCP'de Mysql Sorununun Çözülmesi
date: 2015-07-30 03:19:55.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: VestaCP kullanan sistemlerinde genelde 512 MB yada 1 GB ram barındıran VPS sunucularının temel sorunlarından bir tanesi mysql pidlerinin kendi
---

**VestaCP** kullanan sistemlerinde genelde **512 MB** yada **1 GB** ram barındıran **VPS** sunucularının temel sorunlarından bir tanesi mysql pidlerinin kendi kendilerini kapatmasıdır.Özellikle tam bir işlem yaparken yada durduk yere kendisini kapatmaktadır.Buda sistemin yetersiz kalmasından kaynaklandığını bir kaç kişiye kurulum yaptığımda fark ettim gereksiz yere fazla pid açıyor yada gereksiz yere mysql çalıştırıyordu.Bir kaç haftalık çalışmadan sonra en iyi yapılandırmayı bulabildim.Denediğim 4 adet sistemde de mysql pidleri bir daha kendini kapatmadığını fark ettim.Çok az sistem kaynağı olan siteler için aşağıdaki **my.cnf** kullanabilirsiniz.Bunlar dışında [bir önceki makalemizde](https://mertcangokgoz.com/1gb-sunucular-icin-mysql-optimizasyonu/) yayınladığımız ayarlarıda kullanabilirsiniz.

Bunlardan ilki **512 MB** rami olan sistemler için;

    [mysqld]
    datadir=/var/lib/mysql
    socket=/var/lib/mysql/mysql.sock
    user=mysql
    symbolic-links=0
    max_connections=100
    max_user_connections=30
    wait_timeout=30
    interactive_timeout=50
    slow-query-log =1
    long_query_time=5
    slow-query-log-file = /var/log/mysql-slow.log

    skip-external-locking
    key_buffer_size = 8M
    max_allowed_packet = 16M
    table_open_cache = 4k
    sort_buffer_size = 512k
    read_buffer_size = 512k
    read_rnd_buffer_size = 512k
    myisam_sort_buffer_size = 8M
    thread_cache_size = 128
    query_cache_size = 8M
    query_cache_limit = 8M
    tmp_table_size = 16M
    max_heap_table_size = 16M
    join_buffer_size = 512k

    innodb_file_per_table
    innodb_buffer_pool_size = 8M

    [mysqld_safe]
    log-error=/var/log/mysqld.log
    pid-file=/var/run/mysqld/mysqld.pid

Bir diğeri ise **1 GB** ramı olan sistemler içindir;

    [mysqld]
    datadir=/var/lib/mysql
    socket=/var/lib/mysql/mysql.sock
    user=mysql
    symbolic-links=0
    max_connections=70
    max_user_connections=30
    wait_timeout=10
    interactive_timeout=50
    long_query_time=5
    slow_query_log=0

    key_buffer = 128M
    myisam_sort_buffer_size = 32M
    join_buffer_size=1M
    read_buffer_size=1M
    sort_buffer_size=2M
    table_cache=1536
    thread_cache_size=286
    interactive_timeout=25
    connect_timeout=5
    max_allowed_packet=32M
    max_connect_errors=1000
    query_cache_limit=1M
    query_cache_size=32M
    query_cache_type=1
    tmp_table_size=64M
    max_heap_table_size=64MB


    innodb_buffer_pool_size=32M
    innodb_flush_log_at_trx_commit=2
    innodb_file_per_table

    [mysqld_safe]
    log-error=/var/log/mysqld.log
    pid-file=/var/run/mysqld/mysqld.pid

yapılan testler sonucunda verimli olduğu kararlaştırılmıştır.Sisteminizde oluşabilecek sorunlara karşı lütfen **orjinal my.cnf** dosyasını saklamayı unutmayınız.Ayrıca yukarıdaki ayarları yaptınız ama gene aynı sorun ile karşılaşıyorsanız [lütfen iletişime geçin](https://mertcangokgoz.com/iletisim-2/) yada konu altına yorum yapabilirsiniz.
