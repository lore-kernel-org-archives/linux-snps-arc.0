From: vgupta@synopsys.com (Vineet Gupta)
Date: Fri, 11 Aug 2017 06:37:00 +0530
Subject: Adding new ARC platforms (was Re: Handling stub code for new
 platforms)
In-Reply-To: <97916c54-b30b-c366-a8c5-38673c924a5c@adaptrum.com>
References: <97916c54-b30b-c366-a8c5-38673c924a5c@adaptrum.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f45ce545-4e12-7d90-2c5f-7465024741df@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexandru,

On 08/11/2017 12:58 AM, Alexandru Gagniuc wrote:
> Hi,
> 
> Looking under arch/arc, I see the current way is to add a plat-[socname] for each 
> new SoC. However, it seems that plat-sim, and plat-tb10x are just place-holders 
> for the compatible bindings.
> 
> I was going to do the same for plat-anarion, which required an early boot 
> workaround. However, with Alexey's INTC patch, this workaround is no longer 
> required, so plat-anarion would become just another stub.
> 
> I don't like the idea of adding dead code whenever a new platform arrives. My 
> thought is to merge these into a plat-generic, and add the following two 
> compatible bindings:
> * "snps,arccompact-generic"
> * "snps,arcv2-generic"
> Keep the existing bindings for compatibility reasons, but require all new 
> platforms that don't need boot stubs to use one of the generic .compatible 
> bindings. Do you agree with the plan?

Your proposal is reasonable but I'd still prefer the explicit platform/soC binding 
for calling out the various arc based platforms if nothing else !

However the boilerplate code can be pretty minimal ! If the platform is simple 
enough, no need for any new Kconfig entries. I've already eliminated 
CONFIG_ARC_PLAT_SIM (look at my #for-curr in kernel.org repo / linux-next)
So you just need to
1. create  plat-xxx/{Makefile, platform.c} and a simple board description in latter.
2. And add this platform unconditionally to arch/arc/Makefile

Does that work for you ?

-Vineet
