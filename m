From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Mon, 4 Dec 2017 14:02:42 +0000
Subject: xf86-video-armada via UDL [was: Re: UDL's fbdev doesn't work for
 user-space apps]
In-Reply-To: <1512393408.4977.44.camel@synopsys.com>
References: <1512387175.4977.24.camel@synopsys.com>
 <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
 <1512393408.4977.44.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c6d06ae1-a30b-c358-6c12-317688d194a5@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 04-12-2017 13:16, Alexey Brodkin wrote:
>         Option          "kmsdev" "/dev/dri/card1"

Which drm driver uses /dev/dri/card0? I'm seing drmOpen code and
if you don't specify the busID it will fallback for the first
card that matches "armada-drm" or "imx-drm" or "udl".

> But if I swap "imx-drm" to "udl" I don't see anything on my screen
> (connected via UDL) even though Xserver seems to really start claiming the screen
> (so I see it becomes black, effectively overriding whatever was there before) and
> glmark benchmark prints results.
>
>

Xorg.log can help confirm if everything is ok.
