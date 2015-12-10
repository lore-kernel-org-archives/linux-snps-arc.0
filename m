From: mpe@ellerman.id.au (Michael Ellerman)
Date: Thu, 10 Dec 2015 21:16:31 +1100
Subject: kisskb: FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Dec
 10, 17:33
In-Reply-To: <566945CF.5000807@synopsys.com>
References: <20151210063403.1.54732@94a655e5a217>
 <C2D7FE5348E1B147BCA15975FBA23075F44D53D7@IN01WEMBXA.internal.synopsys.com>
 <1449738241.7156.1.camel@ellerman.id.au> <566945CF.5000807@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449742591.7156.4.camel@ellerman.id.au>
To: linux-snps-arc@lists.infradead.org

On Thu, 2015-12-10@14:58 +0530, Vineet Gupta wrote:
> On Thursday 10 December 2015 02:34 PM, Michael Ellerman wrote:
> > That is weird. I'll ask it to rebuild it and see if it happens again.
> > 
> > Do you build with -j?
> 
> I did now - but still no error at my end.

OK.

It rebuilt OK the second time:

  http://kisskb.ozlabs.ibm.com/kisskb/buildresult/12564629/

So there might be a gremlin in the Makefiles somewhere.

cheers
