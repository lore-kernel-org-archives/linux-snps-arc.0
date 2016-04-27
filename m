From: Lada.Trimasova@synopsys.com (Lada Trimasova)
Date: Wed, 27 Apr 2016 15:13:50 +0000
Subject: Misleading hint to select CONFIG_PERF_EVENTS if driver sets
 PERF_PMU_CAP_NO_INTERRUPT
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E9F42D@us01wembx1.internal.synopsys.com>
References: <1461331523.3403.11.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E9F42D@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1461770030.5970.8.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2016-04-26@12:42 +0000, Vineet Gupta wrote:

On Friday 22 April 2016 06:56 PM, Lada Trimasova wrote:
I think what we have now is sufficient - but u seem to want a prettier failure output.

Anyhow, this print is coming from util/evsel.c: perf_evsel__open_strerror()
At the very least you want another entry in switch case for ENOTSUPP and then
check if event was sampling one (
evsel->attr.sample_period) - use that as a hint for saying sampling events not
supported.




ENOTSUPP is not visible for user programs. So it's impossible to add this entry

to mentioned switch.

I think that there is no good way to make error message more understandable

without breaking existing api.


But this will print the same even if CONFIG_PERF_EVENTS=n. To really fix this you
would want to change the error code returned by SYSCALL_DEFINE5(perf_event_open
for PERF_PMU_CAP_NO_INTERRUPT to say -EOPNOTSUPP and use the sample_period to say
this was for samplign events! However this is an ABI change and might not be
acceptable as some existing scripts etc might break.



/bin/dmesg may provide additional information.
No CONFIG_PERF_EVENTS=y kernel support configured?
--------------------------------->8-----------------------------------

As you can see the root cause of this error message is not obvious.
CONFIG_PERF_EVENTS is selected but still there's a problem while
existing suggestion barely makes any sense.
So probably there could be a way to determine if CONFIG_PERF_EVENTS was
selected or not.

I am not sure about the correct way of solving this problem. Maybe I
should add some checks of syscalls return values and give user
a warning when not PMU interrupts are available.
Any suggestions are appreciated.

Regards,
Lada Trimasova.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc at lists.infradead.org<mailto:linux-snps-arc at lists.infradead.org>
http://lists.infradead.org/mailman/listinfo/linux-snps-arc





Regards,

Lada.
