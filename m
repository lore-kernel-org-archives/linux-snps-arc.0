From: lkp@intel.com (kbuild test robot)
Date: Sun, 22 Sep 2019 00:00:49 +0800
Subject: [PATCH V3 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
In-Reply-To: <1568961203-18660-3-git-send-email-anshuman.khandual@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190921160049.GB13569@xsang-OptiPlex-9020>
To: linux-snps-arc@lists.infradead.org

Hi Anshuman,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.3 next-20190919]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-debug-Add-tests-for-architecture-exported-page-table-helpers/20190920-143746
config: ia64-allmodconfig (attached as .config)
compiler: ia64-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=ia64 
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp at intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/pgtable-nopud.h:8:0,
                    from arch/ia64/include/asm/pgtable.h:591,
                    from include/linux/mm.h:99,
                    from include/linux/highmem.h:8,
                    from mm/arch_pgtable_test.c:14:
   mm/arch_pgtable_test.c: In function 'pud_clear_tests':
>> include/asm-generic/pgtable-nop4d-hack.h:47:32: error: implicit declaration of function '__pgd'; did you mean '__p4d'? [-Werror=implicit-function-declaration]
    #define __pud(x)    ((pud_t) { __pgd(x) })
                                   ^
>> mm/arch_pgtable_test.c:162:8: note: in expansion of macro '__pud'
     pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
           ^~~~~
>> include/asm-generic/pgtable-nop4d-hack.h:47:22: warning: missing braces around initializer [-Wmissing-braces]
    #define __pud(x)    ((pud_t) { __pgd(x) })
                         ^
>> mm/arch_pgtable_test.c:162:8: note: in expansion of macro '__pud'
     pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
           ^~~~~
   cc1: some warnings being treated as errors

# https://github.com/0day-ci/linux/commit/49047f93b076974eefa5b019311bd3b734d61f8c
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 49047f93b076974eefa5b019311bd3b734d61f8c
vim +47 include/asm-generic/pgtable-nop4d-hack.h

30ec842660bd0d Kirill A. Shutemov 2017-03-09  45  
30ec842660bd0d Kirill A. Shutemov 2017-03-09  46  #define pud_val(x)				(pgd_val((x).pgd))
30ec842660bd0d Kirill A. Shutemov 2017-03-09 @47  #define __pud(x)				((pud_t) { __pgd(x) })
30ec842660bd0d Kirill A. Shutemov 2017-03-09  48  

:::::: The code at line 47 was first introduced by commit
:::::: 30ec842660bd0d056d4a7028ac5bd4a82b113d4f asm-generic: introduce __ARCH_USE_5LEVEL_HACK

:::::: TO: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>
:::::: CC: Linus Torvalds <torvalds at linux-foundation.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 54827 bytes
Desc: .config.gz
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20190922/c39652f5/attachment-0001.gz>
