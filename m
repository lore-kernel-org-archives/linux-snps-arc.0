From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Thu, 30 Mar 2017 14:40:14 +0100
Subject: DRM: Component framework API support
In-Reply-To: <1490875508.6561.11.camel@synopsys.com>
References: <1490875508.6561.11.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <18e6380f-738f-9c54-ba4b-08e83b134e22@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,


On 30-03-2017 13:05, Eugeniy Paltsev wrote:
> Hi,
>
> I am trying to add support of new component framework API in ARC PGU driver.
> The point is that for now we have ARC PGU driver which works with adv7511 encoder. Both of them don't support component framework API. I had to add support of component framework based dw_hdmi encoder to ARC PGU driver.

As of commit 69497eb9 ("drm: bridge: dw-hdmi: Implement DRM
bridge registration") you don't need to use component API, you
can just use a platform driver wrapper.

>
> So what is best way of implementing both component framework API and regular API in one driver?

I guess you want to have support for ADV7511 and dw-hdmi, right?
For component API you need to have a master device which binds
all the components and inits them, for regular API not. I don't
see a clean way to do this (but I'm not that experienced in
component API). Do you need runtime support for both of bridges?

Best regards,
Jose Miguel Abreu

>
> Thanks.
