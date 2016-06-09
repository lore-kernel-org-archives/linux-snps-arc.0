From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 9 Jun 2016 14:29:02 +0000
Subject: [PATCH 03/27] drm/arc: Actually bother with handling atomic
 events.
In-Reply-To: <20160609135222.GS3363@phenom.ffwll.local>
References: <1465388359-8070-1-git-send-email-daniel.vetter@ffwll.ch>
 <1465388359-8070-3-git-send-email-daniel.vetter@ffwll.ch>
 <a29a4f82-1699-1c33-73ea-5b8043b53e35@linux.intel.com>
 <20160608143004.GE3363@phenom.ffwll.local>
 <1465469639.3203.57.camel@synopsys.com>
 <20160609122631.GO3363@phenom.ffwll.local>
 <1465476465.3203.66.camel@synopsys.com>
 <20160609132327.GQ3363@phenom.ffwll.local>
 <1465478829.3203.68.camel@synopsys.com>
 <20160609135222.GS3363@phenom.ffwll.local>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1465482496.3203.73.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

On Thu, 2016-06-09@15:52 +0200, Daniel Vetter wrote:
>?
> The fake implementation is fundamentally racy, and I don't want to write
> helpers which can't be used correctly. Anyway I think without this patch
> (or something similar) arcpgu will stall badly with the new nonblocking
> helpers, because arcpgu didn't bother at all to implement nonblocking. Can
> you pls ack this, or even better, test the entire patch series? The
> helpers themselves should work, but in all 5 drivers tested thus far they
> discovered some bugs.

Sure I will happily test this series.
The only question then is what should I use as a proper base?

-Alexey
