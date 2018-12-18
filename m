From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 15:08:56 -0800
Subject: [PATCH 14/21] ARC: Enable __start as entry point vs. canonical
 _start
In-Reply-To: <alpine.DEB.2.21.1812182257160.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-15-git-send-email-vgupta@synopsys.com>
 <87h8fay17b.fsf@oldenburg2.str.redhat.com>
 <C2D7FE5348E1B147BCA15975FBA230750146421EAA@US01WEMBX2.internal.synopsys.com>
 <alpine.DEB.2.21.1812182257160.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cd1f244b-4da5-cf15-6e53-a69b2251001d@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 2:59 PM, Joseph Myers wrote:
>> I deliberately kept them out to call out the fixes, sometimes these help 
>> new ports which stumble into similar issues. And also ~2 years worth of 
>> work gets squashed into a single blob is a shame :-)
>
> Postings of a new port should generally post each new file in the form in 
> which it is intended to be committed (and, thus, the form in which it 
> should be reviewed); you should never post a known-buggy version and a 
> subsequent fix to the bug; that wastes reviewers' time.  (The actual 
> commit of the port should be a single commit with everything, modulo 
> possible separate earlier commits for changes to architecture-independent 
> files, as the port isn't useful with only a subset of the new files 
> added.

Ok I can certainly squash them in next version.

Thx,
-Vineet
