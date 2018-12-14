From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 14 Dec 2018 10:47:30 +0000
Subject: [PATCH] ARC: fix __ffs return value to avoid build warnings
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075014641F6E3@US01WEMBX2.internal.synopsys.com>
References: <20181213154257.23033-1-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075014641F6E3@US01WEMBX2.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1544784449.3270.30.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Thu, 2018-12-13@18:23 +0000, Vineet Gupta wrote:
> On 12/13/18 7:43 AM, Eugeniy Paltsev wrote:
> > Change __ffs return value from 'int' to 'unsigned long' as it
> > is done in other implementations (like asm-generic, x86, etc...)
> > to avoid build-time warnings in places where type is strictly
> > checked.
> > 
> > As __ffs may return values in [0-31] interval changing return
> > type to unsigned is valid.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> 
> Can you please paste a couple of lines of offending output !

---------------------------------->8---------------------------------
  CC      mm/nobootmem.o
In file included from ./include/asm-generic/bug.h:18:0,
                 from ./arch/arc/include/asm/bug.h:32,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/gfp.h:5,
                 from ./include/linux/slab.h:15,
                 from mm/nobootmem.c:14:
mm/nobootmem.c: In function ?__free_pages_memory?:
./include/linux/kernel.h:845:29: warning: comparison of distinct pointer types lacks a cast
   (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                             ^
./include/linux/kernel.h:859:4: note: in expansion of macro ?__typecheck?
   (__typecheck(x, y) && __no_side_effects(x, y))
    ^~~~~~~~~~~
./include/linux/kernel.h:869:24: note: in expansion of macro ?__safe_cmp?
  __builtin_choose_expr(__safe_cmp(x, y), \
                        ^~~~~~~~~~
./include/linux/kernel.h:878:19: note: in expansion of macro ?__careful_cmp?
 #define min(x, y) __careful_cmp(x, y, <)
                   ^~~~~~~~~~~~~
mm/nobootmem.c:104:11: note: in expansion of macro ?min?
   order = min(MAX_ORDER - 1UL, __ffs(start));
           ^~~
---------------------------------->8---------------------------------

> 
> -Vineet
-- 
 Eugeniy Paltsev
