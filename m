From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 6 Dec 2017 14:02:09 -0800
Subject: [PATCH 0/4] ARC: Set initial core pll output frequency via DTS
In-Reply-To: <20171127185611.12379-1-Eugeniy.Paltsev@synopsys.com>
References: <20171127185611.12379-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <734551f7-b558-b9b4-654b-9c381025c3fb@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/27/2017 10:56 AM, Eugeniy Paltsev wrote:
> Set initial core pll output frequency on HSDK and AXS103 via
> "assigned-clock-rates" property in device tree.
> It will be applied at the core pll driver probing.

Can you repost - CC'ing Stephen boyd and RobH ?

-Vineet

>
> Eugeniy Paltsev (4):
>    ARC: [plat-hsdk]: Set initial core pll output frequency
>    ARC: [plat-hsdk]: Get rid of core pll frequency set in platform code
>    ARC: [plat-axs103]: Set initial core pll output frequency
>    ARC: [plat-axs103] refactor the quad core DT quirk code
>
>   arch/arc/boot/dts/axc003.dtsi     |  3 +++
>   arch/arc/boot/dts/axc003_idu.dtsi |  3 +++
>   arch/arc/boot/dts/hsdk.dts        |  3 +++
>   arch/arc/plat-axs10x/axs10x.c     | 18 ++++++++---------
>   arch/arc/plat-hsdk/platform.c     | 42 ---------------------------------------
>   5 files changed, 17 insertions(+), 52 deletions(-)
>
