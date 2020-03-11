Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF494C18E5A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 12:00:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B617821655
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 12:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tXVx3zh0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZgI/VTKc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B617821655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jha8miKdIQMl8Xrb7B1Tcj/lNDU4BkA1PJroOhzKT9I=; b=tXVx3zh0RgJEeP
	BPr1r+r4zPBcinct5hIkBYjSJQJ9K110VZ0cxJS3iTyFVQkC737OdTUk3x9QSdXcsDLZlYfk9tzyE
	8c/kEHBx0KGN6NsWtWZnnJGPaKusCf/jvf0K3TYc6msZfNwQPnXnMNwJHEFkif6C34lYTRRuifXxD
	IHYKToS6WceluNUAzsTUwH3hP5KHdrbNbc+r9iI35TA9Sh7Gdub9FWXR9WR9ebIQj89u9dpbdw/On
	+N52ild3eKL+rZ1KgD8gUiWnTsB/Vnd5wMa1Q75xxS4sEFuRbRKjyVWM8NFN33EnNdxGxSwxD6ZY1
	SHRz8SqEc7t5JgF4Gx8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC02j-0006Hi-5G; Wed, 11 Mar 2020 12:00:57 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC02g-0006GA-1k
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 12:00:55 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9910343B66;
 Wed, 11 Mar 2020 12:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583928051; bh=Txb+nGsGuFHipxu+zOeUnttFcYulzx7J7k/QFdcQaDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZgI/VTKc5vqo7oxkCvUsP7ua1eNf6QQHA7+xzLfnotXE00Il9kjCDAEIqO4fOcTy/
 uQcKFA0HPjOH49Le9udW1mQeTu79CRwbjQEtdjU91GszSZt3cXdQz6GwqQPniC5Mbz
 f/aPbowPVCxmJU0w6E/hh3rdenlH0f4/kEczQO2KjBk3KXqlijgkipNrW0G3l2LJHF
 kLTfgaFQxOH9KQzh+t5t5Hkse8MldiqAt1oblXgzbtpPnZSYYGc70fhvvrCnosRFvF
 P41iQ+CVeNva35gQ1PShYlfpO39JidEj+xliBiQyhUg7VWfdIRCiCKWiwe+9zuJ9+X
 usnfwu89p9vTQ==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.79])
 by mailhost.synopsys.com (Postfix) with ESMTP id EF83FA005F;
 Wed, 11 Mar 2020 12:00:48 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: uboot-snps-arc@synopsys.com, Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 1/2] ARC: CACHE: add support for SL$ disable
Date: Wed, 11 Mar 2020 15:00:43 +0300
Message-Id: <20200311120044.10061-2-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200311120044.10061-1-Eugeniy.Paltsev@synopsys.com>
References: <20200311120044.10061-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_050054_102640_0B0E1FB1 
X-CRM114-Status: GOOD (  15.65  )
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
Cc: u-boot@lists.denx.de, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Since version 3.0 ARC HS supports SL$ (L2 system level cache)
disable. So add support for SL$ disable/enable to code.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/include/asm/cache.h |   7 +++
 arch/arc/lib/cache.c         | 114 ++++++++++++++++++++++++++++++++---
 2 files changed, 114 insertions(+), 7 deletions(-)

diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
index 0fdcf2d2dd5..ab61846b5ab 100644
--- a/arch/arc/include/asm/cache.h
+++ b/arch/arc/include/asm/cache.h
@@ -40,6 +40,13 @@ static const inline int is_ioc_enabled(void)
 	return IS_ENABLED(CONFIG_ARC_DBG_IOC_ENABLE);
 }
 
+/*
+ * We export SLC control functions to use them in platform configuration code.
+ * They maust not be used in any generic code!
+ */
+void slc_enable(void);
+void slc_disable(void);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_ARC_CACHE_H */
diff --git a/arch/arc/lib/cache.c b/arch/arc/lib/cache.c
index 1340776c669..c42723daeb2 100644
--- a/arch/arc/lib/cache.c
+++ b/arch/arc/lib/cache.c
@@ -89,8 +89,7 @@
  *
  * [ NOTE 2 ]:
  * As of today we only support the following cache configurations on ARC.
- * Other configurations may exist in HW (for example, since version 3.0 HS
- * supports SL$ (L2 system level cache) disable) but we don't support it in SW.
+ * Other configurations may exist in HW but we don't support it in SW.
  * Configuration 1:
  *        ______________________
  *       |                      |
@@ -120,7 +119,8 @@
  *       |                      |
  *       |   L2 (SL$)           |
  *       |______________________|
- *          always must be on
+ *          always on (ARCv2, HS <  3.0)
+ *          on/off    (ARCv2, HS >= 3.0)
  *        ___|______________|____
  *       |                      |
  *       |   main memory        |
@@ -178,6 +178,8 @@ DECLARE_GLOBAL_DATA_PTR;
 
 static inlined_cachefunc void __ic_entire_invalidate(void);
 static inlined_cachefunc void __dc_entire_op(const int cacheop);
+static inlined_cachefunc void __slc_entire_op(const int op);
+static inline bool ioc_enabled(void);
 
 static inline bool pae_exists(void)
 {
@@ -238,6 +240,70 @@ static inlined_cachefunc bool slc_exists(void)
 	return false;
 }
 
