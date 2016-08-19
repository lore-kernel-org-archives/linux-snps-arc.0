From: acme@kernel.org (Arnaldo Carvalho de Melo)
Date: Fri, 19 Aug 2016 18:10:20 -0300
Subject: [PATCH] tools lib: Reinstate strlcpy() header guard with
 __UCLIBC__
In-Reply-To: <20160819192302.GA20810@kernel.org>
References: <1471464050-18044-1-git-send-email-vgupta@synopsys.com>
 <20160818140722.GC16916@redhat.com>
 <852a8516-7fc0-3520-4913-b66c9e8ff3d2@synopsys.com>
 <20160819142207.GA4966@kernel.org>
 <868d62af-a673-80f8-2071-9043394f20fe@synopsys.com>
 <20160819192302.GA20810@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160819200843.GB20810@kernel.org>
To: linux-snps-arc@lists.infradead.org

Em Fri, Aug 19, 2016 at 04:23:02PM -0300, Arnaldo Carvalho de Melo escreveu:
> Em Fri, Aug 19, 2016 at 11:01:49AM -0700, Vineet Gupta escreveu:
> > Awesome - I presume it ran to completion and builds perf successfully.
> 
> Right, see full logs below.
> 
> But one question: when you test build, do you have any extra devel
> packages installed besides what is in this prebuilt toolchain tarball?
> 
> I'll add at least zlib and elfutils to the mix, building it in the
> docker image creation process, and then testing with/without
> NO_LIBELF=1, as I do to other cross-building images:

Trying to build elfutils 0.166:

checking whether gcc accepts -Wduplicated-cond... no
checking whether gcc accepts -Wnull-dereference... no
configure: WARNING: "libc does not have argp"
checking for argp_parse in -largp... no
configure: error: "no libargp found"

----

will go errands now, will try to check what is needed to build elfutils
with uclibc, ideas?

