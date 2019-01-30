From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 29 Jan 2019 17:25:40 -0800
Subject: [PATCH v2 00/15] glibc port to ARC processors
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

v2 of glibc port to ARC processors from Synopsys.

Thx for reviewing the v1 [1], I've hopefully addressed all the comments.
Any unlikely omissions are unintended.

Also apologies for the bad timing given the imminent release, but that ship
has likely already sailed, so we might as well continue our march independently.

The main changes since v1 are

  * sigaction updates
    - drop sigaction.h, use generic version
    - sigaction.c to use generic linux/sigaction.c
    - arch specific __sigset_t.h to enable __sigset_t [2] vs. [128]

  * atomics: Enable USE_ATOMIC_COMPILER_BUILTINS
  * switch to init_array, removed crt{i,n}
  * Build: remove libc_cv_fpie=no
  * __startcontext: use cfi_undefined to terminate unwinder

  * dropped ldconfig.h, libnsl.abilist, cacheflush.c (use syscalls.list),
    procfs-id.h, math_private.h

  * cosmetics
    - Trying to follow the coding style and conventions
    - Folded the testsuite fixes patches into main port patches
    - Update copyright headers to 2019

Customary test results: Built against
   binutils-2_32-branch
   gcc-8-stable (commit 0d5ba57508c5 as of today with prerequisite backport)

(a) build-many-glibcs.py

| Summary of test results:
|   1173 PASS		# same as v1
|     15 XFAIL		# same as v1
|
| PASS: glibcs-arc-linux-gnu check

(b) Full testsuite ran in a cross compile setup using buildroot on HSDK development
    platform. Full log at [2].

| Summary of test results:
|     22 FAIL		#  2 fewer than v1
|   5151 PASS		# 27 more than v1
|     23 UNSUPPORTED	#  4 fewer
|     19 XFAIL		# no change
|
| FAIL: localedata/sort-test
| FAIL: stdio-common/bug22
| FAIL: sunrpc/bug20790
| FAIL: nptl/test-mutexattr-printers
| FAIL: nptl/test-mutex-printers
| FAIL: nptl/test-condattr-printers
| FAIL: nptl/test-cond-printers
| FAIL: nptl/test-rwlockattr-printers
| FAIL: nptl/test-rwlock-printers
| FAIL: iconv/test-iconvconfig
| FAIL: posix/bug-ga2
| FAIL: posix/tst-getaddrinfo5
| FAIL: posix/globtest
| FAIL: gmon/tst-sprofil
| FAIL: io/ftwtest
| FAIL: nptl/tst-cond17
| FAIL: nptl/tst-cond25
| FAIL: nptl/tst-umask1
| FAIL: nss/bug-erange
| FAIL: nss/tst-nss-files-hosts-getent
| FAIL: nss/tst-nss-files-hosts-multi
| FAIL: nss/tst-nss-test3

Kindly review.

Thx,
-Vineet

[1] https://sourceware.org/ml/libc-alpha/2018-12/msg00678.html
[2] https://github.com/foss-for-synopsys-dwc-arc-processors/glibc/files/2810200/glibc-testsuite-results-commit-2f9a78f208a7.log.gz

