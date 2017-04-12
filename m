From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Wed, 12 Apr 2017 19:59:47 +0200
Subject: static linking broken?
In-Reply-To: <1491997003.4510.40.camel@synopsys.com>
References: <20170411205225.GD5361@waldemar-brodkorb.de>
 <59250a19-ec37-c315-ded0-fa61f5b3f4de@synopsys.com>
 <1491997003.4510.40.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170412175944.GF5361@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,
Alexey Brodkin wrote,

> Hi Waldemar,
> 
> On Tue, 2017-04-11@14:51 -0700, Vineet Gupta wrote:
> > On 04/11/2017 01:52 PM, Waldemar Brodkorb wrote:
> > > 
> > > Hi Vineet,
> > > 
> > > it seems static linking is totally broken for ARC and uClibc-ng:
> > > 
> > > file root_nsim-arcv2_uclibc-ng_archs/bin/busybox?
> > > root_nsim-arcv2_uclibc-ng_archs/bin/busybox: ELF 32-bit LSB
> > > executable, *unknown arch 0xc3* version 1 (SYSV), dynamically
> > > linked, interpreter *empty*,?for GNU/Linux 4.8.0, stripped
> > > 
> > > I am using arc-2016.09-release within OpenADK.
> > > 
> > > Do you ever used static linking?
> > > 
> > > I only test with nsim, but can't use any static binaries.
> > > 
> > > best regards
> > > ?Waldemar
> > 
> > I do test static linked busybox and last I checked 2016.09 seemed ok ! (below is
> > busybox built against prebuilt 2016.09 toolchain on github)
> > 
> > $ file arc_initramfs_hs_1612-gnu-2016.09-BIG/bin/busybox_static
> > ELF 32-bit LSB executable, *unknown arch 0xc3* version 1 (SYSV), statically
> > linked, for GNU/Linux 4.8.0, not stripped
> > 
> > Although I've seen this issue in different context - Linux kernel perf, Alexey u
> > remember !
> 
> Indeed there was a discussion on that regard in LKML.
> This is the first part of the thread:
> http://lists.infradead.org/pipermail/linux-snps-arc/2016-August/001431.html
> and here are last 2 messages in this thread:
> http://lists.infradead.org/pipermail/linux-snps-arc/2016-September/001454.html
> 
> Conclusion was that for some reason final perf executable even if
> built with "-static" becomes a weird "dynamic" with no interpreter right
> as you saw.
> 
> In fact Linux perf is still affected.
> If I build it from Linux v4.11-rc4 like that:
> ----------------->8--------------
> make NO_LIBELF=1 NO_JVMTI=1 LDFLAGS=-static
> ----------------->8--------------
> I see strange description of the resulting binary:
> ----------------->8--------------
> file perf
> perf: ELF 32-bit LSB executable, *unknown arch 0xc3* version 1 (SYSV), dynamically linked, interpreter *empty*, for GNU/Linux 4.8.0, not stripped
> ----------------->8--------------
> 
> But if I build Busybox (I tried today's master) with prebuilt arc-2016.09 tools
> static busybox looks pretty ok:
> ----------------->8--------------
> file busybox
> busybox: ELF 32-bit LSB executable, *unknown arch 0xc3* version 1 (SYSV), statically linked, for GNU/Linux 4.8.0, stripped
> ----------------->8--------------
> 
> That said something is definitely wrong here.
> In case of perf I was able to get a real "static" binary when excluded "--dynamic-list"
> option passed to the linker, see my initial patch here:
> http://lists.infradead.org/pipermail/linux-snps-arc/2016-August/001431.html
> 
> So I may speculate that something "wrong" gets passed to LD when your busybox
> gets linked.
> 
> I just made a simple test:
> ------------------------------>8--------------------------------
> # cat test.c?
> #include <stdio.h>
> 
> void main(void)
> {
> 	printf("Hello!\n");
> }
> 
> # cat dynamic-list?
> {
> 	main;
> };
> 
> # gcc -static -Wl,--dynamic-list=dynamic-list test.c?
> # file a.out?
> a.out: ELF 64-bit LSB executable, x86-64, version 1 (GNU/Linux), statically linked, for GNU/Linux 2.6.32,
> BuildID[sha1]=55823847c3640b89164ca7ae7c4382ed40c19da5, not stripped
> 
> # arc-linux-gcc -static -Wl,--dynamic-list=dynamic-list test.c?
> # file a.out?
> a.out: ELF 32-bit LSB executable, *unknown arch 0xc3* version 1 (SYSV), dynamically linked, interpreter *empty*, for GNU/Linux 4.8.0, not stripped
> ------------------------------>8--------------------------------
> 
> My host?gcc version 6.3.1 20161221 (Red Hat 6.3.1-1) (GCC)?
> Cross?gcc version 6.2.1 20160824 (ARCv2 ISA Linux uClibc toolchain 2016.09).
> 
> I think it's over to Cupertino to investigate now that magic difference :)

Attached my log file when trying to create a simple hello world with
-static.

best regards
 Waldemar
-------------- next part --------------
Using built-in specs.
COLLECT_GCC=./arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/bin/arc-openadk-linux-uclibc-gcc
COLLECT_LTO_WRAPPER=/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/libexec/gcc/arc-openadk-linux-uclibc/6.2.1/lto-wrapper
Target: arc-openadk-linux-uclibc
Configured with: /home/wbx/arcv2-dynamic/toolchain_build_nsim-arcv2_uclibc-ng_archs/w-gcc-arc-2016.09-release-1/gcc-arc-2016.09-release/configure --prefix=/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr --with-bugurl=http://www.openadk.org/ --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=arc-openadk-linux-uclibc --with-gmp=/home/wbx/arcv2-dynamic/host_x86_64-linux-gnu/usr --with-mpfr=/home/wbx/arcv2-dynamic/host_x86_64-linux-gnu/usr --with-libelf=/home/wbx/arcv2-dynamic/host_x86_64-linux-gnu/usr --disable-__cxa_atexit --with-system-zlib --with-gnu-ld --with-gnu-as --disable-libsanitizer --disable-install-libiberty --disable-libitm --disable-libmudflap --disable-libgomp --disable-libcilkrts --disable-libquadmath --disable-libquadmath-support --disable-decimal-float --disable-libstdcxx-pch --disable-ppl-version-check --disable-cloog-version-check --without-ppl --without-cloog --without-isl --disable-werror --disable-nls --disable-lto --with-cpu=archs --enable-tls --enable-threads --enable-libatomic --enable-shared --enable-cxx-flags=-fPIC --disable-libssp --disable-biarch --disable-multilib --enable-languages=c --with-build-sysroot='/../../target_nsim-arcv2_uclibc-ng_archs' --with-sysroot='/../../target_nsim-arcv2_uclibc-ng_archs'
Thread model: posix
gcc version 6.2.1 20160824 (GCC) 
GNU ld (GNU Binutils) 2.27.51.20161017
  Supported emulations:
   arclinux
   arclinux_prof
   arcelf
   arcelf_prof
   arcv2elf
   arcv2elfx
using internal linker script:
==================================================
/* Script for -z combreloc: combine and sort reloc sections */
/* Copyright (C) 2014-2016 Free Software Foundation, Inc.
   Copying and distribution of this script, with or without modification,
   are permitted in any medium without royalty provided the copyright
   notice and this notice are preserved.  */
OUTPUT_FORMAT("elf32-littlearc", "elf32-bigarc",
	      "elf32-littlearc")
OUTPUT_ARCH(arc)
ENTRY(__start)
SEARCH_DIR("=/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/arc-openadk-linux-uclibc/lib"); SEARCH_DIR("=/usr/local/lib"); SEARCH_DIR("=/lib"); SEARCH_DIR("=/usr/lib");
SECTIONS
{
  /* Read-only sections, merged into text segment: */
  PROVIDE (__executable_start = SEGMENT_START("text-segment", 0x10000)); . = SEGMENT_START("text-segment", 0x10000) + SIZEOF_HEADERS;
  .interp         : { *(.interp) }
  .note.gnu.build-id : { *(.note.gnu.build-id) }
  .hash           : { *(.hash) }
  .gnu.hash       : { *(.gnu.hash) }
  .dynsym         : { *(.dynsym) }
  .dynstr         : { *(.dynstr) }
  .gnu.version    : { *(.gnu.version) }
  .gnu.version_d  : { *(.gnu.version_d) }
  .gnu.version_r  : { *(.gnu.version_r) }
  .rel.dyn        :
    {
      *(.rel.init)
      *(.rel.text .rel.text.* .rel.gnu.linkonce.t.*)
      *(.rel.fini)
      *(.rel.rodata .rel.rodata.* .rel.gnu.linkonce.r.*)
      *(.rel.data.rel.ro .rel.data.rel.ro.* .rel.gnu.linkonce.d.rel.ro.*)
      *(.rel.data .rel.data.* .rel.gnu.linkonce.d.*)
      *(.rel.tdata .rel.tdata.* .rel.gnu.linkonce.td.*)
      *(.rel.tbss .rel.tbss.* .rel.gnu.linkonce.tb.*)
      *(.rel.ctors)
      *(.rel.dtors)
      *(.rel.got)
      *(.rel.bss .rel.bss.* .rel.gnu.linkonce.b.*)
      PROVIDE_HIDDEN (__rel_iplt_start = .);
      *(.rel.iplt)
      PROVIDE_HIDDEN (__rel_iplt_end = .);
    }
  .rela.dyn       :
    {
      *(.rela.init)
      *(.rela.text .rela.text.* .rela.gnu.linkonce.t.*)
      *(.rela.fini)
      *(.rela.rodata .rela.rodata.* .rela.gnu.linkonce.r.*)
      *(.rela.data .rela.data.* .rela.gnu.linkonce.d.*)
      *(.rela.tdata .rela.tdata.* .rela.gnu.linkonce.td.*)
      *(.rela.tbss .rela.tbss.* .rela.gnu.linkonce.tb.*)
      *(.rela.ctors)
      *(.rela.dtors)
      *(.rela.got)
      *(.rela.bss .rela.bss.* .rela.gnu.linkonce.b.*)
      PROVIDE_HIDDEN (__rela_iplt_start = .);
      *(.rela.iplt)
      PROVIDE_HIDDEN (__rela_iplt_end = .);
    }
  .rel.plt        :
    {
      *(.rel.plt)
    }
  .rela.plt       :
    {
      *(.rela.plt)
    }
  .init           :
  {
    KEEP (*(SORT_NONE(.init)))
  }
  .plt            : { *(.plt) }
  .iplt           : { *(.iplt) }
  .text           :
  {
    *(.text.unlikely .text.*_unlikely .text.unlikely.*)
    *(.text.exit .text.exit.*)
    *(.text.startup .text.startup.*)
    *(.text.hot .text.hot.*)
    *(.text .stub .text.* .gnu.linkonce.t.*)
    /* .gnu.warning sections are handled specially by elf32.em.  */
    *(.gnu.warning)
  }
  .fini           :
  {
    KEEP (*(SORT_NONE(.fini)))
  }
  PROVIDE (__etext = .);
  PROVIDE (_etext = .);
  PROVIDE (etext = .);
  .rodata         : { *(.rodata .rodata.* .gnu.linkonce.r.*) }
  .rodata1        : { *(.rodata1) }
  .eh_frame_hdr : { *(.eh_frame_hdr) *(.eh_frame_entry .eh_frame_entry.*) }
  .eh_frame       : ONLY_IF_RO { KEEP (*(.eh_frame)) *(.eh_frame.*) }
  .gcc_except_table   : ONLY_IF_RO { *(.gcc_except_table
  .gcc_except_table.*) }
  .gnu_extab   : ONLY_IF_RO { *(.gnu_extab*) }
  /* These sections are generated by the Sun/Oracle C++ compiler.  */
  .exception_ranges   : ONLY_IF_RO { *(.exception_ranges
  .exception_ranges*) }
  /* Adjust the address for the data segment.  We want to adjust up to
     the same address within the page on the next page up.  */
  . = DATA_SEGMENT_ALIGN (CONSTANT (MAXPAGESIZE), CONSTANT (COMMONPAGESIZE));
  /* Exception handling  */
  .eh_frame       : ONLY_IF_RW { KEEP (*(.eh_frame)) *(.eh_frame.*) }
  .gnu_extab      : ONLY_IF_RW { *(.gnu_extab) }
  .gcc_except_table   : ONLY_IF_RW { *(.gcc_except_table .gcc_except_table.*) }
  .exception_ranges   : ONLY_IF_RW { *(.exception_ranges .exception_ranges*) }
  /* Thread Local Storage sections  */
  .tdata	  : { PROVIDE_HIDDEN(.tdata = .); *(.tdata .tdata.* .gnu.linkonce.td.*) }
  .tbss		  : { PROVIDE_HIDDEN(.tbss = .); *(.tbss .tbss.* .gnu.linkonce.tb.*) *(.tcommon) }
  .preinit_array     :
  {
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP (*(.preinit_array))
    PROVIDE_HIDDEN (__preinit_array_end = .);
  }
  .init_array     :
  {
    PROVIDE_HIDDEN (__init_array_start = .);
    KEEP (*(SORT_BY_INIT_PRIORITY(.init_array.*) SORT_BY_INIT_PRIORITY(.ctors.*)))
    KEEP (*(.init_array EXCLUDE_FILE (*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o ) .ctors))
    PROVIDE_HIDDEN (__init_array_end = .);
  }
  .fini_array     :
  {
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP (*(SORT_BY_INIT_PRIORITY(.fini_array.*) SORT_BY_INIT_PRIORITY(.dtors.*)))
    KEEP (*(.fini_array EXCLUDE_FILE (*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o ) .dtors))
    PROVIDE_HIDDEN (__fini_array_end = .);
  }
  .ctors          :
  {
    /* gcc uses crtbegin.o to find the start of
       the constructors, so we make sure it is
       first.  Because this is a wildcard, it
       doesn't matter if the user does not
       actually link against crtbegin.o; the
       linker won't look for a file to match a
       wildcard.  The wildcard also means that it
       doesn't matter which directory crtbegin.o
       is in.  */
    KEEP (*crtbegin.o(.ctors))
    KEEP (*crtbegin?.o(.ctors))
    /* We don't want to include the .ctor section from
       the crtend.o file until after the sorted ctors.
       The .ctor section from the crtend file contains the
       end of ctors marker and it must be last */
    KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .ctors))
    KEEP (*(SORT(.ctors.*)))
    KEEP (*(.ctors))
  }
  .dtors          :
  {
    KEEP (*crtbegin.o(.dtors))
    KEEP (*crtbegin?.o(.dtors))
    KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .dtors))
    KEEP (*(SORT(.dtors.*)))
    KEEP (*(.dtors))
  }
  .jcr            : { KEEP (*(.jcr)) }
  .data.rel.ro : { *(.data.rel.ro.local* .gnu.linkonce.d.rel.ro.local.*) *(.data.rel.ro .data.rel.ro.* .gnu.linkonce.d.rel.ro.*) }
  .dynamic        : { *(.dynamic) }
  .got            : { *(.got) *(.igot) }
  . = DATA_SEGMENT_RELRO_END (4, .);
  .got.plt        : { *(.got.plt)  *(.igot.plt) }
  .data           :
  {
    *(.data .data.* .gnu.linkonce.d.*)
    SORT(CONSTRUCTORS)
  }
  .data1          : { *(.data1) }
  _edata = .; PROVIDE (edata = .);
  . = .;
  __bss_start = .;
  .bss            :
  {
   *(.dynbss)
   *(.bss .bss.* .gnu.linkonce.b.*)
   *(COMMON)
   /* Align here to ensure that the .bss section occupies space up to
      _end.  Align after .bss to ensure correct alignment even if the
      .bss section disappears because there are no input sections.
      FIXME: Why do we need it? When there is no .bss section, we don't
      pad the .data section.  */
   . = ALIGN(. != 0 ? 32 / 8 : 1);
  }
  . = ALIGN(32 / 8);
  . = SEGMENT_START("ldata-segment", .);
  . = ALIGN(32 / 8);
  _end = .; PROVIDE (end = .);
  . = DATA_SEGMENT_END (.);
  /* Stabs debugging sections.  */
  .stab          0 : { *(.stab) }
  .stabstr       0 : { *(.stabstr) }
  .stab.excl     0 : { *(.stab.excl) }
  .stab.exclstr  0 : { *(.stab.exclstr) }
  .stab.index    0 : { *(.stab.index) }
  .stab.indexstr 0 : { *(.stab.indexstr) }
  .comment       0 : { *(.comment) }
  /* DWARF debug sections.
     Symbols in the DWARF debugging sections are relative to the beginning
     of the section so we begin them at 0.  */
  /* DWARF 1 */
  .debug          0 : { *(.debug) }
  .line           0 : { *(.line) }
  /* GNU DWARF 1 extensions */
  .debug_srcinfo  0 : { *(.debug_srcinfo) }
  .debug_sfnames  0 : { *(.debug_sfnames) }
  /* DWARF 1.1 and DWARF 2 */
  .debug_aranges  0 : { *(.debug_aranges) }
  .debug_pubnames 0 : { *(.debug_pubnames) }
  /* DWARF 2 */
  .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
  .debug_abbrev   0 : { *(.debug_abbrev) }
  .debug_line     0 : { *(.debug_line .debug_line.* .debug_line_end ) }
  .debug_frame    0 : { *(.debug_frame) }
  .debug_str      0 : { *(.debug_str) }
  .debug_loc      0 : { *(.debug_loc) }
  .debug_macinfo  0 : { *(.debug_macinfo) }
  /* SGI/MIPS DWARF 2 extensions */
  .debug_weaknames 0 : { *(.debug_weaknames) }
  .debug_funcnames 0 : { *(.debug_funcnames) }
  .debug_typenames 0 : { *(.debug_typenames) }
  .debug_varnames  0 : { *(.debug_varnames) }
  /* DWARF 3 */
  .debug_pubtypes 0 : { *(.debug_pubtypes) }
  .debug_ranges   0 : { *(.debug_ranges) }
  /* DWARF Extension.  */
  .debug_macro    0 : { *(.debug_macro) }
  .debug_addr     0 : { *(.debug_addr) }
  .gnu.attributes 0 : { KEEP (*(.gnu.attributes)) }
  /DISCARD/ : { *(.__arc_profile_*) }
  /DISCARD/ : { *(.note.GNU-stack) *(.gnu_debuglink) *(.gnu.lto_*) }
}


