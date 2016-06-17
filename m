From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 17 Jun 2016 06:47:47 +0000
Subject: of_reserved_mem_device_init_by_idx() returns -EINVAL if
 "memory-region" is missing
In-Reply-To: <b26dcbc6-758a-a08f-b258-945548aab3dc@samsung.com>
References: <1466095574.4442.53.camel@synopsys.com>
 <b26dcbc6-758a-a08f-b258-945548aab3dc@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1466146013.2948.1.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Marek,

On Fri, 2016-06-17@07:28 +0200, Marek Szyprowski wrote:
> Hi Alexey
> 
> 
> On 2016-06-16 18:47, Alexey Brodkin wrote:
> > 
> > Hi Marek,
> > 
> > We used to use of_reserved_mem_device_init() in such a context in GPU drivers:
> > -------------------->8-------------------
> > 	/* Get the optional framebuffer memory resource */
> > 	ret = of_reserved_mem_device_init(drm->dev);
> > 	if (ret && ret != -ENODEV)
> > 		return ret;
> > -------------------->8-------------------
> > 
> > The point is we may have a dedicated reserved memory area or may not have (depends on a particular .dts).
> > Our expectation is if reserved memory area is missing then of_reserved_mem_device_init()
> > just returns -ENODEV and it used to work like this.
> > 
> > Now with your commit 59ce4039727e "of: reserved_mem: add support for using more than one region for given device"
> > behavior is different. of_reserved_mem_device_init_by_idx() has this:
> > -------------------->8-------------------
> > 	target = of_parse_phandle(np, "memory-region", idx);
> > 	if (!target)
> > 		return -EINVAL;
> > -------------------->8-------------------
> > 
> > So I'm wondering which part should be fixed:
> > ? 1) of_reserved_mem itself or
> > ? 2) users of of_reserved_mem_device_init()
> > 
> > Any thoughts?
> 
> This was my fault. The fix is already queued to linux-next, see commit
> 9f5a802b1d51dc80a27d828a5f7dcc8ec4a72f03 ("[media] of: reserved_mem: restore
> old behavior when no region is defined"),
> http://www.spinics.net/lists/linux-media/msg100972.html
> 

Indeed with mentioned fix GPU driver now works again!
Sorry for the noise and thank you for fixing it that fast.

Regards,
Alexey
