Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B407CA5FCE
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Oct 2026 12:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mIgbAslFhty9D2OBXWdtb1+Kdoz4tdaKp9kacrLIJU=; b=kd4YQp+pQ0sIsd
	E5Hp4JAM7soKsisAo02zHT/E3waUGfwLtFqI1k8/RxWZsj/RkvwdUgpcl08JzjokJBNrN9jpjcZFd
	bxft31HX4LsSpjGuKa69YCAJX0ub9UE7l+UQpOr0wQ+eEvBFS82fJrGuXU+8Oqp/yh22fLfAM/bmI
	hxU9SxR2X7ObmzSH1X83PMnknaKvLK5QuwkZb/fj7bfcllyzxqd4vz5mooC47m3obCbo/RyzdIc3a
	/o5Vxp7ia41l+56kkh8mA0uVcgKPuLzrPI8A/rnzo7Yr0JFkP/jXw1F8ANF7BlSljTm7lPABkqMaw
	nL+lbA4rThL8jnQuQl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhWc-0000000GNjI-36dP;
	Mon, 05 Oct 2026 12:10:34 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhWZ-0000000GNio-3Fv6
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Oct 2026 12:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791202084; bh=c8blceBjpnicYTX0j9XL6TT
	+wvS5GLIS98CfSPeQ2So=; b=ChSIBjgC7DJbuoj/hq7PaoY2Khp4WzR5BqDkJa6jmQg/jjXsl+
	VmcjNTSVigwDsUo6NRJbhYBilUXRgjMICH4pDmHGTvx9spdUnOj/Cz9YyUQ3fX/GMu8CHoJg1tY
	BtZiCtrnWdAd5VukqFHdMyVo54B2s/YqToJtCdMjY/jNMQ9yz6Mxg6iuGo+uUJlW5SlYOhdfQID
	f63H8AKR/KuaSHBqHImS+JoZtAj1+0qWDMfIPrHL1AAOfxdQGQHK1e/7AxIuWHm1EtdvESl1tNR
	XCUNunKXIX7pwWkk3ldyqQUmgcEPcGpOgmYGrJSq2QY5JVtWnxF6CKycRL3IAUVZNtw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791202084; bh=c8blceBjpnicYTX0j9XL6TT
	+wvS5GLIS98CfSPeQ2So=; b=61+Af8PJELF/8wkGVGMZLlzU/KpTjAlFsFmdjLYcCJKFG7YYOj
	MQ0Gh/Lq6D1KBGlISidzf8IttNb8Uvr+FIAg==;
Date: Mon, 05 Oct 2026 13:08:05 +0100
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org, vgupta@kernel.org, guoren@kernel.org,
 chris@zankel.net, jcmvbkbc@gmail.com
CC: arnd@arndb.de, paulmck@kernel.org, david.laight.linux@gmail.com,
 glaubitz@physik.fu-berlin.de, ysato@users.sourceforge.jp, dalias@libc.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] ARC: Emulate two-byte cmpxchg
In-Reply-To: <20261005120556.383004-2-brads@mainlining.org>
References: <20261005120556.383004-1-brads@mainlining.org> <20261005120556.383004-2-brads@mainlining.org>
Message-ID: <DFEBDABC-BF95-4AF7-863C-7C25F1443B28@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_051031_967316_5721ABAE 
X-CRM114-Status: UNSURE (   7.15  )
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

On 5 October 2026 13:05:54 BST, Bradley Morgan <brads@mainlining.org>
wrote:
>ARC has no two-byte atomic compare and swap, so the
>arch_cmpxchg_relaxed() macro switch lets case 2 fall through to
>BUILD_BUG() via default, and a two-byte cmpxchg() fails the build.
>
>Route case 2 through the new cmpxchg_emu_u16(), which narrows the
>old and new values itself, so the dispatch keeps the (uintptr_t)
>casts the case 1 path already uses.
>
>The sizeof(*(_p_)) fix that v4 folded in here landed separately
>through Vineet's f050c3e61d2a, so this patch is now only the
>case 2 wiring.
>
>Signed-off-by: Bradley Morgan <brads@mainlining.org>
>---
> arch/arc/include/asm/cmpxchg.h | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
>index 66b3743c9400..b30b20933f32 100644
>--- a/arch/arc/include/asm/cmpxchg.h
>+++ b/arch/arc/include/asm/cmpxchg.h
>@@ -50,6 +50,9 @@
> 	case 1:								\
> 		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
> 		break;							\
>+	case 2:								\
>+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, (unsigned long)_o_, (unsigned long)_n_);	\
>+		break;							\
> 	case 4:								\
> 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
> 		break;							\
>
Sorry, resent email, internet went out ;(
--- Thanks!
"I'm not a very positive person" - Linus torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
