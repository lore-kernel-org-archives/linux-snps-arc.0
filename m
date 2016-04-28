From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 28 Apr 2016 13:46:22 +0000
Subject: [PATCH 2/2] ARC: [axs10x] Specify reserved memory for frame buffer
In-Reply-To: <572190F3.3020709@synopsys.com>
References: <1461767701-12208-1-git-send-email-abrodkin@synopsys.com>
 <1461767701-12208-3-git-send-email-abrodkin@synopsys.com>
 <572190F3.3020709@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1461851171.3673.30.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Thu, 2016-04-28@09:56 +0530, Vineet Gupta wrote:

[snip]

> > 
> > diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
> > index 420dcfd..ae6162d 100644
> > --- a/arch/arc/boot/dts/axc001.dtsi
> > +++ b/arch/arc/boot/dts/axc001.dtsi
> > @@ -95,6 +95,24 @@
> > ?		#size-cells = <1>;
> > ?		ranges = <0x00000000 0x80000000 0x40000000>;
> > ?		device_type = "memory";
> > -		reg = <0x80000000 0x20000000>;	/* 512MiB */
> > +		reg = <0x80000000 0x1f000000>;	/* 512 - 16 MiB */
> Is 16MB fixed size or is this a function of display resolution / density etc.

Indeed this value depends on screen resolution and bpp and double-
or even tripple-buffering (once this becomes supported in the driver).

So as of now the corner case would be 1920x1080, 16 bits per pixel
which gives ~4Mb. Now if we add support of triple-buffering we'll
need ~12Mb so I booked a little bit more - 16Mb.

But now I recalled that we also support?r8g8b8 mode and in this case
3 bytes are used for color encoding, which effectively gives ~6Mb for
1 FullHD frame. And for tripple-buffering we'll need > 18Mb, so probably
we'll need to go for 24 or even 32 Mb.

[snip]

> > +
> > +	reserved-memory {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges;
> > +		/*
> > +		?* Move frame buffer out of IOC aperture (0x8z-0xAz).
> > +		?*/
> > +		frame_buffer: frame_buffer at bf000000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0xbf000000 0x1000000>;
> Can this be made a bit more future safe. AXS103 has 1 GB of DDR while kernel
> currently only uses 512M. Once we increase that, this will need fixing too. Better
> to make this as far possible.

Makes sense. Will move it to the very end of 1Gb.

> Note that the IOC start alignment needs to follow
> max(4k, size). What will be maximum size of frame buffer - 16M always !

What do you mean by that?

-Alexey
