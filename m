From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 21:31:18 +0000
Subject: [PATCH 14/21] ARC: Enable __start as entry point vs. canonical
 _start
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-15-git-send-email-vgupta@synopsys.com>
 <87h8fay17b.fsf@oldenburg2.str.redhat.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750146421EAA@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 1:28 PM, Florian Weimer wrote:
>> ARC linker scripts have defined __start as entry point so to not break
>> ABI for uClibc et al we allow __start for glibc as well
> I think this change and the test suite fixes should be folded into the
> initial addition of these files.  Or is there a reason for not doing
> this?

I deliberately kept them out to call out the fixes, sometimes these help new ports
which stumble into similar issues. And also ~2 years worth of work gets squashed
into a single blob is a shame :-)

-Vineet
