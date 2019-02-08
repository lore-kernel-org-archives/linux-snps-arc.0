From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 8 Feb 2019 07:13:39 +0000
Subject: patch "devres: Align data[] to ARCH_KMALLOC_MINALIGN" added to
 driver-core-linus
In-Reply-To: <20190207155213.GC7164@kroah.com>
References: <1541965277161164@kroah.com>
 <4881796E12491D4BB15146FE0209CE64681D5C43@DE02WEMBXB.internal.synopsys.com>
 <20190207155213.GC7164@kroah.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE64681D64C3@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Greg,

> -----Original Message-----
> From: gregkh at linuxfoundation.org <gregkh at linuxfoundation.org>
> Sent: Thursday, February 7, 2019 6:52 PM
> To: Alexey Brodkin <alexey.brodkin at synopsys.com>
> Cc: David.Laight at ACULAB.COM; geert at linux-m68k.org; peterz at infradead.org; stable at vger.kernel.org;
> tglx at linutronix.de; will.deacon at arm.com; Vineet Gupta <vineet.gupta1 at synopsys.com>; linux-snps-
> arc at lists.infradead.org
> Subject: Re: patch "devres: Align data[] to ARCH_KMALLOC_MINALIGN" added to driver-core-linus

[snip]
 
> Ah, I was waiting to see if you would notice :)

Well I was just patiently waiting as I guess there's a long queue
of patches to deal with in your inbox :)

> See this question from Linus about this patch:
> 	https://lore.kernel.org/lkml/CAHk-=wj3Q7CkMQYwfZSsqUTqkEhNwVGrRbCwe7AVJ70S8i5sWw at mail.gmail.com/

I didn't see that. Though I intentionally sent my patch to most if not all
arch maintainers so they might share their concerns... but IIRC nobody ever
replied with either concerns or acks.

Also I do agree that it's a trade-off between:
 1. Predictability
    I was completely sure devm-allocated buffer is the same as anything kmalloced
    except some meta-data stored _separately_ and so supposed alignment
    should match as well... but how wrong that feeling was.

 2. Optimization
    Indeed it's so sweet when both devm "meta-data" and real small buffer fit
    into 1 cache line.
 
> I figured that you all did this for a good reason, and wasting that much
> space was going to be ok.  But, I wanted to be sure, so if you never
> noticed it, I figured it was not that pressing of an issue.

It's not super pressing because:
 1. Fortunately [or unfortunately] this problem happens only in pretty rare cases
    like that Etnaviv driver where I first caught it.

 2. There's a solution and affected parties may apply known patch locally.

> Anyway, is this really needed to be backported?

For us poor ARC developers and users it's really needed as our tools ABI
sets 32-bit alignment for 64-bit types. See that's the same optimization -
why wasting precious bytes on useless holes - let's pack data tighter :)

So having that fix at least in the most recent LTS (i.e. 4.19) would be really good.
As for older kernels I think for now we may not touch them as indeed change is
quite intrusive.

-Alexey
