From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 26 Jul 2018 19:00:10 +0000
Subject: [PATCH] ARC: fix broken noncoherent cache ops
References: <20180724141302.4305-1-Eugeniy.Paltsev@synopsys.com>
 <20180726091155.GA24209@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B084089@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/26/2018 02:08 AM, Christoph Hellwig wrote:
> On Tue, Jul 24, 2018@05:13:02PM +0300, Eugeniy Paltsev wrote:
>> All DMA devices on ARC haven't worked with SW cache control
>> since commit a8eb92d02dd7 ("arc: fix arc_dma_{map,unmap}_page")
>> This happens because we don't check direction argument at all in
>> new implementation. Fix that.
>>
>> Fixies: commit a8eb92d02dd7 ("arc: fix arc_dma_{map,unmap}_page")
>> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> Looks sensible.  Might be worth explaining that ARC can speculate
> into the areas under DMA, which is why this is required.
>

ARC CPUs do prefetch, but I doubt if they are doing so, so aggressively, specially
when the region around DMA buffers is unlikely to be used for normal LD/ST
bleeding into DMA buffers. The issue here seems to be less technical and a bit of
snafu in implementation details.

1. originally
    dma_map_single(@dir)  => honored @dir, and did inv, wback or both depending on it

    sync_for_device(@dir) => forced @dir DMA_TO_DEV = > cache wback
    sync_for_cpu(@dir)     => forced @dir DMA_FROM_DEV = > cache inv

2. After commit a8eb92d02dd7, dma_map_single() starting callingsync_for_device( )
which as noted above didn't respect @dir, only doing cache wback, and thus would
fail for DMA_FROM_DEV/BIDIR cases where cpu needs to read from buffer and thus
requires cache inv as well. Likewise dma_unmap_single() would unconditionally do
cache inv, given usage of sync_for_cpu() which would be wrong for the TO_DEVICE cases.

Too bad I didn't spot this in the code review myself at the time.

-Vineet
