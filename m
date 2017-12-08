From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 7 Dec 2017 16:31:36 -0800
Subject: [RFC 0/6] glibc port to ARC architecture
In-Reply-To: <alpine.DEB.2.20.1711272209210.23771@digraph.polyomino.org.uk>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <357a6f84-3f71-d3b7-9c19-4f0390e5db8d@redhat.com>
 <alpine.DEB.2.20.1706271157100.17677@digraph.polyomino.org.uk>
 <457a32ae-c5e2-d69a-cdf9-9d9be49a5bc0@synopsys.com>
 <alpine.DEB.2.20.1711272209210.23771@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f7aee950-8172-5f37-33a3-fde5a5c3ff24@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/27/2017 02:16 PM, Joseph Myers wrote:
> On Mon, 27 Nov 2017, Vineet Gupta wrote:
> 
>>> Any new port should have support added to build-many-glibcs.py for all
>>> ABIs supported by the port (e.g. both endiannesses, if you support both BE
>>> and LE, and any other ABI variants).
>>
>> build-many-glibcs.py works for ARC now - after the 2 backports to gcc 7.2
> 
> Works with clean compilation test results for the glibc testsuite?

I presume you just want to know 010-glibcs-arc-linux-gnu-check-*.txt after running

scripts/build-many-glibcs.py <path> glibcs arc-linux-gnu

FAIL: elf/check-localplt
Summary of test results:
       1 FAIL
    1169 PASS
      15 XFAIL

And even that failure is weird as
(1) this is despite my updates to .../arc/localplt.data
(2) My buildrooot based build reports this test to pass (after my update) but 
still fails in build-many-glibc based build.

Anyhow seems like this should be easy to figure - not mission critical as the 
system running testsuite xcheck is bootstrapped with same ld.so / libc etc.

>>> You should make sure that produces clean test results for all the
>>> compilation tests, for all those variants.
>>>
>>> You should also include results for the full testsuite, including
>>> execution tests (whether testing natively, or cross testing with
>>> test-wrapper set to execute tests for a cross build), in the submission of
>>> the port (and those should be as clean as possible).
>>
>> ATM we have around 200 failures for upstream tools (likely due to libgcc
>> unwinder patch not yet merged upstream). And just for data point, with github
>> based gcc including the non-merged patches that number comes down to ~100.
>> Bunch of them are in math/doubler and some in backtrace/nptl. Will this be
>> considered a blocker. I'm almost ready for next round, rebased recently !
> 
> You should make sure you regenerate libm-test-ulps for your port (from
> scratch, truncate the file and run make regen-ulps).

Thx, that indeed help with quite a few failures.

> If you look at
> <https://sourceware.org/glibc/wiki/Release/2.26#Architecture-independent>
> you'll see some known architecture-independent issues that are generic for
> certain cases (some cases of cross-testing, particular kernel versions,
> etc.).  Beyond anything listed there, I'd say you should have no more than
> 10-20 FAILs in a well-maintained port, preferably less than that.  100
> FAILs indicates there's still some work to do before the port can be
> considered to be in a good state.

The 100 were due to lack of c++ support, stale math ulps etc, default sa_restorer 
generated code etc (which libgcc unwinder is choosy about). And then there were 
some genuine fixes such as:

   csu/test-as-const-tcb-offsets
   misc/tst-syscall-list
   dlfcn/tststatic5
   misc/tst-clone3
...

We are now down to 51 (with github based gcc: more obviously with upstream gcc). I 
think only a very small percentage (~10% guess) would be due to missing glibc bits 
per-se.

Do you think it would be considered review/merge worthy. I will continue to work
on bringing down failures. Otherwise new changes will mean I keep missing the
sweeping arch updates / more failures ... I can post the full set of current 
failures if that helps steer decision.

-Vineet
