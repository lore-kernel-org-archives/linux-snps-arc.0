Return-Path: <SRS0=GxYE=JU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72C2C433ED
	for <linux-snps-arc@archiver.kernel.org>; Fri, 23 Apr 2021 19:53:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60ED7613D7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 23 Apr 2021 19:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60ED7613D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WbOZYf1HKvJ7p3txLUj7SVhLMKk1tR+zuOkeDrnmfkM=; b=nGlZkD27lDSZFhywIzoMU8sxZf
	4+UdsITDz5MhJNCHCtd/7s2mJRvCtfQLBKP/2UuxPSg+/Ai/+PfBG2vzgy4PBecZ4krOGcLVwpbsH
	9k/yBwGklaszqYv5xc51vpWFGkAWjoF4Ptaucy7beZG366KtZk2YjZBWwnCRf0Y5oQDQs723BIc0s
	wdxlZeXIN11dPcW2/YTQ5WDe7XFn0+ayAHrFZMBR91H6KQ8fsO8zgUELiGI9dG3/Lq76mlcZaf3pX
	M70za3kzITFSOHL1II8ru4+/T6MLH2zbUAHxml5fraUp22YRdLSXDGpnlETegq9QcPSwnBose9wcM
	yLPGYAEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la1rR-002FOV-NK; Fri, 23 Apr 2021 19:53:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la1rM-002FO6-Vp
 for linux-snps-arc@desiato.infradead.org; Fri, 23 Apr 2021 19:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=2kJvoBawjprWrRhHHYAdb44PZQAhnRMKg8EfCnWnknI=; b=NVUvYmlo+Y29ncUEqbiwpRpNfT
 n6LLKJhbpMNiYOVK53TvobIIagd66JooBaDYQahGLfwNvbb7tlepYzCw7mYZsGRopmFz1Vz7Det0Q
 30dteHrjWju21o2pPjYXNMuGsT1uSN9GeynFkr7D3/6vK/dtzVTHXBPG01r8npuN1Zvlq1FKI2OhG
 xmAEzl3+BD4XQFYyWgHpObn880FE+Cw3fWz9yTnnUF0PBD7naguwueNOR2DiALd/vtLWWfz1/VWk8
 cVS6CamUhvIVgQoDLPgb4/D9CdxpVykRmwQWme4ACUwUje8x/X657hwiDfzEA/BDOhzkXxFzdWO8F
 VnoiDalQ==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la1rJ-00Efas-HA
 for linux-snps-arc@lists.infradead.org; Fri, 23 Apr 2021 19:53:03 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2E23B400CB;
 Fri, 23 Apr 2021 19:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1619207580; bh=HnFETGUvMhm7zDIsx9cLfUQSofJTRcYq1eMKI/YVrBk=;
 h=From:To:Cc:Subject:Date:From;
 b=E+7NKfccz2+HHv+JYhQIbFGuoBGsTU67zn6Ul6a5EqNl9by1XMpuGCeLPbIodSNCA
 ByyO4FLb8FyV+OWFnjlgJAxIPhW81UvxXqOQGnCs+bghRViaMA4TtVNTFyoJELDeFj
 uQ094ZrduBugvNkOUawsV3s8Qs0Di4OYs2UoZQKeJN5kZS+2Cq1FjjEMJYOINgAHCL
 VnhPMOXe5r+JvHLyZgOxfRCHCp9/ZC0xsDI+CnaUeMg4fTffVClZ2eGKr1xJaqAahk
 iZ3ryWlxCO6NolKpIwp1Z43vzqr62VtLKvJUTEgkYvbq95PCxDqRpiycP3/Qp4DMnI
 L8Yw5GHIMrGbQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 12620A006F;
 Fri, 23 Apr 2021 19:52:58 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Subject: [PATCH] ARC: entry: fix off-by-one error in syscall number validation
Date: Fri, 23 Apr 2021 12:52:57 -0700
Message-Id: <20210423195257.892560-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_125301_593982_F20F8778 
X-CRM114-Status: GOOD (  10.30  )
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

We have NR_syscall syscalls from [0 .. NR_syscall-1].
However the check for invalid syscall number is "> NR_syscall".
This off-by-one error erronesously allows "NR_syscall" itself as valid
and when passed causes out-of-bounds syscall-call table access leading
to crash.

This problem showed up when testing glibc 2.33 (v5.10 kernel capable,
includng faccessat2 syscall (439) against a v5.6 kernel with
NR_syscalls=439 (0 to 438). Due to the bug, 439 was not returned with
-ENOSYS but processed leading to a crash.

Link: https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/48
Reported-by: Shahab Vahedi <shahab@synopsys.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index 1743506081da..aea9b558993d 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -255,7 +255,7 @@ ENTRY(EV_Trap)
 	;============ Normal syscall case
 
 	; syscall num shd not exceed the total system calls avail
-	cmp     r8,  NR_syscalls
+	cmp     r8,  NR_syscalls - 1
 	mov.hi  r0, -ENOSYS
 	bhi     .Lret_from_system_call
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
