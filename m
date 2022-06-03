Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA18C43334
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Jun 2022 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=De/8xGhl0Lk79fi3u5/307OFOFM/PSHDQ8yaICgZg64=; b=DfIA14RDo7gICj
	15D9dmerfHu1DsNpfCqTb2HTy2DhaUoCfeHGgzc1FAkbPHqEpC77T4aTpsEGcfjFndLMcNEjtlY2L
	gLmOatl6dTtbavP8kBof0Qn9aBfShi8I9oeUWz6uro32uuuZvu/oiVXr/HnCHrrlYdgbIiyMBFaOd
	j6/tt9nIbnDd5WLf2CX6xkcTBWwT6bRd0KHf7cb78EfBWOZqtvfJGI+5ZByna3GoaeXD7Ld2HYCqf
	fR9INRhXhbjoHffzrmCFcQ7RwdHKGcUBw82g9B3NCWtZQZ5E/lX8uj1BNA4nLAj2B6L9G34dRjs1I
	Yjbf9iMJeT3irmM9SCkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx6wp-007VKf-Ou; Fri, 03 Jun 2022 13:02:39 +0000
Received: from smtpbg138.qq.com ([106.55.201.18] helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx6wi-007VJG-Nf
	for linux-snps-arc@lists.infradead.org; Fri, 03 Jun 2022 13:02:38 +0000
X-QQ-mid: bizesmtp84t1654261308ty0dfdu0
Received: from localhost.localdomain ( [117.176.187.31])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Jun 2022 21:01:42 +0800 (CST)
X-QQ-SSF: 01000000002000B0G000B00A0000000
X-QQ-FEAT: Mzskoac49OjjUdElT52QQBT8024YNvFxYcB8N1hdnLszXz4fyYEBVDsNqr6H8
	UUUkRWjXTrh/c9t0UuSVOKtAsGpzwT4qlpURu+luHYllW9INpjUSfpvdSBLHal2ToRSasDS
	6TlE47r1i39SItOAOPh3tbonl6QHrZlD+lbWwaJuJZ2h1dVF1/jawezi4JfseD6b08eDX8h
	iEFH70jD9j6tMAS1vYuk4eTAdCXz3B6lxo31DDG96u7IRCkvZq0d9lF9ihPCM0yb6kp226k
	8mNXlI+HyixjYIO5KYTLvebn0Sih/KIfB6zSS/gqWyZwk8IaQKA/CN0JwxREO7HxneeKNGU
	oTqEGMx/tJRgkKL2lE=
X-QQ-GoodBg: 0
From: Xiang wangx <wangxiang@cdjrlc.com>
To: vgupta@kernel.org
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH] ARC: Fix syntax errors in comments
Date: Fri,  3 Jun 2022 21:01:41 +0800
Message-Id: <20220603130141.6516-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_060233_163237_4ECDE8C9 
X-CRM114-Status: GOOD (  11.56  )
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

Delete the redundant word 'to'.
Delete the redundant word 'since'.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 arch/arc/mm/cache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index 5446967ea98d..55c6de138eae 100644
--- a/arch/arc/mm/cache.c
+++ b/arch/arc/mm/cache.c
@@ -750,7 +750,7 @@ static inline void arc_slc_enable(void)
  *  -In SMP, if hardware caches are coherent
  *
  * There's a corollary case, where kernel READs from a userspace mapped page.
- * If the U-mapping is not congruent to to K-mapping, former needs flushing.
+ * If the U-mapping is not congruent to K-mapping, former needs flushing.
  */
 void flush_dcache_page(struct page *page)
 {
@@ -910,7 +910,7 @@ EXPORT_SYMBOL(flush_icache_range);
  * @vaddr is typically user vaddr (breakpoint) or kernel vaddr (vmalloc)
  *    However in one instance, when called by kprobe (for a breakpt in
  *    builtin kernel code) @vaddr will be paddr only, meaning CDU operation will
- *    use a paddr to index the cache (despite VIPT). This is fine since since a
+ *    use a paddr to index the cache (despite VIPT). This is fine since a
  *    builtin kernel page will not have any virtual mappings.
  *    kprobe on loadable module will be kernel vaddr.
  */
-- 
2.36.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
