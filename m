From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 31 Aug 2017 10:38:17 -0700
Subject: [PATCH 3/3 v8] ARC: hsdk: initial port for HSDK board
In-Reply-To: <20170717173823.lklxhoyylhdxjawa@rob-hp-laptop>
References: <20170712094023.23226-1-Eugeniy.Paltsev@synopsys.com>
 <20170712094023.23226-4-Eugeniy.Paltsev@synopsys.com>
 <20170717173823.lklxhoyylhdxjawa@rob-hp-laptop>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c689523e-3fb9-8763-c3ec-83815cadbfd4@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Rob,

On 07/17/2017 10:38 AM, Rob Herring wrote:
> On Wed, Jul 12, 2017@12:40:23PM +0300, Eugeniy Paltsev wrote:
>> From: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w at public.gmane.org>
>>
>> This initial port adds support of ARC HS Development Kit board with some
>> basic features such serial port, USB, SD/MMC and Ethernet.
>>
>> Essentially we run Linux kernel on all 4 cores (i.e. utilize SMP) and
>> heavily use IO Coherency for speeding-up DMA-aware peripherals.
>>
>> Note as opposed to other ARC boards we link Linux kernel to
>> 0x9000_0000 intentionally because cores 1 and 3 configured with DCCM
>> situated at our more usual link base 0x8000_0000. We still can use
>> memory region starting at 0x8000_0000 as we reallocate DCCM in our
>> platform code.
>>
>> Note that PAE remapping for DMA clients does not work due to an RTL bug,
>> so CREG_PAE register must be programmed to all zeroes, otherwise it will
>> cause problems with DMA to/from peripherals even if PAE40 is not used.
>>
>> Signed-off-by: Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w at public.gmane.org>
>> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w at public.gmane.org>
>> ---
>> Changes v7 -> v8:
>>   * DTS: move cpu_intc, idu_intc, arcpct, timer, gfrc nodes to root
>>     level and out of the cpus node.
>>   * DTS: add vendor-specific compatible for ohci and ehci nodes.
>>   * DTS: style fixes
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A at public.gmane.org>
> 
>> +		ohci at 60000 {
>> +			compatible = "snps,hsdk-v1.0-ohci", "generic-ohci";
>> +			reg = <0x60000 0x100>;
>> +			interrupts = <15>;
>> +		};
>> +
>> +		ehci at 40000 {
>> +			compatible = "snps,hsdk-v1.0-ehci", "generic-ehci";
>> +			reg = <0x40000 0x100>;
>> +			interrupts = <15>;
>> +		};
> 
> Of course, now these compatibles need to be documented. You can do that
> in a separate follow-up patch.


Are these v1 suffixes really needed. We don't envision any change to usb IP even 
if we were to ever do a respin of the board !

Thx,
-Vineet
