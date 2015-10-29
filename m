From: lkp@intel.com (kbuild test robot)
Date: Thu, 29 Oct 2015 08:36:10 +0800
Subject: [PATCH] __div64_32: implement division by multiplication for
 32-bit arches
In-Reply-To: <1446072455-16074-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201510290846.odk9tUnU%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

[auto build test ERROR on v4.3-rc7 -- if it's inappropriate base, please suggest rules for selecting the more suitable base]

url:    https://github.com/0day-ci/linux/commits/Alexey-Brodkin/__div64_32-implement-division-by-multiplication-for-32-bit-arches/20151029-065010
config: arm-mini2440_defconfig (attached as .config)
reproduce:
        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=arm 

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:136:0,
                    from lib/div64.c:20:
>> arch/arm/include/asm/div64.h:215:2: error: expected identifier or '(' before '{' token
    ({         \
     ^
>> lib/div64.c:27:12: note: in expansion of macro '__div64_fls'
    inline int __div64_fls(int bits)
               ^

vim +/__div64_fls +27 lib/div64.c

    14	 * Code generated for this function might be very inefficient
    15	 * for some CPUs. __div64_32() can be overridden by linking arch-specific
    16	 * assembly versions such as arch/ppc/lib/div64.S and arch/sh/lib/div64.S.
    17	 */
    18	
    19	#include <linux/export.h>
  > 20	#include <linux/kernel.h>
    21	#include <linux/math64.h>
    22	
    23	/* Not needed on 64bit architectures */
    24	#if BITS_PER_LONG == 32
    25	
    26	/* our own fls implementation to make sure constant propagation is fine */
  > 27	inline int __div64_fls(int bits)
    28	{
    29		unsigned int __left = bits, __nr = 0;
    30	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 19049 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20151029/34c51cb8/attachment-0001.obj>
