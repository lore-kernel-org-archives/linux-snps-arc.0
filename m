From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 18 Jun 2018 11:10:51 -0700
Subject: [PATCH] ARC: Add PCIe support for ARC HSDK platform
In-Reply-To: <ba4b10e967fb39d18eba7a5c70abb167308481f5.camel@synopsys.com>
References: <3e9a2f384fd831fb2639ad99ec43ce0f019ac17c.1529333762.git.gustavo.pimentel@synopsys.com>
 <ba4b10e967fb39d18eba7a5c70abb167308481f5.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <562939df-4c97-c19b-72e3-14196a651c40@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/18/2018 08:20 AM, Alexey Brodkin wrote:
>> +static void __init hsdk_enable_gpio_intc_wire(void)
>> +{
>> +	u32 val = GPIO_HAPS_INT;
>> +
>> +	iowrite32(0xffffffff, (void __iomem *) GPIO_INTMASK);
>> +	iowrite32(~val, (void __iomem *) GPIO_INTMASK);
>> +	iowrite32(0x00000000, (void __iomem *) GPIO_INTTYPE_LEVEL);
>> +	iowrite32(0xffffffff, (void __iomem *) GPIO_INT_POLARITY);
>> +	iowrite32(val, (void __iomem *) GPIO_INTEN);
>> +}
> I would suggest to have a map of really used lines and enable all of them
> instead of adding one-by-one occasionally.

More importantly, adding any code in this file is an absolute abomination and only
desired if this is a platform specific hack which can't be added in the generic
driver and/or specified via the Device Tree. Here it seems like we are enabling
some gpio lines which likely could be done via the gpio driver paths ?

-Vineet
