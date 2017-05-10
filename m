From: vinod.koul@intel.com (Vinod Koul)
Date: Wed, 10 May 2017 09:25:07 +0530
Subject: [PATCH] Allow to use DMA_CTRL_REUSE flag for all channel types
In-Reply-To: <1493738176.25985.23.camel@synopsys.com>
References: <20170428133746.1855-1-Eugeniy.Paltsev@synopsys.com>
 <20170501055125.GN6263@localhost>
 <1493738176.25985.23.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170510035507.GW6263@localhost>
To: linux-snps-arc@lists.infradead.org

On Tue, May 02, 2017@03:16:18PM +0000, Eugeniy Paltsev wrote:
> Hi Vinod,
> 
> On Mon, 2017-05-01@11:21 +0530, Vinod Koul wrote:
> > On Fri, Apr 28, 2017@04:37:46PM +0300, Eugeniy Paltsev wrote:
> > > In the current implementation dma_get_slave_caps is used to check
> > > state of descriptor_reuse option. But dma_get_slave_caps includes
> > > check if the channel supports slave transactions.
> > > So DMA_CTRL_REUSE flag can be set (even for MEM-TO-MEM tranfers)
> > > only if channel supports slave transactions.
> > > 
> > > Now we can use DMA_CTRL_REUSE flag for all channel types.
> > > Also it allows to test reusing mechanism with simply mem-to-mem dma
> > > test.
> > 
> > We do not want to allow that actually. Slave is always treated as a
> > special
> > case, so resue was allowed.
> > 
> > With memcpy the assumptions are different and clients can do reuse.
> 
> Could you please clarify why don't we want to allow use DMA_CTRL_REUSE
> for mem-to-mem transfers?
> 
> Reusing of mem-to-mem (MEMCPY and DMA_SG) descriptors will work fine on
> virt-dma based drivers.

Precisely, the client does not know if you have a virt-dma or some other
kind if implementation

For them they see a channel and use it!

> Anyway the current implementation behaviour is quite strange:
> If channel supports *slave* transfers DMA_CTRL_REUSE can be set to
> slave and *mem-to-mem* transfers.
> 
> And, of course, we can pass DMA_CTRL_REUSE flag to device_prep_dma_sg
> or device_prep_dma_memcpy directly without checks.

Yeah thats bad, do send a patch to forbid that..

-- 
~Vinod
