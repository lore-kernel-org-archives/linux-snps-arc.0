Return-Path: <SRS0=GR/N=JX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B1FC433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Apr 2021 10:10:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BE1261165
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Apr 2021 10:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BE1261165
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fEGbECfrR61lzl6/jeYsZEHI1r3yQxD9MGTY1TZV9SE=; b=Iu5INdt0CQ+jaARqVIBHv9dqOx
	P9AJPzxfu98ZXbeDqcVNGXMC02/zj3KeoweOU9kebijCTtrV9D5uMOxkUl7iMw3Jf9xubmFZiERuh
	z0g2lyngoapgCBS8J2di0rRCkL2L5kA/rmnBNTD6SXRfiikR0W1r2qyMS3QZa9qg9iVkqoB+2/md7
	0yAFEcuvpc1cj+lXDHN46mK/kyo7UC/oaQg8Ck4a2Q8wS3R/7OuoRbvksgifw77AK58ATwnb8mBqJ
	emk6UH0JPjHRxIe+QLyFNe+827GbT1LFf+415mZ7FbueujM7/hxfOu3Q/Jst+dKRpw1YygAA+AFl+
	sENkkvbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1layCL-007NeG-HT; Mon, 26 Apr 2021 10:10:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1layCJ-007Ne3-JG
 for linux-snps-arc@desiato.infradead.org; Mon, 26 Apr 2021 10:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ddaDglxIIY0GrUGadoWZYPaf0oO61ndJz2DdhBj+nTU=; b=kzU5Zs4A1k2gtw6Y+05E2rYZyN
 GZPMzbJ9yGjLMq2p+vT1znZInR6tCzN1rnUKzp9Do+kc+H8SqdF9gRly3Esy7Ds2/TlI6wQXHVolv
 uF8mBlnm4H67Fn0q1BXHIiZHaUYRWCIwiVWgJMD7hC9IzwlTKsMUs6+m100/Z4WhKSuktdBz7WzeD
 oA6g/mAecw8FayXPoKncj4BxaSI0LhM0z42cwjJvSiONW2AZWNbyfqEqc6FphAwimCzUlu0YdBBYP
 ZdCEwKSowSIkRRQbnEukxZ94zC3+t7aj/G4zghDGvZvSXqt4b/BvA807WELZYg+x5xZDTH/tjCO7P
 tb3aaYqA==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1layCG-00Ft2b-Qx
 for linux-snps-arc@lists.infradead.org; Mon, 26 Apr 2021 10:10:34 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 928C2403BA;
 Mon, 26 Apr 2021 10:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1619431830; bh=uEswIh8XDpKzdvjTYxcTqmddGeaHCUIclw9SpAlhPD0=;
 h=From:To:Cc:Subject:Date:From;
 b=C1gS9S1bwlJRh8Qkfn1AR/cQl8dISdmZT6S1yqmIi/ZN4Z3io7EvH6NOUFQcK9OK5
 X0kOaQTY1HcHwwMecBdUiX5b9pNoXyQKDGu8h483S1Bs6rELR5yRn3ZAOsGRr0q9/5
 DGG9LImi68MMl3Q+WPGhvKYYflPlCfiXcjYD3wRFqqxHmG98zdjnfshceVKjqYDil8
 7ETqdgSlzIGAE3EfW0AjB/GZdIrogIokkIyn5d4RQNNQlQvot4hGvOfpNKp0fbOpOW
 IUViNQBgn29/A9UJOdQE7Ijodn7zreIjYQyeJtwVAJAds+N6Xe6t894M7TneUQoh5l
 V0KsMh1Jy2SxA==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id A55A2A005E;
 Mon, 26 Apr 2021 10:10:27 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vladimir Isaev <Vladimir.Isaev@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Vladimir Isaev <Vladimir.Isaev@synopsys.com>
Subject: [PATCH] ARC: Use max_high_pfn as a HIGHMEM zone border
Date: Mon, 26 Apr 2021 13:10:04 +0300
Message-Id: <20210426101004.42695-1-isaev@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_031032_897680_63E283CC 
X-CRM114-Status: GOOD (  10.35  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Commit 4af22ded0ecf ("arc: fix memory initialization for systems with two
memory banks") fixed highmem, but not for PAE case when highmem is
actually bigger than lowmem.

Signed-off-by: Vladimir Isaev <isaev@synopsys.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arc/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index ce07e697916c..59bad6f94105 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -157,7 +157,7 @@ void __init setup_arch_memory(void)
 	min_high_pfn = PFN_DOWN(high_mem_start);
 	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
 
-	max_zone_pfn[ZONE_HIGHMEM] = min_low_pfn;
+	max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;
 
 	high_memory = (void *)(min_high_pfn << PAGE_SHIFT);
 
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
