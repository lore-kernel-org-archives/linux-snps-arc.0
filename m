From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 16 Jun 2016 16:47:08 +0000
Subject: of_reserved_mem_device_init_by_idx() returns -EINVAL if
 "memory-region" is missing
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1466095574.4442.53.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Marek,

We used to use?of_reserved_mem_device_init() in such a context in GPU drivers:
-------------------->8-------------------
	/* Get the optional framebuffer memory resource */
	ret = of_reserved_mem_device_init(drm->dev);
	if (ret && ret != -ENODEV)
		return ret;
-------------------->8-------------------

The point is we may have a dedicated reserved memory area or may not have (depends on a particular .dts).
Our expectation is if reserved memory area is missing then of_reserved_mem_device_init()
just returns -ENODEV and it used to work like this.

Now with your commit?59ce4039727e "of: reserved_mem: add support for using more than one region for given device"
behavior is different.?of_reserved_mem_device_init_by_idx() has this:
-------------------->8-------------------
	target = of_parse_phandle(np, "memory-region", idx);
	if (!target)
		return -EINVAL;
-------------------->8-------------------

So I'm wondering which part should be fixed:
?1)?of_reserved_mem itself or
?2) users of of_reserved_mem_device_init()

Any thoughts?

Regards,
Alexey
