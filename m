From: lkp@intel.com (kbuild test robot)
Date: Thu, 26 Jan 2017 00:49:56 +0800
Subject: [PATCH 2/2] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <1485358457-22957-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201701260003.Z1U8R9mq%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

[auto build test ERROR on linus/master]
[also build test ERROR on v4.10-rc5 next-20170125]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Eugeniy-Paltsev/dmaengine-Add-DW-AXI-DMAC-driver/20170126-000653
config: i386-allmodconfig (attached as .config)
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All error/warnings (new ones prefixed by >>):

   In file included from drivers/dma/axi_dma_platform.c:26:0:
>> include/linux/module.h:130:27: error: redefinition of '__inittest'
     static inline initcall_t __inittest(void)  \
                              ^
>> include/linux/module.h:115:30: note: in expansion of macro 'module_init'
    #define subsys_initcall(fn)  module_init(fn)
                                 ^~~~~~~~~~~
>> drivers/dma/axi_dma_platform.c:1050:1: note: in expansion of macro 'subsys_initcall'
    subsys_initcall(dw_init);
    ^~~~~~~~~~~~~~~
   include/linux/module.h:130:27: note: previous definition of '__inittest' was here
     static inline initcall_t __inittest(void)  \
                              ^
   include/linux/device.h:1463:1: note: in expansion of macro 'module_init'
    module_init(__driver##_init); \
    ^~~~~~~~~~~
   include/linux/platform_device.h:228:2: note: in expansion of macro 'module_driver'
     module_driver(__platform_driver, platform_driver_register, \
     ^~~~~~~~~~~~~
>> drivers/dma/axi_dma_platform.c:1044:1: note: in expansion of macro 'module_platform_driver'
    module_platform_driver(dw_driver);
    ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:132:6: error: redefinition of 'init_module'
     int init_module(void) __attribute__((alias(#initfn)));
         ^
>> include/linux/module.h:115:30: note: in expansion of macro 'module_init'
    #define subsys_initcall(fn)  module_init(fn)
                                 ^~~~~~~~~~~
>> drivers/dma/axi_dma_platform.c:1050:1: note: in expansion of macro 'subsys_initcall'
    subsys_initcall(dw_init);
    ^~~~~~~~~~~~~~~
   include/linux/module.h:132:6: note: previous definition of 'init_module' was here
     int init_module(void) __attribute__((alias(#initfn)));
         ^
   include/linux/device.h:1463:1: note: in expansion of macro 'module_init'
    module_init(__driver##_init); \
    ^~~~~~~~~~~
   include/linux/platform_device.h:228:2: note: in expansion of macro 'module_driver'
     module_driver(__platform_driver, platform_driver_register, \
     ^~~~~~~~~~~~~
>> drivers/dma/axi_dma_platform.c:1044:1: note: in expansion of macro 'module_platform_driver'
    module_platform_driver(dw_driver);
    ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:136:27: error: redefinition of '__exittest'
     static inline exitcall_t __exittest(void)  \
                              ^
>> drivers/dma/axi_dma_platform.c:1056:1: note: in expansion of macro 'module_exit'
    module_exit(dw_exit);
    ^~~~~~~~~~~
   include/linux/module.h:136:27: note: previous definition of '__exittest' was here
     static inline exitcall_t __exittest(void)  \
                              ^
   include/linux/device.h:1468:1: note: in expansion of macro 'module_exit'
    module_exit(__driver##_exit);
    ^~~~~~~~~~~
   include/linux/platform_device.h:228:2: note: in expansion of macro 'module_driver'
     module_driver(__platform_driver, platform_driver_register, \
     ^~~~~~~~~~~~~
>> drivers/dma/axi_dma_platform.c:1044:1: note: in expansion of macro 'module_platform_driver'
    module_platform_driver(dw_driver);
    ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/module.h:138:7: error: redefinition of 'cleanup_module'
     void cleanup_module(void) __attribute__((alias(#exitfn)));
          ^
>> drivers/dma/axi_dma_platform.c:1056:1: note: in expansion of macro 'module_exit'
    module_exit(dw_exit);
    ^~~~~~~~~~~
   include/linux/module.h:138:7: note: previous definition of 'cleanup_module' was here
     void cleanup_module(void) __attribute__((alias(#exitfn)));
          ^
   include/linux/device.h:1468:1: note: in expansion of macro 'module_exit'
    module_exit(__driver##_exit);
    ^~~~~~~~~~~
   include/linux/platform_device.h:228:2: note: in expansion of macro 'module_driver'
     module_driver(__platform_driver, platform_driver_register, \
     ^~~~~~~~~~~~~
>> drivers/dma/axi_dma_platform.c:1044:1: note: in expansion of macro 'module_platform_driver'
    module_platform_driver(dw_driver);
    ^~~~~~~~~~~~~~~~~~~~~~

vim +/__inittest +130 include/linux/module.h

0fd972a7 Paul Gortmaker 2015-05-01  109  #define early_initcall(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  110  #define core_initcall(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  111  #define core_initcall_sync(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  112  #define postcore_initcall(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  113  #define postcore_initcall_sync(fn)	module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  114  #define arch_initcall(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01 @115  #define subsys_initcall(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  116  #define subsys_initcall_sync(fn)	module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  117  #define fs_initcall(fn)			module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  118  #define fs_initcall_sync(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  119  #define rootfs_initcall(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  120  #define device_initcall(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  121  #define device_initcall_sync(fn)	module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  122  #define late_initcall(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  123  #define late_initcall_sync(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  124  
0fd972a7 Paul Gortmaker 2015-05-01  125  #define console_initcall(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  126  #define security_initcall(fn)		module_init(fn)
0fd972a7 Paul Gortmaker 2015-05-01  127  
0fd972a7 Paul Gortmaker 2015-05-01  128  /* Each module must use one module_init(). */
0fd972a7 Paul Gortmaker 2015-05-01  129  #define module_init(initfn)					\
0fd972a7 Paul Gortmaker 2015-05-01 @130  	static inline initcall_t __inittest(void)		\
0fd972a7 Paul Gortmaker 2015-05-01  131  	{ return initfn; }					\
0fd972a7 Paul Gortmaker 2015-05-01 @132  	int init_module(void) __attribute__((alias(#initfn)));
0fd972a7 Paul Gortmaker 2015-05-01  133  
0fd972a7 Paul Gortmaker 2015-05-01  134  /* This is only required if you want to be unloadable. */
0fd972a7 Paul Gortmaker 2015-05-01  135  #define module_exit(exitfn)					\
0fd972a7 Paul Gortmaker 2015-05-01 @136  	static inline exitcall_t __exittest(void)		\
0fd972a7 Paul Gortmaker 2015-05-01  137  	{ return exitfn; }					\
0fd972a7 Paul Gortmaker 2015-05-01 @138  	void cleanup_module(void) __attribute__((alias(#exitfn)));
0fd972a7 Paul Gortmaker 2015-05-01  139  
0fd972a7 Paul Gortmaker 2015-05-01  140  #endif
0fd972a7 Paul Gortmaker 2015-05-01  141  

:::::: The code at line 130 was first introduced by commit
:::::: 0fd972a7d91d6e15393c449492a04d94c0b89351 module: relocate module_init from init.h to module.h

:::::: TO: Paul Gortmaker <paul.gortmaker at windriver.com>
:::::: CC: Paul Gortmaker <paul.gortmaker at windriver.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 57936 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20170126/f48b6066/attachment-0001.gz>
