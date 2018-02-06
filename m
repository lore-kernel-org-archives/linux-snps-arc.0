From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 6 Feb 2018 12:25:24 +0000
Subject: [PATCH v2] arc: dts: use 'atmel' as manufacturer for at24 in
 axs10x_mb
In-Reply-To: <20180206110810.9093-1-brgl@bgdev.pl>
References: <20180206110810.9093-1-brgl@bgdev.pl>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1517919923.6726.13.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Bartosz,

On Tue, 2018-02-06@12:08 +0100, Bartosz Golaszewski wrote:
> Using compatible strings without the <manufacturer> part for at24 is
> deprecated since commit 6da28acf745f ("dt-bindings: at24: consistently
> document the compatible property"). Use a correct 'atmel,<model>'
> value.
> 
> Signed-off-by: Bartosz Golaszewski <brgl at bgdev.pl>

So my further input might be a bit unexpected :)

I took a look at the real board and understood that we specified in .dts
wrong ICs. Those Atmel parts are not connected to the CPU at all (used by some
external device) and instead I2C EEPROM we really have connected (but not yet
obviously used in the Linux kernel) is NXP's PCF8594C-2.

That said we may accept your change because it doesn't break anything
and then I'll send an update to axs10x_mb.dts with replacement of EEPROM nodes.
Or we may drop your change at all since I'm going to replace corresponding nodes.

-Alexey
