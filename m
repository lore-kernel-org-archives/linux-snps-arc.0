Return-Path: <SRS0=KZrG=LC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29EAC47082
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Jun 2021 09:15:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B899661208
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Jun 2021 09:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B899661208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sIlQ5fCIiMUm2vxlYp0ZWISRSYhr+ew8Y6VHu5m2aE=; b=TI4Tbp4WoyEDY5
	5CuGJrM3JaY2FUz85nfEyD/MfWaw1jowIIQXKGIEVNANnyEgdceIwBecpFkdg1dw2vFrVMfsqjfSp
	U/7vVSR18I46hlv0VhNQouDncJrD842aXhtxHzZXb9NNy6BGc6etNCHjgtIkeQ1DEpbGFF94V8V/0
	MLAJfWX2wfE/AZiDn6EMDKdT/tA+Qb/QzxICbTbJUg5a3TXeWk6EZaPV9dKyifXmaO5m8o8K/mZ+/
	yk+AoWR346FKqZUBXKlGPRMmSwtlUmyYjY/DOmGRs0GwfGBz1z+0aSRPgTwCyjojRLW3D9ZxdKrYD
	NcouYbsMKGUzS3jZzgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqXpb-007IKK-8a; Tue, 08 Jun 2021 09:15:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqXnq-007HMK-0q; Tue, 08 Jun 2021 09:13:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 772B76127A;
 Tue,  8 Jun 2021 09:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623143621;
 bh=5M6SI0E8FaPqJBzrojGurF0bG6c1so4urASqP1MJ6OI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MSPk8XP/fk/HQXwQR0Y8X62d/zOfv3kCpxM2mgVp0yMl7xGTgSgJ6awXhx4yAVG3v
 5byIdcpdttB0jtR+0YGpI1sethOsTHVJWfNUJY7+qhuUbKld0uYkWcQ9WINSpcrwus
 E11KhPbHhno3hkty1rt2rw/QxWboDsiZ1qlahi+WW4fkUd7RnjOBxr3Zr7qJdc0qMQ
 wg6SQ4ojIq5rDG8FiHgoN8aYP75GHBOsrUGkafVgrmB1H8TsemMLwY+eQBZ/uW9xEY
 ourFYcy5QDhZVTfn6Zx3jTKWLUFIA5icx2/1V4WIICpvDjLI8buDIL5lq3FHWUjueL
 uR0PflBnBFzaw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>,
 Mike Rapoport <rppt@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Richard Henderson <rth@twiddle.net>, Vineet Gupta <vgupta@synopsys.com>,
 kexec@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
Subject: [PATCH v3 2/9] arc: update comment about HIGHMEM implementation
Date: Tue,  8 Jun 2021 12:13:09 +0300
Message-Id: <20210608091316.3622-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210608091316.3622-1-rppt@kernel.org>
References: <20210608091316.3622-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_021342_110790_DC964859 
X-CRM114-Status: GOOD (  12.80  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

Arc does not use DISCONTIGMEM to implement high memory, update the comment
describing how high memory works to reflect this.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/mm/init.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index e2ed355438c9..397a201adfe3 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -139,16 +139,13 @@ void __init setup_arch_memory(void)
 
 #ifdef CONFIG_HIGHMEM
 	/*
-	 * Populate a new node with highmem
-	 *
 	 * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
-	 * than addresses in normal ala low memory (0x8000_0000 based).
+	 * than addresses in normal aka low memory (0x8000_0000 based).
 	 * Even with PAE, the huge peripheral space hole would waste a lot of
-	 * mem with single mem_map[]. This warrants a mem_map per region design.
-	 * Thus HIGHMEM on ARC is imlemented with DISCONTIGMEM.
-	 *
-	 * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
-	 * populated with normal memory zone while node 1 only has highmem
+	 * mem with single contiguous mem_map[].
+	 * Thus when HIGHMEM on ARC is enabled the memory map corresponding
+	 * to the hole is freed and ARC specific version of pfn_valid()
+	 * handles the hole in the memory map.
 	 */
 #ifdef CONFIG_DISCONTIGMEM
 	node_set_online(1);
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
