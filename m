From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 28 Mar 2016 11:48:35 +0000
Subject: [PATCH 2/4] ARC: axs10x: Update defconfigs so that audio is
 enabled
In-Reply-To: <88015401488eed4f253f49d5831be13e0007339f.1458839710.git.joabreu@synopsys.com>
References: <cover.1458839710.git.joabreu@synopsys.com>
 <88015401488eed4f253f49d5831be13e0007339f.1458839710.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1459165715.4785.71.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Mon, 2016-03-28@10:41 +0100, Jose Abreu wrote:
> The defconfigs for the AXS boards were updated so that
> ALSA SoC is enabled and also the audio for the ADV7511
> HDMI transmitter.
> 
> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> ---
> ?arch/arc/configs/axs101_defconfig?????| 3 +++
> ?arch/arc/configs/axs103_defconfig?????| 5 +++++
> ?arch/arc/configs/axs103_smp_defconfig | 5 +++++
> ?3 files changed, 13 insertions(+)

As Vineet suggested here?http://lists.infradead.org/pipermail/linux-snps-arc/2016-February/000595.html
let's not pollute axs10x_defconfigs with new stuff but instead add all new
options to new configs that will cover everything available on ARC SDP boards.

Since those defconfigs for full SDP doesn't exist as of today please drop that change
as well as "[PATCH 4/4] ARC: axs10x: Update defconfigs so that I2S is enabled" from that
series.

I'll try to come up with mentioed new configs ASAP and then if your series is
already in upstream I'll add bits for audio through HDMI otherwise you'll add it
in some follow-up series.

-Alexey
