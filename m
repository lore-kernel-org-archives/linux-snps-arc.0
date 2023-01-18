Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7493C38147
	for <linux-snps-arc@archiver.kernel.org>; Wed, 18 Jan 2023 15:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uV9sm9ugbDAL2KJhIxr5OK54ce2nx6/nB1I8Bi5VjMo=; b=issGQEyGWfvLl/
	MbIVbbYuTxn/S3KTk6Jp+tIjG76NflFS+owxFXmeLjnsWuSC4s1ezB7Jnq/A4z4KsRQ2sS6hBxHKx
	WPlT+iQVFj96p2LgJFT19Kq/thQztSk2fVQN+qhaW/6SZZPxu3t/GQKmTkTRUEmLdvEYuZvEPO0D7
	HlppNSvrxxzfi/OX6MM5Nb6KNAX44F+XLfM6GfM01AkSh4269fnQbbRGR5iXKnbZkn8iKEuITuTGe
	dpHIWpPaCz44Coq9Gw10vPyOFVd9LjNBlxYSg99T//gHdiWwz62aSe5WXd/X3YxPYXUs1PO6k1qCl
	1fwk8wDWhfflHar9Bm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAdq-001e9P-Px; Wed, 18 Jan 2023 15:46:22 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAcq-001db1-HV; Wed, 18 Jan 2023 15:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674056720; x=1705592720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z8X5newU9XL5BwcTC700iSbaht4sEux85LO6OUO0+Oc=;
  b=BvP0XNQHeXk6p+qln7ZGsB1KC8oCqQmaV0kVFcfMGatASB9gg/94YUEu
   ctk3E9Nl1OB/snlgQddHEUAFNEi5UiTWzxbHv2CijaNX0A4lSNEY4MeIG
   qEEpoq+ul7yQ2K7SYNYFe/qR2uQMGUpgS+W3zFiCR0tiQ8tLAb59Nthdd
   QdViGRN5euo7mlMyINisdkOXbmiU0yu2+GaL8nCh0jHIGPmZurkopSm5P
   7bt2x3yKy4Qn9HDap48Ljp5D5C9V6gvNboG6gq1MBn6tWGiM0teSBXRwD
   p7M4YGENstUhXS3dLfmEu07PvGvmbyx/DJHdnzAyV8qHkKAKoRFNcUa6+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322701223"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="322701223"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:45:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661759280"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="661759280"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:45:14 -0800
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
Subject: [PATCH v5 2/7] linux/include: add non-atomic version of xchg
Date: Wed, 18 Jan 2023 16:44:45 +0100
Message-Id: <20230118154450.73842-2-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118154450.73842-1-andrzej.hajda@intel.com>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_074520_665809_EE2D6556 
X-CRM114-Status: GOOD (  12.73  )
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
