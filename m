From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 20 Dec 2018 14:39:20 +0000
Subject: ensure dma_alloc_coherent always returns zeroed memory
In-Reply-To: <20181220143415.GA17726@lst.de>
References: <20181214082515.14835-1-hch@lst.de>
 <20181219165939.GA26087@lst.de> <1545316369.14089.20.camel@synopsys.com>
 <20181220143415.GA17726@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545316759.14089.22.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 2018-12-20@15:34 +0100, hch@lst.de wrote:
> On Thu, Dec 20, 2018@02:32:52PM +0000, Eugeniy Paltsev wrote:
> > Hi Christoph,
> > 
> > I test kernel from your 'dma-alloc-always-zero' branch, and as
> > I can see we have DMA peripherals (like USB) broken.
> 
> I would be really surprised if that is caused by the patch to add
> the zeroing. 
Me too :)

>  Can you check which commit caused the issue by bisecting
> from a known good baseline?

Yep. At least kernel build from v4.20-rc4 (which is base for your branch)
seems to work fine.

-- 
 Eugeniy Paltsev
