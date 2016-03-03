From: lkp@intel.com (kbuild test robot)
Date: Fri, 4 Mar 2016 01:08:29 +0800
Subject: [PATCH 1/4 v2] drm: Add support of ARC PGU display controller
In-Reply-To: <1457015956-30708-2-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201603040144.Y4lTRkUP%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v4.5-rc6 next-20160303]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Alexey-Brodkin/drm-Add-support-of-ARC-PGU-display-controller/20160303-224311
base:   git://people.freedesktop.org/~airlied/linux.git drm-next
config: i386-allmodconfig (attached as .config)
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All error/warnings (new ones prefixed by >>):

   In file included from include/drm/drm_vma_manager.h:29:0,
                    from include/drm/drmP.h:75,
                    from include/drm/drm_gem_cma_helper.h:4,
                    from drivers/gpu/drm/arc/arcpgu_drv.c:20:
>> drivers/gpu/drm/arc/arcpgu_drv.c:223:25: error: 'arcpgu_drm_of_table' undeclared here (not in a function)
    MODULE_DEVICE_TABLE(of, arcpgu_drm_of_table);
                            ^
>> drivers/gpu/drm/arc/arcpgu_drv.c:223:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
    MODULE_DEVICE_TABLE(of, arcpgu_drm_of_table);
    ^
>> include/linux/module.h:223:27: error: '__mod_of__arcpgu_drm_of_table_device_table' aliased to undefined symbol 'arcpgu_drm_of_table'
    extern const typeof(name) __mod_##type##__##name##_device_table  \
                              ^
>> drivers/gpu/drm/arc/arcpgu_drv.c:223:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
    MODULE_DEVICE_TABLE(of, arcpgu_drm_of_table);
    ^

vim +/arcpgu_drm_of_table +223 drivers/gpu/drm/arc/arcpgu_drv.c

   217	
   218	static const struct of_device_id arcpgu_of_table[] = {
   219		{.compatible = "snps,arcpgu"},
   220		{}
   221	};
   222	
 > 223	MODULE_DEVICE_TABLE(of, arcpgu_drm_of_table);
   224	
   225	static struct platform_driver arcpgu_platform_driver = {
   226		.probe = arcpgu_probe,

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 53493 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160304/55457f60/attachment-0001.obj>
