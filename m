Return-Path: <SRS0=lmvv=KH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD7EC433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 May 2021 07:59:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A661460FE9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 May 2021 07:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A661460FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VLAA81SNPA2tyCMxa04ygTFuEou+eSRqS5fhbWTYmX8=; b=DOyciuEZJ4INVexKKpkuJVVP/4
	93bWCYzGERM1Duz+EWM4tXAKKYCaipMjFF+7cXagrg2LIRETOI/uSijhH6UuIlf+KyIxhGtvNP7Zu
	mfh/qlWEUb2qBxcCepdv0gq0tSkmnC8gqhAHBS5JiqrQvIhSmsU+LlVIX0pQx4oUBm3yOjZFLe45S
	dP9w+OXW5bYyHwLN4c7apbtmuvRDR53qE1liDYuUsWHlHnxAD8g7hcQSENMiJVEXGyw5/cMiCdYu3
	UOUsMCP8D/qya231Bh/pHB3GPAMPNsjuXngwB2zk0d9JvVCwdC3U4ohRxZZp2M0MBOGHodsPCyChW
	2bgGt5yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgjlu-002IG2-DC; Wed, 12 May 2021 07:59:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgjlj-002IEL-2z; Wed, 12 May 2021 07:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=wIUNhcOB6btFOL0gSpr92RlYruAqiaKJ+SP4MHn4OAA=; b=FI8zXmg5sLIHg8DA47goUGY4Fs
 /K59lDjguqORrzL2TOIPeMbtuHI//uFR8kZ+mQyu7CxTEzSlkdStEDOZACQ/krbiaQUqYJSyldrcC
 p912yqLNP/vOteplI+fRnC58WPrNw97X8S6XtaDGZYbIKPzOE1GjdyobE/1Jekw2zuwZbgNHTnvCj
 MVSygv1ulZjKRRt/CT3C4utLP/JxYNRgGXtFKhWCiAbl9hpJVfAD8gFiBPq7UI+hLN7wHwgKojr1f
 cpPoJd8mXzkn+0n+sAThhh73lEGihJI4rjDxvekixGkit22DhdSXRP+fK4+28oM1vk10R/pQAhPOv
 FQ7KX+aQ==;
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgjlf-00AC3i-AW; Wed, 12 May 2021 07:58:57 +0000
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp
 [133.32.232.101]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id 14C7vbPs028192;
 Wed, 12 May 2021 16:57:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 14C7vbPs028192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1620806261;
 bh=wIUNhcOB6btFOL0gSpr92RlYruAqiaKJ+SP4MHn4OAA=;
 h=From:To:Cc:Subject:Date:From;
 b=MEPfaL+dgaQHelu1aORa4dkshKUoXyML9ToegfF2X/+DDlDkT2NTxvVtRobsDkp3y
 w6q0OMUPClkMLevvjlJySVaAGk9chQn5JmHYb+Sby+ocz18EmUyh5EfwgbghPbCUMs
 BfqHu2GczlJunlpKBWtiGYnb5THa+fwMAHT17a+4GK1J+KWFOc18MvDzUYfMdu9apT
 X6Smfz3LDGjObml+5VUPVmYQNjXkkTpqKOuY3LDfkxKy7PEEqqJdMx9ujR6UWsgJpM
 n0Q+gHtNpnXSYPWFtp4AhWmiwdi6gcYpdR3mkS/pbX/h/3dXftILrjdVKvAqW4utJB
 bGXpxDJOBDv8Q==
X-Nifty-SrcIP: [133.32.232.101]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@codeaurora.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Chris Zankel <chris@zankel.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Greentime Hu <green.hu@gmail.com>, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Jeff Dike <jdike@addtoit.com>, Jonas Bonn <jonas@southpole.se>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Marek <michal.lkml@markovi.net>,
 Michal Simek <monstr@monstr.eu>, Nick Hu <nickhu@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Rich Felker <dalias@libc.org>, Richard Henderson <rth@twiddle.net>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Vincent Chen <deanbo422@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, Will Deacon <will@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 x86@kernel.org
Subject: [PATCH 1/5] kbuild: require all architectures to have
 arch/$(SRCARCH)/Kbuild
Date: Wed, 12 May 2021 16:57:25 +0900
Message-Id: <20210512075729.60291-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_005855_618519_4B4F6245 
X-CRM114-Status: GOOD (  16.71  )
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

arch/$(SRCARCH)/Kbuild is useful for Makefile cleanups because you can
use the obj-y syntax.

