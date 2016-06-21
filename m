From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 21 Jun 2016 05:29:28 +0000
Subject: cross compilers [was build failure of sorts]
References: <57640B08.4090007@roeck-us.net>
 <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
 <20160617160438.GA24148@gmail.com> <57645C16.9040300@synopsys.com>
 <20160618070501.GC30154@twins.programming.kicks-ass.net>
 <20160618101740.GN30927@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750106944A6C@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Saturday 18 June 2016 03:47 PM, Peter Zijlstra wrote:
> As you can see, arc doesn't even build upstream binutils :/
> (binutils-2_26-branch as of today).

Hmm - we are still in fight w.r.t. upstreaming gcc fully (ARCv2 gcc support)
although ARCompact has been there for some time. binutils upstream should work -
I'll check why the buildall stuff fails.

We currently have our tools on github but presume that won't work for you due to
non canonical location / version !

-Vineet
