From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 10 Aug 2016 12:22:41 +0000
Subject: dmatest no longer works on ARC SDP with DW DMAC
In-Reply-To: <1470831336.4887.22.camel@linux.intel.com>
References: <1470827209.21247.12.camel@synopsys.com>
 <1470831336.4887.22.camel@linux.intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1470831659.3428.23.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Andy,

On Wed, 2016-08-10@15:15 +0300, Andy Shevchenko wrote:
> On Wed, 2016-08-10@11:06 +0000, Eugeniy Paltsev wrote:
> > 
> > dmatest on ARC SDP with DW DMAC became broken after df5c7386
> > ("dmaengine: dw: some Intel devices has no memcpy support") and
> > 30cb2639 ("dmaengine: dw: don't override platform data with autocfg")
> > commits.
> > * After df5c7386 commit "DMA_MEMCPY" capability option doesn't
> > get set correctly in platform driver version.
> > * After 30cb2639 commit
> > "data_width" and "nollp" parameters don't get set correctly in
> > platform
> > driver version.
> > 
> > This happens because in old driver version there are three sources?
> > of parameters: pdata, device tree and autoconfig hardware registers.?
> > Some parameters were read from pdata and others from autoconfig
> > hardware registers. If pdata was absent some pdata structure?
> > fields were filled with parameters from device tree. But 30cb2639
> > commit disabled overriding pdata with autocfg, so if we use platform
> > driver version without pdata some parameters will not be set.
> 
> Yes, that's correct behaviour right now. You have to provide platform
> code which registers device with all platform data provided.

But given autocfg registers exist in HW why don't we rely on their contents?

> > I'm wondering what would be the best way to fix this situation?
> 
> Ideally we have to switch to use built-in device properties
> (drivers/base/property.c) and platform code in your case has to provide
> properties.

What do you mean saying "built-in device properties"?
Setting pdata structure? In our particular case we use device tree
for DW DMAC setup.

-Alexey
