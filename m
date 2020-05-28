Return-Path: <SRS0=radI=7K=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69082C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 May 2020 19:44:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A272078C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 May 2020 19:44:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TiVcAxoU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ceYSo+gi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33A272078C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZmkoVJBAjcycmzleCXyat0H0Ds1uelJxZMNhYVKbsPI=; b=TiVcAxoUa6dOoU
	IzwGjlitNZ6kb3ClurEgbg43wdcmD8MaQNYbBRHBPj9zubvs3BCPcUf0ZHy9CjE7db/mCbINyrZlX
	Hk8XGDtO0YLgO+HN6IoD4IZgRoIFDo0UjqRvyJ9+dPQGANP8qNNQlE6B3NyavNAdJaExjSkAASGPt
	2kAl1F7iA4u5PBN9N/ZGmewIKqJwkhg+UZFnGZO63FXTF+R1gn7bNT/GG7XYt+vim1UFjUTsenMPH
	5xr54jbneWMUnnGD0k3l2iHLnXghSbFqsFEvFQd4AwI8HzUUhzySxChwnD+F/4hjuMQlnkh7FDKCd
	eq/ibGgXjftSzeSKhH9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeORj-0001QV-FI; Thu, 28 May 2020 19:44:07 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeORg-0001Pr-A7
 for linux-snps-arc@lists.infradead.org; Thu, 28 May 2020 19:44:05 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D3D3EC03BF;
 Thu, 28 May 2020 19:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590695041; bh=/hoeVq0YrRMcvb7Rjn9k4KyM/xpTkw+Q20U1LgWUXtw=;
 h=From:To:Cc:Subject:Date:From;
 b=ceYSo+giitDVKDAVo+qtJxkYwMGpfjmAl473Bblopj+MuDePXUzwq6cRHzNEYPJR/
 8oHvPoKPFrmt3DbgjAnaGHIUfaTGvdVR4wR7ZQ8lw+VouAnNw3thprfmaecGByfd4S
 Ez/cmyUhLAogQxu8SNWfZZvdFu/oFU5Eb8yZXjwn6ZL1t828A8UOYG6/7gtlNwAuku
 VDobujDewd/rHX/Fd9ZJxNBnSp+kDQ+PKFQ7GzupEOWfOJGPVqfcXC4/QzWsBfqSVJ
 V0G9AxLAa9thi+0EHbOtmYOT0eDzwe2MRExbWefGsJ3UqkSHZPweuD/BAD1NamSSpg
 ZBr6RX7LLCQ1w==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 0C040A009C;
 Thu, 28 May 2020 19:43:56 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH] dl-runtime: reloc_{offset,
 index} now functions arch overide'able
Date: Thu, 28 May 2020 12:43:45 -0700
Message-Id: <20200528194345.9829-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_124404_419358_615E1B46 
X-CRM114-Status: GOOD (  15.48  )
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
 linux-snps-arc@lists.infradead.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The existing macros are fragile and expect local variables with a
certain name. Fix this by defining them as functions with defaul
timplementation in a new header dl-runtime.h which arches can overrid
eif need be.

This came up during ARC port review.

This patch potentially only affects hppa/x86 ports,
build tested for both those configs and a few more.

Suggested-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
---
 elf/dl-runtime.c                              | 24 +++++++-------
 elf/dl-runtime.h                              | 30 ++++++++++++++++++
 sysdeps/hppa/dl-runtime.c                     |  4 ---
 sysdeps/hppa/dl-runtime.h                     | 31 +++++++++++++++++++
 sysdeps/x86_64/{dl-runtime.c => dl-runtime.h} | 13 ++++++--
 5 files changed, 84 insertions(+), 18 deletions(-)
 create mode 100644 elf/dl-runtime.h
 create mode 100644 sysdeps/hppa/dl-runtime.h
 rename sysdeps/x86_64/{dl-runtime.c => dl-runtime.h} (60%)

diff --git a/elf/dl-runtime.c b/elf/dl-runtime.c
index cf5f1d3e82e1..62f90579370b 100644
--- a/elf/dl-runtime.c
+++ b/elf/dl-runtime.c
@@ -27,6 +27,7 @@
 #include "dynamic-link.h"
 #include <tls.h>
 #include <dl-irel.h>
+#include <dl-runtime.h>
 
 
 #if (!ELF_MACHINE_NO_RELA && !defined ELF_MACHINE_PLT_REL) \
@@ -42,13 +43,6 @@
 # define ARCH_FIXUP_ATTRIBUTE
 #endif
 
-#ifndef reloc_offset
-# define reloc_offset reloc_arg
-# define reloc_index  reloc_arg / sizeof (PLTREL)
-#endif
-
-
-
 /* This function is called through a special trampoline from the PLT the
    first time each PLT entry is called.  We must perform the relocation
    specified in the PLT of the given shared object, and return the resolved
@@ -68,8 +62,11 @@ _dl_fixup (
     = (const void *) D_PTR (l, l_info[DT_SYMTAB]);
   const char *strtab = (const void *) D_PTR (l, l_info[DT_STRTAB]);
 
+  const uintptr_t pltgot = (uintptr_t) D_PTR (l, l_info[DT_PLTGOT]);
+
   const PLTREL *const reloc
-    = (const void *) (D_PTR (l, l_info[DT_JMPREL]) + reloc_offset);
+    = (const void *) (D_PTR (l, l_info[DT_JMPREL])
+		      + reloc_offset (pltgot, reloc_arg));
   const ElfW(Sym) *sym = &symtab[ELFW(R_SYM) (reloc->r_info)];
   const ElfW(Sym) *refsym = sym;
   void *const rel_addr = (void *)(l->l_addr + reloc->r_offset);
@@ -182,7 +179,8 @@ _dl_profile_fixup (
 
   /* This is the address in the array where we store the result of previous
      relocations.  */
