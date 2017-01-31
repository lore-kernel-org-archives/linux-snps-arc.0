From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 31 Jan 2017 09:40:14 -0800
Subject: [PATCH v2 1/4] ARCv2: IRQ: Move structure for build register of
 core intc to the header
In-Reply-To: <1485863124-26426-2-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485863124-26426-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1485863124-26426-2-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <731065b1-3fde-02f0-a18b-690c84af2dcc@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 01/31/2017 03:45 AM, Yuriy Kolerov wrote:
> Also add new macro ARC_REG_STATUS32 for the address of STATUS32
> auxiliary register. It is better to use it instead of magic numbers.
> 
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>

Applied to for-next.

Thx,
-Vineet
