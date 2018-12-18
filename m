From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 18 Dec 2018 22:59:49 +0000
Subject: [PATCH 14/21] ARC: Enable __start as entry point vs. canonical
 _start
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA230750146421EAA@US01WEMBX2.internal.synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-15-git-send-email-vgupta@synopsys.com>
 <87h8fay17b.fsf@oldenburg2.str.redhat.com>
 <C2D7FE5348E1B147BCA15975FBA230750146421EAA@US01WEMBX2.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812182257160.30183@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> On 12/18/18 1:28 PM, Florian Weimer wrote:
> >> ARC linker scripts have defined __start as entry point so to not break
> >> ABI for uClibc et al we allow __start for glibc as well
> > I think this change and the test suite fixes should be folded into the
> > initial addition of these files.  Or is there a reason for not doing
> > this?
> 
> I deliberately kept them out to call out the fixes, sometimes these help 
> new ports which stumble into similar issues. And also ~2 years worth of 
> work gets squashed into a single blob is a shame :-)

Postings of a new port should generally post each new file in the form in 
which it is intended to be committed (and, thus, the form in which it 
should be reviewed); you should never post a known-buggy version and a 
subsequent fix to the bug; that wastes reviewers' time.  (The actual 
commit of the port should be a single commit with everything, modulo 
possible separate earlier commits for changes to architecture-independent 
files, as the port isn't useful with only a subset of the new files 
added.)

-- 
Joseph S. Myers
joseph at codesourcery.com
