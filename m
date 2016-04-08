From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Fri, 8 Apr 2016 11:06:55 +0100
Subject: [PATCH 5/5 v4] ASoC: dwc: Update DOCUMENTATION for I2S Driver
In-Reply-To: <20160407175326.GX1924@sirena.org.uk>
References: <cover.1460047238.git.joabreu@synopsys.com>
 <ce97e6bb7ddb71e532c4066334ceead4d4d3e692.1460047238.git.joabreu@synopsys.com>
 <20160407175326.GX1924@sirena.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <570782BF.10402@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Mark,


On 07-04-2016 18:53, Mark Brown wrote:
> On Thu, Apr 07, 2016@05:53:59PM +0100, Jose Abreu wrote:
>
>> + Optional properties:
>> + - snps,use-dmaengine: If set the driver will use ALSA DMA engine. If set
>> +   it is required to use the properties 'dmas' and 'dma-names'.
> This is not a good interface, it's describing Linux internal APIs.  If
> the device needs to operate in PIO mode it should just do that.

I added this interface because there is no direct way to check if DMA is
available on the I2S controller so it is not possible to automatically change
between DMA and PIO mode. As the I2S controller can be built with or without DMA
support it is necessary to somehow check if DMA is enabled or not and according
to that use either ALSA DMA engine or the custom platform driver sent in these
patches. I did not want to remove drivers functionality so I added this property
to the DT. This way a user can select between DMA and PIO mode.

Is there a better option to do this without removing the possibility of using
ALSA DMA engine in the driver?

Best regards,
Jose Miguel Abreu
