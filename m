From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 9 Jan 2017 15:08:06 +0000
Subject: [PATCH 1/2] arc: rename xCCM sections so they are not merged in
 global .data/.text
In-Reply-To: <6d3a6876-402f-c237-f9a2-88aad3179ead@synopsys.com>
References: <1482415750-5471-1-git-send-email-abrodkin@synopsys.com>
 <1482415750-5471-2-git-send-email-abrodkin@synopsys.com>
 <6d3a6876-402f-c237-f9a2-88aad3179ead@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1483974486.2890.36.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Thu, 2016-12-22@16:25 -0800, Vineet Gupta wrote:
> On 12/22/2016 06:09 AM, Alexey Brodkin wrote:
> > diff --git a/arch/arc/include/asm/linkage.h b/arch/arc/include/asm/linkage.h
> > index b29f1a9fd6f7..3a5f13d65ee1 100644
> > --- a/arch/arc/include/asm/linkage.h
> > +++ b/arch/arc/include/asm/linkage.h
> > @@ -28,7 +28,7 @@
> > ?/* annotation for data we want in DCCM - if enabled in .config */
> > ?.macro ARCFP_CODE
> > ?#ifdef CONFIG_ARC_HAS_ICCM
> > -	.section .text.arcfp, "ax", at progbits
> > +	.section .text..arcfp, "ax", at progbits
> 
> Why not turn this around and call it arcfp.text and arcfp.data etc - just like
> done for other special sections such as sched, cpuidle, lock... Just so we are
> consistent with normal kernel convention !

Right that looks much better!
Will do so in v2.

-Alexey
