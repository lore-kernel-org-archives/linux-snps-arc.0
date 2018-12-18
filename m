From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:22 -0800
Subject: [PATCH 00/21] glibc port to ARC processors
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

This is reposting of glibc port to ARC processors from synopsys.

The original posting was a while back [1]. The issues at the time were
  (1). Need for working upstream gcc/binutils (vs. the github forks)
  (2). Too many testsuite failures.

All the ducks seem to be in a row now, with last remaining gcc patch backported to
gcc-8-branch last week [2] and testsuite failures tended to/reduced significantly.

(a) build-many-glibcs.py check results are clean

| Summary of test results:
|   1173 PASS
|      15 XFAIL
|
| PASS: glibcs-arc-linux-gnu check

(b) Full testsuite ran in a cross compile setup using buildroot on HSDK development
    platform.

Summary of test results:
     24 FAIL
   5124 PASS
     27 UNSUPPORTED
     19 XFAIL

| FAIL: localedata/sort-test		# Needs more RAM:
| FAIL: stdio-common/bug22		# Needs more RAM: 2 GB memory
| FAIL: sunrpc/bug20790			# missing cpp on target
| FAIL: nptl/test-mutexattr-printers	# need Python3 and target GDB on target
| FAIL: nptl/test-mutex-printers	# need Python3 and target GDB on target
| FAIL: nptl/test-condattr-printers	# need Python3 and target GDB on target
| FAIL: nptl/test-cond-printers		# need Python3 and target GDB on target
| FAIL: nptl/test-rwlockattr-printers	# need Python3 and target GDB on target
| FAIL: nptl/test-rwlock-printers	# need Python3 and target GDB on target

| FAIL: iconv/test-iconvconfig		# Needs gconv installed
| FAIL: posix/bug-ga2			# DNS issue: google DNS vs. SNPS
| FAIL: posix/tst-getaddrinfo5		# DNS server not configured
| FAIL: posix/globtest			# require same user on target and host

| FAIL: elf/check-localplt		# passes for build-many-glibcs.py
					# buildroot builds with slightly different toggles (-Os)
					# such that gcc generates an extra memcpy PLT call
| FAIL: gmon/tst-gmon-pie-gprof
| FAIL: gmon/tst-sprofil
| FAIL: posix/tst-spawn
| FAIL: posix/tst-spawn-static
| FAIL: nptl/tst-cond16
| FAIL: nptl/tst-cond17
| FAIL: nptl/tst-umask1
| FAIL: nptl/tst-setuid2
| FAIL: nss/bug-erange
| FAIL: nss/tst-nss-test3

The full log for above can be found at [3]

Bulk of failures are due to cross test setup and/or RAM accessible on target.
We are analysing the other failures and will tend to them as we go along.

(c) Code was rebased off of master yesterday. Please review and comment.

(d) We currently only support soft float ABI, although I'm working on hard float
    and hopefully will have it ready sometime during the review of this series

Thx,
-Vineet


[1] https://sourceware.org/ml/libc-alpha/2017-06/msg01355.html
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88001
[3] https://github.com/foss-for-synopsys-dwc-arc-processors/glibc/issues/1

Cupertino Miranda (2):
  ARC: testsuite fix: GD TLS issue
  ARC: fix several unwining and cancelation tests

