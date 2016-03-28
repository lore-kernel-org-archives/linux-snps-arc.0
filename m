From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 28 Mar 2016 11:55:45 +0000
Subject: [PATCH 3/4] ASoC: dwc: Add I2S HDMI audio support using custom
 platform driver
In-Reply-To: <7aaad0b57652fc724be7b447790c194645321173.1458839710.git.joabreu@synopsys.com>
References: <cover.1458839710.git.joabreu@synopsys.com>
 <7aaad0b57652fc724be7b447790c194645321173.1458839710.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1459166144.4785.77.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Mon, 2016-03-28@10:41 +0100, Jose Abreu wrote:
> HDMI audio support was added to the AXS board using an
> I2S cpu driver and a custom platform driver.
> 
> The platform driver supports two channels @ 16 bits with
> rates 32k, 44.1k and 48k. ALSA Simple audio card is used to
> glue the cpu, platform and codec driver (adv7511).
> 
> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> ---
> ?arch/arc/boot/dts/axs10x_mb.dtsi |??20 +-

You should not mix DT bindings for a particular board with generic driver
fixes or improvements.

I think it makes sense to split this patch in 2:
?1) Driver improvements
?2) .dts update for boards that use this driver

> ?sound/soc/dwc/Kconfig????????????|???1 +
> ?sound/soc/dwc/designware_i2s.c???| 384 +++++++++++++++++++++++++++++++++++++--
> ?3 files changed, 388 insertions(+), 17 deletions(-)

-Alexey
