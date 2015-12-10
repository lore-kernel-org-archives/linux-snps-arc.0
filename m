From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 10 Dec 2015 14:16:14 +0000
Subject: kisskb: FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Dec
 10, 17:33
In-Reply-To: <566945CF.5000807@synopsys.com>
References: <20151210063403.1.54732@94a655e5a217>
 <C2D7FE5348E1B147BCA15975FBA23075F44D53D7@IN01WEMBXA.internal.synopsys.com>
 <1449738241.7156.1.camel@ellerman.id.au> <566945CF.5000807@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449756974.4047.3.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Michael,

On Thu, 2015-12-10@14:58 +0530, Vineet Gupta wrote:
> On Thursday 10 December 2015 02:34 PM, Michael Ellerman wrote:
> 
> > That is weird. I'll ask it to rebuild it and see if it happens again.
> > 
> > Do you build with -j?
> 
> I did now - but still no error at my end.

I always build our kernels with -j4 or even -j8 depending on the machine I use
and I've never seen issues with parallel building.

Latest I tried was 4.4-rc4.

-Alexey