Vineet Gupta (19):
  longlong.h: sync from gcc to fix ARC inline asm constraints
  ARC: add definitions to elf/elf.h
  ARC: ABI Implementation
  ARC: startup and dynamic linking code
  ARC: Thread Local Storage support
  ARC: Atomics and Locking primitives
  ARC: math soft float support
  ARC: Linux Syscall Interface
  ARC: Linux ABI
  ARC: Linux Startup and Dynamic Loading
  ARC: ABI lists
  ARC: Update syscall-names.list for ARC specific syscalls
  ARC: Build Infrastructure
  ARC: Enable __start as entry point vs. canonical _start
  ARC: testsuite fix: elf/check-initfini
  ARC: testsuite fix: sysvipc/*
  ARC: testsuite fix: stdlib/tst-makecontext
  build-many-glibcs.py: Enable ARC builds
  NEWS: mention ARC port

 ChangeLog                                          |  127 ++
 NEWS                                               |    2 +
 elf/elf.h                                          |   70 +-
 scripts/build-many-glibcs.py                       |    4 +
 stdlib/longlong.h                                  |   65 +-
 sysdeps/arc/Implies                                |    3 +
 sysdeps/arc/Makefile                               |   25 +
 sysdeps/arc/Versions                               |   14 +
 sysdeps/arc/__longjmp.S                            |   50 +
 sysdeps/arc/abort-instr.h                          |    2 +
 sysdeps/arc/atomic-machine.h                       |   89 +
 sysdeps/arc/bits/endian.h                          |   12 +
 sysdeps/arc/bits/fenv.h                            |   92 +
 sysdeps/arc/bits/link.h                            |   52 +
 sysdeps/arc/bits/setjmp.h                          |   33 +
 sysdeps/arc/bsd-_setjmp.S                          |    1 +
 sysdeps/arc/bsd-setjmp.S                           |    1 +
 sysdeps/arc/configure                              |   17 +
 sysdeps/arc/configure.ac                           |   13 +
 sysdeps/arc/crti.S                                 |   79 +
 sysdeps/arc/crtn.S                                 |   56 +
 sysdeps/arc/dl-machine.h                           |  339 ++++
 sysdeps/arc/dl-runtime.c                           |   21 +
 sysdeps/arc/dl-sysdep.h                            |   25 +
 sysdeps/arc/dl-tls.h                               |   30 +
 sysdeps/arc/dl-trampoline.S                        |   81 +
 sysdeps/arc/entry.h                                |    5 +
 sysdeps/arc/gccframe.h                             |   21 +
 sysdeps/arc/gmp-mparam.h                           |   23 +
 sysdeps/arc/jmpbuf-offsets.h                       |   46 +
 sysdeps/arc/jmpbuf-unwind.h                        |   47 +
 sysdeps/arc/ldsodefs.h                             |   43 +
 sysdeps/arc/libc-tls.c                             |   27 +
 sysdeps/arc/machine-gmon.h                         |   33 +
 sysdeps/arc/math_private.h                         |    6 +
 sysdeps/arc/memusage.h                             |   23 +
 sysdeps/arc/nofpu/Implies                          |    1 +
 sysdeps/arc/nofpu/libm-test-ulps                   |  390 ++++
 sysdeps/arc/nofpu/libm-test-ulps-name              |    1 +
 sysdeps/arc/nofpu/math-tests-exception.h           |   27 +
 sysdeps/arc/nofpu/math-tests-rounding.h            |   27 +
 sysdeps/arc/nptl/Makefile                          |   22 +
 sysdeps/arc/nptl/bits/pthreadtypes-arch.h          |   72 +
 sysdeps/arc/nptl/bits/semaphore.h                  |   32 +
 sysdeps/arc/nptl/pthread-offsets.h                 |    5 +
 sysdeps/arc/nptl/pthreaddef.h                      |   32 +
 sysdeps/arc/nptl/tcb-offsets.sym                   |   11 +
 sysdeps/arc/nptl/tls.h                             |  150 ++
 sysdeps/arc/preconfigure                           |   14 +
 sysdeps/arc/setjmp.S                               |   64 +
 sysdeps/arc/sfp-machine.h                          |   51 +
 sysdeps/arc/sotruss-lib.c                          |   51 +
 sysdeps/arc/stackinfo.h                            |   33 +
 sysdeps/arc/start.S                                |   89 +
 sysdeps/arc/sysdep.h                               |   51 +
 sysdeps/arc/tls-macros.h                           |   29 +
 sysdeps/arc/tst-audit.h                            |   23 +
 sysdeps/unix/sysv/linux/arc/Implies                |    3 +
 sysdeps/unix/sysv/linux/arc/Makefile               |   20 +
 sysdeps/unix/sysv/linux/arc/Versions               |   16 +
 sysdeps/unix/sysv/linux/arc/bits/procfs-id.h       |   25 +
 sysdeps/unix/sysv/linux/arc/bits/procfs.h          |   35 +
 sysdeps/unix/sysv/linux/arc/bits/sigaction.h       |   85 +
 sysdeps/unix/sysv/linux/arc/c++-types.data         |   67 +
 sysdeps/unix/sysv/linux/arc/cacheflush.c           |   29 +
 sysdeps/unix/sysv/linux/arc/clone.S                |  100 +
 sysdeps/unix/sysv/linux/arc/configure              |    4 +
 sysdeps/unix/sysv/linux/arc/configure.ac           |    4 +
 sysdeps/unix/sysv/linux/arc/dl-static.c            |   84 +
 sysdeps/unix/sysv/linux/arc/getcontext.S           |   65 +
 sysdeps/unix/sysv/linux/arc/ipc_priv.h             |   21 +
 sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h       |    6 +
 sysdeps/unix/sysv/linux/arc/kernel-features.h      |   28 +
 sysdeps/unix/sysv/linux/arc/ld.abilist             |    9 +
 sysdeps/unix/sysv/linux/arc/ldconfig.h             |   25 +
 sysdeps/unix/sysv/linux/arc/ldsodefs.h             |   32 +
 .../unix/sysv/linux/arc/libBrokenLocale.abilist    |    1 +
 sysdeps/unix/sysv/linux/arc/libanl.abilist         |    4 +
 sysdeps/unix/sysv/linux/arc/libc.abilist           | 2089 ++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/libcrypt.abilist       |    2 +
 sysdeps/unix/sysv/linux/arc/libdl.abilist          |    9 +
 sysdeps/unix/sysv/linux/arc/libm.abilist           |  753 +++++++
 sysdeps/unix/sysv/linux/arc/libnsl.abilist         |  120 ++
 sysdeps/unix/sysv/linux/arc/libpthread.abilist     |  235 +++
 sysdeps/unix/sysv/linux/arc/libresolv.abilist      |   79 +
 sysdeps/unix/sysv/linux/arc/librt.abilist          |   35 +
 sysdeps/unix/sysv/linux/arc/libthread_db.abilist   |   40 +
 sysdeps/unix/sysv/linux/arc/libutil.abilist        |    6 +
 sysdeps/unix/sysv/linux/arc/localplt.data          |   15 +
 sysdeps/unix/sysv/linux/arc/makecontext.c          |   75 +
 sysdeps/unix/sysv/linux/arc/mmap_internal.h        |   26 +
 sysdeps/unix/sysv/linux/arc/profil-counter.h       |    2 +
 sysdeps/unix/sysv/linux/arc/pt-vfork.S             |    1 +
 sysdeps/unix/sysv/linux/arc/setcontext.S           |   95 +
 sysdeps/unix/sysv/linux/arc/shlib-versions         |    2 +
 sysdeps/unix/sysv/linux/arc/sigaction.c            |   63 +
 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h       |   23 +
 sysdeps/unix/sysv/linux/arc/sigrestorer.S          |   28 +
 sysdeps/unix/sysv/linux/arc/swapcontext.S          |   92 +
 sysdeps/unix/sysv/linux/arc/sys/cachectl.h         |   36 +
 sysdeps/unix/sysv/linux/arc/sys/ucontext.h         |   71 +
 sysdeps/unix/sysv/linux/arc/sys/user.h             |   32 +
 sysdeps/unix/sysv/linux/arc/syscall.S              |   38 +
 sysdeps/unix/sysv/linux/arc/sysdep.c               |   33 +
 sysdeps/unix/sysv/linux/arc/sysdep.h               |  259 +++
 sysdeps/unix/sysv/linux/arc/ucontext-macros.h      |   29 +
 sysdeps/unix/sysv/linux/arc/ucontext_i.sym         |   20 +
 sysdeps/unix/sysv/linux/arc/vfork.S                |   42 +
 sysdeps/unix/sysv/linux/syscall-names.list         |    3 +
 109 files changed, 7709 insertions(+), 59 deletions(-)
 create mode 100644 sysdeps/arc/Implies
 create mode 100644 sysdeps/arc/Makefile
 create mode 100644 sysdeps/arc/Versions
 create mode 100644 sysdeps/arc/__longjmp.S
 create mode 100644 sysdeps/arc/abort-instr.h
 create mode 100644 sysdeps/arc/atomic-machine.h
 create mode 100644 sysdeps/arc/bits/endian.h
 create mode 100644 sysdeps/arc/bits/fenv.h
 create mode 100644 sysdeps/arc/bits/link.h
 create mode 100644 sysdeps/arc/bits/setjmp.h
 create mode 100644 sysdeps/arc/bsd-_setjmp.S
 create mode 100644 sysdeps/arc/bsd-setjmp.S
 create mode 100644 sysdeps/arc/configure
 create mode 100644 sysdeps/arc/configure.ac
 create mode 100644 sysdeps/arc/crti.S
 create mode 100644 sysdeps/arc/crtn.S
 create mode 100644 sysdeps/arc/dl-machine.h
 create mode 100644 sysdeps/arc/dl-runtime.c
 create mode 100644 sysdeps/arc/dl-sysdep.h
 create mode 100644 sysdeps/arc/dl-tls.h
 create mode 100644 sysdeps/arc/dl-trampoline.S
 create mode 100644 sysdeps/arc/entry.h
 create mode 100644 sysdeps/arc/gccframe.h
 create mode 100644 sysdeps/arc/gmp-mparam.h
 create mode 100644 sysdeps/arc/jmpbuf-offsets.h
 create mode 100644 sysdeps/arc/jmpbuf-unwind.h
 create mode 100644 sysdeps/arc/ldsodefs.h
 create mode 100644 sysdeps/arc/libc-tls.c
 create mode 100644 sysdeps/arc/machine-gmon.h
 create mode 100644 sysdeps/arc/math_private.h
 create mode 100644 sysdeps/arc/memusage.h
 create mode 100644 sysdeps/arc/nofpu/Implies
 create mode 100644 sysdeps/arc/nofpu/libm-test-ulps
 create mode 100644 sysdeps/arc/nofpu/libm-test-ulps-name
 create mode 100644 sysdeps/arc/nofpu/math-tests-exception.h
 create mode 100644 sysdeps/arc/nofpu/math-tests-rounding.h
 create mode 100644 sysdeps/arc/nptl/Makefile
 create mode 100644 sysdeps/arc/nptl/bits/pthreadtypes-arch.h
 create mode 100644 sysdeps/arc/nptl/bits/semaphore.h
 create mode 100644 sysdeps/arc/nptl/pthread-offsets.h
 create mode 100644 sysdeps/arc/nptl/pthreaddef.h
 create mode 100644 sysdeps/arc/nptl/tcb-offsets.sym
 create mode 100644 sysdeps/arc/nptl/tls.h
 create mode 100644 sysdeps/arc/preconfigure
 create mode 100644 sysdeps/arc/setjmp.S
 create mode 100644 sysdeps/arc/sfp-machine.h
 create mode 100644 sysdeps/arc/sotruss-lib.c
 create mode 100644 sysdeps/arc/stackinfo.h
 create mode 100644 sysdeps/arc/start.S
 create mode 100644 sysdeps/arc/sysdep.h
 create mode 100644 sysdeps/arc/tls-macros.h
 create mode 100644 sysdeps/arc/tst-audit.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/Implies
 create mode 100644 sysdeps/unix/sysv/linux/arc/Makefile
 create mode 100644 sysdeps/unix/sysv/linux/arc/Versions
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/procfs-id.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/procfs.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/sigaction.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/c++-types.data
 create mode 100644 sysdeps/unix/sysv/linux/arc/cacheflush.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/clone.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure.ac
 create mode 100644 sysdeps/unix/sysv/linux/arc/dl-static.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/getcontext.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/ipc_priv.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/kernel-features.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ld.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/ldconfig.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ldsodefs.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libanl.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libc.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libcrypt.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libdl.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libm.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libnsl.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libpthread.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libresolv.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/librt.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libthread_db.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libutil.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/localplt.data
 create mode 100644 sysdeps/unix/sysv/linux/arc/makecontext.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/mmap_internal.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/profil-counter.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/pt-vfork.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/setcontext.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/shlib-versions
 create mode 100644 sysdeps/unix/sysv/linux/arc/sigaction.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sigrestorer.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/swapcontext.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/cachectl.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/ucontext.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/user.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/syscall.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext-macros.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext_i.sym
 create mode 100644 sysdeps/unix/sysv/linux/arc/vfork.S

-- 
2.7.4
