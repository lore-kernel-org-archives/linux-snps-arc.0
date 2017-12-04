From: emil.l.velikov@gmail.com (Emil Velikov)
Date: Mon, 4 Dec 2017 17:52:58 +0000
Subject: xf86-video-armada via UDL [was: Re: UDL's fbdev doesn't work for
 user-space apps]
In-Reply-To: <c6d06ae1-a30b-c358-6c12-317688d194a5@synopsys.com>
References: <1512387175.4977.24.camel@synopsys.com>
 <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
 <1512393408.4977.44.camel@synopsys.com>
 <c6d06ae1-a30b-c358-6c12-317688d194a5@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CACvgo53s7DC6+h=piS3kgoub=P0k+jjLgy5WAT6Mt92EutRxMw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On 4 December 2017@14:02, Jose Abreu <Jose.Abreu@synopsys.com> wrote:
> On 04-12-2017 13:16, Alexey Brodkin wrote:
>>         Option          "kmsdev" "/dev/dri/card1"
>
> Which drm driver uses /dev/dri/card0? I'm seing drmOpen code and
> if you don't specify the busID it will fallback for the first
> card that matches "armada-drm" or "imx-drm" or "udl".
>
As you've noticed, drmOpen can give you some 'nice' side-effects.
I'd recommend getting a list of devices with drmGetDevice{,s}2 and
applying $heuristics to filter the device you want.

-Emil
