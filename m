Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FEFC678D4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 09:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bvk+vP9b4CRLfo5NgsznS6wpxDtXeky800mYG0XD8LU=; b=tbJbHUAw7Qfpyb
	/F1hIAviTe8mzhHQ345LMZTxdEgknnMIYHpL1Uf/q+SV1b7a77wihfYkH1mxMeSsqcBhvNyT/bvS3
	hTb0tQfAtuQmHSxKOMEtuucaWjPDe5kxxeXxy0Pza7cZGOmx29y6xvMdMbUavOUhKgnMBX5RBEXrm
	SKY7mh8QMlJ4qTRTwLJwEXWp8fXzQDiRX3eIt+M5Y0XmWu+iT/u5XJgFUNWRI+DTUTdOmDfLXvhYh
	N14mSlnmRVYjp7fSrXjgtLzOcdGZQsgZ2GYA/nUzxVepZbS/Rp1OKwQ1mne7UrQ3NM0V3ZbERW6Zg
	S2zq84+xJyrgWhAPpp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfLr-001R1p-LK; Thu, 02 Mar 2023 09:35:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfLn-001Qxs-Kp
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 09:35:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso1250802wmq.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Mar 2023 01:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677749742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0+QyJbOcIEmK/h00N9XPuc9p7Y446r7FCIJpaEpb2y0=;
        b=GSZPDYNuLgx/8mLBXcWrYDn7canNDaRtfx/thmlw+ZEBHPI0HYu1zL9LQFCizwcrca
         TsKITKLC0vDpyHBESTzecaxvZI4+8ls2wjItm2Pt/uxbbqQ0iKB0xHThPFn5cHy8g/mJ
         y9OD1hXrn5nc4Q2EZaQPwPA3ne0cIzPME9LqnyO6K/L7WEPGkJVeZOAkCNfuTzDGKLV3
         /5/Ofu4+aOhWWfFMVIN2YY9VqSSWA+OsdGSkgKWVxcBzI+N21V9PPC5mATDOgJC7aibv
         nuJNa9uPLqwVsGG4Y11KwSu5HX6ff6be1CREj0CQTZPl1a4u3/kbBq6+Gy5wWVRsPZ7x
         9i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677749742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+QyJbOcIEmK/h00N9XPuc9p7Y446r7FCIJpaEpb2y0=;
        b=XnhYhdmxvNN4eYQmyZrv1z7fFn9P8kXZxYwLW9kF/LYz9XAYDGRn/B0rJ+euNDhaMI
         y0VvT8uCs9G0hDNxqKKQn+mHF8O5ZHE8zzq8YJB5801gKQ/JFGozWWgE+yT9P2v3lbbe
         qK+rM1qOlAt6kE9pVtfgDY5GM8I4VzsHp1DwPGPVZB97dXLr2dvCh4b36JSU9JZ4q2cr
         d4mPqZ/Mrbly0Kmxq0pMpt+GK+cWcRiLHb0PHPHCG201sTIQqQHiNpt6cs+EIk6xTqKe
         NmgW6op4K/5Si0FHlqJwAoPxUbPFcYfhmH5v7waEKSgkzRpGpQkyh3XR8tVSzoIO46M2
         2hhg==
X-Gm-Message-State: AO0yUKU2D8SWK4FW8UWWJeRfmHNN60GEn1CSCpqjWwAeHyp0hW2zw8dt
	egnRns1AHiUefsM2X3JPoUp4Ww==
X-Google-Smtp-Source: AK7set82JqkGhDygh6pR2mSF0/c3yM6dikmWvSRMvxrqnIL2EUb/yJbhzMLscJ56hDRKKxkME8A6dw==
X-Received: by 2002:a05:600c:1708:b0:3d0:6a57:66a5 with SMTP id c8-20020a05600c170800b003d06a5766a5mr7384393wmn.0.1677749742062;
        Thu, 02 Mar 2023 01:35:42 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l10-20020a7bc44a000000b003e21dcccf9fsm2223136wmi.16.2023.03.02.01.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:35:41 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 00/24] Remove COMMAND_LINE_SIZE from uapi
