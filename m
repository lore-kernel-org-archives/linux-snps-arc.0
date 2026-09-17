Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304A8C982D6
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Sep 2026 16:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjivuhNxM8N+/hB9Mro9r/5Atk6q6mjj279JbNYQIGw=; b=CEJnpc2npWPcUs
	qrsYv7Rh40DY3soYmg45RB4t1fW1BBPyCG60pD5dfIKEff4vVH2AbzlhjufEYy9uKb4kZ3mrvDWXg
	JOydarsoTsT8AIBPzZXVNBwrf1vFRJ1sbxkslJSzuJ8ILACIbw07tQqgaUZ+wwmWozjCgrMsVX2LO
	/RPGF2eghgsaKsq7gu8efjMfbefPrJEkxzhImCECoIcLBBVPsEkGTrjtYIc+lj0CyFLyivJ1v7bLT
	Yl+kXy05Jg1XW0JADAhyMgl3pjK0ab5aSTw/ATw+M7STip91irzOAUwZ9csoCtL2Cl/izZGVb04xr
	nQ9rhYFSJbWUU2FUcaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FB4-0000000Bxsu-3lkJ;
	Thu, 17 Sep 2026 16:41:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FB3-0000000Bxrt-1efO
	for linux-snps-arc@bombadil.infradead.org;
	Thu, 17 Sep 2026 16:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3ywXA6YlVC+E1c3gGiCHQc0l4jiAYrAVWl7TP3MSFhU=; b=b8uL2YWDsCYXWbY5a45QOFQAde
	1pEVkvYCydgCOH8OojSTlmRw/8YcZVB6dbMHaXGXNIlmSI74D3dX7wOSq652dWsf+tCOKlGiJ/EL1
	K0xsh3zWK+iTriz/bSeqTn2KGJeuCr/QGbYiIhLYvFM9GmeOFjhhga0XjM+rGKJUkb2Jud1t6vMHu
	UkDiuC3JW/GsU5A7lSY9LpKYtotMD13CIDg7K4mIkKKljDCstVMzqRhlM2ZMZOJztX/nKXD5h8lKN
	M/mdLXidStO3ixzBYatqwNwMwZasEg7N58B7gig4IVA9VLX6LUKci8B9HmSF0Ip8J5dOt1SzqAjXp
	Hulxdh/g==;
Received: from mail.mainlining.org ([5.75.144.95])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7FB0-000000093vp-1f1P
	for linux-snps-arc@lists.infradead.org;
	Thu, 17 Sep 2026 16:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789663143; bh=3ywXA6YlVC+E1c3gGiCHQc0
	l4jiAYrAVWl7TP3MSFhU=; b=VxQkqBBW9sRnf40WfNQy0UNwy7EMU86vhigeDr60kGk1Nkrdhg
	efJJWIXVw1XFP1+OQSou8wBMpJ9mm7utA+U58oJvMTgL7aCyLwY9vELXF2bepXamAugyOl5Q3Rw
	/ShVX1cJmj1JGkGzZZaQjWvWUaQvEwu4Q0aWkDhKD0PURLdFoIJhf7CE+aV+nA19KvyDAmT4Vzk
	WhwmpmZH3IcLOH1pjWBpzcNTzAY6HTOdje8GXQ0/7Z7chafYH6OnCyiwBsJK0s+rfANzP7ZIqVg
	V2GzCs5/N/I7Aw3n+mVYXxJcQRqknj88K/zJ6/wkxQPUrnlgrvr9SIXo5miscXITElA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789663143; bh=3ywXA6YlVC+E1c3gGiCHQc0
	l4jiAYrAVWl7TP3MSFhU=; b=E5BykGjyMCtNsWQZJZqRlWMkluZBFfyP4tpAHl1lcCVJ0wx2pw
	I0nlPir4hT7n7G2VxUHQtJjYQzuxss6cIZDQ==;
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
Subject: [PATCH v3 5/5] xtensa: Emulate two-byte cmpxchg
Date: Thu, 17 Sep 2026 16:38:30 +0000
Message-ID: <20260917163830.3748-6-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917163830.3748-1-brads@mainlining.org>
References: <20260917163830.3748-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_174134_663016_DB2D77FF 
X-CRM114-Status: UNSURE (   9.67  )
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
the old and new values as unsigned long, so the (unsigned long) casts
on _o_ and _n_ at the call move into the function and the macro's
__typeof__(*(ptr)) typing of _o_ and _n_ remains the pointer-integer
type check.

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