Add an empty file if it is missing in arch/$(SRCARCH)/.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile               | 2 +-
 arch/alpha/Kbuild      | 1 +
 arch/arc/Makefile      | 3 ---
 arch/arm/Makefile      | 1 -
 arch/arm64/Makefile    | 1 -
 arch/csky/Kbuild       | 1 +
 arch/h8300/Kbuild      | 1 +
 arch/hexagon/Kbuild    | 1 +
 arch/ia64/Kbuild       | 1 +
 arch/microblaze/Kbuild | 1 +
 arch/mips/Makefile     | 3 ---
 arch/nds32/Kbuild      | 1 +
 arch/nios2/Kbuild      | 1 +
 arch/openrisc/Makefile | 1 -
 arch/parisc/Kbuild     | 1 +
 arch/powerpc/Makefile  | 3 ---
 arch/riscv/Makefile    | 1 -
 arch/s390/Makefile     | 3 ---
 arch/sh/Kbuild         | 1 +
 arch/sparc/Makefile    | 3 ---
 arch/um/Kbuild         | 1 +
 arch/x86/Makefile      | 3 ---
 arch/xtensa/Kbuild     | 1 +
 23 files changed, 13 insertions(+), 23 deletions(-)
 create mode 100644 arch/alpha/Kbuild
 create mode 100644 arch/csky/Kbuild
 create mode 100644 arch/h8300/Kbuild
 create mode 100644 arch/hexagon/Kbuild
 create mode 100644 arch/ia64/Kbuild
 create mode 100644 arch/microblaze/Kbuild
 create mode 100644 arch/nds32/Kbuild
 create mode 100644 arch/nios2/Kbuild
 create mode 100644 arch/parisc/Kbuild
 create mode 100644 arch/sh/Kbuild
 create mode 100644 arch/um/Kbuild
 create mode 100644 arch/xtensa/Kbuild

diff --git a/Makefile b/Makefile
index 15b6476d0f89..7df040b1b023 100644
--- a/Makefile
+++ b/Makefile
@@ -658,7 +658,7 @@ endif
 
 ifeq ($(KBUILD_EXTMOD),)
 # Objects we will link into vmlinux / subdirs we need to visit
-core-y		:= init/ usr/
+core-y		:= init/ usr/ arch/$(SRCARCH)/
 drivers-y	:= drivers/ sound/
 drivers-$(CONFIG_SAMPLES) += samples/
 drivers-$(CONFIG_NET) += net/
diff --git a/arch/alpha/Kbuild b/arch/alpha/Kbuild
new file mode 100644
index 000000000000..a4e40e534e6a
--- /dev/null
+++ b/arch/alpha/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 4392c9c189c4..3e6d4b84797f 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -85,9 +85,6 @@ KBUILD_LDFLAGS	+= $(ldflags-y)
 
 head-y		:= arch/arc/kernel/head.o
 
-# See arch/arc/Kbuild for content of core part of the kernel
-core-y		+= arch/arc/
-
 # w/o this dtb won't embed into kernel binary
 core-y		+= arch/arc/boot/dts/
 
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 415c3514573a..173da685a52e 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -252,7 +252,6 @@ endif
 
 export	TEXT_OFFSET GZFLAGS MMUEXT
 
-core-y				+= arch/arm/
 # If we have a machine-specific directory, then include it in the build.
 core-y				+= $(machdirs) $(platdirs)
 
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 7ef44478560d..b73c151f3a53 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -149,7 +149,6 @@ KBUILD_CFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
 KBUILD_CPPFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
 KBUILD_AFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
 
-core-y		+= arch/arm64/
 libs-y		:= arch/arm64/lib/ $(libs-y)
 libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
 
diff --git a/arch/csky/Kbuild b/arch/csky/Kbuild
new file mode 100644
index 000000000000..a4e40e534e6a
--- /dev/null
+++ b/arch/csky/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/arch/h8300/Kbuild b/arch/h8300/Kbuild
new file mode 100644
index 000000000000..a4e40e534e6a
--- /dev/null
+++ b/arch/h8300/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/arch/hexagon/Kbuild b/arch/hexagon/Kbuild
new file mode 100644
index 000000000000..a4e40e534e6a
--- /dev/null
+++ b/arch/hexagon/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/arch/ia64/Kbuild b/arch/ia64/Kbuild
new file mode 100644
index 000000000000..a4e40e534e6a
--- /dev/null
+++ b/arch/ia64/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/arch/microblaze/Kbuild b/arch/microblaze/Kbuild
new file mode 100644
index 000000000000..a4e40e534e6a
--- /dev/null
+++ b/arch/microblaze/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 258234c35a09..4e942b7ef022 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -332,9 +332,6 @@ head-y := arch/mips/kernel/head.o
 libs-y			+= arch/mips/lib/
 libs-$(CONFIG_MIPS_FP_SUPPORT) += arch/mips/math-emu/
 
