From: vineetg76@gmail.com (Vineet Gupta)
Date: Tue, 6 Aug 2019 11:19:30 +0530
Subject: [PATCH] ARC: unwind: Mark expected switch fall-throughs
In-Reply-To: <20190805193232.GA12826@embeddedor>
References: <20190805193232.GA12826@embeddedor>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8516c7c5-bd70-38a9-0583-225689e9e1aa@gmail.com>
To: linux-snps-arc@lists.infradead.org

On 8/6/19 1:02 AM, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warnings (Building: haps_hs_defconfig arc):
> 
> arch/arc/kernel/unwind.c:827:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
> arch/arc/kernel/unwind.c:836:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo at embeddedor.com>

Thx for the patch, applied to arc for-curr.

-Vineet
