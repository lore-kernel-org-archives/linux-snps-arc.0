From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Tue, 29 Mar 2016 18:51:34 +0100
Subject: [PATCH] clk/arc: Add I2S PLL clock driver
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E915E9@us01wembx1.internal.synopsys.com>
References: <e580aaf30e3c66d13693a4e6db0ced1996d37c04.1459246186.git.joabreu@synopsys.com>
 <1459250707.3021.31.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E915E9@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56FAC0A6.5000504@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On 29-03-2016 13:36, Vineet Gupta wrote:
> On Tuesday 29 March 2016 04:55 PM, Alexey Brodkin wrote:
>> Hi Jose,
>>
>> On Tue, 2016-03-29@11:56 +0100, Jose Abreu wrote:
>>> The ARC SDP I2S clock can be programmed using a
>>> specific PLL.
>>>
>>> This patch has the goal of adding a clock driver
>>> that programs this PLL.
>>>
>>> At this moment the rate values are hardcoded in
>>> a table but in the future it would be ideal to
>>> use a function which determines the PLL values
>>> given the desired rate.
>>>
>>> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
>>> ---
>> I believe these kind of patches worth sending to
>> linux-snps mailing list (at least add it in Cc) so
>> they won't be lost in time and could be used later as
>> useful references.
> Please do also CC the common clk maintainers
>
> COMMON CLK FRAMEWORK
> M:    Michael Turquette <mturquette at baylibre.com>
> M:    Stephen Boyd <sboyd at codeaurora.org>
> L:    linux-clk at vger.kernel.org

Well, this was just an experiment and I think this patch is still far from being
ready to go mainline, that's why I did not cc'ed the clk maintainers. I will
send a v2 soon so you can review and if you think its worth sending to mainline
I will do that.

