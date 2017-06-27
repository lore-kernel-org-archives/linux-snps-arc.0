From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 27 Jun 2017 12:00:23 +0000
Subject: [RFC 0/6] glibc port to ARC architecture
In-Reply-To: <357a6f84-3f71-d3b7-9c19-4f0390e5db8d@redhat.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <357a6f84-3f71-d3b7-9c19-4f0390e5db8d@redhat.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1706271157100.17677@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 27 Jun 2017, Florian Weimer wrote:

> On 06/27/2017 10:00 AM, Vineet Gupta wrote:
> > This is a Request for comments for glibc port to ARC architecture.
> > http://www.synopsys.com/IP/ProcessorIP/ARCProcessors/Pages/default.aspx
> > 
> > The Linux kernel, uClibc, buildroot have been upstream for quite some time.
> 
> Is it possible to build the new port with scripts/build-many-glibcs.py?

More specifically:

Any new port should have support added to build-many-glibcs.py for all 
ABIs supported by the port (e.g. both endiannesses, if you support both BE 
and LE, and any other ABI variants).

You should make sure that produces clean test results for all the 
compilation tests, for all those variants.

You should also include results for the full testsuite, including 
execution tests (whether testing natively, or cross testing with 
test-wrapper set to execute tests for a cross build), in the submission of 
the port (and those should be as clean as possible).

Any new port should be added to the list in README, and have a NEWS entry 
added.

-- 
Joseph S. Myers
joseph at codesourcery.com
