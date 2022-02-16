Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FECC433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Feb 2022 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qmlyTqgD3dr9KEJ7deslR2yOCU+ZuZeQK3roxf7JCU=; b=ISLbvvuB6BoqfI
	zS6721Lz6C5QVZeLv5+sSE2UCTYbtlqudPW6d/fL/EGmL+F8XXWMyNVe10gIbzdeFKBzW3JeU5pmt
	1S4YmnwzloBzqry/hYbIGwo/19F9VX1C5sjjEZnt7Qn5D4kOaqqssWSJvNXkVYoqIlGnMtSXPHuYQ
	/Io7J35Gddd2C1ayd4n7/Ly/u+cR4wcK+qKZ2JEIVJmJP6V2X2RhNPAe5RbH5o+QRSos0mIW/vITk
	W8+Sz6vcl/KOPYChig5xJZJVh01ONvkSufCZ1tzASAU+4KjE815GHdkXZmp8vJIgUDCOdFH7oaqzj
	PfounRFUm6ONDmejeBMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKKBc-0076Eu-Sk; Wed, 16 Feb 2022 13:17:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKKBQ-007615-C3; Wed, 16 Feb 2022 13:17:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D795961655;
 Wed, 16 Feb 2022 13:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB5FC340F1;
 Wed, 16 Feb 2022 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017443;
 bh=MxlH7OSdWg2oRBDys6vsaBDtcNFNrqae9GgCDj46MDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sjI1N/Ysf6UohThwc+VXydeUqwNugfP8doF9H67EicATD6oaAkDsrCNS3AC/ubFNd
 ziBIxKGEAeyq4Bw3XdZgjBuNcKHeB1enctrHaLGU2ykGVgZHDsnbC5Wzwde0sZPsGo
 WD7WBQJHRS/PhCcVbk/s6TQX9q0zFJnPZsK3bgY0sTLsXoxe2RYo46AhoXLG6T8vLY
 ptfvBD5j0ki8uiIVLlwxNojr8S73bqQ6CnNgAESnFCyQrATHgA3qg0Clpwhp7O6ene
 UNjiTeS5j4av8zOGlm3gJWoU7z2Cw6gaTV6tNodGA/Zj7EYErzSRxKmSguUvyWCtWL
 X2GGlpG3o7PVg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Cc: linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com,
 dinguyen@kernel.org, shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au,
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 hca@linux.ibm.com, dalias@libc.org, davem@davemloft.net, richard@nod.at,
 x86@kernel.org, jcmvbkbc@gmail.com, ebiederm@xmission.com,
 akpm@linux-foundation.org, ardb@kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org
Subject: [PATCH v2 10/18] m68k: fix access_ok for coldfire
Date: Wed, 16 Feb 2022 14:13:24 +0100
Message-Id: <20220216131332.1489939-11-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_051724_505183_B17BB4D5 
X-CRM114-Status: GOOD (  14.08  )
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

From: Arnd Bergmann <arnd@arndb.de>

While most m68k platforms use separate address spaces for user
and kernel space, at least coldfire does not, and the other
ones have a TASK_SIZE that is less than the entire 4GB address
range.

Using the default implementation of __access_ok() stops coldfire
user space from trivially accessing kernel memory.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/include/asm/uaccess.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index 79617c0b2f91..8eb625e75452 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -12,14 +12,21 @@
 #include <asm/extable.h>
 
 /* We let the MMU do all checking */
-static inline int access_ok(const void __user *addr,
+static inline int access_ok(const void __user *ptr,
 			    unsigned long size)
 {
+	unsigned long limit = TASK_SIZE;
+	unsigned long addr = (unsigned long)ptr;
+
 	/*
 	 * XXX: for !CONFIG_CPU_HAS_ADDRESS_SPACES this really needs to check
 	 * for TASK_SIZE!
+	 * Removing this helper is probably sufficient.
 	 */
-	return 1;
+	if (IS_ENABLED(CONFIG_CPU_HAS_ADDRESS_SPACES))
+		return 1;
+
+	return (size <= limit) && (addr <= (limit - size));
 }
 
 /*
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
