Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698BFCD4F4C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSXGEh35xiYlImBtgrks/JNLdYNOnPTQ2BbOqjRzagI=; b=1iz8O7tCEUfIYE
	1s9bv6fPCN0qMO4t1knuNizNMy8H0e16r0VkqQEw09hbKPc5ZtMTh4xvicaEbS2NmGYgytsxh8UKN
	DT4dlFuT2cunYcmjCSd8TzFAaMp1Y8YzfMkrC7iZ/i0DhuMcVhCniVidW50ERrOPm1lU18Im5vrmp
	dgMT3PRkhrAVXmV0RLW+Tg98P2Z3i1Hp0J387N0hKy7ZWJxsorMp7jXKztDcV2zFCLUca/vQnjhwZ
	EzLBcBOCICeMCajiuTtdN1B4zyhTt1mYl6bHl5Mv+Zhh2AqxMHKJ3r2JFs2tsmP/yowpBsr6e0oMd
	jyWTUftQIGBUBQjJMdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjb-00000006Om1-0A7F;
	Wed, 04 Sep 2024 23:48:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjX-00000006OkN-1q8m
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06157A41DF8;
	Wed,  4 Sep 2024 23:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2E2C4CEC8;
	Wed,  4 Sep 2024 23:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493697;
	bh=psn2cg3kyw66zSxZb5tD/YEWBmfy/XReWDQ1aOqEAdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCDqdtEb/NRkunhEP8DfaaSic38AIyn8tNJ2rLGAKtUyPyXxqKtGYCgxwgpKxaiLS
	 HIbtbeyaKVWTHHR0C/Jku8elOT85u3lG57cZVIW23PluRNVRjG7sSjOCNxb6eA9H/E
	 QNu1ebIEh/3Y6kyQLG22BvnXnyvX+euseFrhJFKs4ofAOsVbfrlZKTeM4HHrvGu3Om
	 3k1NHmeefVxzVwcmok8JUFSRutb9vLQCdpUL/Ruriq6H9KNLdEUS8/WEKlBx81mojx
	 DRVROamh1TBiv44Tp/PYfRYappZ56LNg0Vi7DD9f5LoUU8RC5gxVUz4N0Lt/EBvCK7
	 AwGYysqRHHZ+A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/15] kbuild: split device tree build rules into scripts/Makefile.dtbs
Date: Thu,  5 Sep 2024 08:47:38 +0900
Message-ID: <20240904234803.698424-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164819_637307_10BB15D2 
X-CRM114-Status: GOOD (  21.08  )
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

scripts/Makefile.lib is included not only from scripts/Makefile.build
but also from scripts/Makefile.{modfinal,package,vmlinux,vmlinux_o},
where DT build rules are not required.

Split the DT build rules out to scripts/Makefile.dtbs, and include it
only when necessary.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/of/fdt.c       |   2 +-
 drivers/of/unittest.c  |   4 +-
 scripts/Makefile.build |  25 +++-----
 scripts/Makefile.dtbs  | 142 +++++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.lib   | 115 ---------------------------------
 5 files changed, 153 insertions(+), 135 deletions(-)
 create mode 100644 scripts/Makefile.dtbs

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 68103ad230ee..4d528c10df3a 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -34,7 +34,7 @@
 
 /*
  * __dtb_empty_root_begin[] and __dtb_empty_root_end[] magically created by
- * cmd_dt_S_dtb in scripts/Makefile.lib
+ * cmd_wrap_S_dtb in scripts/Makefile.dtbs
  */
 extern uint8_t __dtb_empty_root_begin[];
 extern uint8_t __dtb_empty_root_end[];
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index c830f346df45..fd8cb931b1cc 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1861,7 +1861,7 @@ static int __init unittest_data_add(void)
 	struct device_node *unittest_data_node = NULL, *np;
 	/*
 	 * __dtbo_testcases_begin[] and __dtbo_testcases_end[] are magically
-	 * created by cmd_dt_S_dtbo in scripts/Makefile.lib
+	 * created by cmd_wrap_S_dtbo in scripts/Makefile.dtbs
 	 */
 	extern uint8_t __dtbo_testcases_begin[];
 	extern uint8_t __dtbo_testcases_end[];
