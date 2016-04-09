From: lars@metafoo.de (Lars-Peter Clausen)
Date: Sat, 9 Apr 2016 17:02:49 +0200
Subject: [alsa-devel] [PATCH 2/5 v4] drm/i2c/adv7511: Add audio support
In-Reply-To: <5707D88A.3010400@synopsys.com>
References: <cover.1460047238.git.joabreu@synopsys.com>
 <d56087fae14074198f6c1bc749ce4da3cab62324.1460047238.git.joabreu@synopsys.com>
 <5707D249.5040707@metafoo.de> <5707D88A.3010400@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57091999.4010906@metafoo.de>
To: linux-snps-arc@lists.infradead.org

On 04/08/2016 06:12 PM, Jose Abreu wrote:
[...]
>>
>> [...]
>>> +- adi,enable-audio: If set the ADV7511 driver will register a codec interface
>>> +  into ALSA SoC.
>> This is not a description of the hardware.
> 
> Is this okay: "adi,enable-audio: Set this boolean parameter if ADV7511
> transmitter routes audio signals" ?

I don't think we need this property. There is no problem with registering
the audio part unconditionally. As long as there is no connection we wont
create a sound card that is exposed to userspace.
