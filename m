From: lkp@intel.com (kbuild test robot)
Date: Tue, 10 Jul 2018 00:25:26 +0800
Subject: [PATCH] atomic{64}_t: Explicitly specify data storage length and
 alignment
In-Reply-To: <20180709124741.21037-1-abrodkin@synopsys.com>
References: <20180709124741.21037-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201807100049.6L1a0lqf%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v4.18-rc4 next-20180709]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Alexey-Brodkin/atomic-64-_t-Explicitly-specify-data-storage-length-and-alignment/20180709-223920
config: x86_64-acpi-redef (attached as .config)
compiler: gcc-7 (Debian 7.3.0-16) 7.3.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

All errors (new ones prefixed by >>):

   In file included from tools/objtool/arch/x86/include/asm/orc_types.h:21:0,
                    from orc.h:21,
                    from orc_dump.c:19:
>> tools/include/linux/types.h:62:16: error: expected declaration specifiers or '...' before numeric constant
     u32 __aligned(4) counter;
                   ^
   tools/include/linux/types.h:63:1: error: no semicolon at end of struct or union [-Werror]
    } atomic_t;
    ^
   In file included from tools/objtool/arch/x86/include/asm/orc_types.h:21:0,
                    from orc.h:21,
                    from orc_gen.c:21:
>> tools/include/linux/types.h:62:16: error: expected declaration specifiers or '...' before numeric constant
     u32 __aligned(4) counter;
                   ^
   tools/include/linux/types.h:63:1: error: no semicolon at end of struct or union [-Werror]
    } atomic_t;
    ^
   In file included from tools/include/linux/string.h:5:0,
                    from ../lib/string.c:19:
>> tools/include/linux/types.h:62:16: error: expected declaration specifiers or '...' before numeric constant
     u32 __aligned(4) counter;
                   ^
   tools/include/linux/types.h:63:1: error: no semicolon at end of struct or union [-Werror]
    } atomic_t;
    ^
   cc1: all warnings being treated as errors
>> mv: cannot stat 'tools/objtool/.libstring.o.tmp': No such file or directory
   make[4]: *** [tools/objtool/libstring.o] Error 1
   In file included from tools/include/linux/string.h:5:0,
                    from ../lib/str_error_r.c:5:
>> tools/include/linux/types.h:62:16: error: expected declaration specifiers or '...' before numeric constant
     u32 __aligned(4) counter;
                   ^
   tools/include/linux/types.h:63:1: error: no semicolon at end of struct or union [-Werror]
    } atomic_t;
    ^
   cc1: all warnings being treated as errors
   In file included from tools/include/linux/list.h:5:0,
                    from elf.h:23,
                    from elf.c:31:
>> tools/include/linux/types.h:62:16: error: expected declaration specifiers or '...' before numeric constant
     u32 __aligned(4) counter;
                   ^
   tools/include/linux/types.h:63:1: error: no semicolon at end of struct or union [-Werror]
    } atomic_t;
    ^
   In file included from tools/include/linux/list.h:5:0,
                    from elf.h:23,
                    from special.h:22,
                    from special.c:26:
>> tools/include/linux/types.h:62:16: error: expected declaration specifiers or '...' before numeric constant
     u32 __aligned(4) counter;
                   ^
   tools/include/linux/types.h:63:1: error: no semicolon at end of struct or union [-Werror]
    } atomic_t;
    ^
   mv: cannot stat 'tools/objtool/.str_error_r.o.tmp': No such file or directory
   make[4]: *** [tools/objtool/str_error_r.o] Error 1
   In file included from tools/include/linux/string.h:5:0,
                    from run-command.c:7:
>> tools/include/linux/types.h:62:16: error: expected declaration specifiers or '...' before numeric constant
     u32 __aligned(4) counter;
                   ^
   tools/include/linux/types.h:63:1: error: no semicolon at end of struct or union [-Werror]
    } atomic_t;
    ^
   cc1: all warnings being treated as errors
   mv: cannot stat 'tools/objtool/.orc_dump.o.tmp': No such file or directory
   make[4]: *** [tools/objtool/orc_dump.o] Error 1
   In file included from tools/include/linux/string.h:5:0,
                    from help.c:5:
>> tools/include/linux/types.h:62:16: error: expected declaration specifiers or '...' before numeric constant
     u32 __aligned(4) counter;
                   ^
   tools/include/linux/types.h:63:1: error: no semicolon at end of struct or union [-Werror]
    } atomic_t;
    ^
   cc1: all warnings being treated as errors
   mv: cannot stat 'tools/objtool/.special.o.tmp': No such file or directory
   make[4]: *** [tools/objtool/special.o] Error 1
   cc1: all warnings being treated as errors
   cc1: all warnings being treated as errors
   mv: cannot stat 'tools/objtool/.run-command.o.tmp': No such file or directory
   make[5]: *** [tools/objtool/run-command.o] Error 1
   mv: cannot stat 'tools/objtool/.orc_gen.o.tmp': No such file or directory
   make[4]: *** [tools/objtool/orc_gen.o] Error 1
   cc1: all warnings being treated as errors
   mv: cannot stat 'tools/objtool/.help.o.tmp': No such file or directory
   make[5]: *** [tools/objtool/help.o] Error 1
   cc1: all warnings being treated as errors
   mv: cannot stat 'tools/objtool/.elf.o.tmp': No such file or directory
   make[4]: *** [tools/objtool/elf.o] Error 1
   In file included from tools/include/linux/list.h:5:0,
                    from arch/x86/../../elf.h:23,
                    from arch/x86/decode.c:26:
>> tools/include/linux/types.h:62:16: error: expected declaration specifiers or '...' before numeric constant
     u32 __aligned(4) counter;
                   ^
   tools/include/linux/types.h:63:1: error: no semicolon at end of struct or union [-Werror]
    } atomic_t;
    ^
   cc1: all warnings being treated as errors
   mv: cannot stat 'tools/objtool/arch/x86/.decode.o.tmp': No such file or directory
   make[5]: *** [tools/objtool/arch/x86/decode.o] Error 1
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [arch/x86] Error 2
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [tools/objtool/libsubcmd-in.o] Error 2
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [tools/objtool/libsubcmd.a] Error 2
   make[4]: Target '__build' not remade because of errors.
   make[3]: *** [tools/objtool/objtool-in.o] Error 2
   make[3]: Target 'all' not remade because of errors.
   make[2]: *** [objtool] Error 2
   make[1]: *** [tools/objtool] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [sub-make] Error 2

vim +62 tools/include/linux/types.h

    60	
    61	typedef struct {
  > 62		u32 __aligned(4) counter;
    63	} atomic_t;
    64	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 30712 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20180710/38322752/attachment-0001.gz>
