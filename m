From: joseph@codesourcery.com (Joseph Myers)
Date: Mon, 27 Nov 2017 22:16:06 +0000
Subject: [RFC 0/6] glibc port to ARC architecture
In-Reply-To: <457a32ae-c5e2-d69a-cdf9-9d9be49a5bc0@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <357a6f84-3f71-d3b7-9c19-4f0390e5db8d@redhat.com>
 <alpine.DEB.2.20.1706271157100.17677@digraph.polyomino.org.uk>
 <457a32ae-c5e2-d69a-cdf9-9d9be49a5bc0@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1711272209210.23771@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, 27 Nov 2017, Vineet Gupta wrote:

> > Any new port should have support added to build-many-glibcs.py for all
> > ABIs supported by the port (e.g. both endiannesses, if you support both BE
> > and LE, and any other ABI variants).
> 
> build-many-glibcs.py works for ARC now - after the 2 backports to gcc 7.2

Works with clean compilation test results for the glibc testsuite?

> > You should make sure that produces clean test results for all the
> > compilation tests, for all those variants.
> > 
> > You should also include results for the full testsuite, including
> > execution tests (whether testing natively, or cross testing with
> > test-wrapper set to execute tests for a cross build), in the submission of
> > the port (and those should be as clean as possible).
> 
> ATM we have around 200 failures for upstream tools (likely due to libgcc
> unwinder patch not yet merged upstream). And just for data point, with github
> based gcc including the non-merged patches that number comes down to ~100.
> Bunch of them are in math/doubler and some in backtrace/nptl. Will this be
> considered a blocker. I'm almost ready for next round, rebased recently !

You should make sure you regenerate libm-test-ulps for your port (from 
scratch, truncate the file and run make regen-ulps).

If you look at 
<https://sourceware.org/glibc/wiki/Release/2.26#Architecture-independent> 
you'll see some known architecture-independent issues that are generic for 
certain cases (some cases of cross-testing, particular kernel versions, 
etc.).  Beyond anything listed there, I'd say you should have no more than 
10-20 FAILs in a well-maintained port, preferably less than that.  100 
FAILs indicates there's still some work to do before the port can be 
considered to be in a good state.

-- 
Joseph S. Myers
joseph at codesourcery.com
