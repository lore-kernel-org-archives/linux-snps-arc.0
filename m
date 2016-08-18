From: acme@kernel.org (Arnaldo Carvalho de Melo)
Date: Thu, 18 Aug 2016 13:17:57 -0300
Subject: [PATCH] tools lib: Reinstate strlcpy() header guard with
 __UCLIBC__
In-Reply-To: <852a8516-7fc0-3520-4913-b66c9e8ff3d2@synopsys.com>
References: <1471464050-18044-1-git-send-email-vgupta@synopsys.com>
 <20160818140722.GC16916@redhat.com>
 <852a8516-7fc0-3520-4913-b66c9e8ff3d2@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160818161757.GW20972@kernel.org>
To: linux-snps-arc@lists.infradead.org

Em Thu, Aug 18, 2016 at 09:03:08AM -0700, Vineet Gupta escreveu:
> On 08/18/2016 07:07 AM, Arnaldo Carvalho de Melo wrote:
> > Em Wed, Aug 17, 2016 at 01:00:50PM -0700, Vineet Gupta escreveu:
> >> perf tools build in recent kernels spews splat when cross compiling with uClibc
> >>
> >> |   CC       util/alias.o
> >> | In file included from tools/perf/util/../ui/../util/cache.h:8:0,
> >> |                 from tools/perf/util/../ui/helpline.h:7,
> >> |                 from tools/perf/util/debug.h:8,
> >> |                 from arch/../util/cpumap.h:9,
> >> |                 from arch/../util/env.h:5,
> >> |                 from arch/common.h:4,
> >> |                 from arch/common.c:3:
> >> | tools/include/linux/string.h:12:15: warning: redundant redeclaration of ?strlcpy? [-Wredundant-decls]
> >> |  extern size_t strlcpy(char *dest, const char *src, size_t size);
> >>                ^
> >> This is after commit 61a6445e463a31 ("tools lib: Guard the strlcpy() header with
> >> __GLIBC__"). While the commit was right in theory, issue is uClibc also
> >> defines __GLIBC__ for application headers.
> >>
> >> Instead of reverting the commit, manually revert with some addeed commentary to
> >> same effect.
> > 
> > Well, you can't revert it, as this will make it break elsewhere.
> 
> Just curious, your last change to use ifdef GLIBC vs. ifndef UCLIBC was just a
> preventive fix or was it addressing something reported.

Lets see, applying your revert and starting a build on the 30 docker images I
have for building perf I get... Hey, lucky me, the first one already bombs, its alpine Linux,
that comes with musl libc, see below, I'll let it continue building to see if some other
target explodes:

[root at jouet ~]# time dm
 1 11.315522963 alpine:3.4: FAIL
make: Entering directory '/git/linux/tools/perf'
  BUILD:   Doing 'make -j4' parallel build

Auto-detecting system features:
...                         dwarf: [ OFF ]
...            dwarf_getlocations: [ OFF ]
...                         glibc: [ OFF ]
...                          gtk2: [ on  ]
...                      libaudit: [ OFF ]
...                        libbfd: [ on  ]
...                        libelf: [ on  ]
...                       libnuma: [ OFF ]
...        numa_num_possible_cpus: [ OFF ]
...                       libperl: [ on  ]
...                     libpython: [ on  ]
...                      libslang: [ on  ]
...                     libcrypto: [ on  ]
...                     libunwind: [ OFF ]
...            libdw-dwarf-unwind: [ OFF ]
...                          zlib: [ on  ]
...                          lzma: [ on  ]
...                     get_cpuid: [ on  ]
...                           bpf: [ on  ]

Makefile.config:279: No libdw DWARF unwind found, Please install elfutils-devel/libdw-dev >= 0.158 and/or set LIBDW_DIR
Makefile.config:283: No libdw.h found or old libdw.h found or elfutils is older than 0.138, disables dwarf support. Please install new elfutils-devel/libdw-dev
Makefile.config:315: gelf_getnote() not found on libelf, SDT support disabled
Makefile.config:352: DWARF support is off, BPF prologue is disabled
Makefile.config:360: No sys/sdt.h found, no SDT events are defined, please install systemtap-sdt-devel or systemtap-sdt-dev
Makefile.config:406: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
Makefile.config:433: Disabling post unwind, no support found.
Makefile.config:479: No libaudit.h found, disables 'trace' tool, please install audit-libs-devel or libaudit-dev
Makefile.config:693: No numa.h found, disables 'perf bench numa mem' benchmark, please install numactl-devel/libnuma-devel/libnuma-dev
  GEN      /tmp/build/perf/common-cmds.h
Warning: x86_64's syscall_64.tbl differs from kernel
  CC       /tmp/build/perf/fixdep.o
  LD       /tmp/build/perf/fixdep-in.o
  LINK     /tmp/build/perf/fixdep
  MKDIR    /tmp/build/perf/fd/
  CC       /tmp/build/perf/exec-cmd.o
  CC       /tmp/build/perf/fd/array.o
  CC       /tmp/build/perf/event-parse.o
  LD       /tmp/build/perf/fd/libapi-in.o
  MKDIR    /tmp/build/perf/fs/
  CC       /tmp/build/perf/fs/fs.o
  CC       /tmp/build/perf/help.o
  MKDIR    /tmp/build/perf/fs/
  CC       /tmp/build/perf/fs/tracing_path.o
In file included from fs/tracing_path.c:8:0:
/git/linux/tools/include/linux/string.h:17:15: error: redundant redeclaration of 'strlcpy' [-Werror=redundant-decls]
 extern size_t strlcpy(char *dest, const char *src, size_t size);
               ^
In file included from fs/tracing_path.c:7:0:
/usr/include/string.h:84:8: note: previous declaration of 'strlcpy' was here
 size_t strlcpy (char *, const char *, size_t);
        ^
cc1: all warnings being treated as errors
mv: can't rename '/tmp/build/perf/fs/.tracing_path.o.tmp': No such file or directory
/git/linux/tools/build/Makefile.build:77: recipe for target '/tmp/build/perf/fs/tracing_path.o' failed
make[4]: *** [/tmp/build/perf/fs/tracing_path.o] Error 1
/git/linux/tools/build/Makefile.build:116: recipe for target 'fs' failed
make[3]: *** [fs] Error 2
Makefile:43: recipe for target '/tmp/build/perf/libapi-in.o' failed
make[2]: *** [/tmp/build/perf/libapi-in.o] Error 2
Makefile.perf:546: recipe for target '/tmp/build/perf/libapi.a' failed
make[1]: *** [/tmp/build/perf/libapi.a] Error 2
make[1]: *** Waiting for unfinished jobs....
  CC       /tmp/build/perf/pager.o
  CC       /tmp/build/perf/parse-options.o
  CC       /tmp/build/perf/run-command.o
  PERF_VERSION = 4.8.0-rc2
  CC       /tmp/build/perf/sigchain.o
In file included from run-command.c:6:0:
/git/linux/tools/include/linux/string.h:17:15: error: redundant redeclaration of 'strlcpy' [-Werror=redundant-decls]
 extern size_t strlcpy(char *dest, const char *src, size_t size);
               ^
In file included from run-command.c:5:0:
/usr/include/string.h:84:8: note: previous declaration of 'strlcpy' was here
 size_t strlcpy (char *, const char *, size_t);
        ^
  CC       /tmp/build/perf/event-plugin.o
  CC       /tmp/build/perf/subcmd-config.o
  CC       /tmp/build/perf/trace-seq.o
cc1: all warnings being treated as errors
mv: can't rename '/tmp/build/perf/.run-command.o.tmp': No such file or directory
/git/linux/tools/build/Makefile.build:77: recipe for target '/tmp/build/perf/run-command.o' failed
make[3]: *** [/tmp/build/perf/run-command.o] Error 1
make[3]: *** Waiting for unfinished jobs....
  CC       /tmp/build/perf/parse-filter.o
  CC       /tmp/build/perf/parse-utils.o
  CC       /tmp/build/perf/kbuffer-parse.o
  LD       /tmp/build/perf/libtraceevent-in.o
  LINK     /tmp/build/perf/libtraceevent.a
Makefile:45: recipe for target '/tmp/build/perf/libsubcmd-in.o' failed
make[2]: *** [/tmp/build/perf/libsubcmd-in.o] Error 2
Makefile.perf:560: recipe for target '/tmp/build/perf/libsubcmd.a' failed
make[1]: *** [/tmp/build/perf/libsubcmd.a] Error 2
Makefile:68: recipe for target 'all' failed
make: *** [all] Error 2
make: Leaving directory '/git/linux/tools/perf'
-----------------------------------------------------------------------------
 2 27.319840639 android-ndk:r12b-arm: Ok
 3 79.233901230 archlinux:latest: Ok
 4: centos:5...
