From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 20 Dec 2018 17:08:06 -0800
Subject: [PATCH 07/21] ARC: math soft float support
In-Reply-To: <alpine.DEB.2.21.1812182315580.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-8-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182315580.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e59bc8c5-cf0f-9968-cecf-caaf8b6def7a@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 3:23 PM, Joseph Myers wrote:
> On Tue, 18 Dec 2018, Vineet Gupta wrote:
> 
>> +#if defined(__ARC_FPU_SP__) || defined(__ARC_FPU_DP__)
> 
> Missing spaces before '(' (should have such spaces in most cases between 
> an identifier or keyword and '(' - calls to "defined", calls to functions, 
> calls to macros, __attribute__, etc. - except for a few cases of calls to 
> macros such as ElfW where the result is logically used like an 
> identifier).

OK, I removed the parens in this case (update: removed the guard altogether, see
below).

>> +/* In the soft-float case, only rounding to nearest is supported, with
>> +   no exceptions.  */
> 
> To confirm: hard-float and soft-float are always different ABIs; you don't 
> support hard-float compilation using the soft-float function calling ABI 
> (like is supported for ARM and RISC-V, for example)? 

I'm still ramping up on hard-float, so pardon some of my naivety. It seems the
function calling convention is no different for soft-float vs. hard-float. We have
a single register file (hard FP instructions inherently use an additional
accumulator but that isn't really passed around so doesn't affect calling
convention). Other than that SP values go normally in a reg, DP go in reg pair
just as any 64bit value.

OTOH, the ARC libgcc float emulation code seems likely to be limited in terms of
rounding modes supported etc (the current code is dense math implemented in ARC
assembly (really not my cup of coffee) so I couldn't be sure :-(

At any rate, assuming it did limit the rounding modes etc, does that also lend
into the ABI we are talking about here ? Likely not.


> (If you support 
> hard-float compilation with the soft-float ABI, it would be problematic to 
> have different FE_TONEAREST values in the two cases - ARM and RISC-V both 
> define all the FE_* macros independently of whether hard or soft float is 
> used, because they support that case.)

I'd much rather have them be the same. The fenv.h I started with didn't
distinguish these (well it only had 1 rounding mode: FE_TONEAREST so was bogus at
best). When I revered it up, I added the various modes etc w/o the header guard
and ho behold all the math tests started failing. My knee jerk response was to
segregate them which likely papered over the issue.


>> diff --git a/sysdeps/arc/math_private.h b/sysdeps/arc/math_private.h
> 
> This file should not be needed now.

Ok deleted.


>> diff --git a/sysdeps/arc/nofpu/math-tests-exception.h b/sysdeps/arc/nofpu/math-tests-exception.h
> 
> This file does nothing (the name is wrong, the name actually used is 
> math-tests-exceptions.h).  And it should not be needed unless you support 
> hard-float compilation with the soft-float ABI (and thus define all the 
> FE_* names in bits/fenv.h even for soft-float).

File renamed and retained.

>> diff --git a/sysdeps/arc/nofpu/math-tests-rounding.h b/sysdeps/arc/nofpu/math-tests-rounding.h
> 
> Again, not needed unless hard-float compilation with the soft-float ABI is 
> supported and bits/fenv.h has corresponding contents.

ditto !

Now trying a rebuilt with these changes !
