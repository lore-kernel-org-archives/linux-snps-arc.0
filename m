From: valentin.schneider@arm.com (Valentin Schneider)
Date: Tue, 12 Mar 2019 18:18:55 +0000
Subject: [PATCH 00/14] entry: preempt_schedule_irq() callers scrub
In-Reply-To: <e604601e-f8e1-a8b5-d364-69ca967996ce@synopsys.com>
References: <20190311224752.8337-1-valentin.schneider@arm.com>
 <e604601e-f8e1-a8b5-d364-69ca967996ce@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a5b1605b-b3b3-7898-30ae-d993050e8c7a@arm.com>
To: linux-snps-arc@lists.infradead.org

On 12/03/2019 18:03, Vineet Gupta wrote:
[...]
>> Regarding that loop, archs seem to fall in 3 categories:
>> A) Those that don't have the loop
> 
> Please clarify that this is the right thing to do (since core code already has the
> loop) hence no fixing is required for this "category"
> 

Right, those don't need any change. I had a brief look at them to double
check they had the proper need_resched() gate before calling
preempt_schedule_irq() (with no loop) and they all seem fine. Also...

>> B) Those that have a small need_resched() loop around the
>>    preempt_schedule_irq() callsite
>> C) Those that branch to some more generic code further up the entry code
>>    and eventually branch back to preempt_schedule_irq()
>>
>> arc, m68k, nios2 fall in A)
> 

I forgot to include parisc in here.

[...]
