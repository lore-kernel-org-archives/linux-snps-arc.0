From: vincent.weaver@maine.edu (Vince Weaver)
Date: Thu, 12 May 2016 19:04:58 -0400 (EDT)
Subject: [RFC 2/2] perf/core: change errno for sampling event not supported
 in hardware
In-Reply-To: <20160512072542.GM3192@twins.programming.kicks-ass.net>
References: <1462786660-2900-1-git-send-email-vgupta@synopsys.com>
 <1462786660-2900-3-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1605090923460.27332@macbook-air>
 <5730C79F.3060307@synopsys.com>
 <20160511193627.GH3190@twins.programming.kicks-ass.net>
 <5734229B.90706@synopsys.com>
 <20160512064201.GL3192@twins.programming.kicks-ass.net>
 <573428A1.3060402@synopsys.com>
 <20160512072542.GM3192@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1605121903470.18777@macbook-air>
To: linux-snps-arc@lists.infradead.org

On Thu, 12 May 2016, Peter Zijlstra wrote:

> Ah.. which might be a hint that nobody is actually explicitly testing
> for this and we might just get away with changing the ABI.
> 
> Vince, what say you; shall we try and get away with it? ;-)

It's probably worth trying.

The only other time anyone else noticed was in this thread
	https://lkml.org/lkml/2015/6/11/136
and I think the conclusion at the end of that was also that it's probably 
worth changing.

Vince
