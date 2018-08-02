From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 2 Aug 2018 21:58:02 +0000
Subject: [PATCH] ARC: AXS10x/HSDK: Allow U-Boot to pass MAC-address to
 the kernel
References: <20180802101937.6202-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B089D74@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/02/2018 03:19 AM, Alexey Brodkin wrote:
> Otherwise kernel uses random MAC which is not very conveniet.

Curious what exactly is the issue - why does the user care what MAC is assigned ?

> With that change in place use might set desired MAC in U-Boot
> with "setenv ethaddr 11:22:33:44:55:66", save environment and
> then from boot to boot the same MAC will be used by the kernel.
>

And what if one is running without uboot - it will resort to all zeros vs. random
yet working MAC ?
