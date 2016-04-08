From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Fri, 8 Apr 2016 17:05:59 +0100
Subject: [alsa-devel] [PATCH 2/5 v4] drm/i2c/adv7511: Add audio support
In-Reply-To: <5707D249.5040707@metafoo.de>
References: <cover.1460047238.git.joabreu@synopsys.com>
 <d56087fae14074198f6c1bc749ce4da3cab62324.1460047238.git.joabreu@synopsys.com>
 <5707D249.5040707@metafoo.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5707D6E7.5090405@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Lars,


On 08-04-2016 16:46, Lars-Peter Clausen wrote:
> On 04/07/2016 06:53 PM, Jose Abreu wrote:
>> This patch adds audio support for the ADV7511 HDMI transmitter
>> using ALSA SoC.
>>
>> The code was ported from Analog Devices linux tree from
>> commit 1770c4a1e32b ("Merge remote-tracking branch
>> 'xilinx/master' into xcomm_zynq"), which is available at:
>> 	- https://github.com/analogdevicesinc/linux/
> The reason why this driver is still out of tree, is because there has been
> no conclusion yet on how to go forward with the whole HDMI integration. So
> this is not going to get merged until that issue has been addressed.

Ok, will then drop the patches related with adv7511 but will update with your
comments so that when this HDMI issue is addressed I can send again the patches.
Is this okay?

>
> [...]
>> +- adi,enable-audio: If set the ADV7511 driver will register a codec interface
>> +  into ALSA SoC.
> This is not a description of the hardware.

Is this okay: "adi,enable-audio: Set this boolean parameter if ADV7511
transmitter routes audio signals" ?

>
> [...]
>> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
>> index 964b7de..539c091 100644
>> --- a/include/sound/soc-dai.h
>> +++ b/include/sound/soc-dai.h
>> @@ -33,6 +33,7 @@ struct snd_compr_stream;
>>  #define SND_SOC_DAIFMT_DSP_B		5 /* L data MSB during FRM LRC */
>>  #define SND_SOC_DAIFMT_AC97		6 /* AC97 */
>>  #define SND_SOC_DAIFMT_PDM		7 /* Pulse density modulation */
>> +#define SND_SOC_DAIFMT_SPDIF		8 /* SPDIF */
> This needs to be a separate patch.

Ok.

>
>
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc

Best regards,
Jose Miguel Abreu
