From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Mon, 11 Apr 2016 10:27:14 +0100
Subject: [alsa-devel] [PATCH 2/5 v4] drm/i2c/adv7511: Add audio support
In-Reply-To: <57091999.4010906@metafoo.de>
References: <cover.1460047238.git.joabreu@synopsys.com>
 <d56087fae14074198f6c1bc749ce4da3cab62324.1460047238.git.joabreu@synopsys.com>
 <5707D249.5040707@metafoo.de> <5707D88A.3010400@synopsys.com>
 <57091999.4010906@metafoo.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <570B6DF2.1080008@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Lars,


On 09-04-2016 16:02, Lars-Peter Clausen wrote:
> On 04/08/2016 06:12 PM, Jose Abreu wrote:
> [...]
>>> [...]
>>>> +- adi,enable-audio: If set the ADV7511 driver will register a codec interface
>>>> +  into ALSA SoC.
>>> This is not a description of the hardware.
>> Is this okay: "adi,enable-audio: Set this boolean parameter if ADV7511
>> transmitter routes audio signals" ?
> I don't think we need this property. There is no problem with registering
> the audio part unconditionally. As long as there is no connection we wont
> create a sound card that is exposed to userspace.
>

This change was suggested by Laurent Pinchart and was introduced in v3. Quoting
Laurent:
"The idea is that enabling support for ADV7511 audio in the kernel isn't coupled
with whether the system includes audio support. It would be confusing, and would
also waste resources, to create a Linux sound device when no sound channel is
routed on the board."

Should I revert this?

Best regards,
Jose Miguel Abreu
