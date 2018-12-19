From: joseph@codesourcery.com (Joseph Myers)
Date: Wed, 19 Dec 2018 20:36:38 +0000
Subject: [PATCH 09/21] ARC: Linux ABI
In-Reply-To: <c987196c-3791-01b1-8bd3-c579f58982a9@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-10-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182333230.30183@digraph.polyomino.org.uk>
 <c987196c-3791-01b1-8bd3-c579f58982a9@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812192024320.2810@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Wed, 19 Dec 2018, Vineet Gupta wrote:

> So perhaps we keep the ARC header above, with matching layout, while 
> switching to generic sigaction() still. OK ?

If the different userspace layout is better, it should be better for all 
future ports as well.

Duplicating all the SA_* constants in architecture-specific headers, even 
when those architectures don't actually have different values of those 
constants, is bad, especially since there is logic about which __USE_* 
macros get which SA_* defined which then needs to be duplicated.

So what this suggests to me is a preliminary patch series to unify 
bits/sigaction.h headers - there might be one header for SA_* constants 
(architecture-specific variants only when needed), one for SIG_* constants 
(architecture-specific variants only when needed), and one for the ways in 
which the layout of the userspace struct sigaction can vary (defining 
macros that the unified bits/sigaction.h then uses to control the layout - 
cf. the siginfo unification a while back).

Initially, the default version of that last header would correspond to the 
existing sysdeps/unix/sysv/linux/bits/sigaction.h header - however, if you 
get consensus for a different layout as the default for new architectures, 
the default would change and all existing architectures that use the 
current default layout would get copies of the new bits/ header configured 
to keep the old layout.  (Variants are possible to reduce the number of 
architectures needing architecture-specific copies as a result of the 
changed default.  For example, you could have the new default only in 
sysdeps/unix/sysv/linux/generic not sysdeps/unix/sysv/linux/ and then only 
existing asm-generic architectures (aarch64 nios2 riscv) would need to 
override back to the old default layout.)

-- 
Joseph S. Myers
joseph at codesourcery.com
