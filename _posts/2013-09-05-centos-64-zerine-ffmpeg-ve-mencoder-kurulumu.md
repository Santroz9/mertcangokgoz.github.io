---
layout: post
title: Centos 6.x üzerine ffmpeg ve mencoder kurulumu
date: 2013-09-05 11:35:16.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: centos işletim sisteminde gerek çoğu arkadaşımızın takıldığı yerlerden biriside bu iki uygulamanın kurulumları aslında rutorrent yüklenecek
---

centos işletim sisteminde gerek çoğu arkadaşımızın takıldığı yerlerden biriside bu iki uygulamanın kurulumları aslında rutorrent yüklenecek olan her servera bunların kurulması gerekmektedir.Çünkü yazmış olduğumuz rutorrent scriptinin içerisinde bulunan mediainfo eklentisi bilindiği üzere bazı codecler olmadan kararlı çalışmaz ancak mediainfosuz rutorrent çalışmaktadır.Bu makalemizde sizlere bu iki codec ve bu iki video işleme uygulamasını nasıl kurabileceğimizi anlatacağım ffmpeg denince akla herkesin codec gelmektedir ancak ffmpeg aynı zamanda encoding işleminide yapmaktadır gerekli parametreler verilirse video işleme işlemini de sorunsuz bir şekilde yapacaktır.

Rpm paketimizi ekliyoruz.

    rpm -Uhv http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
    yum -y update

Bu komutları verdikten sonra geliştirici paketlerini ve derlemede işimize yarayacak uygulamaları kuruyoruz.

    yum install glibc gcc gcc-c++ autoconf automake libtool git make nasm pkgconfig
    yum install SDL-devel a52dec a52dec-devel alsa-lib-devel faac faac-devel faad2 faad2-devel
    yum install freetype-devel giflib gsm gsm-devel imlib2 imlib2-devel lame lame-devel libICE-devel libSM-devel libX11-devel
    yum install libXau-devel libXdmcp-devel libXext-devel libXrandr-devel libXrender-devel libXt-devel
    yum install libogg libvorbis vorbis-tools mesa-libGL-devel mesa-libGLU-devel xorg-x11-proto-devel zlib-devel
    yum install libtheora theora-tools
    yum install ncurses-devel
    yum install libdc1394 libdc1394-devel
    yum install amrnb-devel amrwb-devel opencore-amr-devel

Aşağıdaki adımları sırasıyla uygulayarak kurulumları tamamlayabilirsiniz.Xvid kurulumumuza geçiyoruz.

    cd /opt
    wget http://downloads.xvid.org/downloads/xvidcore-1.3.2.tar.gz
    tar xzvf xvidcore-1.3.2.tar.gz
    cd xvidcore/build/generic
    ./configure --prefix="$HOME/ffmpeg_build"
    make
    make install

LibOgg kurulumumuz

    cd /opt
    wget http://downloads.xiph.org/releases/ogg/libogg-1.3.1.tar.gz
    tar xzvf libogg-1.3.1.tar.gz
    cd libogg-1.3.1
    ./configure --prefix="$HOME/ffmpeg_build" --disable-shared
    make
    make install

LibVorbis Kurulumumuz

    cd /opt
    wget http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.4.tar.gz
    tar xzvf libvorbis-1.3.4.tar.gz
    cd libvorbis-1.3.4
    ./configure --prefix="$HOME/ffmpeg_build" --with-ogg="$HOME/ffmpeg_build" --disable-shared
    make
    make install

LibOra Kurulumu

    cd /opt
    wget http://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.gz
    tar xzvf libtheora-1.1.1.tar.gz
    cd libtheora-1.1.1
    ./configure --prefix="$HOME/ffmpeg_build" --with-ogg="$HOME/ffmpeg_build" --disable-examples --disable-shared --disable-sdltest --disable-vorbistest
    make
    make install

Aacenc Kurulumu

    cd /opt
    wget http://downloads.sourceforge.net/opencore-amr/vo-aacenc-0.1.2.tar.gz
    tar xzvf vo-aacenc-0.1.2.tar.gz
    cd vo-aacenc-0.1.2
    ./configure --prefix="$HOME/ffmpeg_build" --disable-shared
    make
    make install

Yasm Kurulumu

    yum remove yasm
    cd /opt
    wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
    tar xzfv yasm-1.2.0.tar.gz
    cd yasm-1.2.0
    ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
    make
    make install
    export "PATH=$PATH:$HOME/bin"

Libvpx Kurulumu

    cd /opt
    git clone http://git.chromium.org/webm/libvpx.git
    cd libvpx
    git checkout tags/v.1.3.0
    ./configure --prefix="$HOME/ffmpeg_build" --disable-examples
    make
    make install

X264 Kurulumu

    cd /opt
    git clone git://git.videolan.org/x264.git
    cd x264
    ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static
    make
    make install

Kurmuş olduğumuz tüm kütüphanelerin ayarlanma işlemi sırasıyla

    export LD_LIBRARY_PATH=/usr/local/lib/
    echo /usr/local/lib >> /etc/ld.so.conf.d/custom-libs.conf
    ldconfig

Son Olarakda FFmpeg kurulumunun yapılması ve işlemlerin sonlandırılması

    cd /opt
    git clone git://source.ffmpeg.org/ffmpeg.git
    cd ffmpeg
    git checkout release/2.5
    PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig"
    export PKG_CONFIG_PATH
    ./configure --prefix="$HOME/ffmpeg_build" --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" --bindir="$HOME/bin" \
    --extra-libs=-ldl --enable-version3 --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libvpx --enable-libfaac \
    --enable-libmp3lame --enable-libtheora --enable-libvorbis --enable-libx264 --enable-libvo-aacenc --enable-libxvid --disable-ffplay \
    --enable-gpl --enable-postproc --enable-nonfree --enable-avfilter --enable-pthreads
    make
    make install
