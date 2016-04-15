From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 15 Apr 2016 12:08:37 +0000
Subject: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
In-Reply-To: <20160411220320.GB14441@codeaurora.org>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
 <1460393270.5119.20.camel@synopsys.com>
 <20160411220320.GB14441@codeaurora.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1460722116.3025.40.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi?Stephen,

On Mon, 2016-04-11@15:03 -0700, sboyd@codeaurora.org wrote:
> On 04/11, Alexey Brodkin wrote:
> > 
> > On Mon, 2016-04-11@11:41 +0100, Jose Abreu wrote:
> > > 
> > > + * warranty of any kind, whether express or implied.
> > > + */
> > > +
> > > +#include <linux/platform_device.h>
> > > +#include <linux/module.h>
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/err.h>
> > > +#include <linux/device.h>
> > "linux/platform_device.h" includes "linux/device.h" so you may make this list of headers
> > a little bit shorter.
> > 
> > > 
> > > +#include <linux/of_address.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/of.h>
> > "linux/of_address.h" already includes "linux/of.h".
> It's ok to include things twice. In fact, its better to avoid any
> implicit includes so that if we ever want to remove includes from
> other headers we can do so without disturbing this driver.

IMHO approach with minimal amount of headers is nice just because
it's easier to check if everything is in place. I mean attempt to compile
will immediately reveal a missing header.

So that's what I do - I remove as many inclusions as I may until stuff compiles.

But with approach of explicit inclusion it's much easier to include
much more headers than really needed. The only way to figure out if header is really
required is to manually check all used functions in the current source
which is way too unreliable and probably nobody will do it ever anyways.
And that's how we'll get more stale and pointless inclusions.

-Alexey
