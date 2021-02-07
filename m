Return-Path: <SRS0=9m4u=HJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F153DC433E0
	for <linux-snps-arc@archiver.kernel.org>; Sun,  7 Feb 2021 01:55:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96FF264E87
	for <linux-snps-arc@archiver.kernel.org>; Sun,  7 Feb 2021 01:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96FF264E87
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6V7KAZ2weOMTAm2dfCE9VuMleglUhiGPdr7L2Z/09UQ=; b=kT8rObwe6vNjdmMy3DZXzW1J/m
	XanI//lVCY90C0mPvFRrKmZzkH+067RHzqJ3bk73aQL1q9GlMITdxFJr8XwTVWatcNtOkgzuIGq8f
	DLLDnKhQRcKOt0MtNKGqoNEr+GhSoiOouQZv15q7DA20vpBpId1ymr/p32HXKDL+I9SunlyteEx6p
	+6gepuCgJ96pKae7+pdbne0aYoYEquSXwsvXB2Yd9BdpfyliTXUs5+mxOxLOuDEF5AxDVvLjHnUhm
	3LACfQzFsgGmQ3VyAZEC6L+4Y4mAwOUTfOcYtA1YRmdfd4H9Tl7rdDiK6GECPtyzw7N+NQWdnpKwT
	sMcaHyfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8ZIS-00058M-Fb; Sun, 07 Feb 2021 01:55:32 +0000
Received: from m12-15.163.com ([220.181.12.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8ZIP-00057v-IJ
 for linux-snps-arc@lists.infradead.org; Sun, 07 Feb 2021 01:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kJMhG
 H1QDTFVJ+sCQEjNNNnYTMpsThhsoFU+XxZ1I4o=; b=j/s09tzDraF677MuyoAWj
 P2oL32WP19QALbwVj6jMRovUco/nEmSWVe+sYzq3gVAV/ZPlapuq6NpEcdv4fWfn
 RGygAJ/eLOhJ1piMxXoTPjYb0JMHsIWj4BWTOSJWJS35DyhoATkFnYBPEXsHYGJR
 RcP+9Gz/E/BKBUcs021Z7I=
Received: from yangdianqing01.ccdomain.com (unknown [218.17.89.92])
 by smtp11 (Coremail) with SMTP id D8CowADX7DCESB9gaRK2AA--.20533S2;
 Sun, 07 Feb 2021 09:55:21 +0800 (CST)
From: sz18665958617@163.com
To: vgupta@synopsys.com
Subject: [PATCH] treewide: avoid the ponter addition with NULL pointer
Date: Sun,  7 Feb 2021 09:54:56 +0800
Message-Id: <20210207015456.1263-1-sz18665958617@163.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: D8CowADX7DCESB9gaRK2AA--.20533S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrW8uw4xGF1rGF1xJr4Dtwb_yoW8Cryfpw
 43GryrtrW5W34Yvw13ArnFgrWUJ398Xa42gFWxGa4Ut3Zrury8WrykGry7uwsav34kW3WY
 vrs09rWUCan7trDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bIR6wUUUUU=
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: dv2rmliwvzkmqwrxqiywtou0bp/xtbBEQkyflaEC3EFsAAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_205530_231315_AE14404F 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
Cc: "dean.yang_cp" <yangdianqing@yulong.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: "dean.yang_cp" <yangdianqing@yulong.com>

Signed-off-by: dean.yang_cp <yangdianqing@yulong.com>
---
 arch/arc/kernel/unwind.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 74ad425..47bab67 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -187,25 +187,26 @@ static void init_unwind_table(struct unwind_table *table, const char *name,
 			      const void *table_start, unsigned long table_size,
 			      const u8 *header_start, unsigned long header_size)
 {
-	const u8 *ptr = header_start + 4;
-	const u8 *end = header_start + header_size;
-
 	table->core.pc = (unsigned long)core_start;
 	table->core.range = core_size;
 	table->init.pc = (unsigned long)init_start;
 	table->init.range = init_size;
 	table->address = table_start;
 	table->size = table_size;
-
-	/* See if the linker provided table looks valid. */
-	if (header_size <= 4
-	    || header_start[0] != 1
-	    || (void *)read_pointer(&ptr, end, header_start[1]) != table_start
-	    || header_start[2] == DW_EH_PE_omit
-	    || read_pointer(&ptr, end, header_start[2]) <= 0
-	    || header_start[3] == DW_EH_PE_omit)
-		header_start = NULL;
-
+	/* To avoid the pointer addition with NULL pointer.*/
+	if (header_start != NULL) {
+		const u8 *ptr = header_start + 4;
+		const u8 *end = header_start + header_size;
+		/* See if the linker provided table looks valid. */
+		if (header_size <= 4
+		|| header_start[0] != 1
+		|| (void *)read_pointer(&ptr, end, header_start[1])
+				!= table_start
+		|| header_start[2] == DW_EH_PE_omit
+		|| read_pointer(&ptr, end, header_start[2]) <= 0
+		|| header_start[3] == DW_EH_PE_omit)
+			header_start = NULL;
+	}
 	table->hdrsz = header_size;
 	smp_wmb();
 	table->header = header_start;
-- 
1.9.1



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
