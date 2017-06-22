From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Fri, 23 Jun 2017 01:21:22 +0200
Subject: uclibc test suite with gnu 2017.03 (was Re: [Fwd: Re: nsim
 latest free version])
In-Reply-To: <20170622221612.GQ26922@waldemar-brodkorb.de>
References: <20170622144201.GN26922@waldemar-brodkorb.de>
 <1498152714.13700.63.camel@synopsys.com>
 <90e5eb43-8912-cb2f-fe72-9b385398f232@synopsys.com>
 <20170622221612.GQ26922@waldemar-brodkorb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170622232122.GR26922@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi,
Waldemar Brodkorb wrote,

> Hi Vineet,
> Vineet Gupta wrote,
> 
> > Hi Waldemar,
> > 
> > >>Hi Waldemar,
> > >>
> > >>On Wed, 2017-06-21@21:16 +0200, Waldemar Brodkorb wrote:
> > >>>Hi Alexey,
> > >>>
> > >>>I have some issues lately running the testsuite in NSIM.
> > >>>Is there may be some new version available?
> > >>>How I can get an updated version?
> > >>Let me check with our nSIM devs.
> > >>But could you please elaborate a bit what is your problem?
> > >It stalls / deadlocks here:
> > >PASS tst-cancel23
> > >FAIL tst-cancel25 got 1 expected 0
> > >         Timed out: killed the child process
> > >PASS tst-cancel3
> > >FAIL tst-cancel4 got 1 expected 0
> > >         Timed out: killed the child process
> > >.... tst-cancel5
> > >
> > >Seems to happen since the toolchain update to 2017.03

Just checked with arc-2016.09-release and the test pass.

best regards
 Waldemar
