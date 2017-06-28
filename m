From: joseph@codesourcery.com (Joseph Myers)
Date: Wed, 28 Jun 2017 09:30:01 +0000
Subject: ucontect vs. ucontext_t (was Re: [RFC 4/6] ARC: Initial port to
 glibc)
In-Reply-To: <aeb31ac8-636a-69d7-b630-3fcd29c37ecc@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
 <aeb31ac8-636a-69d7-b630-3fcd29c37ecc@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1706280925190.6445@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Wed, 28 Jun 2017, Vineet Gupta wrote:

> On 06/27/2017 02:56 PM, Joseph Myers wrote:
> > > +/* Userlevel context.  */
> > > +typedef struct ucontext
> > > +  {
> > > +    unsigned long uc_flags;
> > > +    struct ucontext *uc_link;
> > This is now struct ucontext_t.
> 
> Isn't this an ABI change. After making change as you suggested, building
> gcc/libgcc itself fails now as the ARC libgcc unwinder expects ucontext.

Florian established a lack of ucontext in C++ mangled names in Fedora.

> Can we atleast define a preprocessor macro to indicate this ABI change so
> downstream projects can support both things in short term ?

Projects should use the standard typedef name ucontext_t unconditionally, 
not the tag; the typedef name was already present in glibc before this 
change and should be present in any library implementing these interfaces.  
See my libgcc patch 
<https://gcc.gnu.org/ml/gcc-patches/2017-06/msg02032.html>, now committed 
to trunk.  This is much like the removal of the struct siginfo tag a few 
years ago (including the same motivation, to follow POSIX namespace 
rules); projects had to use siginfo_t, which already existed, instead.

I see no references to ucontext at all in ARC libgcc (ARC doesn't have a 
linux-unwind.h file).

-- 
Joseph S. Myers
joseph at codesourcery.com
