From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 6 Oct 2016 10:10:47 -0700
Subject: [PATCH] ARCv2: intc: untangle SMP, MCIP and IDU
In-Reply-To: <1475745033.3301.5.camel@synopsys.com>
References: <1475699962-11711-1-git-send-email-vgupta@synopsys.com>
 <1475745033.3301.5.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <62f431fd-8c66-143b-2129-a1b996a0a98c@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/06/2016 02:10 AM, Alexey Brodkin wrote:
>> +struct mcip_bcr {
>> +#ifdef CONFIG_CPU_BIG_ENDIAN
>> +		unsigned int pad3:8,
>> +			     idu:1, llm:1, num_cores:6,
>> +			     iocoh:1,  gfrc:1, dbg:1, pad2:1,
>> +			     msg:1, sem:1, ipi:1, pad:1,
>> +			     ver:8;
>> +#else
>> +		unsigned int ver:8,
>> +			     pad:1, ipi:1, sem:1, msg:1,
>> +			     pad2:1, dbg:1, gfrc:1, iocoh:1,
>> +			     num_cores:6, llm:1, idu:1,
>> +			     pad3:8;
>> +#endif
>> +};
> 
> IMHO we should stop using this kind of constructions because they
> are ugly and what's more important not portable.

They are ugly I agree - but not portable - really ? The whole point is to make
this work on BE w/o changing the src code - this details remains hidden in an
obscure header.

> Even though we have it now working for both LE and BE configurations
> it won't work for 64-bit cores. We'll need to add ifdeffed 32-bit paddings
> then which will make that construction even more ugly.

When we get to 64-bit a lot things would have to change - and possibly the aux reg
layout. There is no way to make this exact code 64-bit ready !


> Probably that's not the right patch to address my complaint but just
> to reiterate this topic once again and think about clean-up series on
> that regard :)

Patches are welcome ;-)

-Vineet
