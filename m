From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Wed, 10 Aug 2016 15:15:36 +0300
Subject: dmatest no longer works on ARC SDP with DW DMAC
In-Reply-To: <1470827209.21247.12.camel@synopsys.com>
References: <1470827209.21247.12.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1470831336.4887.22.camel@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

On Wed, 2016-08-10@11:06 +0000, Eugeniy Paltsev wrote:
> dmatest on ARC SDP with DW DMAC became broken after df5c7386
> ("dmaengine: dw: some Intel devices has no memcpy support") and
> 30cb2639 ("dmaengine: dw: don't override platform data with autocfg")
> commits.
> * After df5c7386 commit "DMA_MEMCPY" capability option doesn't
> get set correctly in platform driver version.
> * After 30cb2639 commit
> "data_width" and "nollp" parameters don't get set correctly in
> platform
> driver version.
> 
> This happens because in old driver version there are three sources?
> of parameters: pdata, device tree and autoconfig hardware registers.?
> Some parameters were read from pdata and others from autoconfig
> hardware registers. If pdata was absent some pdata structure?
> fields were filled with parameters from device tree. But 30cb2639
> commit disabled overriding pdata with autocfg, so if we use platform
> driver version without pdata some parameters will not be set.

Yes, that's correct behaviour right now. You have to provide platform
code which registers device with all platform data provided.

> I'm wondering what would be the best way to fix this situation?

Ideally we have to switch to use built-in device properties
(drivers/base/property.c) and platform code in your case has to provide
properties.

> Should we strictly read parameters from only one source (pdata/device
> tree/autoconfig) or we may mix some of them (for example getting
> missing data from autoconf regs)?

See above.

-- 
Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Intel Finland Oy
