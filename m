From: linux@roeck-us.net (Guenter Roeck)
Date: Fri, 29 Jul 2016 14:48:54 -0700
Subject: Build failure in linux mainline when building arcv2 images
In-Reply-To: <66774d12-285a-438f-c050-fba65601bd3c@synopsys.com>
References: <579ACC26.9020106@roeck-us.net>
 <25e43ee1-5015-9dc3-777e-6101872f2ec4@synopsys.com>
 <579B5D79.8060907@roeck-us.net>
 <66774d12-285a-438f-c050-fba65601bd3c@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160729214854.GA21977@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

On Fri, Jul 29, 2016@01:03:56PM -0700, Vineet Gupta wrote:
> On 07/29/2016 06:43 AM, Guenter Roeck wrote:
> > On 07/28/2016 10:20 PM, Vineet Gupta wrote:
> >> Hi Guenter,
> >>
> >> On 07/28/2016 08:23 PM, Guenter Roeck wrote:
> >>> Hi Vineet,
> >>>
> >>> Mainline fails to build arcv2 images with the following error.
> >>>
> >>> {standard input}: Assembler messages:
> >>> {standard input}:19174: Error: Instruction with long immediate data in delay slot
> >>> make[2]: *** [block/cfq-iosched.o] Error 1
> >>>
> >>> Bisect points to commit 9a7f38c42c2 ("cfq-iosched: Convert from jiffies to
> >>> nanoseconds"),
> >>> but I don't really hold it responsible. It looks more like a compiler / binutils
> >>> problem
> >>> to me.
> >>
> >> Indeed - triggers a latent bug in ARC gcc !
> >>
> >>> I am using a toolchain built with buildroot (gcc 4.8.3). Is there a more recent
> >>> toolchain
> >>> than the one in buildroot available, by any chance ? If yes, where do I find it ?
> >>
> >> Yeah there's a 4.8.5 based one (referred to as GNU 2016.03) - will prebuilt
> >> toolchain suffice or would you prefer building on your own. Prebuilt could be
> >> found below.
> >>
> >> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2016.03
> >>
> >>
> >> For building on your own, Alexey can point to upstream buildroot which enabled
> >> 2016.03 tools.
> >>
> > 
> > Unfortunately, I get the same error when using "arc-linux-gcc.br_real (Buildroot
> > 2016.05) 4.8.5".
> 
> Weird - I don't see this when building mainline of now using prebuilt 2016.03
> tools on github . I'm building axs103_smp_defconfig.
> 
What exactly is prebuilt 2016.03 based on ? The arc tree on github only has an
arc-2016.02 branch. I tried it, but it reports the same error. I also tried
abrodkin-arc-2016.03, but it doesn't build for me.

> What exact buildroot commit did u use to build your tools BTW - I can try and
> replicate that here !
> 
I used buildroot 2016.05.

Guenter
