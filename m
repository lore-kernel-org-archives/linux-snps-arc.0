From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 12 May 2016 12:24:25 +0530
Subject: [RFC 2/2] perf/core: change errno for sampling event not
 supported in hardware
In-Reply-To: <20160512064201.GL3192@twins.programming.kicks-ass.net>
References: <1462786660-2900-1-git-send-email-vgupta@synopsys.com>
 <1462786660-2900-3-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1605090923460.27332@macbook-air>
 <5730C79F.3060307@synopsys.com>
 <20160511193627.GH3190@twins.programming.kicks-ass.net>
 <5734229B.90706@synopsys.com>
 <20160512064201.GL3192@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <573428A1.3060402@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 12 May 2016 12:12 PM, Peter Zijlstra wrote:
>> Tried that and doesn't even compile. Reconfirms what Vince said, ENOTSUPP is not
>> > exposed to userspace (being in include/linux and not include/uapi/linux)
> Durr, so what does userspace see?

It sees the "value" of ENOTSUPP, i.e. 524 but there is no symbolic reference to it :-)
