From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 1 Feb 2017 17:52:30 +0000
Subject: [PATCH 1/3] arc: vdk: Disable halt on reset
In-Reply-To: <0c458950-5558-0dc2-4323-c5faba757083@synopsys.com>
References: <1485967373-15273-1-git-send-email-abrodkin@synopsys.com>
 <1485967373-15273-2-git-send-email-abrodkin@synopsys.com>
 <8b857bc4-71f0-9b3b-0cd5-19b49edb2910@synopsys.com>
 <1485969247.5515.27.camel@synopsys.com>
 <0c458950-5558-0dc2-4323-c5faba757083@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1485971550.5515.34.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2017-02-01@09:37 -0800, Vineet Gupta wrote:
> On 02/01/2017 09:14 AM, Alexey Brodkin wrote:
> > 
> > > 
> > > > 
> > > > -# CONFIG_ARC_TIMERS_64BIT is not set
> > > 
> > > Are you sure abut this part. Ater the timers driver rework, this would enable GFRC
> > > for SMP builds and AFAIKR there were some issues with time with GFRC + nSIM etc..
> > 
> > Not anymore :)
> > 
> > Probably I missed something in discussions.
> 
> STAR 9000879565, 9000879563
> 
> > 
> > As a matter of fact I did run-test resulting vmlinux and it worked very nice.
> > More over ARC_TIMERS_64BIT is selected automatically by ISA_ARCV2, see
> > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arc/Kconfig#n119
> > 
> > That said even if "# CONFIG_ARC_TIMERS_64BIT is not set" is left in place the option will be
> > effectively enabled, no?
> 
> The whole point of adding this to defconfig is to override the default from Kconfig ?

Not anymore :)

Since commit?c4c9a040ecb7 ("clocksource: import ARC timer driver"),
see?http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=c4c9a040ecb7297e011e579f5a9cc280e42d725f
we have this:
---------------------->8----------------------
config ISA_ARCV2
	bool "ARC ISA v2"
	select ARC_TIMERS_64BIT
---------------------->8----------------------

which really means if one selects ISA_ARCV2 then ARC_TIMERS_64BIT gets selected automatically
and there's no way to override it from either menuconfig or defconfig.

Probably behavior that you meant was to keep a separate "config ARC_TIMERS_64BIT"
and have it "default y if ISA_ARCV2".

-Alexey
