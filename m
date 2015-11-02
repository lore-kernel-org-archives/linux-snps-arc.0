From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 2 Nov 2015 14:17:01 +0000
Subject: Testmail
References: <CADCPb77DO+F2Mm2Mq50o_Rs+Keq7U=_KmjCqZh+_0VcV+hPNqg@mail.gmail.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44CD21C@IN01WEMBXA.internal.synopsys.com>
 <CADCPb74sQ_QgoRLRv7A-nw6M5cSDbagOpS7WHLqvYxFV=OJSVw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44CFFFA@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Sunday 01 November 2015 11:24 PM, Sujay Raj wrote:
>
> I did encounter what I suppose is a bug.  The build process you sent for
> building kernel for nsim simulator, required arc-linux-uclibc-* ,  whereas the
> host/usr/bin had the toolchain named arc-buildroot-linux-uclibc-* .

It would also have arc-linux-* alias
This needs fixing - we need to switch all arch/arc/config/* to use arc-linux-
CROSS_COMPILE prefix !
Care to send a patch :-)

>
> Well I did get around by creating symlinks for arc-buildroot-linux-uclibc-* as
> arc-linux-uclibc-* . Since the process I followed was the same I think the error
> may be in some script. 

arc-linux-uclibc-gcc, arc-linux-gcc, arc-buildroot-linux-uclibc-gcc are all arc
gcc drivers which simply invoke gcc + as + ld under the hood. gcc drivers
typically provide default library linkages, linker emulation script, standard
include paths etc....
For kernel build we can use any of them as the kernel build system has a very
tight control of include paths, linker script, ..... So it over-rides all
toolchain defaults with it's own need anyways.

Buildroot built toolchain has buildroot prefix - while manual system generates
uclibc prefix. Both have a common arc-linux alias - thus it is better to use
arc-linux- prefix in the kernel builds. In terms of results all produce the same
result, but using arc-linux- consistently is better when mixing buildroot vs. non
buildroot and less tripping point for new people.

Glad to see u r trying this out. If u r interested, u can even help me with glibc
port which I haven't had time to go back to.

P.S. There's a new public mailing list for ARC Linux up and running :
http://lists.infradead.org/pipermail/linux-snps-arc/
So do CC linux-snps-arc at lists.infraded.org if you send any patches.

-Vineet
