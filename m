From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 5 Feb 2018 18:38:51 +0000
Subject: [PATCH] arc: dts: use 'atmel' as manufacturer for at24 in
 axs10x_mb
In-Reply-To: <20180124213955.4975-1-brgl@bgdev.pl>
References: <20180124213955.4975-1-brgl@bgdev.pl>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE646802914A@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Bartosz, all,

> -----Original Message-----
> From: Bartosz Golaszewski [mailto:brgl at bgdev.pl]
> Sent: Thursday, January 25, 2018 12:40 AM
> To: Rob Herring <robh+dt at kernel.org>; Mark Rutland <mark.rutland at arm.com>; Russell King <linux at armlinux.org.uk>; Alexey
> Brodkin <Alexey.Brodkin at synopsys.com>; Vineet Gupta <Vineet.Gupta1 at synopsys.com>
> Cc: devicetree at vger.kernel.org; linux-kernel at vger.kernel.org; linux-snps-arc at lists.infradead.org; Bartosz Golaszewski
> <brgl at bgdev.pl>
> Subject: [PATCH] arc: dts: use 'atmel' as manufacturer for at24 in axs10x_mb
> 
> Using compatible strings without the <manufacturer> part for at24 is
> now deprecated. Use a correct 'atmel,<model>' value.

Even though I agree with this change itself I think it may worth
mentioning an explicit commit that deprecated manufacturer'less parts.

-Alexey
 
