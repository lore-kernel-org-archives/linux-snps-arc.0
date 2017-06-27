From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Jun 2017 11:00:48 +0300
Subject: [RFC 0/6] glibc port to ARC architecture
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

This is a Request for comments for glibc port to ARC architecture.
http://www.synopsys.com/IP/ProcessorIP/ARCProcessors/Pages/default.aspx

The Linux kernel, uClibc, buildroot have been upstream for quite some time.

The code has been rebased off of upstream/master as of yesterday and
contains adjustments for recent changes such as mmap wrapper consolidation
etc.

All comments welcome !

Thx,
-Vineet

Cupertino Miranda (2):
  ARC: Fixed inline asm contraints to gcc 6.x
  ARC: Fix several testsuite failures related to unwinding

Vineet Gupta (4):
  upstream: comment update
  ARC: add definitions to elf/elf.h
  ARC: Initial port to glibc
  ARC: Enable __start as entry point vs. canonical _start

 .gitignore                                         |    1 +
 elf/elf.h                                          |   69 +
 stdlib/longlong.h                                  |    8 +-
 sysdeps/arc/Implies                                |    3 +
 sysdeps/arc/Makefile                               |   26 +
 sysdeps/arc/Subdirs                                |    1 +
 sysdeps/arc/Versions                               |   13 +
 sysdeps/arc/__longjmp.S                            |   50 +
 sysdeps/arc/abort-instr.h                          |    2 +
 sysdeps/arc/atomic-machine.h                       |   85 +
 sysdeps/arc/backtrace.c                            |    1 +
 sysdeps/arc/bits/endian.h                          |   12 +
 sysdeps/arc/bits/fenv.h                            |   52 +
 sysdeps/arc/bits/link.h                            |   52 +
 sysdeps/arc/bits/setjmp.h                          |   33 +
 sysdeps/arc/bsd-_setjmp.S                          |    1 +
 sysdeps/arc/bsd-setjmp.S                           |    1 +
 sysdeps/arc/configure                              |   17 +
 sysdeps/arc/configure.ac                           |   13 +
 sysdeps/arc/crti.S                                 |   77 +
 sysdeps/arc/crtn.S                                 |   56 +
 sysdeps/arc/dl-machine.h                           |  338 ++++
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
 sysdeps/arc/libm-test-ulps                         |  394 ++++
 sysdeps/arc/libm-test-ulps-name                    |    1 +
 sysdeps/arc/machine-gmon.h                         |   30 +
 sysdeps/arc/math-tests.h                           |   28 +
 sysdeps/arc/math_private.h                         |   33 +
 sysdeps/arc/memusage.h                             |   23 +
 sysdeps/arc/nptl/Makefile                          |   22 +
 sysdeps/arc/nptl/bits/pthreadtypes-arch.h          |   70 +
 sysdeps/arc/nptl/bits/semaphore.h                  |   32 +
 sysdeps/arc/nptl/pthread_spin_lock.c               |   24 +
 sysdeps/arc/nptl/pthreaddef.h                      |   32 +
 sysdeps/arc/nptl/tcb-offsets.sym                   |   11 +
 sysdeps/arc/nptl/tls.h                             |  151 ++
 sysdeps/arc/preconfigure                           |    6 +
 sysdeps/arc/s_fma.c                                |    1 +
 sysdeps/arc/s_fmaf.c                               |    1 +
 sysdeps/arc/setjmp.S                               |   64 +
 sysdeps/arc/sfp-machine.h                          |   51 +
 sysdeps/arc/sotruss-lib.c                          |   51 +
 sysdeps/arc/stackinfo.h                            |   33 +
 sysdeps/arc/start.S                                |   89 +
 sysdeps/arc/sysdep.h                               |   51 +
 sysdeps/arc/tls-macros.h                           |   29 +
 sysdeps/arc/tst-audit.h                            |   23 +
 sysdeps/unix/make-syscalls.sh                      |    2 +-
 sysdeps/unix/sysv/linux/arc/Implies                |    3 +
 sysdeps/unix/sysv/linux/arc/Makefile               |    9 +
 sysdeps/unix/sysv/linux/arc/Versions               |    6 +
 sysdeps/unix/sysv/linux/arc/arch-fork.h            |   35 +
 sysdeps/unix/sysv/linux/arc/bits/mman.h            |   42 +
 sysdeps/unix/sysv/linux/arc/bits/sigaction.h       |   78 +
 sysdeps/unix/sysv/linux/arc/c++-types.data         |   67 +
 sysdeps/unix/sysv/linux/arc/cacheflush.c           |   29 +
 sysdeps/unix/sysv/linux/arc/clone.S                |   97 +
 sysdeps/unix/sysv/linux/arc/configure              |    4 +
 sysdeps/unix/sysv/linux/arc/configure.ac           |    4 +
 sysdeps/unix/sysv/linux/arc/kernel-features.h      |   31 +
 sysdeps/unix/sysv/linux/arc/ld.abilist             |   12 +
 sysdeps/unix/sysv/linux/arc/ldconfig.h             |   24 +
 .../unix/sysv/linux/arc/libBrokenLocale.abilist    |    3 +
 sysdeps/unix/sysv/linux/arc/libanl.abilist         |    6 +
 sysdeps/unix/sysv/linux/arc/libc.abilist           | 2123 ++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/libcrypt.abilist       |    9 +
 sysdeps/unix/sysv/linux/arc/libdl.abilist          |   11 +
 sysdeps/unix/sysv/linux/arc/libm.abilist           |  370 ++++
 sysdeps/unix/sysv/linux/arc/libnsl.abilist         |  123 ++
 sysdeps/unix/sysv/linux/arc/libpthread.abilist     |  224 +++
 sysdeps/unix/sysv/linux/arc/libresolv.abilist      |   93 +
 sysdeps/unix/sysv/linux/arc/librt.abilist          |   37 +
 sysdeps/unix/sysv/linux/arc/libthread_db.abilist   |   42 +
 sysdeps/unix/sysv/linux/arc/libutil.abilist        |    8 +
 sysdeps/unix/sysv/linux/arc/localplt.data          |   35 +
 sysdeps/unix/sysv/linux/arc/mmap_internal.h        |   26 +
 sysdeps/unix/sysv/linux/arc/profil-counter.h       |    2 +
 sysdeps/unix/sysv/linux/arc/pt-vfork.S             |    1 +
 sysdeps/unix/sysv/linux/arc/shlib-versions         |    2 +
 sysdeps/unix/sysv/linux/arc/sigaction.c            |   69 +
 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h       |   28 +
 sysdeps/unix/sysv/linux/arc/sys/cachectl.h         |   36 +
 sysdeps/unix/sysv/linux/arc/sys/procfs.h           |  123 ++
 sysdeps/unix/sysv/linux/arc/sys/ucontext.h         |   40 +
 sysdeps/unix/sysv/linux/arc/sys/user.h             |   32 +
 sysdeps/unix/sysv/linux/arc/syscall.S              |   33 +
 sysdeps/unix/sysv/linux/arc/sysdep-cancel.h        |  144 ++
 sysdeps/unix/sysv/linux/arc/sysdep.c               |   22 +
 sysdeps/unix/sysv/linux/arc/sysdep.h               |  257 +++
 sysdeps/unix/sysv/linux/arc/ucontext_i.sym         |   17 +
 sysdeps/unix/sysv/linux/arc/vfork.S                |   42 +
 101 files changed, 6926 insertions(+), 5 deletions(-)
 create mode 100644 sysdeps/arc/Implies
 create mode 100644 sysdeps/arc/Makefile
 create mode 100644 sysdeps/arc/Subdirs
 create mode 100644 sysdeps/arc/Versions
 create mode 100644 sysdeps/arc/__longjmp.S
 create mode 100644 sysdeps/arc/abort-instr.h
 create mode 100644 sysdeps/arc/atomic-machine.h
 create mode 100644 sysdeps/arc/backtrace.c
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
 create mode 100644 sysdeps/arc/libm-test-ulps
 create mode 100644 sysdeps/arc/libm-test-ulps-name
 create mode 100644 sysdeps/arc/machine-gmon.h
 create mode 100644 sysdeps/arc/math-tests.h
 create mode 100644 sysdeps/arc/math_private.h
 create mode 100644 sysdeps/arc/memusage.h
 create mode 100644 sysdeps/arc/nptl/Makefile
 create mode 100644 sysdeps/arc/nptl/bits/pthreadtypes-arch.h
 create mode 100644 sysdeps/arc/nptl/bits/semaphore.h
 create mode 100644 sysdeps/arc/nptl/pthread_spin_lock.c
 create mode 100644 sysdeps/arc/nptl/pthreaddef.h
 create mode 100644 sysdeps/arc/nptl/tcb-offsets.sym
 create mode 100644 sysdeps/arc/nptl/tls.h
 create mode 100644 sysdeps/arc/preconfigure
 create mode 100644 sysdeps/arc/s_fma.c
 create mode 100644 sysdeps/arc/s_fmaf.c
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
 create mode 100644 sysdeps/unix/sysv/linux/arc/arch-fork.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/mman.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/sigaction.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/c++-types.data
 create mode 100644 sysdeps/unix/sysv/linux/arc/cacheflush.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/clone.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure.ac
 create mode 100644 sysdeps/unix/sysv/linux/arc/kernel-features.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ld.abilist
 create mode 100644 sysdeps/unix/sysv/linux/arc/ldconfig.h
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
 create mode 100644 sysdeps/unix/sysv/linux/arc/mmap_internal.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/profil-counter.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/pt-vfork.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/shlib-versions
 create mode 100644 sysdeps/unix/sysv/linux/arc/sigaction.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/cachectl.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/procfs.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/ucontext.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sys/user.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/syscall.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext_i.sym
 create mode 100644 sysdeps/unix/sysv/linux/arc/vfork.S

-- 
2.7.4
