Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EA1C982D6
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Sep 2026 16:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1nCV/Ax91ceveBbklk9Uhl+zr+qcgdkpm554QM8iRY=; b=H/lB6OOxYtVk4n
	FCSIjjZp5bXrM1roPe4siRfcmdvHMrysYK17UrNyenzvHjOATlzgLtfyKAYjCZyRkmrcoEtoBN7jT
	PU7G1S4LV+JiQTmT9VnOJMb8mXVFq0HLS5+CBpVqmt06wMBrv3SYktSBDZrRCE773G7KD5CQCg1He
	a52HQAVpj+jnez6yhNl2JlxMkXE+TP10ImDxjTUBd3rX6MXOghXIyYn2goVNyc5tsM8N6ftZ7kwbp
	9lz9og5gsZ4OsYhsmVDKFaIJFrCYpeM70Va0SVCfuE/FDKbin6+VvpZ8haTf2u/FflaUXI73goFT+
	W0mrL6gaYAcm3RfB+G9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FBv-0000000By4C-0sSx;
	Thu, 17 Sep 2026 16:42:31 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FBt-0000000By3O-1Epw
	for linux-snps-arc@lists.infradead.org;
	Thu, 17 Sep 2026 16:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789663338; bh=juRRI8MQIpYjs0BhSu4tGaP
	+X+54DRB7SI1nxHvfH+A=; b=hJueiS/4t9OIuq2NQI0xcpJLPZdB552eAartHZwhIRDKn64ALf
	tSgWAozL9qE69oGlBA4nItYz5U0gvzMObF4aZq3gme9/kDmlLuKbn5BJ/3mViw5MvejlDjHZfON
	kmeetPp1OvQ1nmXwCiaXikD7BLKpSRvJjtDRM3ndq0EeofS7penuWEXRneYhidDhLY/Mb4Dcj23
	8sUuqe5so33bKmLb+ZJUXuXDQqXl5N26KngeqCErKgeuFY6yf2VMRahb5JAcl1yhxsQzUbTAm5+
	DRNKu6+AgD8R7ohQF+jjvakxrRusxddhLkAm9cEF4Q12qaSXI86sco8BSB8IBZIDKpQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789663338; bh=juRRI8MQIpYjs0BhSu4tGaP
	+X+54DRB7SI1nxHvfH+A=; b=OI0tFVhmDQud8l5AFH+TUgN/Ou4Qha125rpyARyZ9HM2eKky3n
	5f3b2rkTqXr9Q6g6MRRBktwz1ZwCCN9hTfBQ==;
Date: Thu, 17 Sep 2026 17:42:18 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta <vgupta@kernel.org>,
 Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, "Paul E . McKenney" <paulmck@kernel.org>,
 David Laight <david.laight.linux@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] xtensa: Emulate two-byte cmpxchg
In-Reply-To: <20260917163830.3748-6-brads@mainlining.org>
References: <20260917163830.3748-1-brads@mainlining.org> <20260917163830.3748-6-brads@mainlining.org>
Message-ID: <93B03090-99CA-4226-91F0-7A7508521953@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_094229_485559_1C813708 
X-CRM114-Status: UNSURE (   8.28  )
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

On 17 September 2026 17:38:30 BST, Bradley Morgan <brads@mainlining.org>
wrote:
>Xtensa has no two-byte atomic compare and swap, so the __cmpxchg()
>switch lets case 2 fall through to __cmpxchg_called_with_bad_pointer(),
>which is declared but never defined, so a two-byte cmpxchg() fails at
>link time. Route case 2 through the new cmpxchg_emu_u16(), which takes
>the old and new values as unsigned long, so the (unsigned long) casts
>on _o_ and _n_ at the call move into the function and the macro's
>__typeof__(*(ptr)) typing of _o_ and _n_ remains the pointer-integer
>type check.
>
>Signed-off-by: Bradley Morgan <brads@mainlining.org>
>---
> arch/xtensa/include/asm/cmpxchg.h | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
>index b6db4838b175..8dea8e357fc0 100644
>--- a/arch/xtensa/include/asm/cmpxchg.h
>+++ b/arch/xtensa/include/asm/cmpxchg.h
>@@ -76,6 +76,7 @@ __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
> {
> 	switch (size) {
> 	case 1:  return cmpxchg_emu_u8(ptr, old, new);
>+	case 2:  return cmpxchg_emu_u16(ptr, old, new);
> 	case 4:  return __cmpxchg_u32(ptr, old, new);
> 	default: __cmpxchg_called_with_bad_pointer();
> 		 return old;
>
Oops! Forgot to add R-B tag! Merger, could you add this when it's ready to
merge?
--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