Vineet Gupta (15):
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
  build-many-glibcs.py: Enable ARC builds
  NEWS: mention ARC port
  make-syscalls.sh: fix comment referencing syscall-template

 ChangeLog                                          |  106 +
 NEWS                                               |    7 +
 elf/elf.h                                          |   70 +-
 scripts/build-many-glibcs.py                       |    4 +
 sysdeps/arc/Implies                                |    4 +
 sysdeps/arc/Makefile                               |   25 +
 sysdeps/arc/Versions                               |    6 +
 sysdeps/arc/__longjmp.S                            |   50 +
 sysdeps/arc/abort-instr.h                          |    2 +
 sysdeps/arc/atomic-machine.h                       |   73 +
 sysdeps/arc/bits/endian.h                          |   12 +
 sysdeps/arc/bits/fenv.h                            |   72 +
 sysdeps/arc/bits/link.h                            |   52 +
 sysdeps/arc/bits/setjmp.h                          |   26 +
 sysdeps/arc/bsd-_setjmp.S                          |    1 +
 sysdeps/arc/bsd-setjmp.S                           |    1 +
 sysdeps/arc/configure                              |   14 +
 sysdeps/arc/configure.ac                           |   11 +
 sysdeps/arc/dl-machine.h                           |  340 ++++
 sysdeps/arc/dl-runtime.c                           |   39 +
 sysdeps/arc/dl-sysdep.h                            |   25 +
 sysdeps/arc/dl-tls.h                               |   30 +
 sysdeps/arc/dl-trampoline.S                        |   80 +
 sysdeps/arc/entry.h                                |    5 +
 sysdeps/arc/gccframe.h                             |   21 +
 sysdeps/arc/gmp-mparam.h                           |   23 +
 sysdeps/arc/jmpbuf-offsets.h                       |   47 +
 sysdeps/arc/jmpbuf-unwind.h                        |   47 +
 sysdeps/arc/ldsodefs.h                             |   43 +
 sysdeps/arc/libc-tls.c                             |   27 +
 sysdeps/arc/machine-gmon.h                         |   35 +
 sysdeps/arc/memusage.h                             |   23 +
 sysdeps/arc/nofpu/Implies                          |    1 +
 sysdeps/arc/nofpu/libm-test-ulps                   |  390 ++++
 sysdeps/arc/nofpu/libm-test-ulps-name              |    1 +
 sysdeps/arc/nofpu/math-tests-exceptions.h          |   27 +
 sysdeps/arc/nofpu/math-tests-rounding.h            |   27 +
 sysdeps/arc/nptl/Makefile                          |   22 +
 sysdeps/arc/nptl/bits/pthreadtypes-arch.h          |   72 +
 sysdeps/arc/nptl/bits/semaphore.h                  |   32 +
 sysdeps/arc/nptl/pthread-offsets.h                 |    5 +
 sysdeps/arc/nptl/pthreaddef.h                      |   32 +
 sysdeps/arc/nptl/tcb-offsets.sym                   |   11 +
 sysdeps/arc/nptl/tls.h                             |  150 ++
 sysdeps/arc/preconfigure                           |   14 +
 sysdeps/arc/setjmp.S                               |   66 +
 sysdeps/arc/sfp-machine.h                          |   73 +
 sysdeps/arc/sotruss-lib.c                          |   51 +
 sysdeps/arc/stackinfo.h                            |   33 +
 sysdeps/arc/start.S                                |   89 +
 sysdeps/arc/sysdep.h                               |   48 +
 sysdeps/arc/tls-macros.h                           |   47 +
 sysdeps/arc/tst-audit.h                            |   23 +
 sysdeps/unix/make-syscalls.sh                      |    2 +-
 sysdeps/unix/sysv/linux/arc/Implies                |    3 +
 sysdeps/unix/sysv/linux/arc/Makefile               |   20 +
 sysdeps/unix/sysv/linux/arc/Versions               |   16 +
 sysdeps/unix/sysv/linux/arc/bits/procfs.h          |   35 +
 .../unix/sysv/linux/arc/bits/types/__sigset_t.h    |   12 +
 sysdeps/unix/sysv/linux/arc/c++-types.data         |   67 +
 sysdeps/unix/sysv/linux/arc/clone.S                |   98 +
 sysdeps/unix/sysv/linux/arc/configure              |    4 +
 sysdeps/unix/sysv/linux/arc/configure.ac           |    4 +
 sysdeps/unix/sysv/linux/arc/dl-static.c            |   84 +
 sysdeps/unix/sysv/linux/arc/getcontext.S           |   63 +
 sysdeps/unix/sysv/linux/arc/ipc_priv.h             |   21 +
 sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h       |    6 +
 sysdeps/unix/sysv/linux/arc/kernel-features.h      |   28 +
 sysdeps/unix/sysv/linux/arc/ld.abilist             |    9 +
 sysdeps/unix/sysv/linux/arc/ldsodefs.h             |   32 +
 .../unix/sysv/linux/arc/libBrokenLocale.abilist    |    1 +
 sysdeps/unix/sysv/linux/arc/libanl.abilist         |    4 +
 sysdeps/unix/sysv/linux/arc/libc.abilist           | 2089 ++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/libcrypt.abilist       |    2 +
 sysdeps/unix/sysv/linux/arc/libdl.abilist          |    9 +
 sysdeps/unix/sysv/linux/arc/libm.abilist           |  753 +++++++
 sysdeps/unix/sysv/linux/arc/libpthread.abilist     |  235 +++
 sysdeps/unix/sysv/linux/arc/libresolv.abilist      |   79 +
 sysdeps/unix/sysv/linux/arc/librt.abilist          |   35 +
 sysdeps/unix/sysv/linux/arc/libthread_db.abilist   |   40 +
 sysdeps/unix/sysv/linux/arc/libutil.abilist        |    6 +
 sysdeps/unix/sysv/linux/arc/localplt.data          |   16 +
 sysdeps/unix/sysv/linux/arc/makecontext.c          |   75 +
 sysdeps/unix/sysv/linux/arc/mmap_internal.h        |   27 +
 sysdeps/unix/sysv/linux/arc/profil-counter.h       |    2 +
 sysdeps/unix/sysv/linux/arc/pt-vfork.S             |    1 +
 sysdeps/unix/sysv/linux/arc/setcontext.S           |   92 +
 sysdeps/unix/sysv/linux/arc/shlib-versions         |    2 +
 sysdeps/unix/sysv/linux/arc/sigaction.c            |   31 +
 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h       |   23 +
 sysdeps/unix/sysv/linux/arc/sigrestorer.S          |   29 +
 sysdeps/unix/sysv/linux/arc/swapcontext.S          |   92 +
 sysdeps/unix/sysv/linux/arc/sys/cachectl.h         |   36 +
 sysdeps/unix/sysv/linux/arc/sys/ucontext.h         |   63 +
 sysdeps/unix/sysv/linux/arc/sys/user.h             |   31 +
 sysdeps/unix/sysv/linux/arc/syscall.S              |   38 +
 sysdeps/unix/sysv/linux/arc/syscalls.list          |    3 +
 sysdeps/unix/sysv/linux/arc/sysdep.c               |   33 +
 sysdeps/unix/sysv/linux/arc/sysdep.h               |  251 +++
 sysdeps/unix/sysv/linux/arc/ucontext-macros.h      |   29 +
 sysdeps/unix/sysv/linux/arc/ucontext_i.sym         |   20 +
 sysdeps/unix/sysv/linux/arc/vfork.S                |   42 +
 sysdeps/unix/sysv/linux/syscall-names.list         |    3 +
 103 files changed, 7229 insertions(+), 2 deletions(-)
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
 create mode 100644 sysdeps/arc/memusage.h
 create mode 100644 sysdeps/arc/nofpu/Implies
 create mode 100644 sysdeps/arc/nofpu/libm-test-ulps
 create mode 100644 sysdeps/arc/nofpu/libm-test-ulps-name
 create mode 100644 sysdeps/arc/nofpu/math-tests-exceptions.h
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
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/procfs.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/types/__sigset_t.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/c++-types.data
 create mode 100644 sysdeps/unix/sysv/linux/arc/clone.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure.ac
 create mode 100644 sysdeps/unix/sysv/linux/arc/dl-static.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/getcontext.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/ipc_priv.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/kernel-features.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ld.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/ldsodefs.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/libBrokenLocale.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libanl.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libc.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libcrypt.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libdl.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/libm.abilist
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
 create mode 100644 sysdeps/unix/sysv/linux/arc/syscalls.list
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext-macros.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext_i.sym
 create mode 100644 sysdeps/unix/sysv/linux/arc/vfork.S

-- 
2.7.4
