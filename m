From: anshuman.khandual@arm.com (Anshuman Khandual)
Date: Mon, 23 Sep 2019 11:57:29 +0530
Subject: [PATCH V3 2/2] mm/pgtable/debug: Add test validating architecture
 page table helpers
In-Reply-To: <20190921160049.GB13569@xsang-OptiPlex-9020>
References: <20190921160049.GB13569@xsang-OptiPlex-9020>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ab7c36ae-0942-d2e3-2a46-924c13a3d999@arm.com>
To: linux-snps-arc@lists.infradead.org



On 09/21/2019 09:30 PM, kbuild test robot wrote:
> Hi Anshuman,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3 next-20190919]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-debug-Add-tests-for-architecture-exported-page-table-helpers/20190920-143746
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=ia64 
> :::::: branch date: 3 hours ago
> :::::: commit date: 3 hours ago
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp at intel.com>
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from include/asm-generic/pgtable-nopud.h:8:0,
>                     from arch/ia64/include/asm/pgtable.h:591,
>                     from include/linux/mm.h:99,
>                     from include/linux/highmem.h:8,
>                     from mm/arch_pgtable_test.c:14:
>    mm/arch_pgtable_test.c: In function 'pud_clear_tests':
>>> include/asm-generic/pgtable-nop4d-hack.h:47:32: error: implicit declaration of function '__pgd'; did you mean '__p4d'? [-Werror=implicit-function-declaration]
>     #define __pud(x)    ((pud_t) { __pgd(x) })
>                                    ^
>>> mm/arch_pgtable_test.c:162:8: note: in expansion of macro '__pud'
>      pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
>            ^~~~~
>>> include/asm-generic/pgtable-nop4d-hack.h:47:22: warning: missing braces around initializer [-Wmissing-braces]
>     #define __pud(x)    ((pud_t) { __pgd(x) })
>                          ^
>>> mm/arch_pgtable_test.c:162:8: note: in expansion of macro '__pud'
>      pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
>            ^~~~~
>    cc1: some warnings being treated as errors
> 
> # https://github.com/0day-ci/linux/commit/49047f93b076974eefa5b019311bd3b734d61f8c
> git remote add linux-review https://github.com/0day-ci/linux
> git remote update linux-review
> git checkout 49047f93b076974eefa5b019311bd3b734d61f8c
> vim +47 include/asm-generic/pgtable-nop4d-hack.h
> 
> 30ec842660bd0d Kirill A. Shutemov 2017-03-09  45  
> 30ec842660bd0d Kirill A. Shutemov 2017-03-09  46  #define pud_val(x)				(pgd_val((x).pgd))
> 30ec842660bd0d Kirill A. Shutemov 2017-03-09 @47  #define __pud(x)				((pud_t) { __pgd(x) })

I had mentioned about this build failure in the cover letter. The same
problem also exists on arm32 platform.

- Anshuman