>>>  arch/arc/boot/dts/axs10x_mb.dtsi |   5 ++
>>>  drivers/clk/Makefile             |   1 +
>>>  drivers/clk/arc/Makefile         |   1 +
>>>  drivers/clk/arc/i2s_pll_clock.c  | 143 +++++++++++++++++++++++++++++++++++++++
>>>  4 files changed, 150 insertions(+)
>>>  create mode 100644 drivers/clk/arc/Makefile
>>>  create mode 100644 drivers/clk/arc/i2s_pll_clock.c
>>>
>>> diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
>>> index ab5d570..9c68226 100644
>>> --- a/arch/arc/boot/dts/axs10x_mb.dtsi
>>> +++ b/arch/arc/boot/dts/axs10x_mb.dtsi
>>> @@ -23,6 +23,11 @@
>>>  				#clock-cells = <0>;
>>>  			};
>>>  
>>> +			i2sclk: i2sclk {
>>> +				compatible = "snps,i2s-pll-clock";
>>> +				#clock-cells = <0>;
>>> +			};
>>> +
>>>  			apbclk: apbclk {
>>>  				compatible = "fixed-clock";
>>>  				clock-frequency = <50000000>;
>>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>>> index 46869d6..620e47f 100644
>>> --- a/drivers/clk/Makefile
>>> +++ b/drivers/clk/Makefile
>>> @@ -84,3 +84,4 @@ obj-$(CONFIG_X86)			+= x86/
>>>  obj-$(CONFIG_ARCH_ZX)			+= zte/
>>>  obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
>>>  obj-$(CONFIG_H8300)		+= h8300/
>>> +obj-$(CONFIG_ARC)		+= arc/
>> Two things here:
>>  [1] This clock is relevant to only one board but not SoC, CPU core
>>      or whole architecture, so it makes sense to make it dependent on
>>      the AXS platform, i.e. CONFIG_ARC_PLAT_AXS10X.
>>
>>  [2] Something similar is applicable to folder name, I would suggest to
>>      use "drivers/clk/axs10x"
>>
>>> diff --git a/drivers/clk/arc/Makefile b/drivers/clk/arc/Makefile
>>> new file mode 100644
>>> index 0000000..01996b8
>>> --- /dev/null
>>> +++ b/drivers/clk/arc/Makefile
>>> @@ -0,0 +1 @@
>>> +obj-y += i2s_pll_clock.o
>>> diff --git a/drivers/clk/arc/i2s_pll_clock.c b/drivers/clk/arc/i2s_pll_clock.c
>>> new file mode 100644
>>> index 0000000..8c401f1
>>> --- /dev/null
>>> +++ b/drivers/clk/arc/i2s_pll_clock.c
>>> @@ -0,0 +1,143 @@
>>> +/*
>>> + * Synopsys I2S PLL clock driver
>> Again that's not generic SNPS I2S clock but clock driver for a particular board.
>>
>>> + *
>>> + * drivers/clk/arc/i2s_pll_clock.c
>> BTW not sure why this path could be needed here.
>> IMHO that might be safely dropped.
>>
>>> + *
>>> + * Copyright (C) 2016 Synopsys
>>> + *
>>> + * This file is licensed under the terms of the GNU General Public
>>> + * License version 2. This program is licensed "as is" without any
>>> + * warranty of any kind, whether express or implied.
>>> + */
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/err.h>
>>> +#include <linux/device.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/slab.h>
>>> +
>>> +/* FPGA Version Info */
>>> +#define FPGA_VER_INFO	0xE0011230
>>> +#define FPGA_VER_27M	0x000FBED9
>> This is a little bit tricky.
>> We'll need to do that check in each and every clock driver for AXS10x
>> and so it worth putting this code in some common location (I mean common
>> for all axs10x clock drivers).
>>
>>> +/* PLL registers addresses */
>>> +#define PLL_IDIV_ADDR	0xE00100A0
>>> +#define PLL_FBDIV_ADDR	0xE00100A4
>>> +#define PLL_ODIV0_ADDR	0xE00100A8
>>> +#define PLL_ODIV1_ADDR	0xE00100AC
>>>
>>> +struct i2s_pll_clk {
>>> +	struct clk_hw hw;
>>> +};
>>> +
>>> +struct i2s_pll_cfg {
>>> +	unsigned int rate;
>>> +	unsigned int idiv;
>>> +	unsigned int fbdiv;
>>> +	unsigned int odiv0;
>>> +	unsigned int odiv1;
>>> +};
>>> +
>>> +static const struct i2s_pll_cfg i2s_pll_cfg_27m[] = {
>>> +	/* 27 Mhz */
>>> +	{ 1024000, 0x104, 0x451, 0x10E38, 0x2000 },
>>> +	{ 1411200, 0x104, 0x596, 0x10D35, 0x2000 },
>>> +	{ 1536000, 0x208, 0xA28, 0x10B2C, 0x2000 },
>>> +	{ 2048000, 0x82, 0x451, 0x10E38, 0x2000 },
>>> +	{ 2822400, 0x82, 0x596, 0x10D35, 0x2000 },
>>> +	{ 3072000, 0x104, 0xA28, 0x10B2C, 0x2000 },
>>> +	{ 0, 0, 0, 0, 0 },
>>> +};
>>> +
>>> +static const struct i2s_pll_cfg i2s_pll_cfg_28m[] = {
>>> +	/* 28.224 Mhz */
>>> +	{ 1024000, 0x82, 0x105, 0x107DF, 0x2000 },
>>> +	{ 1411200, 0x28A, 0x1, 0x10001, 0x2000 },
>>> +	{ 1536000, 0xA28, 0x187, 0x10042, 0x2000 },
>>> +	{ 2048000, 0x41, 0x105, 0x107DF, 0x2000 },
>>> +	{ 2822400, 0x145, 0x1, 0x10001, 0x2000 },
>>> +	{ 3072000, 0x514, 0x187, 0x10042, 0x2000 },
>>> +	{ 0, 0, 0, 0, 0 },
>>> +};
>>> +
>>> +static unsigned long i2s_pll_recalc_rate(struct clk_hw *hw,
>>> +			unsigned long parent_rate)
>>> +{
>>> +	/* TODO */
>>> +	pr_info("%s: parent_rate=%ld\n", __func__, parent_rate);
>>> +	return parent_rate;
>>> +}
>>> +
>>> +static long i2s_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>>> +			unsigned long *prate)
>>> +{
>>> +	/* TODO: Round rate to nearest valid rate */
>>> +	*prate = rate;
>>> +	pr_info("%s: rate=%ld, prate=%ld\n", __func__, rate, *prate);
>>> +	return *prate;
>>> +}
>> These are now just dummy functions so probably they could be dropped.
>>
>>> +static int i2s_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>> +			unsigned long parent_rate)
>>> +{
>>> +	const struct i2s_pll_cfg *pll_cfg;
>>> +	int i;
>>> +
>>> +	if (readl((void *)FPGA_VER_INFO) <= FPGA_VER_27M)
>>> +		pll_cfg = i2s_pll_cfg_27m;
>>> +	else
>>> +		pll_cfg = i2s_pll_cfg_28m;
>> As I mentioned above we need to check board version in common place and then
>> just use some variable or structure member for comparison.
>>
>> Otherwise it looks pretty nice!
>>
>> -Alexey
>

Best regards,
Jose Miguel Abreu
