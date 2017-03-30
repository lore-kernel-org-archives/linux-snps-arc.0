From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 30 Mar 2017 12:05:08 +0000
Subject: DRM: Component framework API support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1490875508.6561.11.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

I am trying to add support of new component framework API in ARC PGU driver.
The point is that for now we have ARC PGU driver which works with adv7511 encoder.?Both of them don't support component framework API.?I had to add support of component framework based dw_hdmi encoder to ARC PGU driver.

So what is best way of implementing both component framework API and regular API?in one driver?

Thanks.
-- 
?Eugeniy Paltsev
