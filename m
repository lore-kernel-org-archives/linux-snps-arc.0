From: vgupta@synopsys.com (Vineet Gupta)
Date: Tue, 8 Mar 2016 21:16:27 +0530
Subject: [PATCH] mm: slub: Ensure that slab_unlock() is atomic
In-Reply-To: <alpine.DEB.2.20.1603080857360.4047@east.gentwo.org>
References: <1457447457-25878-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1603080857360.4047@east.gentwo.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56DEF3D3.6080008@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 08 March 2016 08:30 PM, Christoph Lameter wrote:
> On Tue, 8 Mar 2016, Vineet Gupta wrote:
> 
>> This in turn happened because slab_unlock() doesn't serialize properly
>> (doesn't use atomic clear) with a concurrent running
>> slab_lock()->test_and_set_bit()
> 
> This is intentional because of the increased latency of atomic
> instructions. Why would the unlock need to be atomic? This patch will
> cause regressions.
> 
> Guess this is an architecture specific issue of modified
> cachelines not becoming visible to other processors?

Absolutely not - we verified with the hardware coherency tracing that there was no
foul play there. And I would dare not point finger at code which was last updated
in 2011 w/o being absolutely sure.

Let me explain this in bit more detail. Like I mentioned in commitlog, this config
of ARC doesn't have exclusive load/stores (LLOCK/SCOND) so atomic ops are
implemented using a "central" spin lock. The spin lock itself is implemented using
EX instruction (atomic R-W)

Generated code for slab_lock() - essentially bit_spin_lock() is below (I've
removed generated code for CONFIG_PREEMPT for simplicity)

80543b0c <slab_lock>:
80543b0c:	push_s     blink
...
80543b3a:	mov_s      r15,0x809de168   <-- @smp_bitops_lock
80543b40:	mov_s      r17,1
80543b46:	mov_s      r16,0

# spin lock() inside test_and_set_bit() - see arc bitops.h (!LLSC code)
80543b78:	clri       r4
80543b7c:	dmb        3
80543b80:	mov_s      r2,r17
80543b82:	ex         r2,[r15]
80543b86:	breq       r2,1,80543b82
80543b8a:	dmb        3

# set the bit
80543b8e:	ld_s       r2,[r13,0] <--- (A) Finds PG_locked is set
80543b90:	or         r3,r2,1    <--- (B) other core unlocks right here
80543b94:	st_s       r3,[r13,0] <--- (C) sets PG_locked (overwrites unlock)

# spin_unlock
80543b96:	dmb        3
80543b9a:	mov_s      r3,r16
80543b9c:	ex         r3,[r15]
80543ba0:	dmb        3
80543ba4:	seti       r4

# check the old bit
80543ba8:	bbit0      r2,0,80543bb8   <--- bit was set, branch not taken
80543bac:	b_s        80543b68        <--- enter the test_bit() loop

   80543b68:	ld_s       r2,[r13,0]	   <-- (C) reads the bit, set by SELF
   80543b6a:	bbit1    r2,0,80543b68              spins infinitely

...


Now using hardware coherency tracing (and using the cycle timestamps) we verified
(A) and (B)

Thing is with exclusive load/store this race can't just happen since the
intervening ST will cause the ST in (C) to NOT commit and the LD/ST will be retried.

And there will be very few production systems which are SMP but lack exclusive
load/stores.

Are you convinced now !

-Vineet
