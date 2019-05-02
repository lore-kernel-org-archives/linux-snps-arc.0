From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 2 May 2019 09:53:56 -0700
Subject: perf tools build broken after v5.1-rc1
In-Reply-To: <20190430011818.GE7857@kernel.org>
References: <eeb83498-f37f-e234-4941-2731b81dc78c@synopsys.com>
 <20190422152027.GB11750@kernel.org> <20190425214800.GC21829@kernel.org>
 <C2D7FE5348E1B147BCA15975FBA2307501A2505837@us01wembx1.internal.synopsys.com>
 <20190430011818.GE7857@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <781caa78-e86a-92e3-b767-1cc1451fc8ad@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 4/29/19 6:18 PM, Arnaldo Carvalho de Melo wrote:
>>>
>>> Auto-detecting system features:
>>> ...                         dwarf: [ OFF ]
>>> ...            dwarf_getlocations: [ OFF ]
>>> ...                         glibc: [ on  ]
>>
>> Not related to current issue, this run uses a uClibc toolchain and yet it is
>> detecting glibc - doesn't seem right to me.
> 
> Ok, I'll improve that, I think it just tries to detect a libc, yeah,
> see:
> 
> [acme at quaco linux]$ cat tools/build/feature/test-glibc.c
> // SPDX-License-Identifier: GPL-2.0
> #include <stdlib.h>
> 
> #if !defined(__UCLIBC__)
> #include <gnu/libc-version.h>
> #else
> #define XSTR(s) STR(s)
> #define STR(s) #s
> #endif
> 
> int main(void)
> {
> #if !defined(__UCLIBC__)
> 	const char *version = gnu_get_libc_version();
> #else
> 	const char *version = XSTR(__GLIBC__) "." XSTR(__GLIBC_MINOR__);
> #endif
> 
> 	return (long)version;
> }

So we return a pointer to a string to declare a glibc build ?
But won't it do so even for other libs, even if those numbers were 0:0. I'm
confused how this feature detction works.

> [acme at quaco linux]$
> 
> [perfbuilder at 59ca4b424ded /]$ grep __GLIBC__ /arc_gnu_2017.09-rc2_prebuilt_uclibc_le_arc700_linux_install/arc-snps-linux-uclibc/sysroot/usr/include/*.h
> /arc_gnu_2017.09-rc2_prebuilt_uclibc_le_arc700_linux_install/arc-snps-linux-uclibc/sysroot/usr/include/features.h:   The macros `__GNU_LIBRARY__', `__GLIBC__', and `__GLIBC_MINOR__' are
> /arc_gnu_2017.09-rc2_prebuilt_uclibc_le_arc700_linux_install/arc-snps-linux-uclibc/sysroot/usr/include/features.h:#define	__GLIBC__	2
> /arc_gnu_2017.09-rc2_prebuilt_uclibc_le_arc700_linux_install/arc-snps-linux-uclibc/sysroot/usr/include/features.h:	((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))
> [perfbuilder at 59ca4b424ded /]$
> 
> Isn't that part of uClibc?
