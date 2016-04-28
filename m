From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 28 Apr 2016 10:05:13 +0530
Subject: Misleading hint to select CONFIG_PERF_EVENTS if driver sets
 PERF_PMU_CAP_NO_INTERRUPT
In-Reply-To: <1461770030.5970.8.camel__5728.3871378333$1461770054$gmane$org@synopsys.com>
References: <1461331523.3403.11.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E9F42D@us01wembx1.internal.synopsys.com>
 <1461770030.5970.8.camel__5728.3871378333$1461770054$gmane$org@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57219301.10505@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Wednesday 27 April 2016 08:43 PM, Lada Trimasova wrote:
> On Tue, 2016-04-26@12:42 +0000, Vineet Gupta wrote:
> 
> On Friday 22 April 2016 06:56 PM, Lada Trimasova wrote:
> I think what we have now is sufficient - but u seem to want a prettier failure output.
> 
> Anyhow, this print is coming from util/evsel.c: perf_evsel__open_strerror()
> At the very least you want another entry in switch case for ENOTSUPP and then
> check if event was sampling one (
> evsel->attr.sample_period) - use that as a hint for saying sampling events not
> supported.
> 
> 
> 
> 
> ENOTSUPP is not visible for user programs. So it's impossible to add this entry
> 
> to mentioned switch.
> 
> I think that there is no good way to make error message more understandable
> 
> without breaking existing api.

I meant EOPNOTSUPP. Any errno value has to be visible to user programs otherwise
there is no point defining it.