==================================================
attempt to open /home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/crt1.o succeeded
/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/crt1.o
attempt to open /home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/crti.o succeeded
/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/crti.o
attempt to open /home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/crtbeginT.o succeeded
/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/crtbeginT.o
attempt to open /tmp/ccFNY8jS.o succeeded
/tmp/ccFNY8jS.o
attempt to open /home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/libgcc.a succeeded
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/libgcc.a)_millicodethunk_st.o
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/libgcc.a)_millicodethunk_ret.o
attempt to open /home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/libgcc_eh.a succeeded
attempt to open /home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/libc.a failed
attempt to open /home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a succeeded
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)puts.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_stdio.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_wcommit.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fputc_unlocked.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fputs_unlocked.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fwrite_unlocked.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)strlen.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)isatty.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)tcgetattr.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)__uClibc_main.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)libc-tls.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)dl-support.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)libdl.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)resolve.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)lowlevellock.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)errno_location.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)herrno.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)__syscall_error.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)bsd-_setjmp.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)ioctl.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)getuid.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)open.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)openat.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)sbrk.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)getgid.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)getegid.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)gettimeofday.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)__syscall_fcntl.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)geteuid.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)errno.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)h_errno.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)dprintf.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)vdprintf.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_WRITE.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_fwrite.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_trans2w.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_vfprintf_internal.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_ppfs_init.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_ppfs_prepargs.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_ppfs_setargs.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_ppfs_parsespec.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fflush_unlocked.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)memset.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)strchr.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)strcmp.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)memcmp.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)strcpy.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)memcpy.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)memchr.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)memrchr.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)strrchr.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)strnlen.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)mempcpy.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)strcat.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)__glibc_strerror_r.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)__xpg_strerror_r.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)strdup.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_string_syserrmsgs.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)free.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)malloc.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)abort.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)getenv.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)exit.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)sysconf.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)raise.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)libc-cancellation.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)dl-tls.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)dl-core.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)sigaction.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)setjmp.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)getpagesize.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)clock_getres.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)getrlimit.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)brk.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)sysinfo.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)write.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)munmap.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_exit.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)sigprocmask.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)mmap.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)getdtablesize.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)__C_ctype_b.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)closedir.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)opendir.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)readdir64.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)parse_config.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)wcrtomb.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)wcsrtombs.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)wcsnrtombs.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fclose.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fopen.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fseeko.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fprintf.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fseeko64.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_adjust_pos.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_fopen.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_cs_funcs.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_load_inttype.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_store_inttype.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_uintmaxtostr.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_fpmaxtostr.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)vfprintf.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fgetc.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fgets.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fgetc_unlocked.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fgets_unlocked.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)strcspn.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)strspn.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)strchrnul.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)sigjmp.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)realloc.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)calloc.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)fstat.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)mremap.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)close.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)llseek.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)getdents64.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_READ.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_rfill.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)_trans2r.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/../../../../arc-openadk-linux-uclibc/lib/libc.a)read.os
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/libgcc.a)_millicodethunk_ld.o
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/libgcc.a)dp-bit.o
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/libgcc.a)_lshrdi3.o
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/libgcc.a)_ashldi3.o
(/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/libgcc.a)fp-bit.o
attempt to open /home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/crtend.o succeeded
/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/crtend.o
attempt to open /home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/crtn.o succeeded
/home/wbx/arcv2-dynamic/toolchain_nsim-arcv2_uclibc-ng_archs/usr/lib/gcc/arc-openadk-linux-uclibc/6.2.1/crtn.o
