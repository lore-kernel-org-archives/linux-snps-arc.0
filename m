Return-Path: <SRS0=e3HE=4X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BE7C10F25
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 18:24:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB2120665
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 18:24:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZX8RsefF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="amNCaFXV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEB2120665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43mW2paKCewFTLM5NhUGGblAWOHvyCp6jYmm6QvLL5g=; b=ZX8RsefFkRaW4z
	l9tPapf3jsKMvg1N0fG4WJzEc9vQiKLCyJrGin4cB9oaRw071GIeQuPl+R3ZA+LWCglk+xR37KxLf
	aCRAWGLoUwfsIjv7V6mMmle1vxWTDOFoF0NFF/qq5guqIq2mD+e6k2WYUejJ5gjZrGwLay6i60PrQ
	nU9e0B0bIWe88FVnk4KdehsEe8ynhwJMo3pn3w+ufiZsPTQLywERFUxjw1LUaqdozvw3SlQocd/68
	pcIdL7YdTEvJUFao2MZfFHYP/PofT/RB5Gi+luBDLKRKMZ5nqrECWUAcN4oqzRKv4vGlAMzTCoNaC
	a6DNJxZMLrKZRt8U2epQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAHeK-0001Xv-Td; Fri, 06 Mar 2020 18:24:40 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAHeA-0001P6-Mh
 for linux-snps-arc@lists.infradead.org; Fri, 06 Mar 2020 18:24:36 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 739BF402EC;
 Fri,  6 Mar 2020 18:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583519069; bh=FpzH26+XHhQ4MnRVPEvTRe9J5/GD/h8nVipsmT0AXRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=amNCaFXV+5h2QiFrX+6Go9Sms1HTjULvRUVFzZyLrugkjYZ0D7DNYRMv96YbqojJ3
 qMCDt9DorLrMFWOG2uboSBSWXAqqEbB/GjguRk/6zrT5shAQ69g7e8VCrROeKuka7t
 WsuGMEi33rwxcLqRPUyBThJENLsG5g2BCiK+m4p7YX3XAH8ZCW/nkhfQ96xEZcTQ3T
 ArTkyIO/MnlWnpCKRFPdkZERlJIgfTduKlBm/ExNehsQqbc8mO/bMerjMJeVnwZpVw
 w/xRVRTc/jVVAvLgiCho1kOlcylBaFAGAJwbirhbXhm+iApAW4zB/1eQYBBH2mZzj1
 rPnKcrOb0IOYQ==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.28])
 by mailhost.synopsys.com (Postfix) with ESMTP id 38D36A006E;
 Fri,  6 Mar 2020 18:24:28 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v3 13/17] ARC: Update syscall-names.list for ARC specific
 syscalls
Date: Fri,  6 Mar 2020 10:24:15 -0800
Message-Id: <20200306182419.13945-14-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200306182419.13945-1-vgupta@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_102430_742772_77C5A56D 
X-CRM114-Status: UNSURE (   7.22  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/unix/sysv/linux/syscall-names.list | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sysdeps/unix/sysv/linux/syscall-names.list b/sysdeps/unix/sysv/linux/syscall-names.list
index 3d89814003a2..758b50164103 100644
--- a/sysdeps/unix/sysv/linux/syscall-names.list
+++ b/sysdeps/unix/sysv/linux/syscall-names.list
@@ -41,6 +41,9 @@ adjtimex
 afs_syscall
 alarm
 alloc_hugepages
+arc_gettls
+arc_settls
+arc_usr_cmpxchg
 arch_prctl
 arm_fadvise64_64
 arm_sync_file_range
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
