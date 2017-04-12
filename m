From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 12 Apr 2017 11:36:44 +0000
Subject: static linking broken?
In-Reply-To: <59250a19-ec37-c315-ded0-fa61f5b3f4de@synopsys.com>
References: <20170411205225.GD5361@waldemar-brodkorb.de>
 <59250a19-ec37-c315-ded0-fa61f5b3f4de@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1491997003.4510.40.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Waldemar,

On Tue, 2017-04-11@14:51 -0700, Vineet Gupta wrote:
> On 04/11/2017 01:52 PM, Waldemar Brodkorb wrote:
> > 
> > Hi Vineet,
> > 
> > it seems static linking is totally broken for ARC and uClibc-ng:
> > 
> > file root_nsim-arcv2_uclibc-ng_archs/bin/busybox?
> > root_nsim-arcv2_uclibc-ng_archs/bin/busybox: ELF 32-bit LSB
> > executable, *unknown arch 0xc3* version 1 (SYSV), dynamically
> > linked, interpreter *empty*,?for GNU/Linux 4.8.0, stripped
> > 
> > I am using arc-2016.09-release within OpenADK.
> > 
> > Do you ever used static linking?
> > 
> > I only test with nsim, but can't use any static binaries.
> > 
> > best regards
> > ?Waldemar
> 
> I do test static linked busybox and last I checked 2016.09 seemed ok ! (below is
> busybox built against prebuilt 2016.09 toolchain on github)
> 
> $ file arc_initramfs_hs_1612-gnu-2016.09-BIG/bin/busybox_static
> ELF 32-bit LSB executable, *unknown arch 0xc3* version 1 (SYSV), statically
> linked, for GNU/Linux 4.8.0, not stripped
> 
> Although I've seen this issue in different context - Linux kernel perf, Alexey u
> remember !

Indeed there was a discussion on that regard in LKML.
This is the first part of the thread:
http://lists.infradead.org/pipermail/linux-snps-arc/2016-August/001431.html
and here are last 2 messages in this thread:
http://lists.infradead.org/pipermail/linux-snps-arc/2016-September/001454.html

Conclusion was that for some reason final perf executable even if
built with "-static" becomes a weird "dynamic" with no interpreter right
as you saw.

In fact Linux perf is still affected.
If I build it from Linux v4.11-rc4 like that:
----------------->8--------------
make NO_LIBELF=1 NO_JVMTI=1 LDFLAGS=-static
----------------->8--------------
I see strange description of the resulting binary:
----------------->8--------------
file perf
perf: ELF 32-bit LSB executable, *unknown arch 0xc3* version 1 (SYSV), dynamically linked, interpreter *empty*, for GNU/Linux 4.8.0, not stripped
----------------->8--------------

But if I build Busybox (I tried today's master) with prebuilt arc-2016.09 tools
static busybox looks pretty ok:
----------------->8--------------
file busybox
busybox: ELF 32-bit LSB executable, *unknown arch 0xc3* version 1 (SYSV), statically linked, for GNU/Linux 4.8.0, stripped
----------------->8--------------

That said something is definitely wrong here.
In case of perf I was able to get a real "static" binary when excluded "--dynamic-list"
option passed to the linker, see my initial patch here:
http://lists.infradead.org/pipermail/linux-snps-arc/2016-August/001431.html

So I may speculate that something "wrong" gets passed to LD when your busybox
gets linked.

I just made a simple test:
------------------------------>8--------------------------------
# cat test.c?
#include <stdio.h>

void main(void)
{
	printf("Hello!\n");
}

# cat dynamic-list?
{
	main;
};

# gcc -static -Wl,--dynamic-list=dynamic-list test.c?
# file a.out?
a.out: ELF 64-bit LSB executable, x86-64, version 1 (GNU/Linux), statically linked, for GNU/Linux 2.6.32,
BuildID[sha1]=55823847c3640b89164ca7ae7c4382ed40c19da5, not stripped

# arc-linux-gcc -static -Wl,--dynamic-list=dynamic-list test.c?
# file a.out?
a.out: ELF 32-bit LSB executable, *unknown arch 0xc3* version 1 (SYSV), dynamically linked, interpreter *empty*, for GNU/Linux 4.8.0, not stripped
------------------------------>8--------------------------------

My host?gcc version 6.3.1 20161221 (Red Hat 6.3.1-1) (GCC)?
Cross?gcc version 6.2.1 20160824 (ARCv2 ISA Linux uClibc toolchain 2016.09).

I think it's over to Cupertino to investigate now that magic difference :)

-Alexey
