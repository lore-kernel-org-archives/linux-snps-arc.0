From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 28 Jan 2019 15:03:50 -0800
Subject: ARC binutils init/fini (was Re: [PATCH 03/21] ARC: ABI Implementation)
In-Reply-To: <alpine.DEB.2.21.1812182302430.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-4-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182302430.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <15846e18-34a8-d368-61c0-1d101a956884@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 3:09 PM, Joseph Myers wrote:
>> diff --git a/sysdeps/arc/crti.S b/sysdeps/arc/crti.S
> As a new port I think it would be best to use init_array in your Implies 
> file so you don't need these crti / crtn files, and make GCC generate 
> init_array / fini_array exclusively.  (See RISC-V and C-Sky discussions of 
> this issue.)
> 

I did the switch and while is working, there are additional test failures

| FAIL: dlfcn/bug-atexit1
| FAIL: dlfcn/bug-atexit2
| FAIL: dlfcn/tstatexit
| FAIL: dlfcn/tstcxaatexit
| FAIL: nptl/tst-atfork2
| FAIL: nptl/tst-cond17
| FAIL: stdlib/test-dlclose-exit-race

In the failing case, the dsos are NOT getting the DT_INIT/DT_FINI dynamic tags

Consider glibc test dlfcn/tstatexit, which uses a dso modatexit.so

In good case

| arc-linux-readelf -a modatexit.os
|
| Section Headers:
|  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
|  [ 9] .init             PROGBITS        0000047c 00047c 000044 00  AX  0   0  4
|  [12] .fini             PROGBITS        000006f8 0006f8 000028 00  AX  0   0  4
|
| Dynamic section at offset 0x1f08 contains 23 entries:
|  0x0000000c (INIT)                       0x47c
|  0x0000000d (FINI)                       0x6f8

In broken case, init/fini sections exist,  but DT_INI/DT_FINI are missing.

|
| Dynamic section at offset 0x1f2c contains 19 entries: <-- missing INIT/FINI
|


I suspected some bintuils/gcc shenanigans and tried hacking around, but was led
far too astray.


(1). gcc config test failing (false alaram)

| host-gcc-final-ab544139bfee/build/gcc/config.log
|
|configure:22941: checking for .preinit_array/.init_array/.fini_array support
|configure:23106: checking cross compile... guessing
|configure:23111: result: no

gcc was seemingly built w/o init_array support leading to inclusion of default
gcc/config/initfini-array.h
However doing a glibc aarch64 build I see the same output so perhaps it is not
relevant.

(2). ARC binutils port seems to hardwire _init/_fini (and the only arch to do
that) so I ripped out the relevant handling from ld, but that doesn't help.


https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/commit/56771171fa7cb9e31c65e26a656a8588d603d924


So I'm not sure if this is deficiency of linker emulation script or code ld/bfd etc..

-Vineet
