From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 20 Sep 2016 14:48:48 -0700
Subject: [PATCH] ARCv2: intc: Use kflag if STATUS32.IE must be reset
In-Reply-To: <1473695703-29547-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1473695703-29547-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <d78e66ad-6909-b90e-6061-7ef414e94d4a@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/12/2016 08:55 AM, Yuriy Kolerov wrote:
> In the end of "arc_init_IRQ" STATUS32.IE flag is going to be affected by
> "flag" instruction but "flag" never touches IE flag on ARCv2. So "kflag"
> instruction must be used instead of "flag".
> 
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>

Applied to for-next for 4.9 + stable backport.

Thx,
-Vineet
