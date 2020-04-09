Return-Path: <SRS0=Kc19=5Z=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A172C2BB55
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Apr 2020 02:56:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4401E20757
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Apr 2020 02:56:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m7dFxEvb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HY0lf0Hc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4401E20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5hh7xhvh3xgaGuUD10NfMnZNfnwpsv0b3CKOb2hWs9I=; b=m7dFxEvbY9Ho34
	kfRnElx+eLJpd7YQ3ipB/ygFk2ZSxVer+PqczxGYCpy+bitFMVS2pf8hgKPFnB9wjKbtkFgd+krhU
	V5oC/DYoFcQY+yxyA9iFBkNILkwxNmMVrJ8/9nf0eyzKUiWoch48PjWWHcmba16oPE09DSIL1seu6
	3BjX5cm4xVz1UamUGCDXNCPaIDO11/BXGbd6IqExY3mcZh2h7yN+V6RNCpcaJiDG/EzPOdRVCKdCM
	QJrOFwQw8C91jhSq6jLMjNsdKRaN5rNofWXZWnudylH38YL3FiMBGsOJh/CxCjDP5BoBeW88E7Qe8
	OjiGyNyWcC7EaPW/ioCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMNMz-0005ep-Ba; Thu, 09 Apr 2020 02:56:45 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMNMq-0005Yn-AR
 for linux-snps-arc@lists.infradead.org; Thu, 09 Apr 2020 02:56:41 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 36A78C00C7;
 Thu,  9 Apr 2020 02:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586400995; bh=lBfAsz9oNabN2c4AOoA9RgvLU675MTcn9/Oa/FIZS1o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HY0lf0Hc4FADmC8DKQo0tSmMpaMS5C6THDiAuCwZa3tSVERhF7e4iWHED2K/SWGQy
 F2AGN+E+rvi8qcxBlZXFkf9sliWvVY/W9pEto26Bw8sHgj8kj4YPtfyWRC/t1FZUfT
 z7SSKlsOsYRN1aS5EvKSoigivo5mmudCSqV2ru+YZvZP2uVCCHn6DPh4qlt0ZUE/qz
 rkBoLhyfuNLgeiRHE3zD4D0QMYCE3lq31TjkyotyZh/zU/yLHgwd6ORTWcH9pyJyHe
 P03dW8ns5WWU2lmwkr68dvU0OFrunCVFdUHOxBTsT/4hq4AOOzYLDXUTB1Qj2tgPEu
 x76KaNStJhDvA==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id DF04DA00C2;
 Thu,  9 Apr 2020 02:56:34 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v5 09/14] ARC: Linux Startup and Dynamic Loading
Date: Wed,  8 Apr 2020 19:56:10 -0700
Message-Id: <20200409025615.27003-10-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409025615.27003-1-vgupta@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_195636_448228_B66A2176 
X-CRM114-Status: GOOD (  15.66  )
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

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/unix/sysv/linux/arc/dl-static.c | 84 +++++++++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/ldsodefs.h  | 32 ++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 sysdeps/unix/sysv/linux/arc/dl-static.c
 create mode 100644 sysdeps/unix/sysv/linux/arc/ldsodefs.h

diff --git a/sysdeps/unix/sysv/linux/arc/dl-static.c b/sysdeps/unix/sysv/linux/arc/dl-static.c
new file mode 100644
index 000000000000..24c31b27fc11
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/dl-static.c
@@ -0,0 +1,84 @@
+/* Variable initialization.  ARC version.
+   Copyright (C) 2001-2020 Free Software Foundation, Inc.
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
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#include <ldsodefs.h>
+
+#ifdef SHARED
+
+void
+_dl_var_init (void *array[])
+{
+  /* It has to match "variables" below. */
+  enum
+    {
+      DL_PAGESIZE = 0
+    };
+
+  GLRO(dl_pagesize) = *((size_t *) array[DL_PAGESIZE]);
+}
+
+#else
+
+static void *variables[] =
+{
+  &GLRO(dl_pagesize)
+};
+
+static void
+_dl_unprotect_relro (struct link_map *l)
+{
+  ElfW(Addr) start = ((l->l_addr + l->l_relro_addr)
+		      & ~(GLRO(dl_pagesize) - 1));
+  ElfW(Addr) end = ((l->l_addr + l->l_relro_addr + l->l_relro_size)
+		    & ~(GLRO(dl_pagesize) - 1));
+
+  if (start != end)
+    __mprotect ((void *) start, end - start, PROT_READ | PROT_WRITE);
+}
+
+void
+_dl_static_init (struct link_map *l)
+{
+  struct link_map *rtld_map = l;
+  struct r_scope_elem **scope;
+  const ElfW(Sym) *ref = NULL;
+  lookup_t loadbase;
+  void (*f) (void *[]);
+  size_t i;
+
+  loadbase = _dl_lookup_symbol_x ("_dl_var_init", l, &ref, l->l_local_scope,
+				  NULL, 0, 1, NULL);
+
+  for (scope = l->l_local_scope; *scope != NULL; scope++)
+    for (i = 0; i < (*scope)->r_nlist; i++)
+      if ((*scope)->r_list[i] == loadbase)
+	{
+	  rtld_map = (*scope)->r_list[i];
+	  break;
+	}
+
+  if (ref != NULL)
+    {
+      f = (void (*) (void *[])) DL_SYMBOL_ADDRESS (loadbase, ref);
+      _dl_unprotect_relro (rtld_map);
+      f (variables);
+      _dl_protect_relro (rtld_map);
+    }
+}
+
+#endif
diff --git a/sysdeps/unix/sysv/linux/arc/ldsodefs.h b/sysdeps/unix/sysv/linux/arc/ldsodefs.h
new file mode 100644
index 000000000000..9eef836168be
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/ldsodefs.h
@@ -0,0 +1,32 @@
+/* Run-time dynamic linker data structures for loaded ELF shared objects. ARC
+   Copyright (C) 2001-2020 Free Software Foundation, Inc.
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
+   License along with the GNU C Library; if not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#ifndef	_LDSODEFS_H
+
+/* Get the real definitions.  */
+#include_next <ldsodefs.h>
+
+/* Now define our stuff.  */
+
+/* We need special support to initialize DSO loaded for statically linked
+   binaries.  */
+extern void _dl_static_init (struct link_map *map);
+#undef DL_STATIC_INIT
+#define DL_STATIC_INIT(map) _dl_static_init (map)
+
+#endif /* ldsodefs.h */
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
