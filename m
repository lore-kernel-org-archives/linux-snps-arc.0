Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B280C3271E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jul 2024 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fb2ysGV8LxtT04kPNTwubyUmhZ32LvryNERILUKO6Zc=; b=s9HG37XWe51h9b
	MkKg757sYD8q0xpvvDD1KK8LUeLor+dkoTwgshjbYl+2g6ME10OzF2g5gjdVHeCa0/HYrPFs1ckUi
	RNtBFxA4DIzpamSNCI+xAL2AiTBPeG5vf4TGWKPQXoj10367Huiy/6nlSR+RpiajkIEzjCqiG2sIo
	+l8KvnOhF2Aor1XiBZkZb+i7G3/Fd59V5RhNQo0v+XgeweQ9GmYsiEBZDqVIH6P7k8dk+syEF7mk9
	L9FhnK8RYCsQXjBkIMxhSjMZn1P4SW5A/Zv0Ah584NY7QrYp+TFGLYJEXbB7aMJtWkAy68dTcGejO
	UV2DVq/FXhNLSUEdHPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNba-0000000DVWo-2zRV;
	Thu, 04 Jul 2024 14:38:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNaS-0000000DUgJ-0C88;
	Thu, 04 Jul 2024 14:37:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 20576CE37C2;
	Thu,  4 Jul 2024 14:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E68C4AF13;
	Thu,  4 Jul 2024 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103845;
	bh=eYRnMrgEiqmr9x4OL4GeJRCEJB6f+mKZwTlWQYaRhhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PlfPJF9jQu7bSlARQ31/jUXuJCBvJoEqY3/YYk1Zwxu4K5mOJeOrxHVgPyCCtWjSE
	 QqEKn7KhNJyzP3qpLo6S2TuRBntnZL78uYdLxX71NOyWW4NTx/MxSie4lXfm0NTjjq
	 sKdYJv/7zsDwCY3fmqduiQOyklB/GVpM6WzKu1VfaWIfB6MYJfbi7UH23h1Fi1afHU
	 mGdM99TzxMI4kUfdqykX1AdDwcC7hWQo17n0QsvmtJfafxMsSYKb4NytqnKuWV8A7k
	 rvNhrqJ4Z7hWg/RZ5oHZv768JapUtsyOhuLRXCLDZIrrKRTOF6FQk1WZtF63Lb75ND
	 xcAcr48Xjyq0A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Christian Brauner <brauner@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 06/17] kbuild: add syscall table generation to scripts/Makefile.asm-headers
Date: Thu,  4 Jul 2024 16:36:00 +0200
Message-Id: <20240704143611.2979589-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073728_470180_C1F7D0D3 
X-CRM114-Status: GOOD (  22.84  )
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

From: Arnd Bergmann <arnd@arndb.de>

There are 11 copies of arch/*/kernel/syscalls/Makefile that all implement
the same basic logic in a somewhat awkward way.

I tried out various ways of unifying the existing copies and ended up
with something that hooks into the logic for generating the redirections
to asm-generic headers. This gives a nicer syntax of being able to list
the generated files in $(syscall-y) inside of arch/*/include/asm/Kbuild
instead of both $(generated-y) in that place and also in another
Makefile.

