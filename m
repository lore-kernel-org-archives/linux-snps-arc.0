From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 12 Mar 2019 11:03:55 -0700
Subject: [PATCH 00/14] entry: preempt_schedule_irq() callers scrub
In-Reply-To: <20190311224752.8337-1-valentin.schneider@arm.com>
References: <20190311224752.8337-1-valentin.schneider@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e604601e-f8e1-a8b5-d364-69ca967996ce@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 3/11/19 3:47 PM, Valentin Schneider wrote:
> Hi,
> 
> This is the continuation of [1] where I'm hunting down
> preempt_schedule_irq() callers because of [2].
> 
> I told myself the best way to get this moving forward wouldn't be to write
> doc about it, but to go write some fixes and get some discussions going,
> which is what this patch-set is about.
> 
> I've looked at users of preempt_schedule_irq(), and made sure they didn't
> have one of those useless loops. The list of offenders is:
> 
> $ grep -r -I "preempt_schedule_irq" arch/ | cut -d/ -f2 | sort | uniq
> 
...

> 
> Regarding that loop, archs seem to fall in 3 categories:
> A) Those that don't have the loop

Please clarify that this is the right thing to do (since core code already has the
loop) hence no fixing is required for this "category"

> B) Those that have a small need_resched() loop around the
>    preempt_schedule_irq() callsite
> C) Those that branch to some more generic code further up the entry code
>    and eventually branch back to preempt_schedule_irq()
> 
> arc, m68k, nios2 fall in A)

> sparc, ia64, s390 fall in C)
> all the others fall in B)
> 
> I've written patches for B) and C) EXCEPT for ia64 and s390 because I
> haven't been able to tell if it's actually fine to kill that "long jump"
> (and maybe I'm wrong on sparc). Hopefully folks who understand what goes on
> in there might be able to shed some light.
