From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 12 May 2016 11:58:43 +0530
Subject: [RFC 2/2] perf/core: change errno for sampling event not
 supported in hardware
In-Reply-To: <20160511193627.GH3190@twins.programming.kicks-ass.net>
References: <1462786660-2900-1-git-send-email-vgupta@synopsys.com>
 <1462786660-2900-3-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1605090923460.27332@macbook-air>
 <5730C79F.3060307@synopsys.com>
 <20160511193627.GH3190@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5734229B.90706@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 12 May 2016 01:06 AM, Peter Zijlstra wrote:
> On Mon, May 09, 2016@10:53:43PM +0530, Vineet Gupta wrote:
> 
>> > Right thats what I feared. But hold on, I don't think we need to change the ABI to
>> > achieve what we want. Gosh why did I even take that path.
>> > 
>> > Currently the errno switch case in perf_evsel__open_strerror() in doesn't handle
>> > ENOTSUPP. So how about we add that - augmented with the same sample_period !0
>> > check to barf for lack of sampling support.
>> > 
>> > Do you see anything wrong with that ?
>
> Should work I think.

Tried that and doesn't even compile. Reconfirms what Vince said, ENOTSUPP is not
exposed to userspace (being in include/linux and not include/uapi/linux)
