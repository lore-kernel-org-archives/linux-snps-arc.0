From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 11 Oct 2016 11:04:41 -0700
Subject: Is conditional calling of restore_altstack() correct for ARC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c8ead7fd-9444-da25-74e9-f755da6296d5@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Al,

I spotted a possible anomaly with ARC sigaltstack() handling and was wondering if
you could confirm if it was wrong (I don't have a test case to prove one way or
the other).

We have a micro-optimization which elides calling restore_altstack() in sigreturn
path, based on a "magic" value, set at the time of sigaction (SA_SIGINFO). So
essentially we only restore ss_{sp,size,flags} if SA_SIGINFO was set.

Do you think this needs to be done unconditionally like other ports do ?

Thx,
-Vineet
