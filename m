From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 6 Aug 2018 13:24:56 +0000
Subject: [PATCH] ARC: AXS10x/HSDK: Allow U-Boot to pass MAC-address to
 the kernel
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075012B089D74@us01wembx1.internal.synopsys.com>
References: <20180802101937.6202-1-abrodkin@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B089D74@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1533561894.32021.5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Thu, 2018-08-02@21:58 +0000, Vineet Gupta wrote:
> On 08/02/2018 03:19 AM, Alexey Brodkin wrote:
> > Otherwise kernel uses random MAC which is not very conveniet.
> 
> Curious what exactly is the issue - why does the user care what MAC is assigned ?
> 
> > With that change in place use might set desired MAC in U-Boot
> > with "setenv ethaddr 11:22:33:44:55:66", save environment and
> > then from boot to boot the same MAC will be used by the kernel.
> > 
> 
> And what if one is running without uboot - it will resort to all zeros vs. random
> yet working MAC ?
> 

If one is running without u-boot - it will resort to random MAC as we don't treat 
"00:00:00:00:00:00" as a valid Ethernet address.

Look at following link for more details.
https://elixir.bootlin.com/linux/v4.18-rc8/source/include/linux/etherdevice.h#L184


BTW:
Tested-by: Evgeniy Paltsev <paltsev at synopsys.com>

> 
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc at lists.infradead.org
> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Dsnps-2Darc&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=ZlJN
> 1MriPUTkBKCrPSx67GmaplEUGcAEk9yPtCLdUXI&m=pEe31Mq4FC20ZBQ1SMGdCpesPmQFyaQCdpY9-N_aWRc&s=lwI7vTqAmbVPHdfMz_FlOzfBDvtYCQDL-6s-Z2FFr_Y&e=
-- 
 Eugeniy Paltsev
