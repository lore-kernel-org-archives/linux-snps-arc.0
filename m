From: lkp@intel.com (kbuild test robot)
Date: Sun, 3 Apr 2016 07:13:59 +0800
Subject: [PATCH 1/5 v5] drm: Add support of ARC PGU display controller
In-Reply-To: <1459164999-11850-2-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201604030718.oT12hIrh%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Carlos,

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v4.6-rc1 next-20160401]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Alexey-Brodkin/drm-Add-support-of-ARC-PGU-display-controller/20160328-194009
base:   git://people.freedesktop.org/~airlied/linux.git drm-next
config: x86_64-allmodconfig (attached as .config)
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

All errors (new ones prefixed by >>):

   drivers/gpu/drm/arc/arcpgu_drv.c: In function 'arcpgu_probe':
>> drivers/gpu/drm/arc/arcpgu_drv.c:232:8: error: implicit declaration of function 'drm_connector_register_all' [-Werror=implicit-function-declaration]
     ret = drm_connector_register_all(drm);
           ^
   drivers/gpu/drm/arc/arcpgu_drv.c: In function 'arcpgu_remove':
   drivers/gpu/drm/arc/arcpgu_drv.c:254:2: error: implicit declaration of function 'drm_connector_unregister_all' [-Werror=implicit-function-declaration]
     drm_connector_unregister_all(drm);
     ^
   cc1: some warnings being treated as errors

vim +/drm_connector_register_all +232 drivers/gpu/drm/arc/arcpgu_drv.c

   226			goto err_unref;
   227	
   228		ret = drm_dev_register(drm, 0);
   229		if (ret)
   230			goto err_unload;
   231	
 > 232		ret = drm_connector_register_all(drm);
   233		if (ret)
   234			goto err_unregister;
   235	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 53176 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160403/7301c9f0/attachment-0001.obj>
