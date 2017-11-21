From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 21 Nov 2017 15:26:32 -0800
Subject: [PATCH 4/4] ARCv2: entry: Reduce perf intr return path
In-Reply-To: <4a28d9dc-b322-1a79-b1d1-c13db2f01ee7@synopsys.com>
References: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
 <1510092784-19942-5-git-send-email-vgupta@synopsys.com>
 <20171114102802.GA3165@worktop.lehotels.local>
 <8b2c70f0-fc51-fb9b-b799-9b85a3d3403b@gmail.com>
 <20171115101853.mtpamwkc5z4ptw2h@hirez.programming.kicks-ass.net>
 <4a28d9dc-b322-1a79-b1d1-c13db2f01ee7@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <64e093da-1778-f1ea-9eae-a1c2ce29556d@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/17/2017 03:42 PM, Vineet Gupta wrote:

>>>> What do you (on ARC) do about irq_work ?
>>>
> 
>> So the reason I'm asking is that some architectures that don't have NMIs
>> call irq_work_run() at the very end of their perf-interrupt handler (ARM
>> does this for instance).
> 
> But on ARC, we don't call irq_work_run() in perf intr return path and that seem to 
> imply it is broken - as in latency to service a perf induced preemption.

[snip...]

>>> Although I'm sure it is, can you please explain how irq_work is relevant in
>>> the context of this patch.
>>
>> Since the perf interrupt (in general) cannot call a whole lot of things
>> for it needs to assume running from NMI context, it needs to defer
>> things to a more regular context. It does this with irq_work.

So given my understanding of this topic, ARC (or any non NMI based perf intr 
system) is potentially broken without irq_work_run() ?

I can follow up with a patch for ARC, or does this need to addressed for others 
too - say irq_exit_perf() or some such ?
