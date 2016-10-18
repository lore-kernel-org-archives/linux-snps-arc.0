From: dave.jiang@intel.com (Dave Jiang)
Date: Tue, 18 Oct 2016 11:14:08 -0700
Subject: [PATCH] dmaengine: dmatest: Restore "memcpy" as default mode
In-Reply-To: <20160915154818.GW13920@localhost>
References: <1473874838-13744-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <20160915154818.GW13920@localhost>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ca16ea1f-2c15-b581-2375-4e805e6b1e0e@intel.com>
To: linux-snps-arc@lists.infradead.org

On 09/15/2016 08:48 AM, Vinod Koul wrote:
> On Wed, Sep 14, 2016@08:40:38PM +0300, Eugeniy Paltsev wrote:
>> Commit 0d4cb44da6ca0e8 ("dmaengine: dmatest: Add support for
>> scatter-gather DMA mode") changes default "dmatest" behavior by
>> changing default mode from "memcpy" to "scatter-gather".
>> Now "memcpy" gets back as default mode.
> 
> Applied, thanks
> 
> 

Did that go into stable? It's breaking the default expected behavior in
4.8 without the fix.
