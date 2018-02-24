From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 23 Feb 2018 17:37:16 -0800
Subject: [PATCH v2 2/3] ARC: mcip: update MCIP debug mask when the new cpu
 came online
In-Reply-To: <20180223164154.22377-2-Eugeniy.Paltsev@synopsys.com>
References: <20180223164154.22377-1-Eugeniy.Paltsev@synopsys.com>
 <20180223164154.22377-2-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <476ba7d8-5877-4966-f2a2-08ce01531bb9@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 02/23/2018 08:42 AM, Eugeniy Paltsev wrote:
> As of today we use hardcoded MCIP debug mask, so if we launch
> kernel via debugger and kick fever cores than HW has all cpus
> hang at the momemt of setup MCIP debug mask.
>
> So update MCIP debug mask when the new cpu came online, instead of
> use hardcoded MCIP debug mask.
>
> Signed-off-by: Eugeniy Paltsev<Eugeniy.Paltsev at synopsys.com>

Acked-by: Vineet Gupta <vgupta at ynopsys.com>
