From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 27 Nov 2017 12:35:44 -0800
Subject: [RFC 0/6] glibc port to ARC architecture
In-Reply-To: <alpine.DEB.2.20.1706271157100.17677@digraph.polyomino.org.uk>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <357a6f84-3f71-d3b7-9c19-4f0390e5db8d@redhat.com>
 <alpine.DEB.2.20.1706271157100.17677@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <457a32ae-c5e2-d69a-cdf9-9d9be49a5bc0@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/27/2017 05:00 AM, Joseph Myers wrote:
> On Tue, 27 Jun 2017, Florian Weimer wrote:
> 
>> On 06/27/2017 10:00 AM, Vineet Gupta wrote:
>>> This is a Request for comments for glibc port to ARC architecture.
>>> http://www.synopsys.com/IP/ProcessorIP/ARCProcessors/Pages/default.aspx
>>>
>>> The Linux kernel, uClibc, buildroot have been upstream for quite some time.
>>
>> Is it possible to build the new port with scripts/build-many-glibcs.py?
> 
> More specifically:
> 
> Any new port should have support added to build-many-glibcs.py for all
> ABIs supported by the port (e.g. both endiannesses, if you support both BE
> and LE, and any other ABI variants).

build-many-glibcs.py works for ARC now - after the 2 backports to gcc 7.2

> You should make sure that produces clean test results for all the
> compilation tests, for all those variants.
> 
> You should also include results for the full testsuite, including
> execution tests (whether testing natively, or cross testing with
> test-wrapper set to execute tests for a cross build), in the submission of
> the port (and those should be as clean as possible).

ATM we have around 200 failures for upstream tools (likely due to libgcc unwinder 
patch not yet merged upstream). And just for data point, with github based gcc 
including the non-merged patches that number comes down to ~100. Bunch of them are 
in math/doubler and some in backtrace/nptl. Will this be considered a blocker. I'm 
almost ready for next round, rebased recently !

-Vineet
