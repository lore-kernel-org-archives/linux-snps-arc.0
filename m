From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 10 Mar 2016 07:44:06 +0000
Subject: [PATCH] arc: use little endian accesses
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E8EDF9@us01wembx1.internal.synopsys.com>
References: <1457544064-16167-1-git-send-email-ltrimas@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8EDF9@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457595846.2868.10.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Thu, 2016-03-10@05:05 +0000, Vineet Gupta wrote:
> +CC Noam
> 
> On Wednesday 09 March 2016 10:51 PM, Lada Trimasova wrote:
> > 
> > Memory access primitives should use cpu_to_le16, cpu_to_le32, le16_to_cpu
> > and le32_to_cpu because it is not really guaranteed that drivers handles
> > any ordering themselves.
> That is the driver issue. readxx as API simply returns data in native endianness.
> We've had EZChip running big endian and so far and they didn't need this change.

Let me disagree with you here.
See what is said in "include/asm-generic/io.h":
---------------------->8---------------------
/*
?* __raw_{read,write}{b,w,l,q}() access memory in native endianness.
?*
?* On some architectures memory mapped IO needs to be accessed differently.
?* On the simple architectures, we just read/write the memory location
?* directly.
?*/

...

/*
?* {read,write}{b,w,l,q}() access little endian memory and return result in
?* native endianness.
?*/
---------------------->8---------------------

And that's an implementation we have for ARC:
---------------------->8---------------------
#define readb(c)		({ u8??__v = readb_relaxed(c); __iormb(); __v; })
#define readw(c)		({ u16 __v = readw_relaxed(c); __iormb(); __v; })
#define readl(c)		({ u32 __v = readl_relaxed(c); __iormb(); __v; })

#define writeb(v,c)		({ __iowmb(); writeb_relaxed(v,c); })
#define writew(v,c)		({ __iowmb(); writew_relaxed(v,c); })
#define writel(v,c)		({ __iowmb(); writel_relaxed(v,c); })

/*
?* Relaxed API for drivers which can handle any ordering themselves
?*/
#define readb_relaxed(c)	__raw_readb(c)
#define readw_relaxed(c)	__raw_readw(c)
#define readl_relaxed(c)	__raw_readl(c)

#define writeb_relaxed(v,c)	__raw_writeb(v,c)
#define writew_relaxed(v,c)	__raw_writew(v,c)
#define writel_relaxed(v,c)	__raw_writel(v,c)
---------------------->8---------------------

Which is effectively (related to endianess discussion):
---------------------->8---------------------
#define readX(c)	__raw_readX(c)
#define writeX(v,c)	__raw_writeX(v,c)
---------------------->8---------------------

That looks IMHO incorrect if we read API description in "include/asm-generic/io.h".
BTW description of {read,write}{b,w,l,q}() is a bit misleading in part saying
"... and return result in __native_endianness__".

But real implementation of {read,write}{b,w,l,q}() in "include/asm-generic/io.h"
really shows what was meant - note?__leXX_to_cpu() and?cpu_to_leXX are used.

> > 
> > For example, serial port driver doesn't work when kernel is build for
> > arc big endian architecture.
> Last I tested Big Endian on SDP with 8250 part + 8250 driver it was working fine.
> I presume this is the systemC model for device and standard 8250 driver and very
> likely the model is not fixed endian or something.

Model is indeed little-endian. We build it only once and than changing
only "nsim_isa_big_endian" property (which changes only CPU core endianess) may use
it equally well with little- and big-endian builds of Linux kernel.

-Alexey
