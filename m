From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 5 Dec 2018 17:15:45 +0000
Subject: [PATCH 3/5] ARC: perf: fix of kernel data types using
References: <20181205170609.18690-1-Eugeniy.Paltsev@synopsys.com>
 <20181205170609.18690-4-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014641B931@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/5/18 9:06 AM, Eugeniy Paltsev wrote:
> Use u32, u64, s64 instead of uint32_t, uint64_t, int64_t
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>


Maybe squash this into trivial cleanups 1/5 ?

Acked-by: Vineet Gupta <vgupta at synopsys.com>

Thx,
-Vineet
