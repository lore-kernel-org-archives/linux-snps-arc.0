From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 10 Dec 2015 14:58:47 +0530
Subject: kisskb: FAILED linux-next/axs103_smp_defconfig/arcv2 Thu Dec 10,
 17:33
In-Reply-To: <1449738241.7156.1.camel@ellerman.id.au>
References: <20151210063403.1.54732@94a655e5a217>
 <C2D7FE5348E1B147BCA15975FBA23075F44D53D7@IN01WEMBXA.internal.synopsys.com>
 <1449738241.7156.1.camel@ellerman.id.au>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <566945CF.5000807@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 10 December 2015 02:34 PM, Michael Ellerman wrote:

> That is weird. I'll ask it to rebuild it and see if it happens again.
> 
> Do you build with -j?

I did now - but still no error at my end.


>> From looking at logs it looks like some sort of a make / paralle jobs timing issue
>> at build farm.
>>
>> P.S. Could you also update system to also cc lkml and
>> linux-snps-arc at lists.infradead.org for such errors.
> 
> I'll add the arc list, I don't like to cc lkml so as not to annoy people with
> too many error mails.

OK - thx.

-Vineet
