From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 6 Jun 2017 14:57:56 -0700
Subject: [PATCH 10/10] ARC: [plat-eznps] Handle memory error as an
 exception
In-Reply-To: <1495711858.5393.37.camel@synopsys.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
 <1495679660-9598-11-git-send-email-noamca@mellanox.com>
 <1495710896.5393.32.camel@synopsys.com>
 <DB5PR05MB1638C447032283FC639A30E8AAFF0@DB5PR05MB1638.eurprd05.prod.outlook.com>
 <1495711858.5393.37.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <9f077709-d6e0-dad8-4555-14ecfa9fbbbc@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 05/25/2017 04:30 AM, Alexey Brodkin wrote:
> Hi Noam,
> 
> On Thu, 2017-05-25@11:26 +0000, Noam Camus wrote:
>>> From: Alexey Brodkin [mailto:Alexey.Brodkin at synopsys.com]
>>> Sent: Thursday, May 25, 2017 14:15 PM
>>>>
>>>> diff --git a/arch/arc/kernel/entry-compact.S
>>>> b/arch/arc/kernel/entry-compact.S index f285dbb..d152d36 100644
>>>> --- a/arch/arc/kernel/entry-compact.S
>>>> +++ b/arch/arc/kernel/entry-compact.S
>>>> @@ -203,6 +203,17 @@ END(handle_interrupt_level2)
>>>>   ; ---------------------------------------------
>>>>   ENTRY(mem_service)
>>>>   
>>>> +#if defined(CONFIG_EZNPS_MEM_ERROR)
>>>> +        ; SW workaround to cover up on a difference between
>>>> +        ; NPS real chip and simulator behaviors.
>>>> +        ; NPS real chip will activate a machine check exception
>>>> +        ; in case of memory error, while the simulator will
>>>> +        ; trigger a level 2 interrupt. Therefor this code section
>>>> +        ; should be reached only in simulation mode.
>>>> +        ; DEAD END: display Regs and HALT
>>> I'm not really buying that.
>>> Why don't you just make simulator behaving exactly as your real chip?
>> I can't change simulator core behavior. nSIM is a Synopsys proprietary code.
> Well probably it worth discussing with nSIM team if they may have any suggestions
> on how to align nSIM behavior with your real HW?

For the record we can't change nSIM since the NPS behavioral is not aligned with 
stock ARC700.

stock ARC700 triggers an L2 interrupt for user space bus errors - weird but that 
is what it is and what kernel currently supports (as verified by IPPK folks when 
doing DDR controller testing from user space).

NPS triggers does machine check which is not correct hence this workaround !

-Vineet
