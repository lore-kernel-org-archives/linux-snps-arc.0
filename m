From: paulmck@linux.ibm.com (Paul E. McKenney)
Date: Thu, 6 Jun 2019 14:17:36 -0700
Subject: single copy atomicity for double load/stores on 32-bit systems
In-Reply-To: <8d1666df180d4d01aaebb5d41370b338@AcuMS.aculab.com>
References: <2fd3a455-6267-5d21-c530-41964a4f6ce9@synopsys.com>
 <20190531082112.GH2623@hirez.programming.kicks-ass.net>
 <C2D7FE5348E1B147BCA15975FBA2307501A2522B5B@us01wembx1.internal.synopsys.com>
 <20190603201324.GN28207@linux.ibm.com>
 <CAMuHMdW-8Jt80mSyHTYmj6354-3f1=Vp_8dY-Nite1ERpUCFew@mail.gmail.com>
 <20190606094340.GD28207@linux.ibm.com>
 <8d1666df180d4d01aaebb5d41370b338@AcuMS.aculab.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190606211736.GW28207@linux.ibm.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Jun 06, 2019@04:34:52PM +0000, David Laight wrote:
> From: Paul E. McKenney
> > Sent: 06 June 2019 10:44
> ...
> > But m68k is !SMP-only, correct?  If so, the only issues would be
> > interactions with interrupt handlers and the like, and doesn't current
> > m68k hardware use exact interrupts?  Or is it still possible to interrupt
> > an m68k in the middle of an instruction like it was in the bad old days?
> 
> Hardware interrupts were always on instruction boundaries, the
> mid-instruction interrupts would only happen for page faults (etc).

OK, !SMP should be fine, then.

> There were SMP m68k systems (but I can't remember one).
> It was important to continue from a mid-instruction trap on the
> same cpu - unless you could guarantee that all the cpus had
> exactly the same version of the microcode.

Yuck!  ;-)

> In any case you could probably use the 'cmp2' instruction
> for an atomic 64bit write.
> OTOH setting that up was such a PITA it was always easier
> to disable interrupts.

Unless I am forgetting something, given that m68k is a 32-bit system,
we should be OK without an atomic 64-bit write.

							Thanx, Paul
