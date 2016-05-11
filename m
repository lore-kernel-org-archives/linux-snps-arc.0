From: vincent.weaver@maine.edu (Vince Weaver)
Date: Tue, 10 May 2016 23:33:13 -0400 (EDT)
Subject: [RFC 2/2] perf/core: change errno for sampling event not supported
 in hardware
In-Reply-To: <5730C79F.3060307@synopsys.com>
References: <1462786660-2900-1-git-send-email-vgupta@synopsys.com>
 <1462786660-2900-3-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.20.1605090923460.27332@macbook-air>
 <5730C79F.3060307@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1605102331420.15322@macbook-air>
To: linux-snps-arc@lists.infradead.org

On Mon, 9 May 2016, Vineet Gupta wrote:

> On Monday 09 May 2016 07:24 PM, Vince Weaver wrote:
> > On Mon, 9 May 2016, Vineet Gupta wrote:
> > 
> >> This allows userspace to identify this case specifically from the
> >> catch all error msg it prints currently.
> >>
> >> This is an ABI change
> > 
> > An ABI change which will probably break things.
> 
> 
> Right thats what I feared. But hold on, I don't think we need to change the ABI to
> achieve what we want. Gosh why did I even take that path.
> 
> Currently the errno switch case in perf_evsel__open_strerror() in doesn't handle
> ENOTSUPP. So how about we add that - augmented with the same sample_period !0
> check to barf for lack of sampling support.
> 
> Do you see anything wrong with that ?

no, but it would be nice if one of the actual maintainers would chime in 
with an opinion.

In any case if ENOTSUPP is being returned to userspace I should update the 
perf_event manpage to reflect that.

Vince
