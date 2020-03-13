Return-Path: <SRS0=tGlP=46=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CDFC5ACC2
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2020 03:04:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1958A206E2
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2020 03:04:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sp1qHXtf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cj8as84y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bu2M2f0u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1958A206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nPCT+iS/HhEUf05d2gyYK/oY81ilaY8ty031YpsoljI=; b=Sp1qHXtfDN0AVi
	gCV0+kC/biEuoXv75q9ZHmys3vn1eMDpC8zkTovXGlvdp70x0+A4nwOshpGkKec2lqW1UhTY6Oop8
	Bh01xBPgznuxbN9ySCUVJGd/mWoo+AzkE+zHqmb5HqmSwghh5mLv4yCK7DjCDAWbv0E3n+k+oPAjZ
	q5IbV6WG7D1j07m8GgZ1CUZtU8ZNkhmzxIRJoKexS2GeFTKV94Bddu6qesLdUCqpN96sCqRVqHAHO
	vxYNbYXPXGYhfB3GliH2th9MsWKB0EirkayNMnKJfA0EFxZlpTYmodxfiS1FmFOSlC5g033ipT1ST
	UpLRPMe75rNLxdRdEj9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCad1-0003gF-Cp; Fri, 13 Mar 2020 03:04:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCacy-0003db-F4
 for linux-snps-arc@bombadil.infradead.org; Fri, 13 Mar 2020 03:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=zpbOJSfepuGiraHhOGRNNAjkFYja2Sde7d2F3NUOWE8=; b=cj8as84yNxjNPQA5YkSGeZqZxZ
 3+h5cuvzviN6N92vpxyK2VLHBmGFHvaO6A9o3v9w/shRQuIXCpPBEnAvKQkUYnfJdshDJA35suvAO
 /AUNWSHAR7U2mcFqe0TzSt10ayUPldYgYvL+vIVtYwNeheg4aAgZZpLArs0HhDAiHa7OG1MNbMibG
 oq9tbn5Frmp9OnMCXZz1pP8usHQsZhy9wZcVdCilxWKxtC9V0HXkZqyxU44bQOOV3+ikMPWeEluX7
 0XNBOk6ZJPOs+NKP/HIXNwhY1x3FMAzRPAoLV+GyGpAvBucddvU2xMwUVVzl1OLr6/9CRWM+FlMUQ
 nMFJiVGA==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCacs-0004z0-66
 for linux-snps-arc@lists.infradead.org; Fri, 13 Mar 2020 03:04:47 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3A4F6C0F90;
 Fri, 13 Mar 2020 03:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584068669; bh=Uk+AX3R5d8LlF02ipLp7wl/tUWsSPCH3/9YVNzNSwPA=;
 h=From:To:Cc:Subject:Date:From;
 b=bu2M2f0u7cVpXtQX//d+CK47QJvd2WoGVvlpQgOdRdAXgz+8SDFou+YDYH5bTHjCH
 Jcp8fceUuJwEHqjVnap9c0LDIPW3Fws11EvJlsKERn4I+eQMkF9IZidOlON7ICbN9N
 Lpn3SSW6IoMZT/MjtCoeZ/c4U9JZr1HEjDv585CIbkGDPILxtPIdKsRvozlhqnFVod
 QMj3aaFQbeU6G0t2dRe9dR2Yqpvtog5NpgnueBmUHt121+5evhRiRiPRcNGnO+gsW6
 ahmXbM9+cDJ3AeX6yqH54f5MimO0beYDgcFhWwiMT4wciXAvpfnx9k1eduD0y3nZa4
 dvEPWGjpv+tGw==
Received: from vineetg-Latitude-E7450.internal.synopsys.com (unknown
 [10.13.182.230])
 by mailhost.synopsys.com (Postfix) with ESMTP id CB78AA0072;
 Fri, 13 Mar 2020 03:04:27 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v4 00/15] glibc port to ARC processors
