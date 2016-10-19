From: vinod.koul@intel.com (Vinod Koul)
Date: Wed, 19 Oct 2016 09:04:57 +0530
Subject: [PATCH] dmaengine: dmatest: Restore "memcpy" as default mode
In-Reply-To: <ca16ea1f-2c15-b581-2375-4e805e6b1e0e@intel.com>
References: <1473874838-13744-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <20160915154818.GW13920@localhost>
 <ca16ea1f-2c15-b581-2375-4e805e6b1e0e@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161019033456.GG2467@localhost>
To: linux-snps-arc@lists.infradead.org

On Tue, Oct 18, 2016@11:14:08AM -0700, Dave Jiang wrote:
> On 09/15/2016 08:48 AM, Vinod Koul wrote:
> > On Wed, Sep 14, 2016@08:40:38PM +0300, Eugeniy Paltsev wrote:
> >> Commit 0d4cb44da6ca0e8 ("dmaengine: dmatest: Add support for
> >> scatter-gather DMA mode") changes default "dmatest" behavior by
> >> changing default mode from "memcpy" to "scatter-gather".
> >> Now "memcpy" gets back as default mode.
> > 
> > Applied, thanks
> 
> Did that go into stable? It's breaking the default expected behavior in
> 4.8 without the fix.

No it wasnt, and it should have...

I send to stable and lokks like it should applied on 4.7 and 4.8.
Commit 0d4cb44da6ca0e8 ("dmaengine: dmatest: Add support for scatter-gather
DMA mode") came in 4.7 IIUC..

Thanks
-- 
~Vinod
