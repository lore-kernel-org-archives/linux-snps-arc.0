From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 10 Nov 2016 14:12:36 -0800
Subject: [PATCH v3 10/10] clocksource: import ARC timer driver
In-Reply-To: <20161110104901.GA18678@mai>
References: <1478216015-18931-1-git-send-email-vgupta@synopsys.com>
 <1478216015-18931-11-git-send-email-vgupta@synopsys.com>
 <20161110104901.GA18678@mai>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <02428cac-602f-087d-a96b-6286e848f614@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/10/2016 02:49 AM, Daniel Lezcano wrote:
> On Thu, Nov 03, 2016@04:33:35PM -0700, Vineet Gupta wrote:
>> This adds support for
>>
>>  - CONFIG_ARC_TIMERS : legacy 32-bit TIMER0 and TIMER1 which count UP
>>    from @CNT to @LIMIT, before optionally triggering an interrupt.
>>    These are programmed using ARC auxiliary register interface.
>>    These are present in all ARC cores (ARC700 and ARC HS38)
>>    TIMER0 serves as clockevent for all ARC linux builds.
>>    TIMER1 is used for clocksource in arc700 builds.
>>
>>  - CONFIG_ARC_TIMERS_64BIT: 64-bit counters, RTC and GFRC found in
>>    ARC HS38 cores. These are independnet IP blocks with different
>>    programming model respectively.
>>
>> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>> ---
> 
> [ ... ]
> 
>>  config ARC
>>  	def_bool y
>> +	select ARC_TIMERS
>>  	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
>>  	select BUILDTIME_EXTABLE_SORT
>> -	select CLKSRC_OF
>>  	select CLONE_BACKWARDS
>>  	select COMMON_CLK
>>  	select GENERIC_ATOMIC64 if !ISA_ARCV2 || !(ARC_HAS_LL64 && ARC_HAS_LLSC)
>> @@ -115,6 +115,7 @@ config ISA_ARCOMPACT
>>  
>>  config ISA_ARCV2
>>  	bool "ARC ISA v2"
>> +	select ARC_TIMERS_64BIT
>>  	help
>>  	  ISA for the Next Generation ARC-HS cores
>>  
>> @@ -410,10 +411,6 @@ config ARC_HAS_DIV_REM
>>  	bool "Insn: div, divu, rem, remu"
>>  	default y
>>  
>> -config ARC_TIMERS_64BIT
>> -	bool "64-bit r/o cycle counters RTC (up) and GFRC (smp)"
>> -	default y
>> -
>>  config ARC_NUMBER_OF_INTERRUPTS
>>  	int "Number of interrupts"
>>  	range 8 240
>> diff --git a/arch/arc/kernel/Makefile b/arch/arc/kernel/Makefile
>> index cfcdedf52ff8..8942c5c3b4c5 100644
>> --- a/arch/arc/kernel/Makefile
>> +++ b/arch/arc/kernel/Makefile
>> @@ -8,7 +8,7 @@
>>  # Pass UTS_MACHINE for user_regset definition
>>  CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
>>  
>> -obj-y	:= arcksyms.o setup.o irq.o time.o reset.o ptrace.o process.o devtree.o
>> +obj-y	:= arcksyms.o setup.o irq.o reset.o ptrace.o process.o devtree.o
>>  obj-y	+= signal.o traps.o sys.o troubleshoot.o stacktrace.o disasm.o
>>  obj-$(CONFIG_ISA_ARCOMPACT)		+= entry-compact.o intc-compact.o
>>  obj-$(CONFIG_ISA_ARCV2)			+= entry-arcv2.o intc-arcv2.o
>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>> index e2c6e43cf8ca..a53bd50164e7 100644
>> --- a/drivers/clocksource/Kconfig
>> +++ b/drivers/clocksource/Kconfig
>> @@ -282,6 +282,25 @@ config CLKSRC_MPS2
>>  	select CLKSRC_MMIO
>>  	select CLKSRC_OF
>>  
>> +config ARC_TIMERS
>> +	bool "Support for 32-bit TIMERn counters in ARC Cores" if COMPILE_TEST
>> +	depends on GENERIC_CLOCKEVENTS
>> +	select CLKSRC_OF
>> +	help
>> +	  These are legacy 32-bit TIMER0 and TIMER1 counters found on all ARC cores
>> +	  (ARC700 as well as ARC HS38).
>> +	  TIMER0 serves as clockevent while TIMER1 provides clocksource
>> +
>> +config ARC_TIMERS_64BIT
>> +	bool "Support for 64-bit counters in ARC HS38 cores" if COMPILE_TEST
>> +	depends on GENERIC_CLOCKEVENTS
>> +	select CLKSRC_OF
>> +	help
>> +	  This enables 2 different 64-bit timers: RTC (for UP) and GFRC (for SMP)
>> +	  RTC is implemented inside the core, while GFRC sits outside the core in
>> +	  ARConnect IP block. Driver automatically picks one of them for clocksource
>> +	  as appropriate.
>> +
>>  config ARM_ARCH_TIMER
>>  	bool
>>  	select CLKSRC_OF if OF
>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
>> index cf87f407f1ad..a14111e1f087 100644
>> --- a/drivers/clocksource/Makefile
>> +++ b/drivers/clocksource/Makefile
>> @@ -51,6 +51,7 @@ obj-$(CONFIG_CLKSRC_TI_32K)	+= timer-ti-32k.o
>>  obj-$(CONFIG_CLKSRC_NPS)	+= timer-nps.o
>>  obj-$(CONFIG_OXNAS_RPS_TIMER)	+= timer-oxnas-rps.o
>>  
>> +obj-$(CONFIG_ARC_TIMERS)		+= arc_timer.o
> 
> I don't see arc_timer.o compiled if ARC_TIMERS_64BIT only is set.
> 
> Wouldn't make sense to fold ARC_TIMERS and ARC_TIMERS_64BIT ?

>From ARC point of view that would be an invalid configuration as the base TIMER0
is set up as clockevent in all configurations and cores and is needed independent
of 64 timers being there or not. So better to add that as explicit dependency here
which would also address the build issue you raise.

Thx,
-Vineet
