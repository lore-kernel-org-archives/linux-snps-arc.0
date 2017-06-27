From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 27 Jun 2017 15:55:44 +0000
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <0cd32bdd-5ec4-0fb6-8cf8-fd658596e790@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
 <0cd32bdd-5ec4-0fb6-8cf8-fd658596e790@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1706271553590.18823@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 27 Jun 2017, Vineet Gupta wrote:

> > > +typedef struct sigcontext mcontext_t;
> > 
> > You can avoid this problematic definition for a new architecture, even
> > while we're still discussing eliminating it for existing architectures.
> 
> So just use struct sigcontext as data type for uc_mcontext ?

No.  Define mcontext_t to be a struct without a tag, with the same layout 
as struct sigcontext, as the identifier sigcontext (and non-reserved 
identifiers for its elements) are not in the POSIX namespace permitted for 
ucontext.h.

https://sourceware.org/ml/libc-alpha/2017-06/msg00946.html

-- 
Joseph S. Myers
joseph at codesourcery.com
