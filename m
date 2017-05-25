From: noamca@mellanox.com (Noam Camus)
Date: Thu, 25 May 2017 11:26:32 +0000
Subject: [PATCH 10/10] ARC: [plat-eznps] Handle memory error as an
 exception
In-Reply-To: <1495710896.5393.32.camel@synopsys.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
 <1495679660-9598-11-git-send-email-noamca@mellanox.com>
 <1495710896.5393.32.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR05MB1638C447032283FC639A30E8AAFF0@DB5PR05MB1638.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

> From: Alexey Brodkin [mailto:Alexey.Brodkin at synopsys.com] 
> Sent: Thursday, May 25, 2017 14:15 PM

>> 
>> diff --git a/arch/arc/kernel/entry-compact.S 
>> b/arch/arc/kernel/entry-compact.S index f285dbb..d152d36 100644
>> --- a/arch/arc/kernel/entry-compact.S
>> +++ b/arch/arc/kernel/entry-compact.S
>> @@ -203,6 +203,17 @@ END(handle_interrupt_level2)
>> ?; ---------------------------------------------
>> ?ENTRY(mem_service)
>> ?
>> +#if defined(CONFIG_EZNPS_MEM_ERROR)
>> +????????; SW workaround to cover up on a difference between
>> +????????; NPS real chip and simulator behaviors.
>> +????????; NPS real chip will activate a machine check exception
>> +????????; in case of memory error, while the simulator will
>> +????????; trigger a level 2 interrupt. Therefor this code section
>> +????????; should be reached only in simulation mode.
>> +????????; DEAD END: display Regs and HALT

>I'm not really buying that.

>Why don't you just make simulator behaving exactly as your real chip?
I can't change simulator core behavior. nSIM is a Synopsys proprietary code.

>Adding those stubs for some corner-cases here and there complicate code, affect maintainability etc.
I agree, any suggestions to still have this but with reduced cost?

-Noam
