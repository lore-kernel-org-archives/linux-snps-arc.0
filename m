From: alex.g@adaptrum.com (Alexandru Gagniuc)
Date: Thu, 10 Aug 2017 12:28:14 -0700
Subject: Handling stub code for new platforms
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <97916c54-b30b-c366-a8c5-38673c924a5c@adaptrum.com>
To: linux-snps-arc@lists.infradead.org

Hi,

Looking under arch/arc, I see the current way is to add a plat-[socname] 
for each new SoC. However, it seems that plat-sim, and plat-tb10x are 
just place-holders for the compatible bindings.

I was going to do the same for plat-anarion, which required an early 
boot workaround. However, with Alexey's INTC patch, this workaround is 
no longer required, so plat-anarion would become just another stub.

I don't like the idea of adding dead code whenever a new platform 
arrives. My thought is to merge these into a plat-generic, and add the 
following two compatible bindings:
* "snps,arccompact-generic"
* "snps,arcv2-generic"
Keep the existing bindings for compatibility reasons, but require all 
new platforms that don't need boot stubs to use one of the generic 
.compatible bindings. Do you agree with the plan?

Alex
