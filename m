From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 5 Feb 2019 16:42:28 +0000
Subject: [PATCH 2/2] arc: hsdk_defconfig: enable CONFIG_ARC_UBOOT_SUPPORT
References: <1549355535-22052-1-git-send-email-clabbe@baylibre.com>
 <1549355535-22052-3-git-send-email-clabbe@baylibre.com>
 <1549366931.27724.26.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642EBE9@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 2/5/19 3:42 AM, Eugeniy Paltsev wrote:
> Hi Corentin,
>
> In case of devboards (like HSDK) we really often disable bootloader and load
> Linux image in memory via JTAG. Enabling CONFIG_ARC_UBOOT_SUPPORT by
> default will break it as we will try to interpret some junk in a registers
> as a pointers to bootargs/etc which aren't set by anyone in case of JTAG using.
>
> So it isn't a good idea to have CONFIG_ARC_UBOOT_SUPPORT enabled by default.

Right.

It is difficult to accommodate everyone's needs (often conflicting) in a single
defconfig.
Can you folks create an out-of-tree defconfig or some such.

-Vineet
