From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 1 Sep 2017 09:05:51 -0700
Subject: [PATCH v2] arc: Re-enable MMU upon die()
In-Reply-To: <076df89b-1fb1-bf15-3f81-2ac7a4169b18@synopsys.com>
References: <12fbfb3099623ae8044f48983bfa58321495cf79.1504281470.git.joabreu@synopsys.com>
 <076df89b-1fb1-bf15-3f81-2ac7a4169b18@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <9dc23712-b8ea-9f4e-d2c1-a8149157af16@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/01/2017 09:01 AM, Jose Abreu wrote:
> Oops, the commit title is now a little bit odd. Let me rephrase
> and send a new version.

Don't worry - I'll fix it up here !

Thx,
-Vineet

>
> On 01-09-2017 17:00, Jose Abreu wrote:
>> I recently came upon a scenario where I would get a double fault
>> after a machine check error. It turns out that for Ksymbol lookup
>> to work with modules we need to have MMU enabled because module
>> address is mapped in the cached space.
>>
>> This patch re-enables the MMU before start printing the stacktrace
>> making stacktracing of modules work upon a fatal exception.
>>
>> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
>> Cc: Vineet Gupta <vgupta at synopsys.com>
>> Cc: Alexey Brodkin <abrodkin at synopsys.com>
>>
>> Changes from v1:
>> 	- Moved MMU re-enable to machine check exception handler
>> ---
>>   arch/arc/kernel/traps.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arc/kernel/traps.c b/arch/arc/kernel/traps.c
>> index ff83e78..d92f161 100644
>> --- a/arch/arc/kernel/traps.c
>> +++ b/arch/arc/kernel/traps.c
>> @@ -19,6 +19,8 @@
>>   #include <linux/ptrace.h>
>>   #include <linux/kprobes.h>
>>   #include <linux/kgdb.h>
>> +#include <asm/arcregs.h>
>> +#include <asm/mmu.h>
>>   #include <asm/setup.h>
>>   #include <asm/unaligned.h>
>>   #include <asm/kprobes.h>
>> @@ -103,6 +105,9 @@ int do_misaligned_access(unsigned long address, struct pt_regs *regs,
>>    */
>>   void do_machine_check_fault(unsigned long address, struct pt_regs *regs)
>>   {
>> +	/* MMU must be enabled for Ksymbol lookup in modules */
>> +	write_aux_reg(ARC_REG_PID, MMU_ENABLE | read_aux_reg(ARC_REG_PID));
>> +
>>   	die("Machine Check Exception", regs, address);
>>   }
>>   
>
