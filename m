From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 4 Dec 2017 17:29:47 +0000
Subject: xf86-video-armada via UDL [was: Re: UDL's fbdev doesn't work
 for user-space apps]
In-Reply-To: <232eae49-ddbb-fd87-2b35-6db47817e23e@synopsys.com>
References: <1512387175.4977.24.camel@synopsys.com>
 <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
 <1512393408.4977.44.camel@synopsys.com>
 <c6d06ae1-a30b-c358-6c12-317688d194a5@synopsys.com>
 <1512399218.4977.48.camel@synopsys.com>
 <d89c088a-a169-b49a-c331-d1bfe4329e25@synopsys.com>
 <1512403237.4977.54.camel@synopsys.com>
 <232eae49-ddbb-fd87-2b35-6db47817e23e@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1512408586.4977.73.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On Mon, 2017-12-04@17:24 +0000, Jose Abreu wrote:
> On 04-12-2017 16:00, Alexey Brodkin wrote:
> > 
> > [????30.763] (II) armada(0): etnaviv: Xv: using YUY2 format intermediate YUV target
> > 
> 
> I'm wondering if this means that target format for UDL is YUV ...
> 
> But anyway, I revisited your first email and noticed that you
> said kmscube runs fine. Is this using etnaviv as renderer?

Indeed, in case of kmscube etnaviv is a renderer while UDL
outputs the picture on the screen.

> And
> you also said X is claiming the screen but nothing appears ...
> which X client are you using to test this?

Well it might be seen from my full log.
I just start X with "X&" command and then
execute things like "xclock".

So not sure who is a client in that case.

-Alexey
