From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 12 May 2016 09:25:42 +0200
Subject: [RFC 2/2] perf/core: change errno for sampling event not
 supported in hardware
In-Reply-To: <573428A1.3060402@synopsys.com>
References: <1462786660-2900-1-git-send-email-vgupta@synopsys.com>
 <1462786660-2900-3-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1605090923460.27332@macbook-air>
 <5730C79F.3060307@synopsys.com>
 <20160511193627.GH3190@twins.programming.kicks-ass.net>
 <5734229B.90706@synopsys.com>
 <20160512064201.GL3192@twins.programming.kicks-ass.net>
 <573428A1.3060402@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160512072542.GM3192@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Thu, May 12, 2016@12:24:25PM +0530, Vineet Gupta wrote:
> On Thursday 12 May 2016 12:12 PM, Peter Zijlstra wrote:
> >> Tried that and doesn't even compile. Reconfirms what Vince said, ENOTSUPP is not
> >> > exposed to userspace (being in include/linux and not include/uapi/linux)
> > Durr, so what does userspace see?
> 
> It sees the "value" of ENOTSUPP, i.e. 524 but there is no symbolic reference to it :-)

Ah.. which might be a hint that nobody is actually explicitly testing
for this and we might just get away with changing the ABI.

Vince, what say you; shall we try and get away with it? ;-)
