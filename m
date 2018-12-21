From: joseph@codesourcery.com (Joseph Myers)
Date: Fri, 21 Dec 2018 01:19:37 +0000
Subject: [PATCH 07/21] ARC: math soft float support
In-Reply-To: <e59bc8c5-cf0f-9968-cecf-caaf8b6def7a@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-8-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182315580.30183@digraph.polyomino.org.uk>
 <e59bc8c5-cf0f-9968-cecf-caaf8b6def7a@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812210114400.24773@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Thu, 20 Dec 2018, Vineet Gupta wrote:

> I'm still ramping up on hard-float, so pardon some of my naivety. It seems the
> function calling convention is no different for soft-float vs. hard-float. We have
> a single register file (hard FP instructions inherently use an additional
> accumulator but that isn't really passed around so doesn't affect calling
> convention). Other than that SP values go normally in a reg, DP go in reg pair
> just as any 64bit value.

If you have only a single register file and the same calling convention - 
and all struct layouts etc. are also the same - then indeed that would be 
a single ABI (meaning that you only need one dynamic linker name for ARC 
rather than two, if you only support one endianness).  (On architectures 
with separate register files, jmp_buf, ucontext etc. might sometimes 
differ between hard and soft float, although often the space is still 
there in the soft-float case, just not used.)

The ARM and RISC-V cases are ones where there are separate hard-float and 
soft-float calling conventions - but *also* support for using hardware 
floating point with the soft-float calling convention.

If you do have a single ABI, that indicates having bits/fenv.h contents 
unconditional (because a soft-float compilation might legitimately end up 
linking with a hard-float libm) - and thus indeed needing the internal 
headers to disable certain math tests for soft-float.  fpu_control.h 
contents would still be conditional, however.

-- 
Joseph S. Myers
joseph at codesourcery.com
