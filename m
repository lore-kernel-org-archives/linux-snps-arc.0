From: l.stach@pengutronix.de (Lucas Stach)
Date: Thu, 23 Aug 2018 10:54:16 +0200
Subject: [RFC] etnaviv: missing dma_mask
In-Reply-To: <20180817064222.GB10811@lst.de>
References: <20180814141225.6123-1-Eugeniy.Paltsev@synopsys.com>
 <20180817064222.GB10811@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1535014456.2724.1.camel@pengutronix.de>
To: linux-snps-arc@lists.infradead.org

Am Freitag, den 17.08.2018, 08:42 +0200 schrieb Christoph Hellwig:
> On Tue, Aug 14, 2018@05:12:25PM +0300, Eugeniy Paltsev wrote:
> > Hi Lucas, Christoph,
> > 
> > After switching ARC to generic dma_noncoherent cache ops?
> > etnaviv driver start failing on dma maping functions because of
> > dma_mask lack.
> > 
> > So I'm wondering is it valid case to have device which is
> > DMA capable and doesn't have dma_mask set?
> > 
> > If not, then I guess something like that should work
> > (at least it works for ARC):
> 
> This looks ok is a minimal fix:
> 
> Reviewed-by: Christoph Hellwig <hch at lst.de>
> 
> But why doesn't this device have a dma-range property in DT?

Because the etnaviv device is a virtual device not represented in DT,
as it is only used to expose the DRM device, which may cover multiple
GPU core devices. The GPU core devices are properly configured from DT,
but unfortunately many of the dma related operations happen through the
DRM device. We could fix this by replacing many of the DRM helpers with
etnaviv specific functions handling dma per GPU core, but it isn't a
clear win right now, as generally on SoCs with multiple GPU cores, the
devices are on the same bus and have the same dma requirements.

Regards,
Lucas
