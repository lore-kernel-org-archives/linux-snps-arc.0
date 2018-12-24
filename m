From: mhocko@kernel.org (Michal Hocko)
Date: Mon, 24 Dec 2018 20:10:04 +0100
Subject: [PATCH 2/2] ARC: show_regs: fix lockdep splat for good
In-Reply-To: <8b3739f1-a7d5-7253-362a-3a1c707b0f6d@synopsys.com>
References: <1545159239-30628-1-git-send-email-vgupta@synopsys.com>
 <1545159239-30628-3-git-send-email-vgupta@synopsys.com>
 <20181220130450.GB17350@dhcp22.suse.cz>
 <C2D7FE5348E1B147BCA15975FBA23075014642389B@US01WEMBX2.internal.synopsys.com>
 <20181221130404.GF16107@dhcp22.suse.cz>
 <8b3739f1-a7d5-7253-362a-3a1c707b0f6d@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181224191004.GE16738@dhcp22.suse.cz>
To: linux-snps-arc@lists.infradead.org

On Fri 21-12-18 09:55:34, Vineet Gupta wrote:
> On 12/21/18 5:04 AM, Michal Hocko wrote:
[...]
> > Yes, the fix might be more involved but I would much rather prefer a
> > correct code which builds on solid assumptions.
> 
> Right so the first step is reverting the disabled semantics for ARC and do some
> heavy testing to make sure any fallouts are addressed etc. And if that works, then
> propagate this change to core itself. Low risk strategy IMO - agree ?

Yeah, I would simply remove the preempt_disable and see what falls out.
smp_processor_id could be converted to the raw version etc...
-- 
Michal Hocko
SUSE Labs
