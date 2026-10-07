Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A872CA6004
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2026 20:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yS+hBT9ORhbT9xnqdKsTW1G2jTMU/70ELAuVzKQ7rj4=; b=WNhbDQPrIudEj3
	V1fCd5y/w5HTU1DW+/yN1jtsDzG1Eyl2APYXumFw5XonwLWzDtrXAETihicybJPjaBsU6ZpAt+vxt
	HZF29GJowEl5v0GDtb+vXCsvVs4DVz8eSawoVVrrq9EneD4fpkSk0ICwwfYL444Hs2v8eS1mTWXkq
	lqF5wTDvOYx9xFrvpOsFvg6FYS4P/KlPfeOeYLmZ+Ox06O028SwOx6hfX0YoFsB6BjnnXeNAiUrzI
	wlllEnujmbvHBXhDh3WmEQrHHkY1iRmQ8gSJ53Su7snpLqN2oBrFyUxzwcjlAVq3KflSPE/ZYFiNE
	uasKFWIFVCDjibizigpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYZD-00000003A3l-2UXO;
	Wed, 07 Oct 2026 20:48:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYZC-00000003A3f-1GWS
	for linux-snps-arc@lists.infradead.org;
	Wed, 07 Oct 2026 20:48:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F01660A53;
	Wed,  7 Oct 2026 20:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6562E1F000FF;
	Wed,  7 Oct 2026 20:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791406124;
	bh=nPV72BRwuyAm3hJ2pQez24KWWbawWtDF4Xp0O9HmZIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T0spcabYBSnTFnftQPKCF43YJ2HgnJrVFQtkhrskjqqyfytiOkIswyApmhyNE1Lgb
	 xktpu3B4Mwse1eyz8rUdx/aK7jKsFt9uM7cQTbX4SEUFTrKnT55rb/gB6F/ZF2O2Jj
	 3Xa83NGCwg9WZHB866isMjmIh+Ilc0vpqIbPpJAKSRc8rhC+8FM5bG9hzrSmbj0xbL
	 vO2lImb8q7CITNTSB1YOzmX+cD71ff16ah9MwbMyzVr93AuGvJQ/NKWxbm6i9yoKEF
	 1+cgFAeouP/SHXsfNf9gGlTYNCv5QBIzywbfN0OUC8KSws49+dmjNI4snVQ12dRR9P
	 IHnmBtx8IClKg==
Message-ID: <40f3c095-4202-4d2b-93e3-376a231d4fe8@kernel.org>
Date: Wed, 7 Oct 2026 22:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ARC: Emulate two-byte cmpxchg
To: "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org
Cc: Bradley Morgan <brads@mainlining.org>, Vineet Gupta <vgupta@kernel.org>,
 Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@kernel.org>,
 David Laight <david.laight.linux@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-sh@vger.kernel.org, kernel-team@meta.com
References: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
 <20261007203636.1982188-3-paulmck@kernel.org>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20261007203636.1982188-3-paulmck@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 10/7/26 22:36, Paul E. McKenney wrote:
> From: Bradley Morgan <brads@mainlining.org>
>
> ARC has no two-byte atomic compare and swap, so the
> arch_cmpxchg_relaxed() macro switch lets case 2 fall through to
> BUILD_BUG() via default, and a two-byte cmpxchg() fails the build.
>
> Route case 2 through the new cmpxchg_emu_u16(), which narrows the
> old and new values itself, so the dispatch keeps the (uintptr_t)
> casts the case 1 path already uses.
>
> The sizeof(*(_p_)) fix that v4 folded in here landed separately
> through Vineet's f050c3e61d2a, so this patch is now only the
> case 2 wiring.
>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

> ---
>   arch/arc/include/asm/cmpxchg.h | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> index 76f43db0890fc..7157718f147c1 100644
> --- a/arch/arc/include/asm/cmpxchg.h
> +++ b/arch/arc/include/asm/cmpxchg.h
> @@ -50,6 +50,9 @@
>   	case 1:								\
>   		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
>   		break;							\
> +	case 2:								\
> +		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, (unsigned long)_o_, (unsigned long)_n_);	\
> +		break;							\
>   	case 4:								\
>   		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
>   		break;							\


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
