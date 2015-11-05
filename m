From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 5 Nov 2015 18:50:22 +0000
Subject: "compatible" and "model" properties in .dts for ARC boards
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1446749422.3151.29.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

During OpenWRT upsreaming process one interesting topic was raised.
See in the middle of https://lists.openwrt.org/pipermail/openwrt-devel/2015-November/036959.html

In Device Tree descriptions for our boards we don't use "model" property
even though it is a required one as specified by ePAPR, see
http://free-electrons.com/~thomas/pub/Power_ePAPR_APPROVED_v1.0.pdf,
page 39 "Table 3-1 Root node properties".

Instead we put 2 items in "compatible" property.

For example:
------------------->8----------------
compatible = "snps,axs101", "snps,arc-sdp";
------------------->8----------------
here: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arc/boot/dts/axs101.dts#n16

And from ePAPR standpoint it makes sense to split contents of that "compatible"
property in 2:
------------------->8----------------
compatible = "snps,arc-sdp";
model = "snps,axs101";
------------------->8----------------

But I do see problems with implementation of that thing.
Today we have a luxury of selection of AXS init functionality
based on that compatible value and if "snps,axs101" goes in
"model" then we'll need to add some more code in
arch/arc/plat-axs10x/axs10x.c that reads "model" value with
of_get_property() and then compare to "axs10{1|3}".

Any thoughts?

-Alexey
