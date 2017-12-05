From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Tue, 5 Dec 2017 10:39:21 +0000
Subject: xf86-video-armada via UDL [was: Re: UDL's fbdev doesn't work for
 user-space apps]
In-Reply-To: <1512408586.4977.73.camel@synopsys.com>
References: <1512387175.4977.24.camel@synopsys.com>
 <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
 <1512393408.4977.44.camel@synopsys.com>
 <c6d06ae1-a30b-c358-6c12-317688d194a5@synopsys.com>
 <1512399218.4977.48.camel@synopsys.com>
 <d89c088a-a169-b49a-c331-d1bfe4329e25@synopsys.com>
 <1512403237.4977.54.camel@synopsys.com>
 <232eae49-ddbb-fd87-2b35-6db47817e23e@synopsys.com>
 <1512408586.4977.73.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c49275d9-6cb3-c6ab-15c8-c18e5a8bc0b0@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

On 04-12-2017 17:29, Alexey Brodkin wrote:
>
> Indeed, in case of kmscube etnaviv is a renderer while UDL
> outputs the picture on the screen.

Thats nice :)

Ok, from your logs I was not able to see anything wrong. X server
does not error exit and Prime seems to be working in DRM ...

Lets try one more thing: Enable all debug in DRM (drm.debug=0x3f)
and try to correlate the log with the actions. i.e.

[boot]
[log]
[x start]
[log]
[xclock start]
[log]
[glmark2-es2 start]
[log]

If that does not give any more info then maybe someone with
better understanding of etnaviv, UDL and X can help (maybe cc X
devel list also ...)

Best Regards,
Jose Miguel Abreu
