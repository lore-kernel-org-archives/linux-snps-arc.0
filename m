From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 5 Dec 2018 17:14:09 +0000
Subject: [PATCH 5/5] ARC: perf: remove useless ifdefs
References: <20181205170609.18690-1-Eugeniy.Paltsev@synopsys.com>
 <20181205170609.18690-6-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014641B902@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/5/18 9:06 AM, Eugeniy Paltsev wrote:
> ifdef around 'arc_pmu_match' structure declaration is useless
> as we refer to 'arc_pmu_match' in several places which aren't
> guarded with ifdef.
>
> Nevertheless 'ARC' option selects 'OF' unconditionally so we
> can simply get rid of this ifdef.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>


Maybe squash this into trivial cleanups 1/5 ?

Acked-by: Vineet Gupta <vgupta at synopsys.com>

Thx,
-Vineet
