From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 3 Jan 2017 10:20:06 -0800
Subject: [PATCH v3 1/3] ARC: IRQ: Use hwirq instead of virq in mask/unmask
In-Reply-To: <1482914786-10490-2-git-send-email-yuriy.kolerov@synopsys.com>
References: <1482914786-10490-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1482914786-10490-2-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <82a0736e-0148-d42a-5b82-66c4f780807f@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/28/2016 12:46 AM, Yuriy Kolerov wrote:
> It is necessary to use hwirq instead of virq when you communicate
> with an interrupt controller since there is no guaranty that virq
> numbers match hwirq numbers.
> 
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>


Applied to for-curr.

Thx,
-vineet
