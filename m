Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D17BC4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Dec 2022 12:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTXhyb5BhHWHS5YlYq6YhRBbTazuCqIeaRupPzsROHY=; b=21hTYz6CLdQ1sc
	EViICFWT3uwKAkCoTyba7C1pdSp4KGSBytGC27VEC/i44JFsgkHhpaGUjQG+0wpHAV6vMr1N8damH
	0DWtYBEEWxnbI3ZDz6pLKjLZxCIwh7k7lQaKJbBnhaMyGlvwDNB6hOH7NbTJeFu37EQ7KL5UqIOFr
	jCIvF/KmdWXzHTmoP7f9VbrqFdXMAtgtcMb10dW/oIEkWv4lWNpsImhgIohQAZlWqBeuX44moGdSh
	5Q4Hu2UiXxtVmyNWOaSssBzM++XtEIrPxKzAPADpF3sM+ZgNCVWVvEPaEBc64uBeXp1w5xOaA97Yr
	dr6hxpxnA54AZ98wtBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KbY-00BoXF-QQ; Thu, 22 Dec 2022 12:23:20 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K4X-00BWfl-4w; Thu, 22 Dec 2022 11:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709753; x=1703245753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tIRocWwFeyLnkMyWNI6V183GDJq3vxxO+e0RyrK1iBA=;
  b=dnRQbvgKFGhPswUk8vFkjePyZPKIVjSmtsVioD7FCUk26tE9tj0FC2al
   YC28XUfKFU64LaQThPC0EoGptZwVdCbTVxTTZgoaCMHRrBVaFJq9W26kP
   3xti6CpH2FSPNfSB3y/b5WMqCYCU07p7ZkqXraHIxZg7czoKodKVbFmPS
   zscAJVF+3fjgH51fnPwTnDgkW9J5WM7vadm+7f8x6ZuZ867zJN84jO2px
   +XFWiTNJowo1YqrDYfvS6A6M7zZjlOyIlKTkcvmzDCSjH6D/XqAMll3Bg
   jk/8p95GEznm0fyG1iy5+knk4J0rP+hFQDYc50iq24hUegZBGnsaOS7mV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804950"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804950"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:49:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504949"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504949"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:49:06 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 18/19] linux/include: add non-atomic version of xchg
Date: Thu, 22 Dec 2022 12:46:34 +0100
Message-Id: <20221222114635.1251934-19-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034913_588924_69E4B1D5 
X-CRM114-Status: GOOD (  11.58  )
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

The pattern of setting variable with new value and returning old
one is very common in kernel. Usually atomicity of the operation
is not required, so xchg seems to be suboptimal and confusing in
such cases.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 include/linux/non-atomic/xchg.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/linux/non-atomic/xchg.h

diff --git a/include/linux/non-atomic/xchg.h b/include/linux/non-atomic/xchg.h
new file mode 100644
index 00000000000000..f7fa5dd746f37d
--- /dev/null
+++ b/include/linux/non-atomic/xchg.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_NON_ATOMIC_XCHG_H
+#define _LINUX_NON_ATOMIC_XCHG_H
+
+/**
+ * __xchg - set variable pointed by @ptr to @val, return old value
+ * @ptr: pointer to affected variable
+ * @val: value to be written
+ *
+ * This is non-atomic variant of xchg.
+ */
+#define __xchg(ptr, val) ({		\
+	__auto_type __ptr = ptr;	\
+	__auto_type __t = *__ptr;	\
+	*__ptr = (val);			\
+	__t;				\
+})
+
+#endif
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
