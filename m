From: sboyd@codeaurora.org (sboyd@codeaurora.org)
Date: Mon, 11 Apr 2016 15:03:20 -0700
Subject: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
In-Reply-To: <1460393270.5119.20.camel@synopsys.com>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
 <1460393270.5119.20.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160411220320.GB14441@codeaurora.org>
To: linux-snps-arc@lists.infradead.org

On 04/11, Alexey Brodkin wrote:
> On Mon, 2016-04-11@11:41 +0100, Jose Abreu wrote:
> > + * warranty of any kind, whether express or implied.
> > + */
> > +
> > +#include <linux/platform_device.h>
> > +#include <linux/module.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/err.h>
> > +#include <linux/device.h>
> 
> "linux/platform_device.h" includes "linux/device.h" so you may make this list of headers
> a little bit shorter.
> 
> > +#include <linux/of_address.h>
> > +#include <linux/slab.h>
> > +#include <linux/of.h>
> 
> "linux/of_address.h" already includes "linux/of.h".

It's ok to include things twice. In fact, its better to avoid any
implicit includes so that if we ever want to remove includes from
other headers we can do so without disturbing this driver.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
