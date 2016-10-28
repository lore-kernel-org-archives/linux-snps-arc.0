From: arnd@arndb.de (Arnd Bergmann)
Date: Sat, 29 Oct 2016 00:03:40 +0200
Subject: [PATCH] lpfc: use %zd format string for size_t
In-Reply-To: <05a8b6f6-b21a-0d77-ba52-23b568967584@synopsys.com>
References: <20161017123605.2217411-1-arnd@arndb.de>
 <3374da57-ecd8-6376-5fca-0466fb799777@synopsys.com>
 <05a8b6f6-b21a-0d77-ba52-23b568967584@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <369474356.SFgOVPi7rO@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Friday, October 28, 2016 2:58:33 PM CEST Vineet Gupta wrote:
> On 10/28/2016 02:52 PM, Vineet Gupta wrote:
> > On 10/28/2016 02:44 PM, Vineet Gupta wrote:
> >> This is configuration specific, and something caused your compiler to
> >>> be built assuming that size_t is unsigned long, while the kernel
> >>> headers are assuming it should be unsigned int.
> > 
> > So yes this seems to be target specific gcc thing
> > 
> > for ARC 4.8
> > 
> > #define PTRDIFF_TYPE "int"
> > 
> > ARM
> > 
> > #ifndef PTRDIFF_TYPE
> > #define PTRDIFF_TYPE (TARGET_AAPCS_BASED ? "int" : "long int")
> > #endif
> > 
> > ARC gcc 6.2
> > 
> > #undef PTRDIFF_TYPE
> > #define PTRDIFF_TYPE "long int"
> 
> Actually we need to adjust SIZE_TYPE (unsigned int) and PTRDIFF_TYPE (int) in the
> gcc 6.x to fix this issue. And that is exactly what ARC gcc 4.8 have.

What compiler versions are most commonly used these days?

You should probably stay with the version that most people have
and then update either the compiler or the kernel, whichever
diverges from it.

I see in the gcc git log that the version that had "int" got removed
at some point, and the version that had "unsigned int" was added
later.

	Arnd
