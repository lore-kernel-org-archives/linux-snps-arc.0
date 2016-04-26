From: Lada.Trimasova@synopsys.com (Lada Trimasova)
Date: Tue, 26 Apr 2016 10:57:35 +0000
Subject: Misleading hint to select CONFIG_PERF_EVENTS if driver sets
 PERF_PMU_CAP_NO_INTERRUPT
In-Reply-To: <1461331523.3403.11.camel@synopsys.com>
References: <1461331523.3403.11.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1461668255.22058.3.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

I wonder if there are any thoughts about this question.
Please treat this as a polite reminder to take a look to this problem.

Regards,
Lada

On Fri, 2016-04-22@16:25 +0300, Lada Trimasova wrote:

I have a question about user-space perf handling error numbers.
The problem is that PMU interrupts are not supported in arc700
architecture and it is impossible to evaluate `perf record` command.
In our perf implementation we set PERF_PMU_CAP_NO_INTERRUPT flag so
core perf infrastructure knows we don't have interrupts.

Kernel `sys_perf_event_open` handler checks if PMU interrupts are
supported and returns ENOTSUPP (524) error code.
I'd expect that perf implementation checks the return value of syscalls
and gives the user understandable error message.
But now I see:
--------------------------------->8-----------------------------------
# perf record ls
The sys_perf_event_open() syscall returned with 524 (Unknown error 524)
for event (cycles:ppp).
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
Lada Trimasova.em
