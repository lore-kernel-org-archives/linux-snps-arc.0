Return-Path: <SRS0=Bf7c=OU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73080C433FE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Sep 2021 18:56:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F8F56135D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Sep 2021 18:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F8F56135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIWiMcKxsqpJPnZK69y38V+js6KJVFDfazWx2djAL9M=; b=qyhHiYBdOX1RMp
	AManI2oygMPwqLToDZ6pWC2GnI3qwxfpwPUcgyBKlk2qYeJCW/FUoZgb7jQkRjN1p1xhJhFaJjz55
	BaXIzEB+eS8zefZUNStqtnnPSyxtp8ovvi/fqJ8VRb7fS7cTuyROGMA8o7nXwvsjSzcfnuMa7+P07
	IgiV+RzfPLRcEoTRdRsK/SaTGXVLuPsdZJ6qj6VA6gFqZBfLw7aedqqrcw+VPylemlx9Yxj5kguar
	H9XF6Y0kMzr4Rp24oBnusLLPHFplKGP3RFBGd1Q45QykKDo3W2lG8gz3YkzBZCJqY6dEWF0KCtQuw
	tE4QbApXcOPhoZtHyNtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW1Dq-00Fkai-VS; Thu, 30 Sep 2021 18:55:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW18y-00FiNF-BF; Thu, 30 Sep 2021 18:50:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8841861209;
 Thu, 30 Sep 2021 18:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633027856;
 bh=UhBCHbOj9Jl5ZEx32c+R0M1PnzpsDKyF6CtjxvFScPo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c2tPiDJenxyQCvMzIY4Em8nsDs+rtaeSgB5mPhO6rdWaZxL8dx3plalQIb93rr+g7
 VQ8cGTHdyEbFp89BNk1xmo9SM+kleGvnBNuMMGt+h3NC2iEs3mimxx37p8Rh1Q49I1
 dICy9rhz40FtM07iwqUokDQc+WAsE9WW38PuHUYN59W32pQcFuBqF49AW2YbxvUmMe
 aml+AvUr5+hgysic8DOhS2c2vDqm1VwkFyfbPUhqrlF8CS9WEcfvcWhLGpQ9MtlfVo
 xwgzIBOzSTgMKLsybKBHHglY8ZfOkRoMe48nKFLqWW35isec2qKzGOkfCDbTRn1Osu
 LXpN7CWI+EqJw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Juergen Gross <jgross@suse.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/6] xen/x86: free_p2m_page: use memblock_free_ptr() to
 free a virtual pointer
Date: Thu, 30 Sep 2021 21:50:27 +0300
Message-Id: <20210930185031.18648-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210930185031.18648-1-rppt@kernel.org>
References: <20210930185031.18648-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_115056_447049_41A1389A 
X-CRM114-Status: GOOD (  10.96  )
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

free_p2m_page() wrongly passes a virtual pointer to memblock_free() that
treats it as a physical address.

Call memblock_free_ptr() instead that gets a virtual address to free the
memory.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/p2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 5e6e236977c7..141bb9dbd2fb 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -197,7 +197,7 @@ static void * __ref alloc_p2m_page(void)
 static void __ref free_p2m_page(void *p)
 {
 	if (unlikely(!slab_is_available())) {
-		memblock_free((unsigned long)p, PAGE_SIZE);
+		memblock_free_ptr(p, PAGE_SIZE);
 		return;
 	}
 
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
