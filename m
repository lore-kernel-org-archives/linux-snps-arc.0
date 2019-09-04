From: anshuman.khandual@arm.com (Anshuman Khandual)
Date: Wed, 4 Sep 2019 11:44:25 +0530
Subject: [PATCH 1/1] mm/pgtable/debug: Add test validating architecture
 page table helpers
In-Reply-To: <201909031912.htvWy2Bu%lkp@intel.com>
References: <1567497706-8649-2-git-send-email-anshuman.khandual@arm.com>
 <201909031912.htvWy2Bu%lkp@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4dc9698f-dff4-b916-a83e-dc932c8087c0@arm.com>
To: linux-snps-arc@lists.infradead.org



On 09/03/2019 04:43 PM, kbuild test robot wrote:
> Hi Anshuman,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3-rc7 next-20190902]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-debug-Add-tests-for-architecture-exported-page-table-helpers/20190903-162959
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=m68k 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp at intel.com>
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from arch/m68k/include/asm/bug.h:32:0,
>                     from include/linux/bug.h:5,
>                     from include/linux/thread_info.h:12,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/m68k/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:78,
>                     from arch/m68k/include/asm/irqflags.h:6,
>                     from include/linux/irqflags.h:16,
>                     from arch/m68k/include/asm/atomic.h:6,
>                     from include/linux/atomic.h:7,
>                     from include/linux/mm_types_task.h:13,
>                     from include/linux/mm_types.h:5,
>                     from include/linux/hugetlb.h:5,
>                     from mm/arch_pgtable_test.c:14:
>    mm/arch_pgtable_test.c: In function 'pmd_clear_tests':
>>> arch/m68k/include/asm/page.h:31:22: error: lvalue required as unary '&' operand
>     #define pmd_val(x) ((&x)->pmd[0])
>                          ^
>    include/asm-generic/bug.h:124:25: note: in definition of macro 'WARN_ON'
>      int __ret_warn_on = !!(condition);    \
>                             ^~~~~~~~~
>>> arch/m68k/include/asm/motorola_pgtable.h:138:26: note: in expansion of macro 'pmd_val'
>     #define pmd_none(pmd)  (!pmd_val(pmd))
>                              ^~~~~~~
>>> mm/arch_pgtable_test.c:233:11: note: in expansion of macro 'pmd_none'
>      WARN_ON(!pmd_none(READ_ONCE(*pmdp)));
>               ^~~~~~~~
>    mm/arch_pgtable_test.c: In function 'pmd_populate_tests':
>>> arch/m68k/include/asm/page.h:31:22: error: lvalue required as unary '&' operand
>     #define pmd_val(x) ((&x)->pmd[0])

Storing READ_ONCE(*pmdp) in a local pmd_t variable first solves the problem.