- Arnaldo

  
> > Thx a bunch for doing this Arnaldo - CROSS build and uclibc had a tendency to
> > break here and there so this will catch errors early.
> 
> Hopefully this is something of the past :-)
> 
> - Arnaldo
> 
> fedora:24-x-ARC-uClibc
> make: Entering directory '/git/linux/tools/perf'
>   BUILD:   Doing 'make -j4' parallel build
> sh: line 0: command: -c: invalid option
> command: usage: command [-pVv] command [arg ...]
> 
> Auto-detecting system features:
> ...                         dwarf: [ OFF ]
> ...            dwarf_getlocations: [ OFF ]
> ...                         glibc: [ on  ]
> ...                          gtk2: [ OFF ]
> ...                      libaudit: [ OFF ]
> ...                        libbfd: [ OFF ]
> ...                        libelf: [ OFF ]
> ...                       libnuma: [ OFF ]
> ...        numa_num_possible_cpus: [ OFF ]
> ...                       libperl: [ OFF ]
> ...                     libpython: [ OFF ]
> ...                      libslang: [ OFF ]
> ...                     libcrypto: [ OFF ]
> ...                     libunwind: [ OFF ]
> ...            libdw-dwarf-unwind: [ OFF ]
> ...                          zlib: [ OFF ]
> ...                          lzma: [ OFF ]
> ...                     get_cpuid: [ OFF ]
> ...                           bpf: [ on  ]
> 
> Makefile.config:260: No libelf found, disables 'probe' tool and BPF support in 'perf record', please install libelf-dev, libelf-devel or elfutils-libelf-devel
> Makefile.config:360: No sys/sdt.h found, no SDT events are defined, please install systemtap-sdt-devel or systemtap-sdt-dev
> Makefile.config:433: Disabling post unwind, no support found.
> Makefile.config:479: No libaudit.h found, disables 'trace' tool, please install audit-libs-devel or libaudit-dev
> Makefile.config:490: No libcrypto.h found, disables jitted code injection, please install libssl-devel or libssl-dev
> Makefile.config:505: slang not found, disables TUI support. Please install slang-devel, libslang-dev or libslang2-dev
> Makefile.config:519: GTK2 not found, disables GTK2 support. Please install gtk2-devel or libgtk2.0-dev
> Makefile.config:547: Missing perl devel files. Disabling perl scripting support, please install perl-ExtUtils-Embed/libperl-dev
> Makefile.config:573: No python interpreter was found: disables Python support - please install python-devel/python-dev
> Makefile.config:680: No liblzma found, disables xz kernel module decompression, please install xz-devel/liblzma-dev
> Makefile.config:693: No numa.h found, disables 'perf bench numa mem' benchmark, please install numactl-devel/libnuma-devel/libnuma-dev
> Makefile.config:750: Your gcc lacks the __get_cpuid() builtin, disables support for auxtrace/Intel PT, please install a newer gcc
>   GEN      /tmp/build/perf/common-cmds.h
>   MKDIR    /tmp/build/perf/fd/
>   CC       /tmp/build/perf/fd/array.o
>   CC       /tmp/build/perf/event-parse.o
>   CC       /tmp/build/perf/exec-cmd.o
>   LD       /tmp/build/perf/fd/libapi-in.o
>   MKDIR    /tmp/build/perf/fs/
>   CC       /tmp/build/perf/fs/fs.o
>   CC       /tmp/build/perf/help.o
>   MKDIR    /tmp/build/perf/fs/
>   CC       /tmp/build/perf/fs/tracing_path.o
>   LD       /tmp/build/perf/fs/libapi-in.o
>   PERF_VERSION = 4.8.0-rc2
>   CC       /tmp/build/perf/cpu.o
>   CC       /tmp/build/perf/pager.o
>   CC       /tmp/build/perf/plugin_jbd2.o
>   CC       /tmp/build/perf/debug.o
>   LD       /tmp/build/perf/plugin_jbd2-in.o
>   CC       /tmp/build/perf/plugin_hrtimer.o
>   CC       /tmp/build/perf/str_error_r.o
>   CC       /tmp/build/perf/parse-options.o
>   LD       /tmp/build/perf/libapi-in.o
>   LD       /tmp/build/perf/plugin_hrtimer-in.o
>   AR       /tmp/build/perf/libapi.a
>   CC       /tmp/build/perf/plugin_kmem.o
>   GEN      perf-archive
>   GEN      perf-with-kcore
>   MKDIR    /tmp/build/perf/util/
>   LD       /tmp/build/perf/plugin_kmem-in.o
>   CC       /tmp/build/perf/util/alias.o
>   CC       /tmp/build/perf/plugin_kvm.o
>   LD       /tmp/build/perf/plugin_kvm-in.o
>   CC       /tmp/build/perf/plugin_mac80211.o
>   CC       /tmp/build/perf/event-plugin.o
>   MKDIR    /tmp/build/perf/util/
>   LD       /tmp/build/perf/plugin_mac80211-in.o
>   CC       /tmp/build/perf/plugin_sched_switch.o
>   CC       /tmp/build/perf/util/annotate.o
>   CC       /tmp/build/perf/trace-seq.o
>   CC       /tmp/build/perf/parse-filter.o
>   LD       /tmp/build/perf/plugin_sched_switch-in.o
>   CC       /tmp/build/perf/plugin_function.o
>   LD       /tmp/build/perf/plugin_function-in.o
>   CC       /tmp/build/perf/plugin_xen.o
>   LD       /tmp/build/perf/plugin_xen-in.o
>   CC       /tmp/build/perf/plugin_scsi.o
>   CC       /tmp/build/perf/parse-utils.o
>   LD       /tmp/build/perf/plugin_scsi-in.o
>   CC       /tmp/build/perf/plugin_cfg80211.o
>   CC       /tmp/build/perf/kbuffer-parse.o
>   CC       /tmp/build/perf/run-command.o
>   LD       /tmp/build/perf/plugin_cfg80211-in.o
>   LINK     /tmp/build/perf/plugin_jbd2.so
>   LINK     /tmp/build/perf/plugin_hrtimer.so
>   LD       /tmp/build/perf/libtraceevent-in.o
>   LINK     /tmp/build/perf/libtraceevent.a
>   LINK     /tmp/build/perf/plugin_kmem.so
>   LINK     /tmp/build/perf/plugin_kvm.so
>   LINK     /tmp/build/perf/plugin_mac80211.so
>   LINK     /tmp/build/perf/plugin_sched_switch.so
>   LINK     /tmp/build/perf/plugin_function.so
>   LINK     /tmp/build/perf/plugin_xen.so
>   LINK     /tmp/build/perf/plugin_scsi.so
>   CC       /tmp/build/perf/sigchain.o
>   LINK     /tmp/build/perf/plugin_cfg80211.so
>   GEN      /tmp/build/perf/libtraceevent-dynamic-list
>   CC       /tmp/build/perf/util/build-id.o
>   CC       /tmp/build/perf/subcmd-config.o
>   LD       /tmp/build/perf/libsubcmd-in.o
>   AR       /tmp/build/perf/libsubcmd.a
>   CC       /tmp/build/perf/util/config.o
>   CC       /tmp/build/perf/builtin-bench.o
>   CC       /tmp/build/perf/builtin-annotate.o
>   CC       /tmp/build/perf/util/ctype.o
>   CC       /tmp/build/perf/util/db-export.o
>   CC       /tmp/build/perf/util/env.o
>   CC       /tmp/build/perf/util/event.o
>   CC       /tmp/build/perf/builtin-config.o
>   CC       /tmp/build/perf/util/evlist.o
>   CC       /tmp/build/perf/builtin-diff.o
>   CC       /tmp/build/perf/util/evsel.o
>   CC       /tmp/build/perf/util/evsel_fprintf.o
>   CC       /tmp/build/perf/util/find_bit.o
>   CC       /tmp/build/perf/builtin-evlist.o
>   CC       /tmp/build/perf/util/kallsyms.o
>   CC       /tmp/build/perf/util/levenshtein.o
>   CC       /tmp/build/perf/builtin-help.o
>   CC       /tmp/build/perf/util/llvm-utils.o
>   MKDIR    /tmp/build/perf/arch/
>   CC       /tmp/build/perf/arch/common.o
>   BISON    /tmp/build/perf/util/parse-events-bison.c
>   MKDIR    /tmp/build/perf/arch/arc/
>   LD       /tmp/build/perf/arch/arc/libperf-in.o
>   LD       /tmp/build/perf/arch/libperf-in.o
>   MKDIR    /tmp/build/perf/ui/
>   CC       /tmp/build/perf/builtin-sched.o
>   CC       /tmp/build/perf/ui/setup.o
>   MKDIR    /tmp/build/perf/ui/
>   CC       /tmp/build/perf/ui/helpline.o
>   CC       /tmp/build/perf/util/perf_regs.o
>   CC       /tmp/build/perf/ui/progress.o
>   CC       /tmp/build/perf/util/path.o
>   CC       /tmp/build/perf/ui/util.o
>   CC       /tmp/build/perf/ui/hist.o
>   CC       /tmp/build/perf/util/rbtree.o
>   MKDIR    /tmp/build/perf/ui/stdio/
>   CC       /tmp/build/perf/ui/stdio/hist.o
>   CC       /tmp/build/perf/util/libstring.o
>   CC       /tmp/build/perf/util/bitmap.o
>   CC       /tmp/build/perf/util/hweight.o
>   CC       /tmp/build/perf/util/quote.o
>   CC       /tmp/build/perf/util/strbuf.o
>   CC       /tmp/build/perf/util/string.o
>   CC       /tmp/build/perf/util/strlist.o
>   CC       /tmp/build/perf/util/strfilter.o
>   CC       /tmp/build/perf/util/top.o
>   MKDIR    /tmp/build/perf/scripts/
>   LD       /tmp/build/perf/scripts/libperf-in.o
>   CC       /tmp/build/perf/builtin-buildid-list.o
>   CC       /tmp/build/perf/util/usage.o
>   CC       /tmp/build/perf/builtin-buildid-cache.o
>   CC       /tmp/build/perf/util/dso.o
>   CC       /tmp/build/perf/builtin-list.o
>   CC       /tmp/build/perf/builtin-record.o
>   CC       /tmp/build/perf/builtin-report.o
>   LD       /tmp/build/perf/ui/libperf-in.o
>   CC       /tmp/build/perf/builtin-stat.o
>   CC       /tmp/build/perf/util/symbol.o
>   CC       /tmp/build/perf/builtin-timechart.o
>   CC       /tmp/build/perf/builtin-top.o
>   CC       /tmp/build/perf/util/symbol_fprintf.o
>   CC       /tmp/build/perf/util/color.o
>   CC       /tmp/build/perf/builtin-script.o
>   CC       /tmp/build/perf/util/header.o
>   CC       /tmp/build/perf/builtin-kmem.o
>   CC       /tmp/build/perf/builtin-lock.o
>   CC       /tmp/build/perf/builtin-kvm.o
>   CC       /tmp/build/perf/builtin-inject.o
>   CC       /tmp/build/perf/builtin-mem.o
>   CC       /tmp/build/perf/util/callchain.o
>   CC       /tmp/build/perf/builtin-data.o
>   CC       /tmp/build/perf/builtin-version.o
>   MKDIR    /tmp/build/perf/bench/
>   CC       /tmp/build/perf/bench/sched-messaging.o
>   MKDIR    /tmp/build/perf/tests/
>   CC       /tmp/build/perf/tests/builtin-test.o
>   CC       /tmp/build/perf/util/values.o
>   MKDIR    /tmp/build/perf/bench/
>   CC       /tmp/build/perf/bench/sched-pipe.o
>   MKDIR    /tmp/build/perf/tests/
>   CC       /tmp/build/perf/tests/parse-events.o
>   CC       /tmp/build/perf/util/debug.o
>   CC       /tmp/build/perf/bench/mem-functions.o
>   CC       /tmp/build/perf/util/machine.o
>   CC       /tmp/build/perf/bench/futex-hash.o
>   CC       /tmp/build/perf/bench/futex-wake.o
>   CC       /tmp/build/perf/bench/futex-wake-parallel.o
>   CC       /tmp/build/perf/bench/futex-requeue.o
>   CC       /tmp/build/perf/bench/futex-lock-pi.o
>   CC       /tmp/build/perf/util/map.o
>   LD       /tmp/build/perf/bench/perf-in.o
>   CC       /tmp/build/perf/perf.o
>   CC       /tmp/build/perf/util/pstack.o
>   CC       /tmp/build/perf/util/session.o
>   CC       /tmp/build/perf/util/ordered-events.o
>   CC       /tmp/build/perf/util/comm.o
>   CC       /tmp/build/perf/util/thread.o
>   CC       /tmp/build/perf/util/thread_map.o
>   CC       /tmp/build/perf/util/trace-event-parse.o
>   CC       /tmp/build/perf/tests/dso-data.o
>   CC       /tmp/build/perf/util/parse-events-bison.o
>   BISON    /tmp/build/perf/util/pmu-bison.c
>   CC       /tmp/build/perf/util/trace-event-read.o
>   CC       /tmp/build/perf/tests/attr.o
>   CC       /tmp/build/perf/tests/vmlinux-kallsyms.o
>   CC       /tmp/build/perf/util/trace-event-info.o
>   CC       /tmp/build/perf/util/trace-event-scripting.o
>   CC       /tmp/build/perf/tests/openat-syscall.o
>   CC       /tmp/build/perf/util/trace-event.o
>   CC       /tmp/build/perf/tests/openat-syscall-all-cpus.o
>   CC       /tmp/build/perf/util/svghelper.o
>   CC       /tmp/build/perf/util/sort.o
>   CC       /tmp/build/perf/util/hist.o
>   CC       /tmp/build/perf/tests/openat-syscall-tp-fields.o
>   CC       /tmp/build/perf/tests/mmap-basic.o
>   CC       /tmp/build/perf/tests/perf-record.o
>   CC       /tmp/build/perf/util/util.o
>   CC       /tmp/build/perf/tests/evsel-roundtrip-name.o
>   CC       /tmp/build/perf/tests/evsel-tp-sched.o
>   CC       /tmp/build/perf/tests/fdarray.o
>   CC       /tmp/build/perf/tests/pmu.o
>   CC       /tmp/build/perf/tests/hists_common.o
>   CC       /tmp/build/perf/tests/hists_link.o
>   CC       /tmp/build/perf/tests/hists_filter.o
>   CC       /tmp/build/perf/util/xyarray.o
>   CC       /tmp/build/perf/util/cpumap.o
>   CC       /tmp/build/perf/tests/hists_output.o
>   CC       /tmp/build/perf/util/cgroup.o
>   CC       /tmp/build/perf/tests/hists_cumulate.o
>   CC       /tmp/build/perf/util/target.o
>   CC       /tmp/build/perf/util/rblist.o
>   CC       /tmp/build/perf/util/intlist.o
>   CC       /tmp/build/perf/util/vdso.o
>   CC       /tmp/build/perf/tests/python-use.o
>   CC       /tmp/build/perf/tests/bp_signal.o
>   CC       /tmp/build/perf/tests/bp_signal_overflow.o
>   CC       /tmp/build/perf/util/counts.o
>   CC       /tmp/build/perf/tests/task-exit.o
>   CC       /tmp/build/perf/tests/sw-clock.o
>   CC       /tmp/build/perf/tests/mmap-thread-lookup.o
>   CC       /tmp/build/perf/util/stat.o
>   CC       /tmp/build/perf/tests/thread-mg-share.o
>   CC       /tmp/build/perf/tests/switch-tracking.o
>   CC       /tmp/build/perf/tests/keep-tracking.o
>   CC       /tmp/build/perf/tests/code-reading.o
>   CC       /tmp/build/perf/tests/sample-parsing.o
>   CC       /tmp/build/perf/util/stat-shadow.o
>   CC       /tmp/build/perf/tests/parse-no-sample-id-all.o
>   CC       /tmp/build/perf/tests/kmod-path.o
>   CC       /tmp/build/perf/tests/thread-map.o
>   CC       /tmp/build/perf/tests/llvm.o
>   CC       /tmp/build/perf/util/record.o
>   CC       /tmp/build/perf/tests/bpf.o
>   CC       /tmp/build/perf/util/srcline.o
>   CC       /tmp/build/perf/tests/topology.o
>   CC       /tmp/build/perf/tests/cpumap.o
>   CC       /tmp/build/perf/util/data.o
>   CC       /tmp/build/perf/util/tsc.o
>   CC       /tmp/build/perf/tests/stat.o
>   CC       /tmp/build/perf/tests/event_update.o
>   CC       /tmp/build/perf/util/cloexec.o
>   CC       /tmp/build/perf/util/call-path.o
>   CC       /tmp/build/perf/tests/event-times.o
>   CC       /tmp/build/perf/util/thread-stack.o
>   CC       /tmp/build/perf/util/parse-branch-options.o
>   CC       /tmp/build/perf/tests/backward-ring-buffer.o
>   CC       /tmp/build/perf/util/parse-regs-options.o
>   CC       /tmp/build/perf/tests/sdt.o
>   CC       /tmp/build/perf/util/term.o
>   CC       /tmp/build/perf/tests/is_printable_array.o
>   CC       /tmp/build/perf/tests/bitmap.o
>   CC       /tmp/build/perf/util/help-unknown-cmd.o
>   CC       /tmp/build/perf/tests/llvm-src-base.o
>   CC       /tmp/build/perf/tests/llvm-src-kbuild.o
>   CC       /tmp/build/perf/util/mem-events.o
>   CC       /tmp/build/perf/tests/llvm-src-prologue.o
>   CC       /tmp/build/perf/tests/llvm-src-relocation.o
>   CC       /tmp/build/perf/util/vsprintf.o
>   CC       /tmp/build/perf/util/symbol-minimal.o
>   LD       /tmp/build/perf/tests/perf-in.o
>   MKDIR    /tmp/build/perf/util/scripting-engines/
>   LD       /tmp/build/perf/util/scripting-engines/libperf-in.o
>   CC       /tmp/build/perf/util/demangle-java.o
>   LD       /tmp/build/perf/perf-in.o
>   CC       /tmp/build/perf/util/demangle-rust.o
>   FLEX     /tmp/build/perf/util/parse-events-flex.c
>   FLEX     /tmp/build/perf/util/pmu-flex.c
>   CC       /tmp/build/perf/util/pmu-bison.o
>   CC       /tmp/build/perf/util/parse-events.o
>   CC       /tmp/build/perf/util/parse-events-flex.o
>   CC       /tmp/build/perf/util/pmu.o
>   CC       /tmp/build/perf/util/pmu-flex.o
>   LD       /tmp/build/perf/util/libperf-in.o
>   LD       /tmp/build/perf/libperf-in.o
>   AR       /tmp/build/perf/libperf.a
>   LINK     /tmp/build/perf/perf
> make: Leaving directory '/git/linux/tools/perf'
> fedora:24-x-ARC-uClibc: Ok
> 
> 
