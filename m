From: lkp@intel.com (kbuild test robot)
Date: Fri, 25 Mar 2016 01:37:22 +0800
Subject: [PATCH 1/5 v4] drm: Add support of ARC PGU display controller
In-Reply-To: <1458838116-24954-2-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201603250131.aMZWaAoR%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Carlos,

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v4.5 next-20160324]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Alexey-Brodkin/drm-Add-support-of-ARC-PGU-display-controller/20160325-005345
base:   git://people.freedesktop.org/~airlied/linux.git drm-next
config: i386-allmodconfig (attached as .config)
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

   drivers/gpu/drm/arc/arcpgu_drv.c: In function 'arcpgu_probe':
>> drivers/gpu/drm/arc/arcpgu_drv.c:232:8: error: implicit declaration of function 'drm_connector_register_all' [-Werror=implicit-function-declaration]
     ret = drm_connector_register_all(drm);
           ^
   drivers/gpu/drm/arc/arcpgu_drv.c: In function 'arcpgu_remove':
>> drivers/gpu/drm/arc/arcpgu_drv.c:254:2: error: implicit declaration of function 'drm_connector_unregister_all' [-Werror=implicit-function-declaration]
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
   236		return 0;
   237	
   238	err_unregister:
   239		drm_dev_unregister(drm);
   240	
   241	err_unload:
   242		arcpgu_unload(drm);
   243	
   244	err_unref:
   245		drm_dev_unref(drm);
   246	
   247		return ret;
   248	}
   249	
   250	static int arcpgu_remove(struct platform_device *pdev)
   251	{
   252		struct drm_device *drm = platform_get_drvdata(pdev);
   253	
 > 254		drm_connector_unregister_all(drm);
   255		drm_dev_unregister(drm);
   256		arcpgu_unload(drm);
   257		drm_dev_unref(drm);

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 53512 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160325/f1605ccf/attachment-0001.obj>
