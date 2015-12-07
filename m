From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 7 Dec 2015 09:12:27 +0000
Subject: [PATCH] ARC: [axs10x] enable DW DMA controller
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F44D4B6E@IN01WEMBXA.internal.synopsys.com>
References: <1449256926-16786-1-git-send-email-abrodkin@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D4B6E@IN01WEMBXA.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449479546.2772.3.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Sat, 2015-12-05@10:14 +0000, Vineet Gupta wrote:
> On Saturday 05 December 2015 12:52 AM, Alexey Brodkin wrote:
> > From: Nelson Pereira <npereira at synopsys.com>
> > 
> > ARC SDP baseboard among other peripherals sports
> > DesignWare DMA controller.
> > 
> > This enables support of that device.
> > Note typically DW DMA controller is used with external devices
> > connected to ARC SDP board via HAPS Extension bus.
> 
> Such a board config needs to have it's own defconfig / DT (if needed). There's no
> point in enabling this for rest of the world who don't have a use case for this IP.
> 
> So nack !

I see rationale behind this decision but:
1) How enabled DMA controller hurts other users of the same SDP board
2) That DMA controller exists in SDP anyway - that's not a special flavor of ARC SDP
3) Another defconfig and .dts adds another item for verification while
   enabling DW DMA in our current defconfigs allows usage of the same one binaries for
   all purposes on ARC SDP.

-Alexey
