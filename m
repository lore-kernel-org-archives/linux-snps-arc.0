From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 24 Feb 2016 14:12:00 +0000
Subject: [PATCH 2/4 RESEND] ARC: axs10x: Update defconfigs so that audio
 is enabled
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E8BD53@us01wembx1.internal.synopsys.com>
References: <cover.1456234503.git.joabreu@synopsys.com>
 <174bd675951f46071d0db8ea1f67abb083053332.1456234503.git.joabreu@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8BD53@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1456323120.3392.31.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2016-02-24@04:36 +0000, Vineet Gupta wrote:
> On Tuesday 23 February 2016 07:22 PM, Jose Abreu wrote:
> > The defconfigs for the AXS boards were updated so that
> > ALSA SoC is enabled and also the audio for the ADV7511
> > HDMI transmitter.
> > 
> > Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> > ---
> > ?arch/arc/configs/axs101_defconfig?????| 3 +++
> > ?arch/arc/configs/axs103_defconfig?????| 5 +++++
> > ?arch/arc/configs/axs103_smp_defconfig | 5 +++++
> 
> @Alexey, has this been tested on AXS103. Do we have the right PLL / clocks to get
> the audio rates - given the lower master clk.

I think I tried first version of these patches on axs103 as well.
But may assume Jose have no access to axs103 and so this particular
implementation may lack tests on axs103 platform. Still this is easy to
fix - I'll try it myself now.

> Further per out off-list discussion - let us have a seperate config for ARC HS SDP
> which supports the shipping single hardware configuration and add these fancy
> things there as well as bumping the clk rate to 100 MHz . Current axs103* configs
> are more of developer configs and I don't want to bloat their code with things we
> don't build / download 10 times a day !

Agree but first we need to introduce those additional configs.
Let me draft those.

In the meantime it would be helpful if you take a look at existing axs10x_defconfigs
and check which option you do want to keep and what are those extra once that should
go to new configs with all bells and whistles.


-Alexey