-# See arch/mips/Kbuild for content of core part of the kernel
-core-y += arch/mips/
-
 drivers-y			+= arch/mips/crypto/
 
 # suspend and hibernation support
diff --git a/arch/nds32/Kbuild b/arch/nds32/Kbuild
new file mode 100644
index 000000000000..a4e40e534e6a
--- /dev/null
+++ b/arch/nds32/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/arch/nios2/Kbuild b/arch/nios2/Kbuild
new file mode 100644
index 000000000000..a4e40e534e6a
--- /dev/null
+++ b/arch/nios2/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/arch/openrisc/Makefile b/arch/openrisc/Makefile
index 410e7abfac69..c52de526e518 100644
--- a/arch/openrisc/Makefile
+++ b/arch/openrisc/Makefile
@@ -42,7 +42,6 @@ endif
 
 head-y 		:= arch/openrisc/kernel/head.o
 
-core-y		+= arch/openrisc/
 libs-y		+= $(LIBGCC)
 
 PHONY += vmlinux.bin
diff --git a/arch/parisc/Kbuild b/arch/parisc/Kbuild
new file mode 100644
index 000000000000..a4e40e534e6a
--- /dev/null
+++ b/arch/parisc/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 3212d076ac6a..af669aa75b73 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -267,9 +267,6 @@ head-$(CONFIG_PPC_FPU)		+= arch/powerpc/kernel/fpu.o
 head-$(CONFIG_ALTIVEC)		+= arch/powerpc/kernel/vector.o
 head-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)  += arch/powerpc/kernel/prom_init.o
 
-# See arch/powerpc/Kbuild for content of core part of the kernel
-core-y += arch/powerpc/
-
 # Default to zImage, override when needed
 all: zImage
 
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3eb9590a0775..c5f359540862 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -90,7 +90,6 @@ endif
 
 head-y := arch/riscv/kernel/head.o
 
-core-y += arch/riscv/
 core-$(CONFIG_RISCV_ERRATA_ALTERNATIVE) += arch/riscv/errata/
 
 libs-y += arch/riscv/lib/
diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index e443ed9947bd..37b61645694c 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -128,9 +128,6 @@ OBJCOPYFLAGS	:= -O binary
 
 head-y		:= arch/s390/kernel/head64.o
 
-# See arch/s390/Kbuild for content of core part of the kernel
-core-y		+= arch/s390/
-
 libs-y		+= arch/s390/lib/
 drivers-y	+= drivers/s390/
 
diff --git a/arch/sh/Kbuild b/arch/sh/Kbuild
new file mode 100644
index 000000000000..a4e40e534e6a
--- /dev/null
+++ b/arch/sh/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
index bee99e65fe23..4e65245bc755 100644
--- a/arch/sparc/Makefile
+++ b/arch/sparc/Makefile
@@ -58,9 +58,6 @@ endif
 
 head-y                 := arch/sparc/kernel/head_$(BITS).o
 
-# See arch/sparc/Kbuild for the core part of the kernel
-core-y                 += arch/sparc/
-
 libs-y                 += arch/sparc/prom/
 libs-y                 += arch/sparc/lib/
 
diff --git a/arch/um/Kbuild b/arch/um/Kbuild
new file mode 100644
index 000000000000..a4e40e534e6a
--- /dev/null
+++ b/arch/um/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index c77c5d8a7b3e..4307bf48ec53 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -239,9 +239,6 @@ head-y += arch/x86/kernel/platform-quirks.o
 
 libs-y  += arch/x86/lib/
 
-# See arch/x86/Kbuild for content of core part of the kernel
-core-y += arch/x86/
-
 # drivers-y are linked after core-y
 drivers-$(CONFIG_MATH_EMULATION) += arch/x86/math-emu/
 drivers-$(CONFIG_PCI)            += arch/x86/pci/
diff --git a/arch/xtensa/Kbuild b/arch/xtensa/Kbuild
new file mode 100644
index 000000000000..a4e40e534e6a
--- /dev/null
+++ b/arch/xtensa/Kbuild
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
-- 
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
