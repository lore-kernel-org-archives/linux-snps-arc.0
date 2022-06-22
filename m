Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D146C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Jun 2022 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kt17mikt01i76rzCVUp7sr6Hqp+/EnZm3ABJ351WOPs=; b=WhfVe6STw6a0ok
	6P4tuupk9adkT86WSri0GQI6VvtmqDEkAr4+ZP4Nbb2OLBJtxmRVonD1dB+YRv9qfMpYlb3MvmA+7
	NrBBrvzMIreO9gmIZZCmqdkDgVID0T2r9R9mxWfKZxr3ZgXRl4822rNUc9Ny5hUuQMKH3jFDBONek
	JjzTkm3X23ORBK2jSVyplGnqhYXd48o6hdJE8eT3D5GN+rq+kW4Ja0/o+gZCweFBa5QlCLPqcuzyk
	kDNiDk1ubt4zpL3u1YtamKnjxG3UF9v4UZByziPMCqAKYWhbXQcos276wpw1nuVi0c0+aviSc0fHJ
	rY0EpI+ImH7U6HN2ONKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3vMx-009AvW-AY; Wed, 22 Jun 2022 08:05:47 +0000
Received: from smtpbg138.qq.com ([106.55.201.18] helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3vMr-009Anj-75
	for linux-snps-arc@lists.infradead.org; Wed, 22 Jun 2022 08:05:46 +0000
X-QQ-mid: bizesmtp89t1655885081ty3h0se4
Received: from localhost.localdomain ( [125.70.163.206])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jun 2022 16:04:30 +0800 (CST)
X-QQ-SSF: 0100000000200020B000B00A0000000
X-QQ-FEAT: e00egQTBacRpAMH3MJBoJKnUaLjbSAMptizPG1hbxKXoyqNy5wEkA8mHq+fkZ
	GQR2oDXjDpITEYiQuAckQL/ItON3m//yG0EiEiTC3aIJQCodyatGCOK/ruRBk/EVXRH1sPT
	pBb70Uzuont6HsK6IYXuyVJlX4udTft0/WePrdoaUL0QvD9HVQUQaB8TVwYfoevmDBM23wl
	HDXeT12xMk/w0i433e7OQuUV9ToNI+w+2dQJAHr0ifTuSKcsgUpMmZP4GP/ZPyAd7nbrvP0
	zSuPuY75kCrcTFJQ+zqJOOgQLvC2jxyCDgT5d8nvGQryJldVORax8sy6uFIpbUk5ZPyPLZ0
	jkzC7PGRI9Kh0EWkXHNg8I+dbCPFA==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: vgupta@kernel.org,
	Julia.Lawall@inria.fr,
	rdunlap@infradead.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] ARC:mm:Fix syntax errors in comments
Date: Wed, 22 Jun 2022 16:04:23 +0800
Message-Id: <20220622080423.41570-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_010541_633756_F55160CE 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 arch/arc/mm/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
index 5446967ea98d..84fe78c41c37 100644
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
-- 
2.36.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
