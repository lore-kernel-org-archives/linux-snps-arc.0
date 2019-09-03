From: lkp@intel.com (kbuild test robot)
Date: Tue, 3 Sep 2019 19:13:42 +0800
Subject: [PATCH 1/1] mm/pgtable/debug: Add test validating architecture
 page table helpers
In-Reply-To: <1567497706-8649-2-git-send-email-anshuman.khandual@arm.com>
References: <1567497706-8649-2-git-send-email-anshuman.khandual@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201909031912.htvWy2Bu%lkp@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Anshuman,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.3-rc7 next-20190902]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-debug-Add-tests-for-architecture-exported-page-table-helpers/20190903-162959
config: m68k-allmodconfig (attached as .config)
compiler: m68k-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=m68k 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp at intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/bug.h:32:0,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/hugetlb.h:5,
                    from mm/arch_pgtable_test.c:14:
   mm/arch_pgtable_test.c: In function 'pmd_clear_tests':
>> arch/m68k/include/asm/page.h:31:22: error: lvalue required as unary '&' operand
    #define pmd_val(x) ((&x)->pmd[0])
                         ^
   include/asm-generic/bug.h:124:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
>> arch/m68k/include/asm/motorola_pgtable.h:138:26: note: in expansion of macro 'pmd_val'
    #define pmd_none(pmd)  (!pmd_val(pmd))
                             ^~~~~~~
>> mm/arch_pgtable_test.c:233:11: note: in expansion of macro 'pmd_none'
     WARN_ON(!pmd_none(READ_ONCE(*pmdp)));
              ^~~~~~~~
   mm/arch_pgtable_test.c: In function 'pmd_populate_tests':
>> arch/m68k/include/asm/page.h:31:22: error: lvalue required as unary '&' operand
    #define pmd_val(x) ((&x)->pmd[0])
                         ^
   include/asm-generic/bug.h:124:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   arch/m68k/include/asm/motorola_pgtable.h:139:25: note: in expansion of macro 'pmd_val'
    #define pmd_bad(pmd)  ((pmd_val(pmd) & _DESCTYPE_MASK) != _PAGE_TABLE)
                            ^~~~~~~
>> mm/arch_pgtable_test.c:245:10: note: in expansion of macro 'pmd_bad'
     WARN_ON(pmd_bad(READ_ONCE(*pmdp)));
             ^~~~~~~

vim +/pmd_none +233 mm/arch_pgtable_test.c

   228	
   229	static void pmd_clear_tests(pmd_t *pmdp)
   230	{
   231		memset(pmdp, RANDOM_NZVALUE, sizeof(pmd_t));
   232		pmd_clear(pmdp);
 > 233		WARN_ON(!pmd_none(READ_ONCE(*pmdp)));
   234	}
   235	
   236	static void pmd_populate_tests(struct mm_struct *mm, pmd_t *pmdp,
   237				       pgtable_t pgtable)
   238	{
   239		/*
   240		 * This entry points to next level page table page.
   241		 * Hence this must not qualify as pmd_bad().
   242		 */
   243		pmd_clear(pmdp);
   244		pmd_populate(mm, pmdp, pgtable);
 > 245		WARN_ON(pmd_bad(READ_ONCE(*pmdp)));
   246	}
   247	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 50918 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20190903/b855ce88/attachment-0001.gz>
