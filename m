From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 19 Feb 2019 15:30:19 -0800
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
In-Reply-To: <4881796E12491D4BB15146FE0209CE64681EECE5@DE02WEMBXB.internal.synopsys.com>
References: <20190208105519.26750-1-abrodkin@synopsys.com>
 <81017fe4-b31f-4942-e822-a7b70008b74d@synopsys.com>
 <f83412d1e7fd4d67b4632c1f81fae963@AcuMS.aculab.com>
 <bfc65835-21f9-6d5e-791d-ee49113d939c@synopsys.com>
 <20190213125651.GP32494@hirez.programming.kicks-ass.net>
 <e6138aeb-9ce4-fbfa-4d6a-b76f189a3e47@synopsys.com>
 <4881796E12491D4BB15146FE0209CE64681DB01F@DE02WEMBXB.internal.synopsys.com>
 <e4aed55f-656b-ebec-c3e3-393714cc693e@synopsys.com>
 <4881796E12491D4BB15146FE0209CE64681EECE5@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d20680b3-f71e-9eb7-f79c-660e25673d82@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 2/18/19 12:53 AM, Alexey Brodkin wrote:
> So are you OK with this patch or something should be done before applying?

Or your original patch was

+#ifdef CONFIG_ARC_HAS_LL64
+#define ARCH_SLAB_MINALIGN     8
+#endif

I don't think this issue is related to LL64 at all. A long long on ARC could be 4
byte aligned (as mandated by the ABI). It could use LDD or 2 separate LDs. This
has no bearing on the fact that LLOCKD have to use a 64-bit aligned addresses. So
I think we should just do this unconditionally. Agree ?
