From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 13 Aug 2018 17:39:52 +0000
Subject: [PATCH v2 0/4] ARC: allow to use IOC and non-IOC DMA devices
 simultaneously
References: <20180730162636.3556-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B08C82C@us01wembx1.internal.synopsys.com>
 <1534181238.3962.74.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B08C903@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/13/2018 10:27 AM, Eugeniy Paltsev wrote:
>> You didn't pay attention to my previous comment on this !
>> IOC port can be considered a micro-architecture optimization (an important one
>> though). The main thing is hardware snooping DMA transactions which enabled IOC in
>> first place.
> Ok, I'll rewrite this commit message.

No need since this is a cover letter and will get dropped anyways, but the reason
I emphasize it is that it sets the wrong expectations for someone down the line
googling for this stuff ! And that someone could be other or just us when we've
long forgotten about this ;-)

>
>>> Some recent SoC with ARC HS (like HSDK) allow to select bus
>>> port (IOC or non-IOC port) for connecting DMA devices in runtime.
>> Again you mention the port but none of your 4 patches actually touch the port
>> itself in programming it.
> Ok.
>
