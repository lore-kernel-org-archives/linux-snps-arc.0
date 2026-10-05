Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E759CA5FF0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Oct 2026 12:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ek05E9waY/Gmc1IAdvOpNp6j90fTFid/Lx5f3zBClTk=; b=kyYwzlLVTWN4cU
	y45UXJ1FPAUvgkisK3oobpSKY0FT13qS2jRLpnE3Fm/0p1dbO5zhiENgLJbwDN5PmCb6GP7ZV8aVS
	HYfj/WtVGW1Qae1oB9l8OB1eSZfufpp3ycJPFU9h7QxWFudmpgeVrdYJvCo7zGQYaiwhuSJh6H7b3
	x0BCL/nKawf3Fb8vqZv8kwZc4H31uZ4GaVdsAYEa9c6f5kVBYzj1EDDcIagH3758fyZXi9FX7WO/v
	ibH7kl57ovmoia0S2wUXgfHrei5WCkFmEIls4hNoAOBx9U01wSU6TpC/3HwusIt0hLhMVxOkgVKu/
	ZcuYzB+wNEDJwiKt4p6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhSP-0000000GNMh-3XZy;
	Mon, 05 Oct 2026 12:06:13 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhSN-0000000GNLz-0fFg
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Oct 2026 12:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201964; bh=gQiGga2Z4THQxcURrzEPZFq
	KmnssVIT4dSdk9XOrkDQ=; b=c6X/5p4pcLqfTbYSOffQRTPj+yYzQ6Ar88g9TgYQZB6jVLFSPB
	Re/YsXzw5lMY+JuIiJ4qULks/AMP7ZTQL1+31EQ2x+cHhhgZyA/DkJyP9xtU+Xm7Ll6rZ5GCuex
	JStQRds7rzzZu0kxPJq4/l42l8Bplmh0HO+nAwJ1v42VKuqDSf9Fy62pDStY9pEPWClynoJNqZ4
	NvbUujIRW9W8mYXXfxcJnhAd7ogOPU12uBkLyi8nCjrHSJjzeao0F0WULN8HfK8ojke7WFGbF/b
	FZ3KiFDXv0OA+rIqfkD9X8iWSV0Xsvi8ilWQm3YrMbKfyfKbgJYGN8pYRFLMKjTRXxg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201964; bh=gQiGga2Z4THQxcURrzEPZFq
	KmnssVIT4dSdk9XOrkDQ=; b=3lAMB5Imfg+jAz+v8/50fhFT1WYag9oorC2vpN0PebrW6zQJ1Z
	rk/V4FA+NFPEcL/zeD+EZaca5OD3DR6UKuDw==;
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org,
	vgupta@kernel.org,
	guoren@kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: arnd@arndb.de,
	paulmck@kernel.org,
	david.laight.linux@gmail.com,
	glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
Date: Mon,  5 Oct 2026 12:05:56 +0000
Message-ID: <20261005120556.383004-4-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005120556.383004-1-brads@mainlining.org>
References: <20261005120556.383004-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_050611_347281_0B3637BC 
X-CRM114-Status: UNSURE (   8.06  )
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
which is declared but never defined, so a two-byte cmpxchg() fails
at link time.

Route case 2 through the new cmpxchg_emu_u16(), which takes the
old and new values as unsigned long and narrows them itself, so
the call needs no extra casts.

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
2.53.0

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
