Return-Path: <SRS0=19Kx=HZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C6FC433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Feb 2021 02:04:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F13864E12
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Feb 2021 02:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F13864E12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6V7KAZ2weOMTAm2dfCE9VuMleglUhiGPdr7L2Z/09UQ=; b=CuUdkFAzH+u0dAtf88h+3Cjzj8
	uK4TXAyGhqbG3dLFyMoL3yOMoNcjsP/K7KyI9AXmJsi+nvJM6UoMWT0bXU9/sS1OulRU7d7lk02kJ
	4DIqnd5WhIMEz/FZx+OmFAC8fNEJSNtU2V1O3X8a3K2kjWyByZS3HZPbxNIeo+6ZkcQPJYe+XOJh/
	KAo0Js/FekiHwDmNVWDFye87t/NCSZDRcXUvbTfxdRXeL+LFibrkn+F3HcBJr+vjqXqMNVcb101K+
	v2hXfyT6u4WErj5QP4k7GvMoG4MEiW9gu5F3FMoP+30ll6bnhoQBs9wq7M/w2Cbhlo6gcrskqPRR8
	L2gEZtnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEN41-0003pK-Bf; Tue, 23 Feb 2021 02:04:37 +0000
Received: from m12-13.163.com ([220.181.12.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEN3y-0003nJ-UX
 for linux-snps-arc@lists.infradead.org; Tue, 23 Feb 2021 02:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kJMhG
 H1QDTFVJ+sCQEjNNNnYTMpsThhsoFU+XxZ1I4o=; b=ZVgsQIH6cxar7KhnbOQPU
 Rr5zDO4Ifco7Tron7v/ZOAcfqooUhEaZdtqYfgKT3O4RnT4FRQfyejrjeTqIWJ0W
 QKdBQhpfGUmSAVmYbdqSBMQ//MskglLhPuUtZNdPcc2/JVfrnfjY+vxlc/nC7+wa
 fwKU1Hvar50T9m+4nc/EPo=
Received: from yangdianqing01.ccdomain.com (unknown [119.137.54.165])
 by smtp9 (Coremail) with SMTP id DcCowACX1JClYjRgftOhgQ--.8449S2;
 Tue, 23 Feb 2021 10:04:25 +0800 (CST)
From: sz18665958617@163.com
To: vgupta@synopsys.com
Subject: [PATCH] treewide: avoid the ponter addition with NULL pointer
Date: Tue, 23 Feb 2021 10:00:31 +0800
Message-Id: <20210223020031.519-1-sz18665958617@163.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: DcCowACX1JClYjRgftOhgQ--.8449S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrW8uw4xGF1rGF1xJr4Dtwb_yoW8Cryfpw
 43GryrtrW5W34Yvw13ArnFgrWUJ398Xa42gFWxGa4Ut3Zrury8WrykGry7uwsav34kW3WY
 vrs09rWUCan7trDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jWtC7UUUUU=
X-Originating-IP: [119.137.54.165]
X-CM-SenderInfo: dv2rmliwvzkmqwrxqiywtou0bp/1tbiRQlCfll91QNaiQAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_210435_495264_609087E6 
X-CRM114-Status: UNSURE (   9.44  )
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