-  struct reloc_result *reloc_result = &l->l_reloc_result[reloc_index];
+  struct reloc_result *reloc_result
+    = &l->l_reloc_result[reloc_index (reloc_arg, sizeof (PLTREL))];
 
  /* CONCURRENCY NOTES:
 
@@ -219,8 +217,11 @@ _dl_profile_fixup (
 	= (const void *) D_PTR (l, l_info[DT_SYMTAB]);
       const char *strtab = (const char *) D_PTR (l, l_info[DT_STRTAB]);
 
+      const uintptr_t pltgot = (uintptr_t) D_PTR (l, l_info[DT_PLTGOT]);
+
       const PLTREL *const reloc
-	= (const void *) (D_PTR (l, l_info[DT_JMPREL]) + reloc_offset);
+	= (const void *) (D_PTR (l, l_info[DT_JMPREL])
+			  + reloc_offset (pltgot, reloc_arg));
       const ElfW(Sym) *refsym = &symtab[ELFW(R_SYM) (reloc->r_info)];
       const ElfW(Sym) *defsym = refsym;
       lookup_t result;
@@ -489,7 +490,8 @@ _dl_call_pltexit (struct link_map *l, ElfW(Word) reloc_arg,
      relocations.  */
   // XXX Maybe the bound information must be stored on the stack since
   // XXX with bind_not a new value could have been stored in the meantime.
-  struct reloc_result *reloc_result = &l->l_reloc_result[reloc_index];
+  struct reloc_result *reloc_result =
+    &l->l_reloc_result[reloc_index (reloc_arg, sizeof (PLTREL))];
   ElfW(Sym) *defsym = ((ElfW(Sym) *) D_PTR (reloc_result->bound,
 					    l_info[DT_SYMTAB])
 		       + reloc_result->boundndx);
diff --git a/elf/dl-runtime.h b/elf/dl-runtime.h
new file mode 100644
index 000000000000..ed5db3ba51b7
--- /dev/null
+++ b/elf/dl-runtime.h
@@ -0,0 +1,30 @@
+/* Helpers for On-demand PLT fixup for shared objects, Generic version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+static inline uintptr_t
+reloc_offset (uintptr_t plt0, uintptr_t pltn)
+{
+  return pltn;
+}
+
+static inline uintptr_t
+reloc_index (uintptr_t pltn, size_t size)
+{
+  return pltn / size;
+}
diff --git a/sysdeps/hppa/dl-runtime.c b/sysdeps/hppa/dl-runtime.c
index 885a3f1837cb..2d061b150f06 100644
--- a/sysdeps/hppa/dl-runtime.c
+++ b/sysdeps/hppa/dl-runtime.c
@@ -17,10 +17,6 @@
    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
    02111-1307 USA.  */
 
-/* Clear PA_GP_RELOC bit in relocation offset.  */
-#define reloc_offset (reloc_arg & ~PA_GP_RELOC)
-#define reloc_index  (reloc_arg & ~PA_GP_RELOC) / sizeof (PLTREL)
-
 #include <elf/dl-runtime.c>
 
 /* The caller has encountered a partially relocated function descriptor.
diff --git a/sysdeps/hppa/dl-runtime.h b/sysdeps/hppa/dl-runtime.h
new file mode 100644
index 000000000000..cfde0ec991e3
--- /dev/null
+++ b/sysdeps/hppa/dl-runtime.h
@@ -0,0 +1,31 @@
+/* Helpers for On-demand PLT fixup for shared objects, HPAA version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, write to the Free
+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+   02111-1307 USA.  */
+
+/* Clear PA_GP_RELOC bit in relocation offset.  */
+static inline uintptr_t
+reloc_offset (uintptr_t plt0, uintptr_t pltn)
+{
+  return pltn & ~PA_GP_RELOC;
+}
+
+static inline uintptr_t
+reloc_index (uintptr_t pltn, size_t size)
+{
+  return (pltn & ~PA_GP_RELOC )/ size;
+}
diff --git a/sysdeps/x86_64/dl-runtime.c b/sysdeps/x86_64/dl-runtime.h
similarity index 60%
rename from sysdeps/x86_64/dl-runtime.c
rename to sysdeps/x86_64/dl-runtime.h
index b625d1e88257..494ff47b7091 100644
--- a/sysdeps/x86_64/dl-runtime.c
+++ b/sysdeps/x86_64/dl-runtime.h
@@ -3,7 +3,14 @@
    also use the index.  Therefore it is wasteful to compute the offset
    in the trampoline just to reverse the operation immediately
    afterwards.  */
-#define reloc_offset reloc_arg * sizeof (PLTREL)
-#define reloc_index  reloc_arg
+static inline uintptr_t
+reloc_offset (uintptr_t plt0, uintptr_t pltn)
+{
+  return pltn * sizeof (ElfW(Rela));
+}
 
-#include <elf/dl-runtime.c>
+static inline uintptr_t
+reloc_index (uintptr_t pltn, size_t size)
+{
+  return pltn;
+}
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
