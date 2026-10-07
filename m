Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61478CA600D
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2026 20:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=glR5eNVrIfKa9gAeFjiy6a59ennaaL1X8gHeb2gIWUA=; b=QRta/FokzKz9Yj
	xf+JUcb7sLe1XMH4/SBRCzBE96ZbfyFJoBJDV202ZB9nzVc4JZ5hhW3pfxO9PnvlcFjuYOpiJcpbP
	ybwjWWnU/VpCNNf+U/f0RXOt9IbzkvDa+5yDeGaUvJ3R5/jbirlAq+mikQ62QaWt+rOQDv/3h5gu8
	vEspFZ5vXM+4QAV/4E+OUFI8FvC5cAI2CxrbzKGIM1LGIaRe05LxwL+5yegRc7w7nhP9IZ7KjRcwx
	PR6ULSYXQTzlu17DNHx340fXe3w67DmLMqcxxz53+B6Y1DPMpMi7HFupypNw3ORKqzd56rVZfNhGV
	yzG3v0jh2nzyZ/GqByZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYNT-000000038qa-3sta;
	Wed, 07 Oct 2026 20:36:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYNS-000000038pQ-2a13
	for linux-snps-arc@lists.infradead.org;
	Wed, 07 Oct 2026 20:36:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A90A447E8;
	Wed,  7 Oct 2026 20:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FF21F0089D;
	Wed,  7 Oct 2026 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405397;
	bh=DwR+Icn/O6BJifyfJAm+hF0AIuvvzHeAbd8YOtPmg7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AFM84YxParxFhIM0Vhs0eYo5leJXbo2bOLnf3+VzDyrL9vKLgo6E33T26dtUOYo8r
	 BKsMuN0kvFUQhQoI4vWsKew6s78p7tqO8nbr+eBqouVP6WrGZ6avmaMj45+29cPTKr
	 p5olhih/3WuJ0FV608FexLlqJ5LXN+rXERKB94gIi+9x1wd3wer4pQKUgBE0VavPsa
	 xRRIBibtzjfp9hoiV9OKlX3QQWTgp498lZVZfDLDc7Uo2ns3z/dwIxqzzTZ21jdYb4
	 /o6tmgcdeuFdHQt/6RuRlFOyTBdIbeUFkMMjckY+/TEx222A4/i8/3wPGrDG9AhsUS
	 KTCBICobo8ECA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6C516CE26CA; Wed,  7 Oct 2026 13:36:37 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Bradley Morgan <brads@mainlining.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-sh@vger.kernel.org,
	kernel-team@meta.com,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH 5/5] xtensa: Emulate two-byte cmpxchg
Date: Wed,  7 Oct 2026 13:36:36 -0700
Message-Id: <20261007203636.1982188-5-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
References: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
MIME-Version: 1.0
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

From: Bradley Morgan <brads@mainlining.org>

Xtensa has no two-byte atomic compare and swap, so the __cmpxchg()
switch lets case 2 fall through to __cmpxchg_called_with_bad_pointer(),
which is declared but never defined, so a two-byte cmpxchg() fails
at link time.

Route case 2 through the new cmpxchg_emu_u16(), which takes the
old and new values as unsigned long and narrows them itself, so
the call needs no extra casts.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
---
 arch/xtensa/include/asm/cmpxchg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index b6db4838b175a..8dea8e357fc0f 100644
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
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
