From: vgupta@synopsys.com (Vineet Gupta)
Date: Sun, 13 Aug 2017 22:44:33 +0530
Subject: Adding new ARC platforms (was Re: Handling stub code for new
 platforms)
In-Reply-To: <d4e20a2b-e269-45f1-0d83-d3ef8dcfdc4b@adaptrum.com>
References: <97916c54-b30b-c366-a8c5-38673c924a5c@adaptrum.com>
 <f45ce545-4e12-7d90-2c5f-7465024741df@synopsys.com>
 <d4e20a2b-e269-45f1-0d83-d3ef8dcfdc4b@adaptrum.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5fac8c45-b644-d0fe-86ef-82d91382d81c@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/11/2017 10:55 PM, Alexandru Gagniuc wrote:
>> Does that work for you ?
> 
> I was hoping to avoid the addition of extra source files for zero code gain, 
> though your proposal does work. However, since the platform would be added 
> unconditionally, would it make more sense to add the
> .compatible = "adaptrum,anarion"
> binding to plat-nsim instead of creating new files?

Yeah that is indeed better.

But we have a convention to name SoC binding starting with arc-*.
Look at other ARC SoC bindings.

-Vineet
