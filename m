From: joseph@codesourcery.com (Joseph Myers)
Date: Thu, 20 Dec 2018 00:14:07 +0000
Subject: [PATCH 00/21] glibc port to ARC processors
In-Reply-To: <228be09c-0d23-d77c-ab45-0ffb69f7f5a1@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182310431.30183@digraph.polyomino.org.uk>
 <228be09c-0d23-d77c-ab45-0ffb69f7f5a1@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812192355310.10617@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Wed, 19 Dec 2018, Vineet Gupta wrote:

> On 12/18/18 3:11 PM, Joseph Myers wrote:
> > Another general point: when posting a new port, could you include pointers 
> > to architecture and ABI reference manuals in case those are of relevance 
> > to the review?  (URLs going directly to PDFs of those manuals are 
> > preferred.)
> 
> The PRM (Programmer's Reference Manual) is not open source and per corporate
> policy requires license agreement, signing NDA...

It's very questionable whether we should consider a port for inclusion in 
glibc at all without public architecture documentation (that is, 
documentation of instruction semantics; not necessarily documentation of 
microarchitectural performance characteristics etc.).  Various kinds of 
changes can require a developer to refer to documentation across the range 
of architectures supported by glibc, if something requires assembly 
implementations across architectures (e.g. some of Adhemerval's changes to 
thread cancellation; or when I added fegetmode / fesetmode, that required 
referring to various architecture documentation to identify what bits 
should be considered mode bits, on each architecture where floating-point 
status and control bits occupy a single register).

(Non-NDA click-throughs, like the Arm one agreeing not to use the manual 
to find if Arm implementations violate any patents, are OK, presuming 
there is nothing to restrict public discussion of the contents and using 
the information therein to develop free software, although having a direct 
URL to the manual without needing such a click-through is certainly 
preferred.)

-- 
Joseph S. Myers
joseph at codesourcery.com