@@ -3525,7 +3525,7 @@ static void __init of_unittest_lifecycle(void)
 
 /*
  * __dtbo_##overlay_name##_begin[] and __dtbo_##overlay_name##_end[] are
- * created by cmd_dt_S_dtbo in scripts/Makefile.lib
+ * created by cmd_wrap_S_dtbo in scripts/Makefile.dtbs
  */
 
 #define OVERLAY_INFO_EXTERN(overlay_name) \
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4b6942653093..6385e7aa5dbb 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -57,7 +57,6 @@ endif
 # subdir-builtin and subdir-modorder may contain duplications. Use $(sort ...)
 subdir-builtin := $(sort $(filter %/built-in.a, $(real-obj-y)))
 subdir-modorder := $(sort $(filter %/modules.order, $(obj-m)))
-subdir-dtbslist := $(sort $(filter %/dtbs-list, $(dtb-y)))
 
 targets-for-builtin := $(extra-y)
 
@@ -349,7 +348,7 @@ $(obj)/%.o: $(obj)/%.S FORCE
 
 targets += $(filter-out $(subdir-builtin), $(real-obj-y))
 targets += $(filter-out $(subdir-modorder), $(real-obj-m))
-targets += $(real-dtb-y) $(lib-y) $(always-y)
+targets += $(lib-y) $(always-y)
 
 # Linker scripts preprocessor (.lds.S -> .lds)
 # ---------------------------------------------------------------------------
