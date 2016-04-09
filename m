From: lars@metafoo.de (Lars-Peter Clausen)
Date: Sat, 9 Apr 2016 16:55:37 +0200
Subject: [alsa-devel] [PATCH 5/5 v4] ASoC: dwc: Update DOCUMENTATION for
 I2S Driver
In-Reply-To: <5707D780.4050406@synopsys.com>
References: <cover.1460047238.git.joabreu@synopsys.com>
 <ce97e6bb7ddb71e532c4066334ceead4d4d3e692.1460047238.git.joabreu@synopsys.com>
 <20160407175326.GX1924@sirena.org.uk> <570782BF.10402@synopsys.com>
 <5707D3AD.8030308@metafoo.de> <5707D780.4050406@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <570917E9.8020804@metafoo.de>
To: linux-snps-arc@lists.infradead.org

On 04/08/2016 06:08 PM, Jose Abreu wrote:
> Hi Lars,
> 
> 
> On 08-04-2016 16:52, Lars-Peter Clausen wrote:
>> On 04/08/2016 12:06 PM, Jose Abreu wrote:
>>> Hi Mark,
>>>
>>>
>>> On 07-04-2016 18:53, Mark Brown wrote:
>>>> On Thu, Apr 07, 2016@05:53:59PM +0100, Jose Abreu wrote:
>>>>
>>>>> + Optional properties:
>>>>> + - snps,use-dmaengine: If set the driver will use ALSA DMA engine. If set
>>>>> +   it is required to use the properties 'dmas' and 'dma-names'.
>>>> This is not a good interface, it's describing Linux internal APIs.  If
>>>> the device needs to operate in PIO mode it should just do that.
>>> I added this interface because there is no direct way to check if DMA is
>>> available on the I2S controller so it is not possible to automatically change
>>> between DMA and PIO mode. As the I2S controller can be built with or without DMA
>>> support it is necessary to somehow check if DMA is enabled or not and according
>>> to that use either ALSA DMA engine or the custom platform driver sent in these
>>> patches. I did not want to remove drivers functionality so I added this property
>>> to the DT. This way a user can select between DMA and PIO mode.
>> That's OK, but you need to describe the hardware, not the indented behavior
>> of the software driver.
>>
> 
> Is this okay: "snps,use-dmaengine: Set this boolean paramater if I2S controller
> has DMA support. If set the properties 'dmas' and 'dma-names' must be also set" ?

The description is better. But the name of the property is still imperative
rather then descriptive. It tells the software what should be done rather
then describing what the hardware looks like.

Since there is already the dmas property which is present if a DMA is
connected and is absent when no DMA is present it should be enough to just
check that property rather than requiring an additional one.
