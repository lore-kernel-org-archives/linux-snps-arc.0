From: mpe@ellerman.id.au (Michael Ellerman)
Date: Thu, 26 Nov 2015 18:04:47 +1100
Subject: + arc-convert-to-dma_map_ops.patch added to -mm tree
In-Reply-To: <56544C89.7060302@synopsys.com>
References: <564b9e3a.DaXj5xWV8Mzu1fPX%akpm@linux-foundation.org>
 <C2D7FE5348E1B147BCA15975FBA23075F44D2EEF@IN01WEMBXA.internal.synopsys.com>
 <20151124075047.GA29572@lst.de>
 <C2D7FE5348E1B147BCA15975FBA23075F44D3928@IN01WEMBXA.internal.synopsys.com>
 <1448362882.32654.1.camel@ellerman.id.au> <56544C89.7060302@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1448521487.19291.1.camel@ellerman.id.au>
To: linux-snps-arc@lists.infradead.org

On Tue, 2015-11-24@17:09 +0530, Vineet Gupta wrote:
> Hi Michael,
> On Tuesday 24 November 2015 04:31 PM, Michael Ellerman wrote:
> > On Tue, 2015-11-24@09:46 +0000, Vineet Gupta wrote:
> > > > On Tuesday 24 November 2015 01:20 PM, hch@lst.de wrote:
> > > > > > Hi Vineet,
> > > > > > 
> > > > > > the original version went through the buildbot, which succeeded.  It seems
> > > > > > like the official buildbot does not support arc, and might benefit from
> > > > > > helping to set up an arc environment. 
> > > > 
> > > > I have in the past asked kisskb service folks - but haven't heard back from them.
> > > > Stephan, Michael could you please add ARC toolchain to kisskb build service. I can
> > > > buy you guys a beer (or some other beverage of choice) next time we meet :-)
> > Sure, where do I get a toolchain? Can I just build upstream binutils + GCC?
> > 
> We are in the process of revamping upstream support for GNU tools (they were added
> many years ago, bit-rotted and now are being redone again).
> 
> The current tools are hoisted on github.
> https://github.com/foss-for-synopsys-dwc-arc-processors/
> 
> You could use upstream buildroot which automatically picks up relevant tools
> branches from our github repos.
> 
> Please note that ARC cores are based off two ISA: ARCompact and recently announced
> ARCv2. Thus it would be awesome if we could build following kernel configs on
> regular basis:
>  - axs101_defconfig
>  - axs103_smp_defconfig
> 
> This however needs 2 toolchain installs as we don't have multilibed tools which
> support both ISA.
> 
> You can do following to generate the tools (this first pass builds the kernel as
> well which can be disabled if u so wish).
> 
> $ wget http://buildroot.uclibc.org/downloads/buildroot-2015.08.1.tar.gz
> $ tar -xvf buildroot-2015.08.1.tar.gz
> $ cd buildroot-2015.08.1; mkdir arcv2 arcomp
> 
> $ make O=arcv2 snps_axs103_defconfig ; cd arcv2; make ; cd .. # for ARCv2 tools
> $ make O=arcomp snps_axs101_defconfig ; cd arcomp; make # for ARCompact tools

OK. In general I'm not inclined to support custom toolchains, simply because of
the extra work required.

But seeing as you asked nicely and gave me instructions I'll try and build it
and see how I go :)

cheers
