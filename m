From: acme@kernel.org (Arnaldo Carvalho de Melo)
Date: Mon, 22 Aug 2016 15:08:57 -0300
Subject: [PATCH] tools lib: Reinstate strlcpy() header guard with
 __UCLIBC__
In-Reply-To: <1471888754.8888.15.camel@synopsys.com>
References: <20160818140722.GC16916@redhat.com>
 <852a8516-7fc0-3520-4913-b66c9e8ff3d2@synopsys.com>
 <20160819142207.GA4966@kernel.org>
 <868d62af-a673-80f8-2071-9043394f20fe@synopsys.com>
 <20160819192302.GA20810@kernel.org>
 <20160819200843.GB20810@kernel.org>
 <0ad144ea-21b2-ab10-3ef5-68078ee32631@synopsys.com>
 <20160819214207.GC20810@kernel.org>
 <20160819230210.GD20810@kernel.org>
 <1471888754.8888.15.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160822180857.GA20493@kernel.org>
To: linux-snps-arc@lists.infradead.org

Em Mon, Aug 22, 2016 at 06:01:08PM +0000, Alexey Brodkin escreveu:
> On Fri, 2016-08-19@20:02 -0300, Arnaldo Carvalho de Melo wrote:
> > Em Fri, Aug 19, 2016 at 06:42:07PM -0300, Arnaldo Carvalho de Melo escreveu:
> > > Em Fri, Aug 19, 2016 at 02:27:58PM -0700, Vineet Gupta escreveu:
> > > > corresponding buildroot package folder. Give this a shot - otherwise it is easier
> > > > to just build a custom toolchain with pre-req packages from buildroot. Or can be
> > > > provided if you so deem fit !

> > Please, if you do that, then I'll be able to test more stuff, I already
> > had enough fun trying to get elfutils, argp-standalone and libelf built
> > on this env :-\

> Please find a tarball with prebuilt toolchain for ARC HS38 by that link:
> https://www.dropbox.com/s/uvqla26pmq03h5u/br-2016.08-rc2-65-g11109fd-archs38.tar.gz?dl=0

Thanks for that, I'm behind a slow connection right now, will try later,
but can you consider leaving this on a permanent location? At some point
I'll publish my Dockerfiles, probably on the kernel sources, so that
other people can replicate my test build environment, and then it would
be nice for them to be able to audit what is in there, where the
toolchains/packages come from, etc.

For reference, this is how I have the ARC-uclibc set up right now, with
the previous toolchain Vineet provided me:

[root at jouet perf]# cat fedora/24/x-ARC-uClibc/Dockerfile
# docker.io/acmel/linux-perf-tools-build-fedora:24-x-ARC-uClibc
FROM docker.io/fedora:24
MAINTAINER Arnaldo Carvalho de Melo <acme at kernel.org>
ENV TOOLCHAIN=arc_gnu_2016.03_prebuilt_uclibc_le_archs_linux_install
ENV CROSS=arc-linux-
# binutils for ar, used without cross compiler prefix in libelf build
RUN SOURCEFILE=${TOOLCHAIN}.tar.gz && \
    dnf -y install make flex bison binutils wget tar bzip2 && \
    dnf -y clean all && \
    mkdir -m 777 -p /tmp/build/perf && \
    curl -OL https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2016.03/${SOURCEFILE} && \
    tar xf ${SOURCEFILE} && \
    rm -f ${SOURCEFILE} && \
    export TARGET=arc-snps-linux-uclibc && \
    export INSTALLDIR=/${TOOLCHAIN}/${TARGET}/sysroot/ && \
    export PATH=/${TOOLCHAIN}/bin:$PATH && \
    export TARGETMACH=${TARGET} && \
    export CC=${CROSS}gcc && \
    export LD=${CROSS}ld && \
    export AS=${CROSS}as && \
    export AR=${CROSS}ar && \
    wget -q http://zlib.net/zlib-1.2.8.tar.gz && \
    tar xf zlib-1.2.8.tar.gz && \
    cd zlib-1.2.8 && \
    ./configure --prefix=${INSTALLDIR} && \
    make && \
    make install && \
    cd .. && \
    rm -rf zlib-1.2.8 && \
    rm -f zlib-1.2.8.tar.gz && \
    dnf -y remove tar wget bzip2 binutils && \
    groupadd -r perfbuilder && \
    useradd -r -g perfbuilder perfbuilder
USER perfbuilder
ENTRYPOINT make -C /git/linux/tools/perf O=/tmp/build/perf NO_LIBBPF=1
ARCH=arc CROSS_COMPILE=/${TOOLCHAIN}/bin/${CROSS}

- Arnaldo
 
> Just FYI I built it from today's BR sources, i.e. this is gcc6 based with all latest fixes
> for ARC on top of vanilla gcc 6.1.1.
> 
> That's a defconfig I used in Buildroot:
> -------------------->8---------------------
> BR2_arcle=y
> BR2_archs38=y
> BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_PACKAGE_ELFUTILS=y
> -------------------->8---------------------
> 
> -Alexey