The configuration for which syscall.tbl file to use and which ABIs to
enable is now done in arch/*/kernel/Makefile.syscalls. I have done
patches for all architectures and made sure that the new generic
rules implement a superset of all the architecture specific corner
cases.

ince the header file is not specific to asm-generic/*.h redirects
now, I ended up renaming the file to scripts/Makefile.asm-headers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Makefile                     |  2 +-
 scripts/Makefile.asm-generic | 58 ---------------------
 scripts/Makefile.asm-headers | 98 ++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+), 59 deletions(-)
 delete mode 100644 scripts/Makefile.asm-generic
 create mode 100644 scripts/Makefile.asm-headers

diff --git a/Makefile b/Makefile
index 06aa6402b385..d62ef2b2c102 100644
--- a/Makefile
+++ b/Makefile
@@ -1219,7 +1219,7 @@ remove-stale-files:
 	$(Q)$(srctree)/scripts/remove-stale-files
 
 # Support for using generic headers in asm-generic
-asm-generic := -f $(srctree)/scripts/Makefile.asm-generic obj
+asm-generic := -f $(srctree)/scripts/Makefile.asm-headers obj
 
 PHONY += asm-generic uapi-asm-generic
 asm-generic: uapi-asm-generic
diff --git a/scripts/Makefile.asm-generic b/scripts/Makefile.asm-generic
deleted file mode 100644
index 69434908930e..000000000000
--- a/scripts/Makefile.asm-generic
+++ /dev/null
@@ -1,58 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# include/asm-generic contains a lot of files that are used
-# verbatim by several architectures.
-#
-# This Makefile reads the file arch/$(SRCARCH)/include/(uapi/)/asm/Kbuild
-# and for each file listed in this file with generic-y creates
-# a small wrapper file in arch/$(SRCARCH)/include/generated/(uapi/)/asm.
-
-PHONY := all
-all:
-
-src := $(srctree)/$(subst /generated,,$(obj))
-
-include $(srctree)/scripts/Kbuild.include
--include $(kbuild-file)
-
-# $(generic)/Kbuild lists mandatory-y. Exclude um since it is a special case.
-ifneq ($(SRCARCH),um)
-include $(srctree)/$(generic)/Kbuild
-endif
-
-redundant := $(filter $(mandatory-y) $(generated-y), $(generic-y))
-redundant += $(foreach f, $(generic-y), $(if $(wildcard $(src)/$(f)),$(f)))
-redundant := $(sort $(redundant))
-$(if $(redundant),\
-	$(warning redundant generic-y found in $(src)/Kbuild: $(redundant)))
-
-# If arch does not implement mandatory headers, fallback to asm-generic ones.
-mandatory-y := $(filter-out $(generated-y), $(mandatory-y))
-generic-y   += $(foreach f, $(mandatory-y), $(if $(wildcard $(src)/$(f)),,$(f)))
-
-generic-y   := $(addprefix $(obj)/, $(generic-y))
-generated-y := $(addprefix $(obj)/, $(generated-y))
-
-# Remove stale wrappers when the corresponding files are removed from generic-y
-old-headers := $(wildcard $(obj)/*.h)
-unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
-
-quiet_cmd_wrap = WRAP    $@
-      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
-
-quiet_cmd_remove = REMOVE  $(unwanted)
-      cmd_remove = rm -f $(unwanted)
-
-all: $(generic-y)
-	$(if $(unwanted),$(call cmd,remove))
-	@:
-
-$(obj)/%.h: $(srctree)/$(generic)/%.h
-	$(call cmd,wrap)
-
-# Create output directory. Skip it if at least one old header exists
-# since we know the output directory already exists.
-ifeq ($(old-headers),)
-$(shell mkdir -p $(obj))
-endif
-
-.PHONY: $(PHONY)
diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
new file mode 100644
index 000000000000..6b8e8318e810
--- /dev/null
+++ b/scripts/Makefile.asm-headers
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0
+# include/asm-generic contains a lot of files that are used
+# verbatim by several architectures.
+#
+# This Makefile generates arch/$(SRCARCH)/include/generated/(uapi/)/asm
+# headers from multiple sources:
+#  - a small wrapper to include the corresponding asm-generic/*.h
+#    is generated for each file listed as generic-y
+#  - uapi/asm/unistd_*.h files listed as syscalls-y are generated from
+#    syscall.tbl with the __NR_* macros
+#  - Corresponding asm/syscall_table_*.h are generated from the same input
+
+PHONY := all
+all:
+
+src := $(srctree)/$(subst /generated,,$(obj))
+
+syscall_abis_32  += common,32
+syscall_abis_64  += common,64
+syscalltbl := $(srctree)/scripts/syscall.tbl
+syshdr-args := --emit-nr
+
+# let architectures override $(syscall_abis_%) and $(syscalltbl)
+-include $(srctree)/arch/$(SRCARCH)/kernel/Makefile.syscalls
+include $(srctree)/scripts/Kbuild.include
+-include $(kbuild-file)
+
+syshdr := $(srctree)/scripts/syscallhdr.sh
+systbl := $(srctree)/scripts/syscalltbl.sh
+
+# $(generic)/Kbuild lists mandatory-y. Exclude um since it is a special case.
+ifneq ($(SRCARCH),um)
+include $(srctree)/$(generic)/Kbuild
+endif
+
+redundant := $(filter $(mandatory-y) $(generated-y), $(generic-y))
+redundant += $(foreach f, $(generic-y), $(if $(wildcard $(src)/$(f)),$(f)))
+redundant := $(sort $(redundant))
+$(if $(redundant),\
+	$(warning redundant generic-y found in $(src)/Kbuild: $(redundant)))
+
+# If arch does not implement mandatory headers, fallback to asm-generic ones.
+mandatory-y := $(filter-out $(generated-y), $(mandatory-y))
+generic-y   += $(foreach f, $(mandatory-y), $(if $(wildcard $(src)/$(f)),,$(f)))
+
+generic-y   := $(addprefix $(obj)/, $(generic-y))
+syscall-y   := $(addprefix $(obj)/, $(syscall-y))
+generated-y := $(addprefix $(obj)/, $(generated-y))
+
+# Remove stale wrappers when the corresponding files are removed from generic-y
+old-headers := $(wildcard $(obj)/*.h)
+unwanted    := $(filter-out $(generic-y) $(generated-y) $(syscall-y),$(old-headers))
+
+quiet_cmd_wrap = WRAP    $@
+      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
+
+quiet_cmd_remove = REMOVE  $(unwanted)
+      cmd_remove = rm -f $(unwanted)
+
+quiet_cmd_syshdr = SYSHDR  $@
+      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) \
+		   $(if $(syshdr-args-$*),$(syshdr-args-$*),$(syshdr-args)) \
+		   $(if $(syscall_compat),--prefix "compat$*_") \
+		   --abis $(subst $(space),$(comma),$(strip $(syscall_abis_$*))) \
+		   $< $@
+
+quiet_cmd_systbl = SYSTBL  $@
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) \
+		   $(if $(systbl-args-$*),$(systbl-args-$*),$(systbl-args)) \
+		   --abis $(subst $(space),$(comma),$(strip $(syscall_abis_$*))) \
+		   $< $@
+
+all: $(generic-y) $(syscall-y)
+	$(if $(unwanted),$(call cmd,remove))
+	@:
+
+$(obj)/%.h: $(srctree)/$(generic)/%.h
+	$(call cmd,wrap)
+
+$(obj)/unistd_%.h: $(syscalltbl) $(syshdr) FORCE
+	$(call if_changed,syshdr)
+
+$(obj)/unistd_compat_%.h: syscall_compat:=1
+$(obj)/unistd_compat_%.h: $(syscalltbl) $(syshdr) FORCE
+	$(call if_changed,syshdr)
+
+$(obj)/syscall_table_%.h: $(syscalltbl) $(systbl) FORCE
+	$(call if_changed,systbl)
+
+# Create output directory. Skip it if at least one old header exists
+# since we know the output directory already exists.
+ifeq ($(old-headers),)
+$(shell mkdir -p $(obj))
+endif
+
+FORCE:
+
+.PHONY: $(PHONY)
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
