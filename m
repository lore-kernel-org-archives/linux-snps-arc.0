From: arnd@arndb.de (Arnd Bergmann)
Date: Fri, 06 Nov 2015 09:59:46 +0100
Subject: "compatible" and "model" properties in .dts for ARC boards
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44D0C84@IN01WEMBXA.internal.synopsys.com>
References: <1446749422.3151.29.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D0C84@IN01WEMBXA.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <82634871.ymdF4uL7TN@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Friday 06 November 2015 04:45:24 Vineet Gupta wrote:
> >
> > During OpenWRT upsreaming process one interesting topic was raised.
> > See in the middle of https://lists.openwrt.org/pipermail/openwrt-devel/2015-November/036959.html
> >
> > In Device Tree descriptions for our boards we don't use "model" property
> > even though it is a required one as specified by ePAPR, see
> > http://free-electrons.com/~thomas/pub/Power_ePAPR_APPROVED_v1.0.pdf,
> > page 39 "Table 3-1 Root node properties".
> >
> > Instead we put 2 items in "compatible" property.
> >
> > For example:
> > ------------------->8----------------
> > compatible = "snps,axs101", "snps,arc-sdp";
> > ------------------->8----------------
> >
> > And from ePAPR standpoint it makes sense to split contents of that "compatible"
> > property in 2:
> > ------------------->8----------------
> > compatible = "snps,arc-sdp";
> > model = "snps,axs101";
> > ------------------->8----------------
> 
> It seems model is just a descriptive label and we can surely add them to existing DT.
> compatible on the other hand is more fundamental used for exact comparisons etc
> and follows the vendor,device convention.
> It is pretty common for compatible to have multiple strings for exactly the same
> reason as I have them here. Both axs101 and axs103 are based on sdp thus we want
> the ability to have both pieces of information and use as needed.

Correct.

The model should also be a human readable name of the machine, just one
string like "Synapsys AXS101 Development Board" (or whatever that is called).

> > But I do see problems with implementation of that thing.
> > Today we have a luxury of selection of AXS init functionality
> > based on that compatible value and if "snps,axs101" goes in
> > "model" then we'll need to add some more code in
> > arch/arc/plat-axs10x/axs10x.c that reads "model" value with
> > of_get_property() and then compare to "axs10{1|3}".
> >
> > Any thoughts?

That should use the of_machine_is_compatible() helper. The model string
is for printing in dmesg or /proc/cpuinfo.

	Arnd