Date: Thu, 12 Mar 2020 20:04:04 -0700
Message-Id: <20200313030419.15843-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_030442_719038_E5A9626D 
X-CRM114-Status: GOOD (  13.92  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

This patchset implements glibc port to ARC HS48x processor from Synopsys.

It is based on 64-time time and offset work by Alistair and others.
Thank you guys for all the hard-work.

Code
-----

git@github.com:foss-for-synopsys-dwc-arc-processors/glibc.git  #arc-glibc-upstream

v4:
   * Dropped 1/17: Merged upstream
   * Dropped 17/17:
       - 64-bit time/offset code chunked up into respective patches
   * sysctl removed
   * Updated README for arc gnu triplet
   * Updated install files for ARC gcc/binutils requirements
   * Updated NEWS with brief ISA/ABI info

v3:
   * Support for Hardware Floating Point
   * 64-bit time and offsets ABI (although all such changes are confined
     to a single patch)

v3: https://sourceware.org/legacy-ml/libc-alpha/2020-03/msg00167.html
v2: https://sourceware.org/legacy-ml/libc-alpha/2019-01/msg00681.html
v1: https://sourceware.org/legacy-ml/libc-alpha/2018-12/msg00678.html

Documentation:
--------------

(a) ABI doc:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/wiki/files/ARCv2_ABI.pdf

(b) Programmer's Reference Manual (PRM) : needs a download request to be filled
https://www.synopsys.com/dw/ipdir.php?ds=arc-hs44-hs46-hs48
https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf

Test Results:
--------------
(a) build-many-glibcs.py

| Summary of test results:
|   1251 PASS
|     15 XFAIL

(b) Full testsuite ran in a cross compile setup using buildroot on HSDK development
    platform. Bulk of failures come from cross testing setup and I
    intend to improve things with native testing going forward.

    We have 4 old container tests passing, thx to DJ Delorie's insights.
    But the 3 sysv ipc tests are failing likely from generic 64-bit changes in flight
    which will come to resolution as things settle down.

| Summary of test results:
|     29 FAIL    # compared to prev run: +4 pass, -3 fail
|
| PASS: elf/tst-dlopen-self-container
| PASS: elf/tst-dlopen-tlsmodid-container
| PASS: elf/tst-ldconfig-bad-aux-cache
| PASS: elf/tst-pldd
|
| FAIL: elf/tst-ldconfig-ld_so_conf-update # not true: dlopen
| FAIL: iconv/test-iconvconfig		# Needs gconv installed
| FAIL: io/ftwtest			# Requires execution by non-root
| FAIL: io/tst-lockf
| FAIL: libio/tst-wfile-sync
| FAIL: nptl/test-cond-printers		# needs Python3 and target GDB on target
| FAIL: nptl/test-condattr-printers	#    ditto
| FAIL: nptl/test-mutex-printers	#    ditto
| FAIL: nptl/test-mutexattr-printers	#    ditto
| FAIL: nptl/test-rwlock-printers	#    ditto
| FAIL: nptl/test-rwlockattr-printers	#    ditto
| FAIL: nptl/tst-pthread-getattr	# Cannot create testroot lock.
| FAIL: nptl/tst-umask1			# passes if run natively on target (NFS ACLv3 support needed)
| FAIL: nss/bug-erange
| FAIL: nss/tst-nss-db-endgrent		# Cannot create testroot lock.
| FAIL: nss/tst-nss-db-endpwent		#    ditto
| FAIL: nss/tst-nss-files-hosts-long	#    ditto
| FAIL: nss/tst-nss-test3		#    ditto
| FAIL: nss/tst-nss-files-hosts-getent	# Timed out
| FAIL: nss/tst-nss-files-hosts-multi	# Timed out
| FAIL: posix/bug-ga2			# DNS issue: google DNS vs. SNPS
| FAIL: posix/globtest			# require same user on target and host
| FAIL: posix/tst-getaddrinfo5		# passes outside corporate network
| FAIL: stdio-common/bug22		# Needs more RAM: 2 GB memory
| FAIL: sunrpc/bug20790			# missing cpp on target
| FAIL: timezone/tst-tzset		# passes outside corporate network


kindly review.

Thx,
-Vineet

Vineet Gupta (15):
  ARC: add definitions to elf/elf.h
  ARC: ABI Implementation
  ARC: startup and dynamic linking code
  ARC: Thread Local Storage support
  ARC: Atomics and Locking primitives
  ARC: math soft float support
  ARC: hardware floating point support
  ARC: Linux Syscall Interface
  ARC: Linux ABI
  ARC: Linux Startup and Dynamic Loading
  ARC: ABI lists
  ARC: Update syscall-names.list for ARC specific syscalls
  ARC: Build Infrastructure
  build-many-glibcs.py: Enable ARC builds
  Documentation for ARC port

 NEWS                                          |   11 +
 README                                        |    1 +
 elf/elf.h                                     |   70 +-
 manual/install.texi                           |    5 +
 scripts/build-many-glibcs.py                  |    7 +
 sysdeps/arc/Implies                           |    3 +
 sysdeps/arc/Makefile                          |   25 +
 sysdeps/arc/Versions                          |    6 +
 sysdeps/arc/__longjmp.S                       |   50 +
 sysdeps/arc/abort-instr.h                     |    2 +
 sysdeps/arc/atomic-machine.h                  |   73 +
 sysdeps/arc/bits/endianness.h                 |   15 +
 sysdeps/arc/bits/fenv.h                       |   77 +
 sysdeps/arc/bits/link.h                       |   52 +
 sysdeps/arc/bits/setjmp.h                     |   26 +
 sysdeps/arc/bsd-_setjmp.S                     |    1 +
 sysdeps/arc/bsd-setjmp.S                      |    1 +
 sysdeps/arc/configure                         |   14 +
 sysdeps/arc/configure.ac                      |   11 +
 sysdeps/arc/dl-machine.h                      |  340 +++
 sysdeps/arc/dl-runtime.c                      |   39 +
 sysdeps/arc/dl-sysdep.h                       |   25 +
 sysdeps/arc/dl-tls.h                          |   30 +
 sysdeps/arc/dl-trampoline.S                   |   80 +
 sysdeps/arc/entry.h                           |    5 +
 sysdeps/arc/fpu/e_sqrt.c                      |   27 +
 sysdeps/arc/fpu/e_sqrtf.c                     |   27 +
 sysdeps/arc/fpu/fclrexcpt.c                   |   36 +
 sysdeps/arc/fpu/fegetenv.c                    |   37 +
 sysdeps/arc/fpu/fegetmode.c                   |   31 +
 sysdeps/arc/fpu/fegetround.c                  |   32 +
 sysdeps/arc/fpu/feholdexcpt.c                 |   43 +
 sysdeps/arc/fpu/fesetenv.c                    |   48 +
 sysdeps/arc/fpu/fesetexcept.c                 |   32 +
 sysdeps/arc/fpu/fesetmode.c                   |   41 +
 sysdeps/arc/fpu/fesetround.c                  |   39 +
 sysdeps/arc/fpu/feupdateenv.c                 |   46 +
 sysdeps/arc/fpu/fgetexcptflg.c                |   31 +
 sysdeps/arc/fpu/fraiseexcpt.c                 |   39 +
 sysdeps/arc/fpu/fsetexcptflg.c                |   38 +
 sysdeps/arc/fpu/ftestexcept.c                 |   33 +
 sysdeps/arc/fpu/libm-test-ulps                | 1703 ++++++++++++++
 sysdeps/arc/fpu/libm-test-ulps-name           |    1 +
 sysdeps/arc/fpu/s_fma.c                       |   28 +
 sysdeps/arc/fpu/s_fmaf.c                      |   28 +
 sysdeps/arc/fpu_control.h                     |  101 +
 sysdeps/arc/gccframe.h                        |   21 +
 sysdeps/arc/get-rounding-mode.h               |   38 +
 sysdeps/arc/gmp-mparam.h                      |   23 +
 sysdeps/arc/jmpbuf-offsets.h                  |   47 +
 sysdeps/arc/jmpbuf-unwind.h                   |   47 +
 sysdeps/arc/ldsodefs.h                        |   43 +
 sysdeps/arc/libc-tls.c                        |   27 +
 sysdeps/arc/machine-gmon.h                    |   35 +
 sysdeps/arc/math-tests-trap.h                 |   27 +
 sysdeps/arc/memusage.h                        |   23 +
 sysdeps/arc/nofpu/Implies                     |    1 +
 sysdeps/arc/nofpu/libm-test-ulps              |  390 +++
 sysdeps/arc/nofpu/libm-test-ulps-name         |    1 +
 sysdeps/arc/nofpu/math-tests-exceptions.h     |   27 +
 sysdeps/arc/nofpu/math-tests-rounding.h       |   27 +
 sysdeps/arc/nptl/Makefile                     |   22 +
 sysdeps/arc/nptl/bits/semaphore.h             |   32 +
 sysdeps/arc/nptl/pthreaddef.h                 |   32 +
 sysdeps/arc/nptl/tcb-offsets.sym              |   11 +
 sysdeps/arc/nptl/tls.h                        |  150 ++
 sysdeps/arc/preconfigure                      |   15 +
 sysdeps/arc/setjmp.S                          |   66 +
 sysdeps/arc/sfp-machine.h                     |   73 +
 sysdeps/arc/sotruss-lib.c                     |   51 +
 sysdeps/arc/stackinfo.h                       |   33 +
 sysdeps/arc/start.S                           |   74 +
 sysdeps/arc/sysdep.h                          |   48 +
 sysdeps/arc/tininess.h                        |    1 +
 sysdeps/arc/tls-macros.h                      |   47 +
 sysdeps/arc/tst-audit.h                       |   23 +
 sysdeps/unix/sysv/linux/arc/Implies           |    3 +
 sysdeps/unix/sysv/linux/arc/Makefile          |   20 +
 sysdeps/unix/sysv/linux/arc/Versions          |   16 +
 sysdeps/unix/sysv/linux/arc/arch-syscall.h    |  317 +++
 sysdeps/unix/sysv/linux/arc/bits/procfs.h     |   35 +
 .../sysv/linux/arc/bits/socket-constants.h    |   38 +
 sysdeps/unix/sysv/linux/arc/bits/timesize.h   |   21 +
 .../sysv/linux/arc/bits/types/__sigset_t.h    |   12 +
 sysdeps/unix/sysv/linux/arc/c++-types.data    |   67 +
 sysdeps/unix/sysv/linux/arc/clone.S           |   98 +
 sysdeps/unix/sysv/linux/arc/configure         |    4 +
 sysdeps/unix/sysv/linux/arc/configure.ac      |    4 +
 sysdeps/unix/sysv/linux/arc/dl-static.c       |   84 +
 sysdeps/unix/sysv/linux/arc/getcontext.S      |   63 +
 sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h  |    6 +
 sysdeps/unix/sysv/linux/arc/kernel-features.h |   28 +
 sysdeps/unix/sysv/linux/arc/kernel_stat.h     |   26 +
 sysdeps/unix/sysv/linux/arc/ld.abilist        |    5 +
 sysdeps/unix/sysv/linux/arc/ldsodefs.h        |   32 +
 .../sysv/linux/arc/libBrokenLocale.abilist    |    1 +
 sysdeps/unix/sysv/linux/arc/libanl.abilist    |    4 +
 sysdeps/unix/sysv/linux/arc/libc.abilist      | 2082 +++++++++++++++++
 sysdeps/unix/sysv/linux/arc/libcrypt.abilist  |    2 +
 sysdeps/unix/sysv/linux/arc/libdl.abilist     |    9 +
 sysdeps/unix/sysv/linux/arc/libm.abilist      |  699 ++++++
 .../unix/sysv/linux/arc/libpthread.abilist    |  217 ++
 sysdeps/unix/sysv/linux/arc/libresolv.abilist |   79 +
 sysdeps/unix/sysv/linux/arc/librt.abilist     |   35 +
 .../unix/sysv/linux/arc/libthread_db.abilist  |   40 +
 sysdeps/unix/sysv/linux/arc/libutil.abilist   |    6 +
 sysdeps/unix/sysv/linux/arc/localplt.data     |   12 +
 sysdeps/unix/sysv/linux/arc/makecontext.c     |   75 +
 sysdeps/unix/sysv/linux/arc/mmap_internal.h   |   27 +
 sysdeps/unix/sysv/linux/arc/pt-vfork.S        |    1 +
 sysdeps/unix/sysv/linux/arc/setcontext.S      |   92 +
 sysdeps/unix/sysv/linux/arc/shlib-versions    |    2 +
 sysdeps/unix/sysv/linux/arc/sigaction.c       |   31 +
 sysdeps/unix/sysv/linux/arc/sigcontextinfo.h  |   28 +
 sysdeps/unix/sysv/linux/arc/sigrestorer.S     |   29 +
 sysdeps/unix/sysv/linux/arc/swapcontext.S     |   92 +
 sysdeps/unix/sysv/linux/arc/sys/cachectl.h    |   36 +
 sysdeps/unix/sysv/linux/arc/sys/ucontext.h    |   63 +
 sysdeps/unix/sysv/linux/arc/sys/user.h        |   31 +
 sysdeps/unix/sysv/linux/arc/syscall.S         |   38 +
 sysdeps/unix/sysv/linux/arc/syscalls.list     |    3 +
 sysdeps/unix/sysv/linux/arc/sysctl.mk         |    1 +
 sysdeps/unix/sysv/linux/arc/sysdep.c          |   33 +
 sysdeps/unix/sysv/linux/arc/sysdep.h          |  219 ++
 sysdeps/unix/sysv/linux/arc/ucontext-macros.h |   29 +
 sysdeps/unix/sysv/linux/arc/ucontext_i.sym    |   20 +
 sysdeps/unix/sysv/linux/arc/vfork.S           |   42 +
 sysdeps/unix/sysv/linux/syscall-names.list    |    3 +
 128 files changed, 9824 insertions(+), 1 deletion(-)
 create mode 100644 sysdeps/arc/Implies
 create mode 100644 sysdeps/arc/Makefile
 create mode 100644 sysdeps/arc/Versions
 create mode 100644 sysdeps/arc/__longjmp.S
 create mode 100644 sysdeps/arc/abort-instr.h
 create mode 100644 sysdeps/arc/atomic-machine.h
 create mode 100644 sysdeps/arc/bits/endianness.h
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
 create mode 100644 sysdeps/arc/fpu/e_sqrt.c
 create mode 100644 sysdeps/arc/fpu/e_sqrtf.c
 create mode 100644 sysdeps/arc/fpu/fclrexcpt.c
 create mode 100644 sysdeps/arc/fpu/fegetenv.c
 create mode 100644 sysdeps/arc/fpu/fegetmode.c
 create mode 100644 sysdeps/arc/fpu/fegetround.c
 create mode 100644 sysdeps/arc/fpu/feholdexcpt.c
 create mode 100644 sysdeps/arc/fpu/fesetenv.c
 create mode 100644 sysdeps/arc/fpu/fesetexcept.c
 create mode 100644 sysdeps/arc/fpu/fesetmode.c
 create mode 100644 sysdeps/arc/fpu/fesetround.c
 create mode 100644 sysdeps/arc/fpu/feupdateenv.c
 create mode 100644 sysdeps/arc/fpu/fgetexcptflg.c
 create mode 100644 sysdeps/arc/fpu/fraiseexcpt.c
 create mode 100644 sysdeps/arc/fpu/fsetexcptflg.c
 create mode 100644 sysdeps/arc/fpu/ftestexcept.c
 create mode 100644 sysdeps/arc/fpu/libm-test-ulps
 create mode 100644 sysdeps/arc/fpu/libm-test-ulps-name
 create mode 100644 sysdeps/arc/fpu/s_fma.c
 create mode 100644 sysdeps/arc/fpu/s_fmaf.c
 create mode 100644 sysdeps/arc/fpu_control.h
 create mode 100644 sysdeps/arc/gccframe.h
 create mode 100644 sysdeps/arc/get-rounding-mode.h
 create mode 100644 sysdeps/arc/gmp-mparam.h
 create mode 100644 sysdeps/arc/jmpbuf-offsets.h
 create mode 100644 sysdeps/arc/jmpbuf-unwind.h
 create mode 100644 sysdeps/arc/ldsodefs.h
 create mode 100644 sysdeps/arc/libc-tls.c
 create mode 100644 sysdeps/arc/machine-gmon.h
 create mode 100644 sysdeps/arc/math-tests-trap.h
 create mode 100644 sysdeps/arc/memusage.h
 create mode 100644 sysdeps/arc/nofpu/Implies
 create mode 100644 sysdeps/arc/nofpu/libm-test-ulps
 create mode 100644 sysdeps/arc/nofpu/libm-test-ulps-name
 create mode 100644 sysdeps/arc/nofpu/math-tests-exceptions.h
 create mode 100644 sysdeps/arc/nofpu/math-tests-rounding.h
 create mode 100644 sysdeps/arc/nptl/Makefile
 create mode 100644 sysdeps/arc/nptl/bits/semaphore.h
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
 create mode 100644 sysdeps/arc/tininess.h
 create mode 100644 sysdeps/arc/tls-macros.h
 create mode 100644 sysdeps/arc/tst-audit.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/Implies
 create mode 100644 sysdeps/unix/sysv/linux/arc/Makefile
 create mode 100644 sysdeps/unix/sysv/linux/arc/Versions
 create mode 100644 sysdeps/unix/sysv/linux/arc/arch-syscall.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/procfs.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/socket-constants.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/timesize.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/types/__sigset_t.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/c++-types.data
 create mode 100644 sysdeps/unix/sysv/linux/arc/clone.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure.ac
 create mode 100644 sysdeps/unix/sysv/linux/arc/dl-static.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/getcontext.S
 create mode 100644 sysdeps/unix/sysv/linux/arc/jmp_buf-macros.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/kernel-features.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/kernel_stat.h
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
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysctl.mk
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/sysdep.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext-macros.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/ucontext_i.sym
 create mode 100644 sysdeps/unix/sysv/linux/arc/vfork.S

-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
