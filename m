From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 15 Nov 2017 17:36:36 +0000
Subject: etnaviv: PHYS_OFFSET usage
In-Reply-To: <1510764243.2835.13.camel@pengutronix.de>
References: <1510763053.29843.64.camel@synopsys.com>
 <1510764243.2835.13.camel@pengutronix.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1510767395.29843.83.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Lucas,

On Wed, 2017-11-15@17:44 +0100, Lucas Stach wrote:
> Hi Alexey,
> 
> Am Mittwoch, den 15.11.2017, 16:24 +0000 schrieb Alexey Brodkin:
> > 
> > Hi Lucas,
> > 
> > As we discussed on ELCE last month in Prague we have Vivante GPU
> > built-in our new ARC HSDK development board.
> > 
> > And even though [thanks to your suggestions] I got Etnaviv driver
> > working perfectly fine on our board I faced one quite a tricky
> > situation [which I dirty worked-around for now].
> > 
> > Etnaviv driver uses some PHYS_OFFSET define which is not very
> > usual across all architectures and platforms supported by Linux kernel.
> > 
> > In fact for ARC we don't have?PHYS_OFFSET defined [yet].
> > And I'm wondering how to get this resolved.
> > 
> > Essentially we have 2 options:
> > ?1. Define?PHYS_OFFSET for ARC (and later for other arches once needed)
> > ?2. Replace?PHYS_OFFSET with something else in etnaviv sources.
> > 
> > Even though (1) seems to be the simplest solution is doesn't look very nice
> > because it seems to be quite ARM-specific but not something really generic
> > and portable.
> > 
> > As for (2) frankly I din't quite understand why do we really care about
> > DDR start offset in the GPU driver. If some more light could be shed on this
> > topic probably we'll figure out what would be more elegant solution.
> 
> Basically the GPU has a linear address window which is 2GB in size and
> all GPU command buffers must be mapped through this window. The window
> has a base offset, so we can move it to point to different locations in
> the physical address space of the system.

Wow, what a design decision :)

> Etnaviv uses the PHYS_OFFSET to find out where in the physical address
> space the RAM starts. If the start of RAM is above the 2GB mark we
> _must_ use the linear window in order to make the command buffers
> available to the GPU.

Well that looks not super safe and versatile solution to me.
What if used RAM is much more than 2Gb? I guess in that case it's
possible to to set PHYS_OFFSET to say 0 and then kernel might allocate
command buffer above 2Gb which will make that buffer not visible for
GPU I guess.

> I'm not aware of any other kernel API that would allow us to find the
> start of RAM. If there is I would be happy to replace the PHYS_OFFSET
> stuff. If you don't like to copy the PHYS_OFFSET stuff to ARC, you
> would need to introduce some new API, which allows us to retrieve this
> information.

I'd say we may use so-called "reserved memory" here as a nice an elegant solution.
In device tree we describe this memory area like this:
------------------------------>8---------------------------
	gpu_3d: gpu at 90000 {
		compatible = "vivante,gc";
		reg = <0x90000 0x4000>;
		interrupts = <28>;
		memory-region = <&gpu_memory>;
	};

	reserved-memory {
		#address-cells = <2>;
		#size-cells = <2>;
		ranges;
		gpu_memory:?gpu_memory at be000000 {
			compatible = "shared-dma-pool";
			reg = <0xbe000000 0x2000000>;
			no-map;
		};
	};
------------------------------>8---------------------------

And then in the driver code we just need to do 2 things:
?1) Start using this memory for allocations in the driver
? ? with help of?of_reserved_mem_device_init()
?2) Get the region start. Not sure what's the best way to do it
? ? but I guess we'll be able to get "reg" property of the "gpu_memory"
? ? node in the worst case. And then use that base instead of PHYS_OFFSET.

If of any interest I'll be willing to send you an RFC shortly so you
may see real implementation in details.

-Alexey
