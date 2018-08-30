From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 30 Aug 2018 12:14:25 +0000
Subject: [PATCH v2 1/2] GPIO: add single-register gpio via creg driver
In-Reply-To: <024be088-15ff-89ed-3766-09eb64e47342@infradead.org>
References: <20180828112721.28178-1-Eugeniy.Paltsev@synopsys.com>
 <20180828112721.28178-2-Eugeniy.Paltsev@synopsys.com>
 <024be088-15ff-89ed-3766-09eb64e47342@infradead.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1535631219.4465.47.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2018-08-28@11:15 -0700, Randy Dunlap wrote:
> Hi,
> 
> I don't see any updates/corrections here.  :(

My fault - I've forgotten to re-generate new patch via git format-patch
and send you previous version.

> 
> On 08/28/2018 04:27 AM, Eugeniy Paltsev wrote:
> 
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 71c0ab46f216..0f9cc1582cab 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -430,6 +430,15 @@ config GPIO_REG
> >  	  A 32-bit single register GPIO fixed in/out implementation.  This
> >  	  can be used to represent any register as a set of GPIO signals.
> >  
> > +config GPIO_SNPS_CREG
> > +	bool "GPIO via CREG (Control REGisers) driver"
> > +	select OF_GPIO
> > +	help
> > +	  This driver supports GPIOs via CREG on various Synopsys SoCs.
> > +	  This is is single-register MMIO gpio driver for complex cases
> > +	  where only several fields in register belong to GPIO and
> > +	  each GPIO owns field with different length and on/off values.
> > +
> >  config GPIO_SPEAR_SPICS
> >  	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
> >  	depends on PLAT_SPEAR
> 
> 
-- 
 Eugeniy Paltsev
