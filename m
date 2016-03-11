From: lkp@intel.com (kbuild test robot)
Date: Sat, 12 Mar 2016 00:45:42 +0800
Subject: [PATCH 1/4 v3] drm: Add support of ARC PGU display controller
In-Reply-To: <1457710959-9562-2-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201603120053.Dr2iFD2z%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

[auto build test WARNING on drm/drm-next]
[also build test WARNING on v4.5-rc7 next-20160311]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Alexey-Brodkin/drm-Add-support-of-ARC-PGU-display-controller/20160311-234824
base:   git://people.freedesktop.org/~airlied/linux.git drm-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/arc/arcpgu_drv.c:243:6-11: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
