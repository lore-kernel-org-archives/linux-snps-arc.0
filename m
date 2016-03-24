From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 24 Mar 2016 21:12:12 +0000
Subject: [PATCH 1/5 v4] drm: Add support of ARC PGU display controller
In-Reply-To: <201603250131.aMZWaAoR%fengguang.wu@intel.com>
References: <201603250131.aMZWaAoR%fengguang.wu@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1458853932.3068.13.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello,

On Fri, 2016-03-25@01:37 +0800, kbuild test robot wrote:
> Hi Carlos,
> 
> [auto build test ERROR on drm/drm-next]
> [also build test ERROR on v4.5 next-20160324]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
> 
> url:????https://github.com/0day-ci/linux/commits/Alexey-Brodkin/drm-Add-support-of-ARC-PGU-display-controller/20160325
> -005345
> base:???git://people.freedesktop.org/~airlied/linux.git drm-next
> config: i386-allmodconfig (attached as .config)
> reproduce:
> ????????# save the attached .config to linux build tree
> ????????make ARCH=i386?
> 
> All errors (new ones prefixed by >>):
> ? ?230			goto err_unload;
> ???231	
> ?> 232		ret = drm_connector_register_all(drm);

...

> ?> 254		drm_connector_unregister_all(drm);
> ???255		drm_dev_unregister(drm);

That problem happens because that change relies on another series that yet
to be accepted in DRM for 4.7 cycle, see?https://lkml.org/lkml/2016/3/23/128

Based on Daniel's comment I would assume soon after 4.6-rc1 will be cut
pending prerequisite will be applied to drm-next and that build failure will
go away.

-Alexey
