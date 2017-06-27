From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 27 Jun 2017 17:02:31 +0000
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <30d4364e-1932-649c-917e-d0bc2dc4093c@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
 <0cd32bdd-5ec4-0fb6-8cf8-fd658596e790@synopsys.com>
 <alpine.DEB.2.20.1706271553590.18823@digraph.polyomino.org.uk>
 <30d4364e-1932-649c-917e-d0bc2dc4093c@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1706271701440.18823@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 27 Jun 2017, Vineet Gupta wrote:

> thx for this link - per comments there the contents of struct sigcontext could
> come from kernel which is
> 
>   struct sigcontext {
> 	struct user_regs_struct regs;
>   };
> 
> Now I'd rather prefer to not duplicate user_regs_struct here, but instead just
> refer to kernel variant, something like ...
> 
>   typedef struct user_regs_struct mcontext_t;
> 
> Will that work or do I absolutely need to redefine this in userspace hdrs ?

You have to redefine.  Neither "user_regs_struct" nor "regs" is an 
identifier permitted here by POSIX.

-- 
Joseph S. Myers
joseph at codesourcery.com
