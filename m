Return-Path: <SRS0=Frhj=K4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D84C47083
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jun 2021 11:00:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B22466023F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Jun 2021 11:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B22466023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TeLSyFPklEtFQSdX/6h5qEf4ASFBbt+e0wivtqLOGzQ=; b=RIySqbLTHGCg8g
	02MXBujNicqY6LTpAtumXfovLSeavvGUunffpdYw7WZDr/dozwpEIlWUiPendSExvMkvJua1b+lA5
	N3wSik9HCAGf7cUnSsgn7TuPdGJOpP+feNto5NM8P832V98+jYNLvlVh8SR/Gn17dfMHxUp7NkAp2
	FuSpfa2Dnq6VumhmOWt9YjUiPLdvBicLtOPqVyBE+i9dEpW9+Jg2/En7qcFKsmrN1mvT1JtMxyGqw
	3yy2Th+M1ynRexfrSKaCA4nYKQ4WMAR98KnnA1btWg0+5ccaMpK5CaAoGdfuFqKXcSQmhaIBgXm7o
	z0LsY8eVgkYtimXkVCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loOc0-003Wsp-Ku; Wed, 02 Jun 2021 11:00:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loOVp-003U9X-Bt; Wed, 02 Jun 2021 10:54:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3015613D2;
 Wed,  2 Jun 2021 10:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622631253;
 bh=M0bKVaGHx9OxuQ1E9oxHVBUkdvBwvAMGJJiXepUaSFE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NZQ2rr2E/OctHk1XnG/C5vLVoo2DWWNRKDUphu7Fh35eCKk7WRb+E/oZ1QWpjns4n
 483dCoOUenIqXs2GkrV7dD0CBQudFaPjtEpqVBzYDkYbv3dPEwgvpFNS1sK8Qm2M5h
 dfPcSWwLtEgixqKEsihdQBlQLPat/EiAfVdcN+PKy/jPFrwO4GBJW17FhoiRnP5FE/
 LjACmzvLPl6AQjzug1qGPe7CVpkPamqtdaxLDkkdyw7FIplstRB17LG7WMeV+G4ZvT
 AznPR6UfbTW4ZrJ8sIkP2lNwVl5gX3ybDLO4yKMbiW88ZJjTyFtboulTH3d2QuUriT
 IjqRNXEinP8RQ==
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
Subject: [PATCH 2/9] arc: update comment about HIGHMEM implementation
Date: Wed,  2 Jun 2021 13:53:41 +0300
Message-Id: <20210602105348.13387-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210602105348.13387-1-rppt@kernel.org>
References: <20210602105348.13387-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_035413_478204_EEB386FB 
X-CRM114-Status: GOOD (  13.28  )
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
