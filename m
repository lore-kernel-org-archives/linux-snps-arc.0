From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 20 Dec 2018 18:45:48 +0000
Subject: [PATCH 2/2] ARC: show_regs: fix lockdep splat for good
References: <1545159239-30628-1-git-send-email-vgupta@synopsys.com>
 <1545159239-30628-3-git-send-email-vgupta@synopsys.com>
 <20181220130450.GB17350@dhcp22.suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642389B@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/20/18 5:04 AM, Michal Hocko wrote:
> On Tue 18-12-18 10:53:59, Vineet Gupta wrote:
>> signal handling core calls ARCH show_regs() with preemption disabled
>> which causes __might_sleep functions such as mmput leading to lockdep
>> splat.  Workaround by re-enabling preemption temporarily.
>>
>> This may not be as bad as it sounds since the preemption disabling
>> itself was introduced for a supressing smp_processor_id() warning in x86
>> code by commit 3a9f84d354ce ("signals, debug: fix BUG: using
>> smp_processor_id() in preemptible code in print_fatal_signal()")
> The commit you are referring to here sounds dubious in itself.

Indeed that was my thought as well, but it did introduce the preemption disabling
logic aroung core calling show_regs() !

> We do not
> want to stick a preempt_disable just to silence a warning.

I presume you are referring to original commit, not my anti-change in ARC code,
which is actually re-enabling it.

> show_regs is
> called from preemptible context at several places (e.g. __warn).

Right, but do we have other reports which show this, perhaps not too many distros
have CONFIG__PREEMPT enabled ?

> Maybe
> this was not the case in 2009 when the change was introduced but this
> seems like a relict from the past. So can we fix the actual problem
> rather than build on top of it instead?

The best/correct fix is to remove the preempt diabling in core code, but that
affects every arch out there and will likely trip dormant land mines, needed
localized fixes like I'm dealing with now.

-Vineet
