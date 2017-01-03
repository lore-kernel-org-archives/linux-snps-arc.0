From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 3 Jan 2017 10:21:12 -0800
Subject: [PATCH v3 2/3] ARCv2: IRQ: Call entry/exit functions for chained
 handlers in MCIP
In-Reply-To: <1482914786-10490-3-git-send-email-yuriy.kolerov@synopsys.com>
References: <1482914786-10490-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1482914786-10490-3-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0a1879f7-961a-b78a-a9de-0b6f54b0acd5@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/28/2016 12:46 AM, Yuriy Kolerov wrote:
> It is necessary to call entry/exit functions for parent interrupt
> controllers for proper masking/unmasking of interrupt lines.
> 
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>

Applied to for-curr.

Thx,
-vineet
