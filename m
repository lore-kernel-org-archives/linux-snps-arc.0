From: linux@roeck-us.net (Guenter Roeck)
Date: Wed, 12 Sep 2018 10:30:37 -0700
Subject: [PATCH] ARCv2: build: use mcpu=hs38 iso generic mcpu=archs
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075012B0949BC@us01wembx1.internal.synopsys.com>
References: <20180912165817.GA5118@roeck-us.net>
 <C2D7FE5348E1B147BCA15975FBA23075012B0949BC@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180912173037.GA6386@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

On Wed, Sep 12, 2018@05:06:25PM +0000, Vineet Gupta wrote:
> 
> Hmm I have a prebuilt 2017.03 release of tools (gcc 7.1.1 based) and I don't see
> the issue above when building net/core/dev.o
> I presume your toolchain was built off of upstream gcc sources.

Yes, using buildroot.

> Can you please post the output of your arc-linux*gcc -v
> 

Here you are:

Using built-in specs.
COLLECT_GCC=/opt/kernel/arcv2/gcc-7.3.0/bin/arc-linux-gcc.br_real
COLLECT_LTO_WRAPPER=/opt/kernel/arcv2/gcc-7.3.0/bin/../libexec/gcc/arc-buildroot-linux-uclibc/7.3.0/lto-wrapper
Target: arc-buildroot-linux-uclibc
Configured with: ./configure --prefix=/opt/buildbot/buildroot/output/host
--sysconfdir=/opt/buildbot/buildroot/output/host/etc --enable-static
--target=arc-buildroot-linux-uclibc
--with-sysroot=/opt/buildbot/buildroot/output/host/arc-buildroot-linux-uclibc/sysroot
--disable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib
--with-gmp=/opt/buildbot/buildroot/output/host
--with-mpc=/opt/buildbot/buildroot/output/host
--with-mpfr=/opt/buildbot/buildroot/output/host --with-pkgversion='Buildroot
2018.02.2-00017-gea0e6fa-dirty' --with-bugurl=http://bugs.buildroot.net/
--disable-libquadmath --disable-libsanitizer --enable-tls --disable-libmudflap
--enable-threads --without-isl --without-cloog --disable-decimal-float
--with-cpu=archs --enable-languages=c
--with-build-time-tools=/opt/buildbot/buildroot/output/host/arc-buildroot-linux-uclibc/bin
--enable-shared --disable-libgomp
Thread model: posix
gcc version 7.3.0 (Buildroot 2018.02.2-00017-gea0e6fa-dirty) 

Guenter