Date: Thu,  2 Mar 2023 10:35:15 +0100
Message-Id: <20230302093539.372962-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_013547_715432_2E27852C 
X-CRM114-Status: GOOD (  19.40  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This all came up in the context of increasing COMMAND_LINE_SIZE in the
RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
maximum length of /proc/cmdline and userspace could staticly rely on
that to be correct.

Usually I wouldn't mess around with changing this sort of thing, but
PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
increasing, but they're from before the UAPI split so I'm not quite sure
what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
asm-generic/setup.h.").

It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
part of the uapi to begin with, and userspace should be able to handle
/proc/cmdline of whatever length it turns out to be.  I don't see any
references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
search, but that's not really enough to consider it unused on my end.

This issue was already considered in s390 and they reached the same
conclusion in commit 622021cd6c56 ("s390: make command line
configurable").

The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
shouldn't be part of uapi, so this now touches all the ports.  I've
tried to split this all out and leave it bisectable, but I haven't
tested it all that aggressively.

Changes since v3 <https://lore.kernel.org/all/20230214074925.228106-1-alexghiti@rivosinc.com/>:
* Added RB/AB
* Added a mention to commit 622021cd6c56 ("s390: make command line
  configurable") in the cover letter

Changes since v2 <https://lore.kernel.org/all/20221211061358.28035-1-palmer@rivosinc.com/>:
* Fix sh, csky and ia64 builds, as reported by kernel test robot

Changes since v1 <https://lore.kernel.org/all/20210423025545.313965-1-palmer@dabbelt.com/>:
* Touches every arch.

base-commit-tag: next-20230207

Palmer Dabbelt (24):
  alpha: Remove COMMAND_LINE_SIZE from uapi
  arm64: Remove COMMAND_LINE_SIZE from uapi
  arm: Remove COMMAND_LINE_SIZE from uapi
  ia64: Remove COMMAND_LINE_SIZE from uapi
  m68k: Remove COMMAND_LINE_SIZE from uapi
  microblaze: Remove COMMAND_LINE_SIZE from uapi
  mips: Remove COMMAND_LINE_SIZE from uapi
  parisc: Remove COMMAND_LINE_SIZE from uapi
  powerpc: Remove COMMAND_LINE_SIZE from uapi
  sparc: Remove COMMAND_LINE_SIZE from uapi
  xtensa: Remove COMMAND_LINE_SIZE from uapi
  asm-generic: Remove COMMAND_LINE_SIZE from uapi
  alpha: Remove empty <uapi/asm/setup.h>
  arc: Remove empty <uapi/asm/setup.h>
  m68k: Remove empty <uapi/asm/setup.h>
  arm64: Remove empty <uapi/asm/setup.h>
  microblaze: Remove empty <uapi/asm/setup.h>
  sparc: Remove empty <uapi/asm/setup.h>
  parisc: Remove empty <uapi/asm/setup.h>
  x86: Remove empty <uapi/asm/setup.h>
  xtensa: Remove empty <uapi/asm/setup.h>
  powerpc: Remove empty <uapi/asm/setup.h>
  mips: Remove empty <uapi/asm/setup.h>
  s390: Remove empty <uapi/asm/setup.h>

 .../admin-guide/kernel-parameters.rst         |  2 +-
 arch/alpha/include/asm/setup.h                |  4 +--
 arch/alpha/include/uapi/asm/setup.h           |  7 -----
 arch/arc/include/asm/setup.h                  |  1 -
 arch/arc/include/uapi/asm/setup.h             |  6 -----
 arch/arm/include/asm/setup.h                  |  1 +
 arch/arm/include/uapi/asm/setup.h             |  2 --
 arch/arm64/include/asm/setup.h                |  3 ++-
 arch/arm64/include/uapi/asm/setup.h           | 27 -------------------
 arch/ia64/include/asm/setup.h                 | 10 +++++++
 arch/ia64/include/uapi/asm/setup.h            |  6 ++---
 arch/loongarch/include/asm/setup.h            |  2 +-
 arch/m68k/include/asm/setup.h                 |  3 +--
 arch/m68k/include/uapi/asm/setup.h            | 17 ------------
 arch/microblaze/include/asm/setup.h           |  2 +-
 arch/microblaze/include/uapi/asm/setup.h      | 20 --------------
 arch/mips/include/asm/setup.h                 |  3 ++-
 arch/mips/include/uapi/asm/setup.h            |  8 ------
 arch/parisc/include/{uapi => }/asm/setup.h    |  0
 arch/powerpc/include/asm/setup.h              |  2 +-
 arch/powerpc/include/uapi/asm/setup.h         |  7 -----
 arch/s390/include/asm/setup.h                 |  1 -
 arch/s390/include/uapi/asm/setup.h            |  1 -
 arch/sh/include/asm/setup.h                   |  2 +-
 arch/sparc/include/asm/setup.h                |  6 ++++-
 arch/sparc/include/uapi/asm/setup.h           | 16 -----------
 arch/x86/include/asm/setup.h                  |  2 --
 arch/x86/include/uapi/asm/setup.h             |  1 -
 arch/xtensa/include/{uapi => }/asm/setup.h    |  0
 include/asm-generic/Kbuild                    |  1 +
 include/{uapi => }/asm-generic/setup.h        |  0
 include/uapi/asm-generic/Kbuild               |  1 -
 32 files changed, 31 insertions(+), 133 deletions(-)
 delete mode 100644 arch/alpha/include/uapi/asm/setup.h
 delete mode 100644 arch/arc/include/uapi/asm/setup.h
 delete mode 100644 arch/arm64/include/uapi/asm/setup.h
 create mode 100644 arch/ia64/include/asm/setup.h
 delete mode 100644 arch/m68k/include/uapi/asm/setup.h
 delete mode 100644 arch/microblaze/include/uapi/asm/setup.h
 delete mode 100644 arch/mips/include/uapi/asm/setup.h
 rename arch/parisc/include/{uapi => }/asm/setup.h (100%)
 delete mode 100644 arch/powerpc/include/uapi/asm/setup.h
 delete mode 100644 arch/s390/include/uapi/asm/setup.h
 delete mode 100644 arch/sparc/include/uapi/asm/setup.h
 delete mode 100644 arch/x86/include/uapi/asm/setup.h
 rename arch/xtensa/include/{uapi => }/asm/setup.h (100%)
 rename include/{uapi => }/asm-generic/setup.h (100%)

-- 
2.37.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
