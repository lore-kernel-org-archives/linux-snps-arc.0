From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 11 Apr 2017 14:51:24 -0700
Subject: static linking broken?
In-Reply-To: <20170411205225.GD5361@waldemar-brodkorb.de>
References: <20170411205225.GD5361@waldemar-brodkorb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <59250a19-ec37-c315-ded0-fa61f5b3f4de@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 04/11/2017 01:52 PM, Waldemar Brodkorb wrote:
> Hi Vineet,
>
> it seems static linking is totally broken for ARC and uClibc-ng:
>
> file root_nsim-arcv2_uclibc-ng_archs/bin/busybox 
> root_nsim-arcv2_uclibc-ng_archs/bin/busybox: ELF 32-bit LSB
> executable, *unknown arch 0xc3* version 1 (SYSV), dynamically
> linked, interpreter *empty*, for GNU/Linux 4.8.0, stripped
>
> I am using arc-2016.09-release within OpenADK.
>
> Do you ever used static linking?
>
> I only test with nsim, but can't use any static binaries.
>
> best regards
>  Waldemar

I do test static linked busybox and last I checked 2016.09 seemed ok ! (below is
busybox built against prebuilt 2016.09 toolchain on github)

$ file arc_initramfs_hs_1612-gnu-2016.09-BIG/bin/busybox_static
ELF 32-bit LSB executable, *unknown arch 0xc3* version 1 (SYSV), statically
linked, for GNU/Linux 4.8.0, not stripped

Although I've seen this issue in different context - Linux kernel perf, Alexey u
remember !

-Vineet
