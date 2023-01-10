Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65767C46467
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Jan 2023 20:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aq6LaMrk2reoZ/5sITrVKlJ/m7LqzVSLbJoCuc4uFTo=; b=K9FIA2BicdZ1WR
	bW/VsdbX318hI+dvpnXkOwHH80a0K4sJn9HMOragIA3oemJFWhcbjt3gYu6Ykm+flN2Qs/reZsmhB
	EFOVeuw0TXf8Pt6m9ymeF/8VxeIlnijhbM23DucuRBGMkW9p4BLRbu0GqM3RcJWFq91qIFJjB2v7y
	ypqOONcAmLxqbD0gKvynVQIPQloE//V8zlOLNpTd95cOBlRNm67cnlHoKl8N8NMCmbVEQDo/lSgeW
	sjE9YRBT5GjgtxqGYN6LpkXdls3dq/pV4jHjF9S7d++ybvHnFbEV4c0IEm8f05uY7KI9+sAeeAEMt
	nv4mwfpab1y4p7uCJzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFL7n-008SjV-W2; Tue, 10 Jan 2023 20:21:35 +0000
Received: from smtp-23.smtpout.orange.fr ([80.12.242.23] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFL7i-008SiB-Gd
	for linux-snps-arc@lists.infradead.org; Tue, 10 Jan 2023 20:21:34 +0000
Received: from pop-os.home ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id FL7cpSMgVPNsNFL7dpVOK1; Tue, 10 Jan 2023 21:21:27 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 10 Jan 2023 21:21:27 +0100
X-ME-IP: 86.243.100.34
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] bit_spinlock: Include <linux/processor.h>
Date: Tue, 10 Jan 2023 21:21:13 +0100
Message-Id: <efd8783178f9d15e6d57f10e2e5090a14d5bc923.1673381735.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_122130_707018_F06F8F6A 
X-CRM114-Status: GOOD (  11.33  )
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

In an attempt to simplify some includes in <include/dcache.h>, it
appeared, when compiling fs/ecryptfs/dentry.c, that <linux/bit_spinlock.h>
was relying on other includes to get the definition of cpu_relax().
(see [1])

It broke on ARC.

Include <linux/processor.h> in <linux/bit_spinlock.h> to fix the issue.
This will help to remove some un-needed includes from <include/dcache.h>.

[1]: https://lore.kernel.org/all/202301082130.LXMj5qkD-lkp@intel.com/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Change in v2:
  - include <linux/processor.h> instead of <asm/processor.h>   (Andrew Morton)
  
v1:
https://lore.kernel.org/all/8b81101d59a31f4927016c17e49be96754a23380.1673204461.git.christophe.jaillet@wanadoo.fr/
---
 include/linux/bit_spinlock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bit_spinlock.h b/include/linux/bit_spinlock.h
index bbc4730a6505..4e3b407963f6 100644
--- a/include/linux/bit_spinlock.h
+++ b/include/linux/bit_spinlock.h
@@ -4,9 +4,9 @@
 
 #include <linux/kernel.h>
 #include <linux/preempt.h>
+#include <linux/processor.h>
 #include <linux/atomic.h>
 #include <linux/bug.h>
-
 /*
  *  bit-based spin_lock()
  *
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