+enum slc_dis_status {
+	ST_SLC_MISSING = 0,
+	ST_SLC_NO_DISABLE_CTRL,
+	ST_SLC_DISABLE_CTRL
+};
+
+/*
+ * ARCv1                                     -> ST_SLC_MISSING
+ * ARCv2 && SLC absent                       -> ST_SLC_MISSING
+ * ARCv2 && SLC exists && SLC version <= 2   -> ST_SLC_NO_DISABLE_CTRL
+ * ARCv2 && SLC exists && SLC version > 2    -> ST_SLC_DISABLE_CTRL
+ */
+static inlined_cachefunc enum slc_dis_status slc_disable_supported(void)
+{
+	if (is_isa_arcv2()) {
+		union bcr_generic sbcr;
+
+		sbcr.word = read_aux_reg(ARC_BCR_SLC);
+		if (sbcr.fields.ver == 0)
+			return ST_SLC_MISSING;
+		else if (sbcr.fields.ver <= 2)
+			return ST_SLC_NO_DISABLE_CTRL;
+		else
+			return ST_SLC_DISABLE_CTRL;
+	}
+
+	return ST_SLC_MISSING;
+}
+
+static inlined_cachefunc bool __slc_enabled(void)
+{
+	return !(read_aux_reg(ARC_AUX_SLC_CTRL) & SLC_CTRL_DIS);
+}
+
+static inlined_cachefunc void __slc_enable(void)
+{
+	unsigned int ctrl;
+
+	ctrl = read_aux_reg(ARC_AUX_SLC_CTRL);
+	ctrl &= ~SLC_CTRL_DIS;
+	write_aux_reg(ARC_AUX_SLC_CTRL, ctrl);
+}
+
+static inlined_cachefunc void __slc_disable(void)
+{
+	unsigned int ctrl;
+
+	ctrl = read_aux_reg(ARC_AUX_SLC_CTRL);
+	ctrl |= SLC_CTRL_DIS;
+	write_aux_reg(ARC_AUX_SLC_CTRL, ctrl);
+}
+
+static inlined_cachefunc bool slc_enabled(void)
+{
+	enum slc_dis_status slc_status = slc_disable_supported();
+
+	if (slc_status == ST_SLC_MISSING)
+		return false;
+	else if (slc_status == ST_SLC_NO_DISABLE_CTRL)
+		return true;
+	else
+		return __slc_enabled();
+}
+
 static inlined_cachefunc bool slc_data_bypass(void)
 {
 	/*
@@ -247,6 +313,39 @@ static inlined_cachefunc bool slc_data_bypass(void)
 	return !dcache_enabled();
 }
 
+void slc_enable(void)
+{
+	if (slc_disable_supported() != ST_SLC_DISABLE_CTRL)
+		return;
+
+	if (__slc_enabled())
+		return;
+
+	__slc_enable();
+}
+
+/* TODO: warn if we are not able to disable SLC */
+void slc_disable(void)
+{
+	if (slc_disable_supported() != ST_SLC_DISABLE_CTRL)
+		return;
+
+	/* we don't support SLC disabling if we use IOC */
+	if (ioc_enabled())
+		return;
+
+	if (!__slc_enabled())
+		return;
+
+	/*
+	 * We need to flush L1D$ to guarantee that we won't have any
+	 * writeback operations during SLC disabling.
+	 */
+	__dc_entire_op(OP_FLUSH);
+	__slc_entire_op(OP_FLUSH_N_INV);
+	__slc_disable();
+}
+
 static inline bool ioc_exists(void)
 {
 	if (is_isa_arcv2()) {
@@ -275,7 +374,7 @@ static inlined_cachefunc void __slc_entire_op(const int op)
 {
 	unsigned int ctrl;
 
-	if (!slc_exists())
+	if (!slc_enabled())
 		return;
 
 	ctrl = read_aux_reg(ARC_AUX_SLC_CTRL);
@@ -324,7 +423,7 @@ static void __slc_rgn_op(unsigned long paddr, unsigned long sz, const int op)
 	unsigned int ctrl;
 	unsigned long end;
 
-	if (!slc_exists())
+	if (!slc_enabled())
 		return;
 
 	/*
@@ -382,6 +481,9 @@ static void arc_ioc_setup(void)
 	if (!slc_exists())
 		panic("Try to enable IOC but SLC is not present");
 
+	if (!slc_enabled())
+		panic("Try to enable IOC but SLC is disabled");
+
 	/* Unsupported configuration. See [ NOTE 2 ] for more details. */
 	if (!dcache_enabled())
 		panic("Try to enable IOC but L1 D$ is disabled");
@@ -517,8 +619,6 @@ void invalidate_icache_all(void)
 	/*
 	 * If SL$ is bypassed for data it is used only for instructions,
 	 * so we need to invalidate it too.
-	 * TODO: HS 3.0 supports SLC disable so we need to check slc
-	 * enable/disable status here.
 	 */
 	if (is_isa_arcv2() && slc_data_bypass())
 		__slc_entire_op(OP_INV);
-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
