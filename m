From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 13 Dec 2018 17:21:57 +0000
Subject: [PATCH v2 1/4] ARC: perf: trivial code cleanup
References: <20181213165621.20817-1-Eugeniy.Paltsev@synopsys.com>
 <20181213165621.20817-2-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014641F684@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/13/18 8:56 AM, Eugeniy Paltsev wrote:
> * Use BIT(), lower_32_bits(), upper_32_bits() macroses,
>   fix code style violations.
> * Use u32, u64, s64 instead of uint32_t, uint64_t, int64_t
> * Fix description comment as this code doesn't belong only to
>   ARC700 anymore.
> * Use SPDX License Identifier.
> * Remove useless ifdefs. ifdef around 'arc_pmu_match' structure
>   declaration is useless as we refer to 'arc_pmu_match' in
>   several places which aren't guarded with ifdef. Nevertheless
>   'ARC' option selects 'OF' unconditionally so we can simply
>   get rid of this ifdef.
>
> Acked-by: Vineet Gupta <vgupta at synopsys.com>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

Applied !

Thx,
-Vineet
