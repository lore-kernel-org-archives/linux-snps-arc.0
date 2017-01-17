From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 17 Jan 2017 14:14:02 -0800
Subject: [PATCH 4/4] ARCv2: smp-boot: MCIP: use Inter-Core-Debug unit to
 kick start non master cpus
In-Reply-To: <4881796E12491D4BB15146FE0209CE646789B05F@DE02WEMBXB.internal.synopsys.com>
References: <1484600277-32345-1-git-send-email-vgupta@synopsys.com>
 <1484600277-32345-5-git-send-email-vgupta@synopsys.com>
 <4881796E12491D4BB15146FE0209CE646789B05F@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a0bb5549-452b-5523-c458-88862b7c48ee@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 01/17/2017 01:41 PM, Alexey Brodkin wrote:
> 
> Has this one passed checkpatch? Above "{" on the same line as function name
> and closing one merged with the previous line look strange.

Nope - I didn't :-(
I will fix it. Thx for spotting this.

>> +	 */
>> +	if (mp.dbg)
>> +		asm volatile("flag 1	\n");
> 
> Are you sure that won't trigger MDB stop?

Yes and why is that a problem. mdb can start all cores and they are free to self
halt themselves for any reason whatsoever. In corresponding disassembly window(s),
such cores will be parked on the flag 1 instruction.

> I would imagine if MDB saw coreX running and then it unexpectedly [for MDB] gets halted
> MDB stops, no? Essentially I'm talking about properly set CPMD session.
> 
> I have no board handy ATM so just thinking out loud.

This series has been smoke tested on AXS103 hardware with quad core bitfile.


>> +	.cpu_kick	= mcip_cpu_kick,
>> +#ifndef CONFIG_ARC_SMP_HALT_ON_RESET
> 
> I really hate compile-time defined stuff and would prefer to remove most of that
> stuff at least in ARC code instaed of adding more items that stops us from using
> the same binary on wider range of ARC cores.

Right, I live by that mantra too - but halt-on-reset and run-reset is not
something we can derive from any build info - it is SoC specific. And
unfortunately they imply different semantics.

> In 2/4 you already do check if core was configured [actually Linux kernel was configured but not the HW]
> -------------------------->8-------------------------
> if (IS_ENABLED(CONFIG_ARC_SMP_HALT_ON_RESET))
> -------------------------->8-------------------------
> so "plat_smp_ops.cpu_wait(cpu)" won't be executed anyways.
> 
>> +	.cpu_wait	= mcip_cpu_wait,
>> +#endif
>>  };
> 

As I mention in the prev reply, #ifdef in 2/4 is independent of any MCIP wait or
not - it needs to be there for a different reason. Here, the #ifdef ensured we
don't plug in MCIP specific wait routine - which will halt the cores - which is
not needed if they already halted on reset.


> So why don't we implement it all much simpler regardless CONFIG_ARC_SMP_HALT_ON_RESET?
> Like that:
> -------------------------->8-------------------------
> static void __init mcip_cpu_wait(int cpu)
> {
> 	struct mcip_bcr mp;
> 
> 	/* Check if master has already set "wake_flag" wanting us to run */
> 	if (wake_flag != cpu) { // or similar construction if we switch to bitfield
> 
> 		READ_BCR(ARC_REG_MCIP_BCR, mp);
> 
> 		/*
> 		 * self halt for waiting as Master will resume us using MCIP ICD assist
> 		 * Note: if ICD is not configured, we are hosed, but panic here is
> 		 *       not going to help as UART access might not even work
> 		 */
> 		if (mp.dbg)
> 			asm volatile("flag 1	\n");
> 	}
> }

My design is to keep 2 implementations if wait-wake protocol.
In absence of mcip ICD hardware assist, there is the original polling on wake_flag
based mechanism. If mcip ICD exists we use that instead and do away with any
polling on memory. This is specially important since for IOC setup the polling on
memory just can;t be done as it causes traffic on coherency fabric. Arguably we
could uncached polling but why even bother.

We don't mix the 2 approaches - which you seem to be implying here.


> -------------------------->8-------------------------
> 
> And I think we may then keep mcip_cpu_kick() as it is.
> In ARConnect databook there's no mention of side-effects for CMD_DEBUG_RUN being used
> against already running core.
> 
> IMHO with this approach we'll be able to handle cases when [pre-]bootloader inverted HALT/RUN_ON_RESET state.
> 
> -Alexey
> 