@@ -375,7 +374,6 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
 # To build objects in subdirs, we need to descend into the directories
 $(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
 $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
-$(subdir-dtbslist): $(obj)/%/dtbs-list: $(obj)/% ;
 
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
@@ -391,12 +389,8 @@ quiet_cmd_ar_builtin = AR      $@
 $(obj)/built-in.a: $(real-obj-y) FORCE
 	$(call if_changed,ar_builtin)
 
-#
-# Rule to create modules.order and dtbs-list
-#
-# This is a list of build artifacts (module or dtb) from the current Makefile
-# and its sub-directories. The timestamp should be updated when any of the
-# member files.
+# This is a list of build artifacts from the current Makefile and its
+# sub-directories. The timestamp should be updated when any of the member files.
 
 cmd_gen_order = { $(foreach m, $(real-prereqs), \
 	$(if $(filter %/$(notdir $@), $m), cat $m, echo $m);) :; } \
@@ -405,9 +399,6 @@ cmd_gen_order = { $(foreach m, $(real-prereqs), \
 $(obj)/modules.order: $(obj-m) FORCE
 	$(call if_changed,gen_order)
 
-$(obj)/dtbs-list: $(dtb-y) FORCE
-	$(call if_changed,gen_order)
-
 #
 # Rule to compile a set of .o files into one .a file (with symbol table)
 #
@@ -436,11 +427,7 @@ intermediate_targets = $(foreach sfx, $(2), \
 				$(patsubst %$(strip $(1)),%$(sfx), \
 					$(filter %$(strip $(1)), $(targets))))
 # %.asn1.o <- %.asn1.[ch] <- %.asn1
-# %.dtb.o <- %.dtb.S <- %.dtb <- %.dts
-# %.dtbo.o <- %.dtbo.S <- %.dtbo <- %.dtso
-targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
-	   $(call intermediate_targets, .dtb.o, .dtb.S .dtb) \
-	   $(call intermediate_targets, .dtbo.o, .dtbo.S .dtbo)
+targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h)
 
 # Include additional build rules when necessary
 # ---------------------------------------------------------------------------
@@ -457,6 +444,10 @@ ifneq ($(userprogs),)
 include $(srctree)/scripts/Makefile.userprogs
 endif
 
+ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb.o %.dtbo.o,$(targets)),)
+include $(srctree)/scripts/Makefile.dtbs
+endif
+
 # Build
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
new file mode 100644
index 000000000000..46009d5f1486
--- /dev/null
+++ b/scripts/Makefile.dtbs
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
+dtb-$(CONFIG_OF_ALL_DTBS) += $(dtb-)
+
+# Composite DTB (i.e. DTB constructed by overlay)
+multi-dtb-y := $(call multi-search, $(dtb-y), .dtb, -dtbs)
+# Primitive DTB compiled from *.dts
+real-dtb-y := $(call real-search, $(dtb-y), .dtb, -dtbs)
+# Base DTB that overlay is applied onto
+base-dtb-y := $(filter %.dtb, $(call real-search, $(multi-dtb-y), .dtb, -dtbs))
+
+dtb-y           := $(addprefix $(obj)/, $(dtb-y))
+multi-dtb-y     := $(addprefix $(obj)/, $(multi-dtb-y))
+real-dtb-y      := $(addprefix $(obj)/, $(real-dtb-y))
+
+always-y        += $(dtb-y)
+targets         += $(real-dtb-y)
+
+# dtbs-list
+# ---------------------------------------------------------------------------
+
+ifdef need-dtbslist
+subdir-dtbslist := $(addsuffix /dtbs-list, $(subdir-ym))
+dtb-y           += $(subdir-dtbslist)
+always-y        += $(obj)/dtbs-list
+endif
+
+$(subdir-dtbslist): $(obj)/%/dtbs-list: $(obj)/% ;
+
+$(obj)/dtbs-list: $(dtb-y) FORCE
+	$(call if_changed,gen_order)
+
+# Assembly file to wrap dtb(o)
+# ---------------------------------------------------------------------------
+
+# Generate an assembly file to wrap the output of the device tree compiler
+quiet_cmd_wrap_S_dtb = WRAP    $@
+      cmd_wrap_S_dtb = {								\
+		symbase=__$(patsubst .%,%,$(suffix $<))_$(subst -,_,$(notdir $*));	\
+		echo '\#include <asm-generic/vmlinux.lds.h>';				\
+		echo '.section .dtb.init.rodata,"a"';					\
+		echo '.balign STRUCT_ALIGNMENT';					\
+		echo ".global $${symbase}_begin";					\
+		echo "$${symbase}_begin:";						\
+		echo '.incbin "$<" ';							\
+		echo ".global $${symbase}_end";						\
+		echo "$${symbase}_end:";						\
+		echo '.balign STRUCT_ALIGNMENT';					\
+	} > $@
+
+$(obj)/%.dtb.S: $(obj)/%.dtb FORCE
+	$(call if_changed,wrap_S_dtb)
+
+$(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
+	$(call if_changed,wrap_S_dtb)
+
+# Schema check
+# ---------------------------------------------------------------------------
+
+ifneq ($(CHECK_DTBS),)
+DT_CHECKER ?= dt-validate
+DT_CHECKER_FLAGS ?= $(if $(DT_SCHEMA_FILES),-l $(DT_SCHEMA_FILES),-m)
+DT_BINDING_DIR := Documentation/devicetree/bindings
+DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
+dtb-check-enabled = $(if $(filter %.dtb, $@),y)
+endif
+
+quiet_dtb_check_tag = $(if $(dtb-check-enabled),[C],   )
+cmd_dtb_check = $(if $(dtb-check-enabled),; $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true)
+
+# Overlay
+# ---------------------------------------------------------------------------
+
+# NOTE:
+# Do not replace $(filter %.dtb %.dtbo, $^) with $(real-prereqs). When a single
+# DTB is turned into a multi-blob DTB, $^ will contain header file dependencies
+# recorded in the .*.cmd file.
+quiet_cmd_fdtoverlay = OVL $(quiet_dtb_check_tag) $@
+      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^) $(cmd_dtb_check)
+
+$(multi-dtb-y): $(DT_TMP_SCHEMA) FORCE
+	$(call if_changed,fdtoverlay)
+$(call multi_depend, $(multi-dtb-y), .dtb, -dtbs)
+
+# DTC
+# ---------------------------------------------------------------------------
+
+DTC ?= $(objtree)/scripts/dtc/dtc
+DTC_FLAGS += -Wno-unique_unit_address
+
+# Disable noisy checks by default
+ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
+DTC_FLAGS += -Wno-unit_address_vs_reg \
+             -Wno-avoid_unnecessary_addr_size \
+             -Wno-alias_paths \
+             -Wno-graph_child_address \
+             -Wno-simple_bus_reg
+else
+DTC_FLAGS += -Wunique_unit_address_if_enabled
+endif
+
+ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
+DTC_FLAGS += -Wnode_name_chars_strict \
+             -Wproperty_name_chars_strict \
+             -Wunique_unit_address
+endif
+
+DTC_FLAGS += $(DTC_FLAGS_$(target-stem))
+
+# Set -@ if the target is a base DTB that overlay is applied onto
+DTC_FLAGS += $(if $(filter $(patsubst $(obj)/%,%,$@), $(base-dtb-y)), -@)
+
+DTC_INCLUDE := $(srctree)/scripts/dtc/include-prefixes
+
+dtc_cpp_flags = -Wp,-MMD,$(depfile).pre.tmp -nostdinc -I $(DTC_INCLUDE) -undef -D__DTS__
+
+dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
+
+quiet_cmd_dtc = DTC $(quiet_dtb_check_tag) $@
+      cmd_dtc = \
+	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
+	$(DTC) -o $@ -b 0 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) \
+	       $(DTC_FLAGS) -d $(depfile).dtc.tmp $(dtc-tmp) ; \
+	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile) \
+	$(cmd_dtb_check)
+
+$(obj)/%.dtb: $(obj)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
+	$(call if_changed_dep,dtc)
+
+$(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
+	$(call if_changed_dep,dtc)
+
+# targets
+# ---------------------------------------------------------------------------
+
+targets += $(always-y)
+
+# %.dtb.o <- %.dtb.S <- %.dtb <- %.dts
+# %.dtbo.o <- %.dtbo.S <- %.dtbo <- %.dtso
+targets += $(call intermediate_targets, .dtb.o, .dtb.S .dtb) \
+           $(call intermediate_targets, .dtbo.o, .dtbo.S .dtbo)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 207325eaf1d1..4fea9e9bec3c 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -45,11 +45,6 @@ else
 obj-y		:= $(filter-out %/, $(obj-y))
 endif
 
-ifdef need-dtbslist
-dtb-y		+= $(addsuffix /dtbs-list, $(subdir-ym))
-always-y	+= dtbs-list
-endif
-
 # Expand $(foo-objs) $(foo-y) etc. by replacing their individuals
 suffix-search = $(strip $(foreach s, $3, $($(1:%$(strip $2)=%$s))))
 # List composite targets that are constructed by combining other targets
@@ -80,19 +75,6 @@ always-y += $(hostprogs-always-y) $(hostprogs-always-m)
 userprogs += $(userprogs-always-y) $(userprogs-always-m)
 always-y += $(userprogs-always-y) $(userprogs-always-m)
 
-# DTB
-# If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
-dtb-$(CONFIG_OF_ALL_DTBS)       += $(dtb-)
-
-# Composite DTB (i.e. DTB constructed by overlay)
-multi-dtb-y := $(call multi-search, $(dtb-y), .dtb, -dtbs)
-# Primitive DTB compiled from *.dts
-real-dtb-y := $(call real-search, $(dtb-y), .dtb, -dtbs)
-# Base DTB that overlay is applied onto
-base-dtb-y := $(filter %.dtb, $(call real-search, $(multi-dtb-y), .dtb, -dtbs))
-
-always-y			+= $(dtb-y)
-
 # Add subdir path
 
 ifneq ($(obj),.)
@@ -104,9 +86,6 @@ lib-y		:= $(addprefix $(obj)/,$(lib-y))
 real-obj-y	:= $(addprefix $(obj)/,$(real-obj-y))
 real-obj-m	:= $(addprefix $(obj)/,$(real-obj-m))
 multi-obj-m	:= $(addprefix $(obj)/, $(multi-obj-m))
-dtb-y		:= $(addprefix $(obj)/, $(dtb-y))
-multi-dtb-y	:= $(addprefix $(obj)/, $(multi-dtb-y))
-real-dtb-y	:= $(addprefix $(obj)/, $(real-dtb-y))
 subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
 endif
 
@@ -255,12 +234,6 @@ cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 
 ld_flags       = $(KBUILD_LDFLAGS) $(ldflags-y) $(LDFLAGS_$(@F))
 
-DTC_INCLUDE    := $(srctree)/scripts/dtc/include-prefixes
-
-dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
-		 $(addprefix -I,$(DTC_INCLUDE))                          \
-		 -undef -D__DTS__
-
 ifdef CONFIG_OBJTOOL
 
 objtool := $(objtree)/tools/objtool/objtool
@@ -350,94 +323,6 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 quiet_cmd_gzip = GZIP    $@
       cmd_gzip = cat $(real-prereqs) | $(KGZIP) -n -f -9 > $@
 
-# DTC
-# ---------------------------------------------------------------------------
-DTC ?= $(objtree)/scripts/dtc/dtc
-DTC_FLAGS += \
-	-Wno-unique_unit_address
-
-# Disable noisy checks by default
-ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
-DTC_FLAGS += -Wno-unit_address_vs_reg \
-	-Wno-avoid_unnecessary_addr_size \
-	-Wno-alias_paths \
-	-Wno-graph_child_address \
-	-Wno-simple_bus_reg
-else
-DTC_FLAGS += \
-        -Wunique_unit_address_if_enabled
-endif
-
-ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
-DTC_FLAGS += -Wnode_name_chars_strict \
-	-Wproperty_name_chars_strict \
-	-Wunique_unit_address
-endif
-
-DTC_FLAGS += $(DTC_FLAGS_$(target-stem))
-
-# Set -@ if the target is a base DTB that overlay is applied onto
-DTC_FLAGS += $(if $(filter $(patsubst $(obj)/%,%,$@), $(base-dtb-y)), -@)
-
-# Generate an assembly file to wrap the output of the device tree compiler
-quiet_cmd_wrap_S_dtb = WRAP    $@
-      cmd_wrap_S_dtb = {								\
-		symbase=__$(patsubst .%,%,$(suffix $<))_$(subst -,_,$(notdir $*));	\
-		echo '\#include <asm-generic/vmlinux.lds.h>';				\
-		echo '.section .dtb.init.rodata,"a"';					\
-		echo '.balign STRUCT_ALIGNMENT';					\
-		echo ".global $${symbase}_begin";					\
-		echo "$${symbase}_begin:";						\
-		echo '.incbin "$<" ';							\
-		echo ".global $${symbase}_end";						\
-		echo "$${symbase}_end:";						\
-		echo '.balign STRUCT_ALIGNMENT';					\
-	} > $@
-
-$(obj)/%.dtb.S: $(obj)/%.dtb FORCE
-	$(call if_changed,wrap_S_dtb)
-
-$(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
-	$(call if_changed,wrap_S_dtb)
-
-quiet_dtb_check_tag = $(if $(dtb-check-enabled),[C],   )
-cmd_dtb_check = $(if $(dtb-check-enabled),; $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true)
-
-quiet_cmd_dtc = DTC $(quiet_dtb_check_tag) $@
-cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-	$(DTC) -o $@ -b 0 \
-		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
-		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
-	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile) \
-	$(cmd_dtb_check)
-
-# NOTE:
-# Do not replace $(filter %.dtb %.dtbo, $^) with $(real-prereqs). When a single
-# DTB is turned into a multi-blob DTB, $^ will contain header file dependencies
-# recorded in the .*.cmd file.
-quiet_cmd_fdtoverlay = OVL $(quiet_dtb_check_tag) $@
-      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^) $(cmd_dtb_check)
-
-$(multi-dtb-y): FORCE
-	$(call if_changed,fdtoverlay)
-$(call multi_depend, $(multi-dtb-y), .dtb, -dtbs)
-
-ifneq ($(CHECK_DTBS),)
-DT_CHECKER ?= dt-validate
-DT_CHECKER_FLAGS ?= $(if $(DT_SCHEMA_FILES),-l $(DT_SCHEMA_FILES),-m)
-DT_BINDING_DIR := Documentation/devicetree/bindings
-DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
-dtb-check-enabled = $(if $(filter %.dtb, $@),y)
-endif
-
-$(obj)/%.dtb: $(obj)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
-	$(call if_changed_dep,dtc)
-
-$(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
-	$(call if_changed_dep,dtc)
-
-dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
-
 # Bzip2
 # ---------------------------------------------------------------------------
 
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
