From: lars@metafoo.de (Lars-Peter Clausen)
Date: Mon, 11 Apr 2016 21:34:26 +0200
Subject: [alsa-devel] [PATCH 2/5 v4] drm/i2c/adv7511: Add audio support
In-Reply-To: <570BAFE7.8040206@synopsys.com>
References: <cover.1460047238.git.joabreu@synopsys.com>
 <d56087fae14074198f6c1bc749ce4da3cab62324.1460047238.git.joabreu@synopsys.com>
 <5707D249.5040707@metafoo.de> <5707D88A.3010400@synopsys.com>
 <57091999.4010906@metafoo.de> <570B6DF2.1080008@synopsys.com>
 <570B6F7B.2020906@metafoo.de> <570B8B59.7000900@synopsys.com>
 <570B975C.50702@metafoo.de> <570BAFE7.8040206@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <570BFC42.7040705@metafoo.de>
To: linux-snps-arc@lists.infradead.org

On 04/11/2016 04:08 PM, Jose Abreu wrote:
[...]
>> Currently there is also zero support of of-graph in ASoC, so a bit of work
>> is required to get this integrated properly.
>>
> 
> I also believe this would be the better option but in the meantime can't I
> integrate the audio like it is being done in the dw-hdmi driver[1]? In this
> driver the audio is registered as a sound card and is conditionally built using
> Kconfig, just like I was doing in the previous versions. I know you said the
> HDMI audio is still an open issue but it seems that for this case it was accepted.
> 
> [1] http://lxr.free-electrons.com/source/drivers/gpu/drm/bridge/dw-hdmi-ahb-audio.c

Maybe, but I'm not sure it would work in this case. Resources are probably
better invested in working towards a proper solution.
