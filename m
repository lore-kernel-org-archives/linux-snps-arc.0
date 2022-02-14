Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7B5C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Feb 2022 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JKhl+evFfsq9Rm6Hr54F+DQTR8oiWaxLSqwvSPV74g=; b=nR+jOOgaUp69n9
	2TV+cBE2vee0hI1M1E2uYzRpa71GFUHVGTsbd4h4rq1OlW5l2Dh6KyzcU87DB2zJ+EOb2g9k8OiD7
	jionzE+BE9OQKCyBu0zObyyf+RK8PZqTapfSuwcIE0ptu85JX9rGG03HLjfSY8DRNpLTOt3uy31KT
	hatArnr7Tm1uKPvQWPaFaJYh6OOFE9uTu0Ed1Okxo77/LoW15cJ90IqE+6CqToZsgh+d+1gxr6lBZ
	f8tCicgJvACKRwXx7ELYusH9XGKv89XxULEsAmlyd5K1r1GcbZdyKHN+6efJ9Z6yO1R/LPfhoqPwP
	qevHw83QbB4CXsnaupaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJeRF-00G6NJ-IQ; Mon, 14 Feb 2022 16:42:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJeLt-00G3Mt-3P; Mon, 14 Feb 2022 16:37:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B15A614E2;
 Mon, 14 Feb 2022 16:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3700C340EF;
 Mon, 14 Feb 2022 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644856643;
 bh=JepNdDlcl+vjLJWkKWFbQ8vIdC8P4ZqTHDtlQLygTvQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yg/pItSQEzs71U/F185pU77Adjq+Wuerpy4kR6BgmvnTJ6TSm1zrt/F8Hi0vGnBb+
 /8Qj5B7b7QxWzSyj+YeaQuhTnchKrNXCzC5slLNGTccGG7g8bl+2UbzUrHWSpXGIt7
 xOg1fig8QiFMO5I3dgU5J+VFGv9rj3JE/Q8LpSpGVH3h3UIE6QskDu0wdEwCOfzQ3s
 aEs8d4j4C6ZkWevO+OIcqOgq9ygDqYeks1ido77hfRKhPW+Q6EC6HRyawN1COLV7LZ
 IgymdocysjOODUy7N4XtW+MjvAWPMlGA3mGuN1K+i4O4Oyp887hWbHPbK6Uy2BO2A4
 4Bp3sWpanrwTw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org
Cc: linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com,
 dinguyen@kernel.org, shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au,
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 hca@linux.ibm.com, dalias@libc.org, davem@davemloft.net, richard@nod.at,
 x86@kernel.org, jcmvbkbc@gmail.com, ebiederm@xmission.com,
 akpm@linux-foundation.org, ardb@kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: [PATCH 09/14] m68k: drop custom __access_ok()
Date: Mon, 14 Feb 2022 17:34:47 +0100
Message-Id: <20220214163452.1568807-10-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_083725_215207_85D4BE19 
X-CRM114-Status: GOOD (  11.87  )
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

Using the generic implementation of __access_ok() stops coldfire
user space from trivially accessing kernel memory, and is probably
the right thing elsewhere for consistency as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/include/asm/uaccess.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index d6bb5720365a..64914872a5c9 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -10,19 +10,6 @@
 #include <linux/compiler.h>
 #include <linux/types.h>
 #include <asm/extable.h>
-
-/* We let the MMU do all checking */
-static inline int __access_ok(const void __user *addr,
-			    unsigned long size)
-{
-	/*
-	 * XXX: for !CONFIG_CPU_HAS_ADDRESS_SPACES this really needs to check
-	 * for TASK_SIZE!
-	 * Removing this helper is probably sufficient.
-	 */
-	return 1;
-}
-#define __access_ok __access_ok
 #include <asm-generic/access_ok.h>
 
 /*
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
