From: joseph@codesourcery.com (Joseph Myers)
Date: Wed, 19 Dec 2018 00:01:58 +0000
Subject: [PATCH 07/21] ARC: math soft float support
In-Reply-To: <alpine.DEB.2.21.1812182315580.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-8-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182315580.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812190000410.30183@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Joseph Myers wrote:

> On Tue, 18 Dec 2018, Vineet Gupta wrote:
> 
> > +#if defined(__ARC_FPU_SP__) || defined(__ARC_FPU_DP__)
> 
> Missing spaces before '(' (should have such spaces in most cases between 
> an identifier or keyword and '(' - calls to "defined", calls to functions, 
> calls to macros, __attribute__, etc. - except for a few cases of calls to 
> macros such as ElfW where the result is logically used like an 
> identifier).

Or, of course, just omit the parentheses in the "defined" case, which is 
very common for calls to "defined" in glibc.

(Function-like macro definitions are a case where you *can't* have the 
space because the syntax of C requires no space between the name of the 
macro being defined and the '(' before the list of argument names.)

-- 
Joseph S. Myers
joseph at codesourcery.com
