From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 1 Feb 2017 20:03:25 +0000
Subject: [PATCH 1/3] arc: vdk: Disable halt on reset
In-Reply-To: <e9df73e0-14e6-cd84-0539-1e79e05ebd08@synopsys.com>
References: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
 <1485967373-15273-2-git-send-email-abrodkin@synopsys.com>
 <8b857bc4-71f0-9b3b-0cd5-19b49edb2910@synopsys.com>
 <1485969247.5515.27.camel@synopsys.com>
 <0c458950-5558-0dc2-4323-c5faba757083@synopsys.com>
 <1485971550.5515.34.camel@synopsys.com>
 <e9df73e0-14e6-cd84-0539-1e79e05ebd08@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE64678ACD5A@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta [mailto:vgupta at synopsys.com]
> Sent: Wednesday, February 1, 2017 10:56 PM
> To: Alexey Brodkin <Alexey.Brodkin at synopsys.com>
> Cc: Ruud Derwig <rderwig at synopsys.com>; linux-kernel at vger.kernel.org;
> linux-snps-arc at lists.infradead.org
> Subject: Re: [PATCH 1/3] arc: vdk: Disable halt on reset
> 
> On 02/01/2017 09:52 AM, Alexey Brodkin wrote:
> >> The whole point of adding this to defconfig is to override the default from
> Kconfig ?
> > Not anymore :)
> >
> > Since commit c4c9a040ecb7 ("clocksource: import ARC timer driver"),
> > see
> > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/
> > ?id=c4c9a040ecb7297e011e579f5a9cc280e42d725f
> > we have this:
> > ---------------------->8----------------------
> > config ISA_ARCV2
> > 	bool "ARC ISA v2"
> > 	select ARC_TIMERS_64BIT
> > ---------------------->8----------------------
> >
> > which really means if one selects ISA_ARCV2 then ARC_TIMERS_64BIT gets
> > selected automatically and there's no way to override it from either
> menuconfig or defconfig.
> 
> Bummer - this means VDK based off 4.9+ kernel might be affected with nsim
> GFRC issue !

One note here - I think it only affects 4.10+ kernels.

-Aexey
