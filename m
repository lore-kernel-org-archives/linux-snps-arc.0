From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 19 Dec 2018 16:51:59 -0800
Subject: [PATCH 00/21] glibc port to ARC processors
In-Reply-To: <alpine.DEB.2.21.1812192355310.10617@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182310431.30183@digraph.polyomino.org.uk>
 <228be09c-0d23-d77c-ab45-0ffb69f7f5a1@synopsys.com>
 <alpine.DEB.2.21.1812192355310.10617@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <89503516-ce73-0749-4290-31dd932b496d@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/19/18 4:14 PM, Joseph Myers wrote:
> On Wed, 19 Dec 2018, Vineet Gupta wrote:
> 
>> On 12/18/18 3:11 PM, Joseph Myers wrote:
>>> Another general point: when posting a new port, could you include pointers 
>>> to architecture and ABI reference manuals in case those are of relevance 
>>> to the review?  (URLs going directly to PDFs of those manuals are 
>>> preferred.)
>>
>> The PRM (Programmer's Reference Manual) is not open source and per corporate
>> policy requires license agreement, signing NDA...
> 
> It's very questionable whether we should consider a port for inclusion in 
> glibc at all without public architecture documentation 

IMHO this seems excessive. We've successfully open-sourced significant ports such
as Linux kernel, gcc, binutils etc. gcc atleast deals with instruction semantics
at a much closer level than glibc perse and that didn't get in the way then.

Being an open source developer myself I agree with your reservations, but the
reality is what Ted Tso so nicely put in at [1]

| "It's something I do worry about; and I do share your concern.  At the
| same time, the reality is that we are a little like the Old Dutch
| Masters, who had take into account the preference of their patrons
| (i.e., in our case, those who pay our paychecks :-)"

[1] https://lwn.net/Articles/446626/

> (that is, 
> documentation of instruction semantics; not necessarily documentation of 
> microarchitectural performance characteristics etc.). 

I understand the intent is all good faith and justified...

> Various kinds of 
> changes can require a developer to refer to documentation across the range 
> of architectures supported by glibc, if something requires assembly 
> implementations across architectures (e.g. some of Adhemerval's changes to 
> thread cancellation; or when I added fegetmode / fesetmode, that required 
> referring to various architecture documentation to identify what bits 
> should be considered mode bits, on each architecture where floating-point 
> status and control bits occupy a single register).

To be honest folks on lkml do sweeping arch changes, PeterZ is one good example
and he has infact changed ARC assembly at times w/o access to PRM. Given the
arrangement we have now, perhaps such changes can call in for review from port
maintainer etc.

> (Non-NDA click-throughs, like the Arm one agreeing not to use the manual 
> to find if Arm implementations violate any patents, are OK

No that is not possible: I've discussed this with power may-be in the past and
again today and this is not going to happen.

Thx,
-Vineet
