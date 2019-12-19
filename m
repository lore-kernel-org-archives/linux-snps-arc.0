Return-Path: <SRS0=9HNX=2J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04762C43603
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2019 13:30:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA08A218AC
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2019 13:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jEU047s4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hER6opfX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA08A218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=boSbn7pHBgmKVs06zoKBQqH9NTSe9juyjEt8FBod5dM=; b=jEU047s4JNbI49
	zWUYajZT9ht9Ki7z7UHftSSkKfUHxRIdDaO4gZBSOSsjZ9gXwo5j86As2I4EctTRMIZVwxW9OCId0
	rK9F2HNDiRa9Bn7SShFRUIlTNzW2VteF86ShahwCbqidVdKs5kLuanZLKAAP1FPmRwA5JZzwkBwu2
	pj0sWhDvhAa901xPQir3GlNeZ4dwGKG3iYtqswnuyo74itLOOIYdYHbu2ssZ8eMUNED+dT5DUBGKC
	i49r8fmAtcb2cXuVN8hRGCNFA9QzWUMeRqQOOxlmNqipnKR1+5hxxVi3f60SxTBYv86g7LRFuPRxv
	/IUkYxJNHjr/MijKazjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihvtA-0007h6-Tm; Thu, 19 Dec 2019 13:30:48 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihvt8-0007ed-8c
 for linux-snps-arc@lists.infradead.org; Thu, 19 Dec 2019 13:30:47 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5DB70405D4;
 Thu, 19 Dec 2019 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576762245; bh=CwpIHUsLSwWgfRfilgxCCE00b6aVv9KpT49ou2/oTLI=;
 h=From:To:Cc:Subject:Date:From;
 b=hER6opfXJxcbx+tkUxHY5+je+3Okwntz9LcihPHUs+oD9kfAF9Rruw7T4LK1V1r6s
 z81OPiVRoFUeKDDabUygcXzeNPRKFiV5+H47dn5L0VgOB9lm9YUV2lrJEgLtcwu+aT
 5XWq7wIUE1HV+6itz8ybsuCq2S/ZkpEHjbzW1ujVpplY8L3NI/e+ep4aexKQ4CbS95
 i6TpM3rk+mi2n9NgjoDTEs8MkaGiVJRE74anC3fhknrtmSeCK3VR2iyS2+F6LcHz8N
 mjVzNTjkJ6LX+QL8cEzX2NUmZFwdl0qvrbl9l+LWLQrOdeTn1vMhUMiA1QOV028Ukh
 5A3SY9K8FVzJw==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id 18ED4A0066;
 Thu, 19 Dec 2019 13:30:42 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH] ARC: asm-offsets: remove duplicate entry
Date: Thu, 19 Dec 2019 16:30:40 +0300
Message-Id: <20191219133040.12736-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_053046_368653_10BBFBBA 
X-CRM114-Status: UNSURE (   7.62  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

We define 'PT_user_r25' twice in asm-offsets.c
It's not a big issue as we define it to the same value, however
let's fix it.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/kernel/asm-offsets.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arc/kernel/asm-offsets.c b/arch/arc/kernel/asm-offsets.c
index 1f621e416521..631ebb5d3458 100644
--- a/arch/arc/kernel/asm-offsets.c
+++ b/arch/arc/kernel/asm-offsets.c
@@ -66,7 +66,6 @@ int main(void)
 
 	DEFINE(SZ_CALLEE_REGS, sizeof(struct callee_regs));
 	DEFINE(SZ_PT_REGS, sizeof(struct pt_regs));
-	DEFINE(PT_user_r25, offsetof(struct pt_regs, user_r25));
 
 	return 0;
 }
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
