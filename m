From: Ruud.Derwig@synopsys.com (Ruud Derwig)
Date: Thu, 2 Feb 2017 14:03:40 +0000
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
Message-ID: <921F8835C03C574A887849158AC092F957726AA3@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

VDK config includes GRFC, not sure if it's working/used though.
The nSIM STAR is about that GRFC frequency is fixed in nSIM, but configurable for HW/customers.
But if the frequency is configured correctly (same as cpu frequency), don't think there's an issue.

Ruud.
-----Original Message-----
From: Vineet Gupta 
Sent: Wednesday, February 01, 2017 8:56 PM
To: Alexey Brodkin <Alexey.Brodkin at synopsys.com>
Cc: Ruud Derwig <rderwig at synopsys.com>; linux-kernel at vger.kernel.org; linux-snps-arc at lists.infradead.org
Subject: Re: [PATCH 1/3] arc: vdk: Disable halt on reset

On 02/01/2017 09:52 AM, Alexey Brodkin wrote:
>> The whole point of adding this to defconfig is to override the default from Kconfig ?
> Not anymore :)
> 
> Since commit c4c9a040ecb7 ("clocksource: import ARC timer driver"), 
> see 
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/
> ?id=c4c9a040ecb7297e011e579f5a9cc280e42d725f
> we have this:
> ---------------------->8----------------------
> config ISA_ARCV2
> 	bool "ARC ISA v2"
> 	select ARC_TIMERS_64BIT
> ---------------------->8----------------------
> 
> which really means if one selects ISA_ARCV2 then ARC_TIMERS_64BIT gets 
> selected automatically and there's no way to override it from either menuconfig or defconfig.

Bummer - this means VDK based off 4.9+ kernel might be affected with nsim GFRC issue !

> Probably behavior that you meant was to keep a separate "config ARC_TIMERS_64BIT"
> and have it "default y if ISA_ARCV2".

No, the whole point of moving it out of arch/arc was to increase test coverage etc so it was not tied to ISA_ARCV2 on purpose so that it would atleast build.

Lets see what Rudd has to say abt this. But GFRC can't be used this would need fixing after all by introducing an additional ARC_PLAT_CANT_USE_TIMERS_64BIT which is def_bool set to n, but selected y in VDK Kconfig.

-Vineet
