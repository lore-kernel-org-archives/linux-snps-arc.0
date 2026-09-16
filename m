Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F7DC982C9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Sep 2026 20:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BiZixNDc+UETlDdVOu8JeyL+ntclSqjfl4yhKNWnO7c=; b=Q9M5wkPCvZvmuu
	+C0qDa5L0o8vQMshaiSUTafPMDoOoabw9NWO16kLIuw10jB18USMtx3H9kH6vTYBCYGdQUc7j3nS7
	EKnD0w0Qi/93VtUKE+AvYvrg+7iyxM4eFIZkCo3zd8D4Rjfc9JQXzW+8FLSnggnXAFTo2gbAbiISO
	yz0Aqs/Ol+ElqHn5ACX9ipXvcehrNUUVQvD4mTUKj60iCVR64sm3u131eOsOLNcxqAKbPJZrihBsJ
	y/72weZhC8Oy8mwA0eqyzPmAAW5M7b7PN4F7shGyAwwLCJONmWn0r92mTU+VOPNxJetvS5yzy03j5
	BHCvhfU3pvt5S2qnC0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vsK-0000000A4Ld-2fwQ;
	Wed, 16 Sep 2026 20:05:00 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vsI-0000000A4Kt-1mka
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Sep 2026 20:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789588936; bh=Cmoc+LvxrB8XTyAuxieF0n1
	oKRJqDrHiKarYKzS8wOk=; b=QrcW/ZGsGc/8zHko7LRpzYzG2forpReCVNUoEO/bRUiepdOsvJ
	Vr1/YF1bZ3Bw296iaAHCQclAkdJYIUR6E02L/Nq8tZfvVx22f7rYSWrsMTbLU1cW0SCq8DSeYnN
	BVg5WtgXATQq/GpIUm611bYcR9qe+DJR5ZKoAs7PnYH1aR23/+8gPaqNZIrUr/UxGocpngHCThG
	6HdW+Z51I7gGEhp+ZvlZ1zvFuicUibVeNY7bBLL5ZQc36Yj4a2dB1Cftd463cVKFVEOrAXDUAFN
	OOPI0h8Jmnqq22PWIuHK9IRam5z0qayaxb78HeVB4twBKIFxpaTu0fnjuLZrjs0ddrw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789588936; bh=Cmoc+LvxrB8XTyAuxieF0n1
	oKRJqDrHiKarYKzS8wOk=; b=GUPIOwdm1MvUm482CkvGoF26O4/6Ajr0KBRTAKBF4cQt4KT7lo
	wqg+pzOKceAgkHmRUcBiSMNVP21Ag6YNpZDg==;
From: Bradley Morgan <brads@mainlining.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH v2 5/5] xtensa: Emulate two-byte cmpxchg
Date: Wed, 16 Sep 2026 20:02:15 +0000
Message-ID: <20260916200215.21774-6-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916200215.21774-1-brads@mainlining.org>
References: <20260916200215.21774-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_130458_609617_7AFCBD5B 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

Xtensa has no two-byte atomic compare and swap, so the __cmpxchg()
switch lets case 2 fall through to __cmpxchg_called_with_bad_pointer(),
which is declared but never defined, so a two-byte cmpxchg() fails at
link time. Route case 2 through the new cmpxchg_emu_u16(), which takes
natural u16 arguments, so the unsigned long old and new narrow at the
function boundary.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/xtensa/include/asm/cmpxchg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index b6db4838b175..8dea8e357fc0 100644
--- a/arch/xtensa/include/asm/cmpxchg.h
+++ b/arch/xtensa/include/asm/cmpxchg.h
@@ -76,6 +76,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 {
 	switch (size) {
 	case 1:  return cmpxchg_emu_u8(ptr, old, new);
+	case 2:  return cmpxchg_emu_u16(ptr, old, new);
 	case 4:  return __cmpxchg_u32(ptr, old, new);
 	default: __cmpxchg_called_with_bad_pointer();
 		 return old;
-- 
2.47.3

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
