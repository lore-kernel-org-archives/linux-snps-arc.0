Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F8EC7EE43
	for <linux-snps-arc@archiver.kernel.org>; Sun, 11 Jun 2023 15:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+mkcMiG08TG6rsH2ruQkN1n8ZsjF36vHVLoMBgOcME=; b=lGnVmc/UPA7Lzs
	gy84qDqXmlMA71Wj/+qVpTMSj9u0zmSB/wwU/frB+aZWVb/i3E5DtGDcbvE6stgoLmF3P20JCPGtE
	z6dRkIZ76xltbysHbSx0ev5WGcl1PheGfsA6XCFfm4f2z3oXmwcexGMhMA66ZWFqXkWR469ltp7Rs
	aM6eyG5IKjsKDTVqrGUhBU3kBxGYiF8lGrwOi2TZldprs0H6nVpDkJlTEbmszT6hivrYR8ULpyryV
	4T7cE+Ss5mXDL3Nq6L/VWPnxEWGIfKJZxIwohQD6N4/IyEBSw2v4jHuYNnKzEl90VTO5ySGYjQq+z
	zrJzYyRVqyl53ihwehvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLp-001GVd-1b;
	Sun, 11 Jun 2023 15:51:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8NLm-001GUK-1S
	for linux-snps-arc@lists.infradead.org;
	Sun, 11 Jun 2023 15:51:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CD0F61C16;
	Sun, 11 Jun 2023 15:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE34CC4339B;
	Sun, 11 Jun 2023 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686498689;
	bh=ovLMPnCEsSYRr1mwopc41Atwj/r73CD3/FzXYmBBh0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sqCXqjDg6c4koH1V3VgawzmG7Rwa5xYqrFiUf4Sod4aNEr8JdhvTtZa/CpmUivZAG
	 2Oy+M3PHBf++zZZYhrQVrrgfH0f4JPq04xDYRLzxbyj8t15NFBAjEQrSz7g7RMZ5BT
	 kjPjEJRQWLrjyIq6+9WoXLQC3LoKeYsBd7iq5GyNaG4aCvY6dP5+qqZ1hMs04Z2tkL
	 E3ERngfrg3GpXy+IrS9HvyA7vBy/qKZq4+2xzBvZZ/uKtejg5vwMEo9GG7eLdIvjEg
	 B8btF8qfHtGVgONjFbMh1ZE3z8rg3hfqIJNbt9GHXyIkCtzFGdvAitqBX4qtBWeXFp
	 vwYYOl+YPk10Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-snps-arc@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v9 11/11] linux/export.h: rename 'sec' argument to 'license'
Date: Mon, 12 Jun 2023 00:51:00 +0900
Message-Id: <20230611155100.2553804-12-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611155100.2553804-1-masahiroy@kernel.org>
References: <20230611155100.2553804-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_085130_574355_DEE69915 
X-CRM114-Status: GOOD (  11.13  )
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

Now, EXPORT_SYMBOL() is populated in two stages. In the first stage,
all of EXPORT_SYMBOL/EXPORT_SYMBOL_GPL go into the same section,
'.export_symbol'.

'sec' does not make sense any more. Rename it to 'license'.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---

(no changes since v7)

Changes in v7:
 - New patch

 include/linux/export.h | 8 ++++----
 include/linux/pm.h     | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index 1de600734071..beed8387e0a4 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -57,11 +57,11 @@ extern struct module __this_module;
  * be reused in other execution contexts such as the UEFI stub or the
  * decompressor.
  */
-#define __EXPORT_SYMBOL(sym, sec, ns)
+#define __EXPORT_SYMBOL(sym, license, ns)
 
 #elif defined(__GENKSYMS__)
 
-#define __EXPORT_SYMBOL(sym, sec, ns)	__GENKSYMS_EXPORT_SYMBOL(sym)
+#define __EXPORT_SYMBOL(sym, license, ns)	__GENKSYMS_EXPORT_SYMBOL(sym)
 
 #elif defined(__ASSEMBLY__)
 
@@ -78,9 +78,9 @@ extern struct module __this_module;
 #endif /* CONFIG_MODULES */
 
 #ifdef DEFAULT_SYMBOL_NAMESPACE
-#define _EXPORT_SYMBOL(sym, sec)	__EXPORT_SYMBOL(sym, sec, __stringify(DEFAULT_SYMBOL_NAMESPACE))
+#define _EXPORT_SYMBOL(sym, license)	__EXPORT_SYMBOL(sym, license, __stringify(DEFAULT_SYMBOL_NAMESPACE))
 #else
-#define _EXPORT_SYMBOL(sym, sec)	__EXPORT_SYMBOL(sym, sec, "")
+#define _EXPORT_SYMBOL(sym, license)	__EXPORT_SYMBOL(sym, license, "")
 #endif
 
 #define EXPORT_SYMBOL(sym)		_EXPORT_SYMBOL(sym, "")
diff --git a/include/linux/pm.h b/include/linux/pm.h
index f615193587d2..badad7d11f4f 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -375,14 +375,14 @@ const struct dev_pm_ops name = { \
 }
 
 #ifdef CONFIG_PM
-#define _EXPORT_DEV_PM_OPS(name, sec, ns)				\
+#define _EXPORT_DEV_PM_OPS(name, license, ns)				\
 	const struct dev_pm_ops name;					\
-	__EXPORT_SYMBOL(name, sec, ns);					\
+	__EXPORT_SYMBOL(name, license, ns);				\
 	const struct dev_pm_ops name
 #define EXPORT_PM_FN_GPL(name)		EXPORT_SYMBOL_GPL(name)
 #define EXPORT_PM_FN_NS_GPL(name, ns)	EXPORT_SYMBOL_NS_GPL(name, ns)
 #else
-#define _EXPORT_DEV_PM_OPS(name, sec, ns)				\
+#define _EXPORT_DEV_PM_OPS(name, license, ns)				\
 	static __maybe_unused const struct dev_pm_ops __static_##name
 #define EXPORT_PM_FN_GPL(name)
 #define EXPORT_PM_FN_NS_GPL(name, ns)
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
