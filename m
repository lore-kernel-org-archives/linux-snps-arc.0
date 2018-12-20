From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 20 Dec 2018 14:32:52 +0000
Subject: ensure dma_alloc_coherent always returns zeroed memory
In-Reply-To: <20181219165939.GA26087@lst.de>
References: <20181214082515.14835-1-hch@lst.de> <20181219165939.GA26087@lst.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545316369.14089.20.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Christoph,

I test kernel from your 'dma-alloc-always-zero' branch, and as
I can see we have DMA peripherals (like USB) broken.

There are the errors example I got during USB initializing:
------------------------------>8--------------------------------
usb 1-1: device descriptor read/64, error -110
usb usb1-port1: attempt power cycle
usb 1-1: new high-speed USB device number 4 using ehci-platform
usb 1-1: device descriptor read/64, error -110
usb 1-1: device descriptor read/64, error -110
usb 1-1: new high-speed USB device number 5 using ehci-platform
usb 1-1: device descriptor read/64, error -110
usb 1-1: device descriptor read/64, error -110
usb usb1-port1: unable to enumerate USB device
usb 2-1: new full-speed USB device number 2 using ohci-platform
usb 2-1: device descriptor read/all, error -84
usb 2-1: new full-speed USB device number 3 using ohci-platform
usb 2-1: device descriptor read/all, error -84
usb usb2-port1: attempt power cycle
usb 2-1: new full-speed USB device number 4 using ohci-platform
usb 2-1: device descriptor read/8, error -62
usb 2-1: device descriptor read/8, error -62
usb 2-1: new full-speed USB device number 5 using ohci-platform
usb 2-1: device descriptor read/8, error -84
usb 2-1: device descriptor read/8, error -84
usb usb2-port1: unable to enumerate USB device
 [snip]
------------------------------8<--------------------------------


On Wed, 2018-12-19@17:59 +0100, Christoph Hellwig wrote:
> FYI, I've picked this up for dma-mapping for-next now.
> 
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc at lists.infradead.org
> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.infradead.org_mailman_listinfo_linux-2Dsnps-2Darc&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=ZlJN
> 1MriPUTkBKCrPSx67GmaplEUGcAEk9yPtCLdUXI&m=naBCT96A4RSQJLzBWzuCcmptFGiQDfFTOWJpprqDIVk&s=cHF84va89ofP6VlrV683ewENUXdaLW7opamLZSkZBgk&e=
-- 
 Eugeniy Paltsev
