From: vinod.koul@intel.com (Vinod Koul)
Date: Thu, 15 Sep 2016 21:18:18 +0530
Subject: [PATCH] dmaengine: dmatest: Restore "memcpy" as default mode
In-Reply-To: <1473874838-13744-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1473874838-13744-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160915154818.GW13920@localhost>
To: linux-snps-arc@lists.infradead.org

On Wed, Sep 14, 2016@08:40:38PM +0300, Eugeniy Paltsev wrote:
> Commit 0d4cb44da6ca0e8 ("dmaengine: dmatest: Add support for
> scatter-gather DMA mode") changes default "dmatest" behavior by
> changing default mode from "memcpy" to "scatter-gather".
> Now "memcpy" gets back as default mode.

Applied, thanks


-- 
~Vinod
