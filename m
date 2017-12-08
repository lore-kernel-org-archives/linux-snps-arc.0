From: joseph@codesourcery.com (Joseph Myers)
Date: Fri, 8 Dec 2017 11:15:27 +0000
Subject: [RFC 0/6] glibc port to ARC architecture
In-Reply-To: <f7aee950-8172-5f37-33a3-fde5a5c3ff24@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <357a6f84-3f71-d3b7-9c19-4f0390e5db8d@redhat.com>
 <alpine.DEB.2.20.1706271157100.17677@digraph.polyomino.org.uk>
 <457a32ae-c5e2-d69a-cdf9-9d9be49a5bc0@synopsys.com>
 <alpine.DEB.2.20.1711272209210.23771@digraph.polyomino.org.uk>
 <f7aee950-8172-5f37-33a3-fde5a5c3ff24@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1712081053190.3915@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Thu, 7 Dec 2017, Vineet Gupta wrote:

> I presume you just want to know 010-glibcs-arc-linux-gnu-check-*.txt after
> running
> 
> scripts/build-many-glibcs.py <path> glibcs arc-linux-gnu
> 
> FAIL: elf/check-localplt
> Summary of test results:
>       1 FAIL
>    1169 PASS
>      15 XFAIL
> 
> And even that failure is weird as
> (1) this is despite my updates to .../arc/localplt.data
> (2) My buildrooot based build reports this test to pass (after my update) but
> still fails in build-many-glibc based build.

The 011 log should show the output of all non-PASS tests, so allowing you 
to identify the problem local PLT entry use (or if applicable, PLT entry 
not used that was expected to be used).  If it's e.g. 
compiler-version-specific and hard to fix for some reason, note how 
entries in localplt.data can use "?" to mark them optional (or can specify 
an alternative relocation, in cases where a function is meant to be 
interposable but may not have a PLT entry).

> Anyhow seems like this should be easy to figure - not mission critical as the
> system running testsuite xcheck is bootstrapped with same ld.so / libc etc.

For build-many-glibcs.py use to detect testsuite regressions for a 
configuration, the baseline required is *no* failures in the parts of the 
testsuite it runs.  If there are any failures at all, that serves to hide 
regressions (additional tests starting to fail, or the testsuite starting 
to fail to build), because it just distinguishes zero / nonzero exit 
status from "make check".

> We are now down to 51 (with github based gcc: more obviously with upstream
> gcc). I think only a very small percentage (~10% guess) would be due to
> missing glibc bits per-se.
> 
> Do you think it would be considered review/merge worthy. I will continue to

I think a plausible state to be merge-ready would be no more than 20 
architecture-specific failures, *with upstream GCC and binutils*.  We've 
had enough problems in the past with glibc ports that turn out to rely on 
non-upstream toolchain pieces that I think you need results with upstream 
tools essentially as good as those with non-upstream before inclusion of 
the port is appropriate.  So you should get whatever GCC fixes are needed 
upstream sooner rather than later.  (That means upstream in GCC mainline 
so GCC 8 is ready for the port.  Release branch backports are at your 
discretion, although it's generally a good idea to make sure the GCC port 
is in a good state in the most recent release branch, where there is any 
GCC release branch supporting the architecture at all.)

That does not mean you should stop work on eliminating failures once down 
to 20, as many ports are rather better than that, just that 20 is more 
comparable with other reasonably well maintained glibc ports.

It's still be appropriate to submit the code for review now, before you're 
down to 20 failures, given that a port is likely to need to go through 
multiple rounds of review anyway before it's ready for inclusion in glibc.

Note that it should be possible for a new port to go into glibc during the 
release freeze period (January), provided it's clear the changes cannot 
affect other ports.  So if you have any fixes to architecture-independent 
parts of glibc that are needed for this port, you should submit them as 
soon as possible, and separately from the main port submission.

> work
> on bringing down failures. Otherwise new changes will mean I keep missing the
> sweeping arch updates / more failures ... I can post the full set of current
> failures if that helps steer decision.

The full list of failures, and whatever analysis you have of their causes 
/ symptoms, should certainly be included in every submission of the port.

-- 
Joseph S. Myers
joseph at codesourcery.com
