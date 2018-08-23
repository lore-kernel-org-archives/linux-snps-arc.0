From: rdunlap@infradead.org (Randy Dunlap)
Date: Thu, 23 Aug 2018 08:08:34 -0700
Subject: [PATCH 1/2] GPIO: add single-register gpio via creg driver
In-Reply-To: <20180823150013.21837-2-Eugeniy.Paltsev@synopsys.com>
References: <20180823150013.21837-1-Eugeniy.Paltsev@synopsys.com>
 <20180823150013.21837-2-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c5f75b43-6ef3-31e2-0366-b6c8623d3f5d@infradead.org>
To: linux-snps-arc@lists.infradead.org

On 08/23/2018 08:00 AM, Eugeniy Paltsev wrote:
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 71c0ab46f216..0f9cc1582cab 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -430,6 +430,15 @@ config GPIO_REG
>  	  A 32-bit single register GPIO fixed in/out implementation.  This
>  	  can be used to represent any register as a set of GPIO signals.
>  
> +config GPIO_SNPS_CREG
> +	bool "GPIO via CREG (Control REGisers) driver"

	                             REGisters)

> +	select OF_GPIO
> +	help
> +	  This driver supports GPIOs via CREG on various Synopsys SoCs.
> +	  This is is single-register MMIO gpio driver for complex cases

	  This is a                  MMIO GPIO

> +	  where only several fields in register belong to GPIO and

	                            in a register

> +	  each GPIO owns field with different length and on/off values.

maybe:
	                 fields with different lengths

> +
>  config GPIO_SPEAR_SPICS
>  	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
>  	depends on PLAT_SPEAR


-- 
~Randy
