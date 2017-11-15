From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 15 Nov 2017 16:24:13 +0000
Subject: etnaviv: PHYS_OFFSET usage
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1510763053.29843.64.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Lucas,

As we discussed on ELCE last month in Prague we have Vivante GPU
built-in our new ARC HSDK development board.

And even though [thanks to your suggestions] I got Etnaviv driver
working perfectly fine on our board I faced one quite a tricky
situation [which I dirty worked-around for now].

Etnaviv driver uses some PHYS_OFFSET define which is not very
usual across all architectures and platforms supported by Linux kernel.

In fact for ARC we don't have?PHYS_OFFSET defined [yet].
And I'm wondering how to get this resolved.

Essentially we have 2 options:
?1. Define?PHYS_OFFSET for ARC (and later for other arches once needed)
?2. Replace?PHYS_OFFSET with something else in etnaviv sources.

Even though (1) seems to be the simplest solution is doesn't look very nice
because it seems to be quite ARM-specific but not something really generic
and portable.

As for (2) frankly I din't quite understand why do we really care about
DDR start offset in the GPU driver. If some more light could be shed on this
topic probably we'll figure out what would be more elegant solution.

Regards,
Alexey
