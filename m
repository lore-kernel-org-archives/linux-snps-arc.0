Return-Path: <SRS0=1Xwl=MI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7CCC12002
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Jul 2021 18:57:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A41A613CF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 16 Jul 2021 18:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A41A613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ty06XOORL93RrIaAvx7ZPjW8f5vprbDIpWhH92ozE5A=; b=qQHIobkosCSOUe
	VLJp/+DD3V1C/0p2X7XvLrDwYAnuEKY4JanDUMF9wP4i8I82zPVeS5PwftFEpVyfxswX+/V5eKfPU
	TGS5u85uWTP8kH+J+Uxjo1ckc2EsIVxtc+WrSPIRyevSuNbC8iLb1XFsMnvuVy+RWaQfg3IR1dF1e
	EANl+I516yCcHfWkfCtXps8kYEy+gkpRAwm0TZFDX+TYMnO/gkuh7JF9vrJdmMPbJfyVTUZWQeixr
	72g3UHJjD3B+4OSVj4M45aiOKiSNStvvoTO5Tf9zfd8MAPP0Hiwws+nqkMb99e1SRE/byDCSCO+fQ
	Cml2ro8ozfH6Bhd+4f0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4T1M-0055f5-Gu; Fri, 16 Jul 2021 18:57:12 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4T1J-0055en-Ha
 for linux-snps-arc@lists.infradead.org; Fri, 16 Jul 2021 18:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626461820;
 bh=LrJqnGLr+yAUvufNYQHvar5369au8NY8/oDzo4u3xto=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=XwExZnsJfQ+X8B0rpgw0gihOv0utXtTdkgNCMJHcrxYlz2agulAdQCLwN/l0Mkf0P
 IGRqh7aLYA7RpqgRY/HHPOoD7UFNdZ4SeUfJx0n2ZJpHyLTcR/lrqRHBH0WCuFxQNr
 r8CcI617cTAkBM75f8TsH0Ui+1jj0ZX0nO/pEdpw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([83.52.228.41]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MybGh-1lCAcJ2iDN-00yypb; Fri, 16 Jul 2021 19:04:02 +0200
From: Len Baker <len.baker@gmx.com>
To: Vineet Gupta <vgupta@synopsys.com>
Cc: Len Baker <len.baker@gmx.com>, "dean.yang_cp" <yangdianqing@yulong.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARC: unwind: Use struct_size helper instead of open-coded
 arithmetic
Date: Fri, 16 Jul 2021 19:03:44 +0200
Message-Id: <20210716170344.9150-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:5SAJCQgoPecLOvlAQgDwaVANDA8DxUuLHfyrrkaNw0SbTdjcubb
 +3mVWWXnnrtaFn7YSpUqf7imH3OMpztog3bq8Qy2lKTgdiSIV36wx9kxNZzrF/WEpZCwRem
 eVgdflOQ30ghuVax+8LcnoW3M8I4JnPvkIEJO0p8Z3mI2/tM0cKFcrNmBiC7F2zbFOmIPDW
 q6lobTxcgJROUUt2IFdPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FMaIHDtt3TQ=:LSLkKUsSh8DCjF9U0xiz3B
 oUig+i4vvD4uMv5wQfBMvd7xn7SLBiNi1BwCD09YITPdEmn/m0T4qdVUl09/RpSLgQQBeVXjd
 qzhYxG7zAKx/v72e7rtYQSA/7975CQIOwPZlPqfHqwRUq2a146/htOBFIvW64XeQ0UHK3bDzL
 gwkU5pe+hJCAaEdcRC2yRFB/WzMpG3rR7h8XfZ0JfoxWFwGJtOZFPDBva1g9jnB7LTrY9Q3M0
 Mv5YhG77TwYthFjwEYFGrP/cBDUxlHmTgKoybp7U7s7HCPRKtIYXPzeZOEYCM+IgwoAEYJAyx
 MbvEUkN2IF+cBsIRADxqjNppK3F2J8ApZOok58o3N5Uem+ZLBevOPR1UA03Yy4S/8zw1hcJxo
 xct+YNur76woW2z0qVAgR9Udjx1L36GXe91chKp7Iz6Is39OQPRIZ8NDuZPlTi4hJSNSWrmw8
 0bZLqKfR7oiIEKqRMYOOyxLPe8V2B7X4B9MQAC4+GFz7jkzUh1mVRgYdieDLZgkN+LxogPl4i
 HyFn2ZNZC4WSw4lEWExRnlWsXIHEZd9zTQUkOEiS7wyFE9G4OqYHUSJYzlQTLUjyJej4Fk45y
 tGOBEHmfQwQ2PW5UGdMZe6W9382NGp8U091tp/UAVCq/TVPu4bQagGnCkxTWEo0f6QTo3Z8KT
 aCjViZOeTbZGlrX0KB9kDCpniBzaCrNBVLkzZB0A51HcFxsJljIppskuWK8ME+3wwQkSb/6wq
 wNx47Awffd7D/Et7htO7taD7jnqENOBSeNtYHCZ5mvHQfBT3ulBNpkAQ3QTp72Y1tRN1VPxok
 DAHfR9nlt07oaADPGnxNfCLtf0NlcYiBvXEr8vgfvouBqKasnNb2FZs0sHRtQaeoDnQ1C7Pux
 6zr7KAsIfh6We0Zwxzgk4myo2I9YnQBhoUYDi4kqciGsLx1bV9KnRV+sjx117UUg4hEpjhBQr
 ksJ8kHcf6wpOf/LZh/60JIUHiUDijStMUY9EJEuwXHzCrxzfatw4d4ZmWkDHkDmWAGAEq4eHJ
 jbRYY4I24LHq+MXsxMFrtBWzZOoJqpIghg7lpIlPyNfH0tzNDcUypHhK7eJwW5O++xR93zpcO
 jcR57+1QXBWYtdgRBukXMIE1coQNVyTeM/I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_115709_960361_AB2CD2C9 
X-CRM114-Status: UNSURE (   8.33  )
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

Dynamic size calculations (especially multiplication) should not be
performed in memory allocator function arguments due to the risk of them
overflowing. This could lead to values wrapping around and a smaller
allocation being made than the caller was expecting. Using those
allocations could lead to linear overflows of heap memory and other
misbehaviors.

To avoid this scenario, use the struct_size helper.

Signed-off-by: Len Baker <len.baker@gmx.com>
---
 arch/arc/kernel/unwind.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 47bab67f8649..af18052b86a7 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -13,6 +13,7 @@
 #include <linux/sched.h>
 #include <linux/module.h>
 #include <linux/memblock.h>
+#include <linux/overflow.h>
 #include <linux/sort.h>
 #include <linux/slab.h>
 #include <linux/stop_machine.h>
@@ -312,9 +313,7 @@ static void init_unwind_hdr(struct unwind_table *table,
 	if (tableSize || !n)
 		goto ret_err;

-	hdrSize = 4 + sizeof(unsigned long) + sizeof(unsigned int)
-	    + 2 * n * sizeof(unsigned long);
-
+	hdrSize = struct_size(header, table, n);
 	header = alloc(hdrSize);
 	if (!header)
 		goto ret_err;
--
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
