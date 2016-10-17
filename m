From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 17 Oct 2016 23:02:02 +0200
Subject: Build regressions/improvements in v4.9-rc1
In-Reply-To: <00b16c44-79b8-43b8-6516-13c8bb92eb03@synopsys.com>
References: <1476688913-15648-1-git-send-email-geert@linux-m68k.org>
 <CAMuHMdVety8LeBgM1ZHfqw=NMjH5_=sQR=LLypQ1-YjxnuvaiQ@mail.gmail.com>
 <00b16c44-79b8-43b8-6516-13c8bb92eb03@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5541266.ySlPfDOezF@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Monday, October 17, 2016 9:59:24 AM CEST Vineet Gupta wrote:
> +CC Arnd, Michal
> 
> Hi Geert, Arnd
> 
> Need some guidance here.
> 
> On 10/17/2016 12:34 AM, Geert Uytterhoeven wrote:
> >> 48 error regressions:
> >> >   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r2,[r0]':  => 476
> >> >   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r2,[r13]':  => 475
> 
> [snip...]
> 
> >> >   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r4,[r8]':  => 516
> >> >   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r6,[r3]':  => 478
> > arcv2/axs103_smp_defconfig
> 
> 
> I'm thinking how to address this correctly.
> 
> This is due to the older version of compiler.  The fix itself is trivial - add an
> "call as-instr" construct in Makefile to get -DARC_TOOLS_SUPPORT_LLOCKD
> 
> However the atomic64 API variant (CONFIG_GENERIC_ATOMIC64 or arch native) which
> gets included in build comes from Kconfig (ISA supports them or not). How do we
> tie the Makefile info into the Kconfig.
> 
> We could trigger a build failure for invalid combinations of GENERIC_ATOMIC64 and
> ARC_TOOLS_SUPPORT_LLOCKD but that would be less than ideal out of box experience.
> 
> Or the simpler solution is that kisskb upgrades the ARC GNU compiler 

Some ideas, none of which are perfect:

- add an #ifndef ARC_TOOLS_SUPPORT_LLOCKD clause in asm/atomic.h that uses
  .long with hardcoded opcodes in place of the mnemonics.

- instead of setting CONFIG_GENERIC_ATOMIC64 from Kconfig, add a file
  in arch/arc/kernel/ that includes lib/atomic64.c if ARC_TOOLS_SUPPORT_LLOCKD
  is not set.

- add "-DCONFIG_GENERIC_ATOMIC64" to cflags-y from arch/arc/Makefile if
  old binutils are found.

I think someone was suggesting in the past that Kconfig could be extended
to make decisions based on the gcc version, and the same thing could
be done for binutils. Don't remember who that was though. I think a number
of awkward hacks in the kernel could be simplified if we had this.

	And
