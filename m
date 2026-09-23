Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5D2C982FA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2026 09:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdbtbNIPZNq4uSyjyb8SNAt26+IACqLBaytCO2XRpu8=; b=df2dYkreIVLYTa
	NLvY1zsQbsfBARXQQDSFIpyt2Eh0+X3Qu64CGrRjD92l/CfDO5QGcHt1x7VTEW7GzlcHzkWHH+FBr
	wGDsTYtDsz24CvaklkOJIbklm6mWKX/jf/awYPXSw+yvjA8lcv0VrxXcBhnJYNgEDfBdDtiCD7oe5
	bEYAVjodWY8R174vGM0WW+H3sPHzrZGh6iJmVHaS/LPzus8Xcc3isFhEaR4F586HhMDCH29bQdvkp
	NxVCQwvPu0yJ1KrC8ZGqESAsZp5W+QaVCLK9VYgGhx4KIMjX/gONjn2kJoa17tfhCazKHZdG+iSGb
	VKYbc48XWQOUHHh+/EyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JJC-00000007jYl-2SvO;
	Wed, 23 Sep 2026 09:30:34 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JJ9-00000007jXq-2lXB
	for linux-snps-arc@lists.infradead.org;
	Wed, 23 Sep 2026 09:30:32 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485984ebf5cso634200f8f.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 23 Sep 2026 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790155830; x=1790760630; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XpdOD7b7tZjf2YLODbEeqXbESzHRLhCJCCPyiQAoQpI=;
        b=p/GJCQHqTRzQrJZFq8I3LgN3YsrM1gD7zyvwm6ZIwJaVRuEHv5maXAd0mG9bmIOGEu
         FwEk5J4cNnLe2qwPVaV6ANONGhgkIg2YNq+3PIe0WMP7tp8b3KRM/cKZQul3+QglTSTd
         RtgNUTIIDGyWg4mUwS27pCPzwXv3zKMkl7MI5n/f74mQJhGgQDRQh7o0O6ejP7BCWoEW
         MYouq9Vd/9VqjEwa49i5aNRR3xzgmCiQBZyy15X3Gz910wj47WL/z9kK3Ov8CNBuvHsH
         dxbmG3EKESuqDbJ9N/MgucSmOPx3yPCQ8C17tKzjQgLINoQm16WaTqhaQ1bymiq+Wya2
         YdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790155830; x=1790760630;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpdOD7b7tZjf2YLODbEeqXbESzHRLhCJCCPyiQAoQpI=;
        b=rNEePfec8FApFbNL9MQfgkE/zECflLGT5sDEn/DTj+JizA6Bqv78UQvxF1wck4o3Ks
         Lu72wa//7MN6EgxW8cNMN/xvgC79qi/4GMwE8ZKJJfQ/BFvpur5P/aAnHWYg4Q8u34Bm
         7i88hmi0wCKb4mPWy0XUo2Vb+h4ItHWIH1zNtPyLNU516OtNOydoLum9kusYsZxTVXa9
         /eiaLOBpBs47D67JSoBbScuS0NZr3Tymc1Fxa1K93i1qfpq28x8NPkqWwhJEQaui5eF0
         5rjCjX3fY2pqNBlqz3BB10Mqr4IDKCsIf0xAikyxTte5I3lwZt1xcAJkuji5tZxZBJ7G
         WclQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZApJLisRHS3g8wOvQdTPKlPmZqgvvm/cGmsr5Z4x8bxvUI27F6CZR2bMR4PWSaXj5rbVqHG9ctPSTBe6vWw==@lists.infradead.org
X-Gm-Message-State: AFuF++mZp1XOUq+ZLrc1JI/GwcuuEvK4brZ+NJ78+P1TN7V2UlnqOF9L
	Cf/tnZh7+SjPA4OV8renKWm+UCfwDt7D8gZf1FYQaeieCRCCd0Snkq7J
X-Gm-Gg: AYBFou2gZN8HcasZ9EGNwJtbS+KND9dLh56gSUirKyWWnY8VBsYb5VDy3vCLUkYyn7t
	2ttYp6YxhJibor/tDhyohkl5oNvH1zIcRuDlKiKJTG3hxkUFtZdtdBidGYtJcpV58acmwpjuqW4
	liGLl1QBUv1k50R1WmJsFvrrDfbJUJFLBE5BaWdmC7h1jKoMMBWnkIuLj/ndfo4phwwsWWmfPLA
	q/bzCkBh7KEE4rG6qEvHTkb9D1w3BbZCBeEGKM/3CqDAgUe16ci5YFTiV9dn/h8CcvbTbHYxwjd
	77YhuOOLqs1x3s4meXScdvWYYEj9FnOF5wF0DjRV9kZClHUUhHb1BoJ0eYCSWV3et8zeoRlOnU+
	SHw8468qAK2dEtDBiCNDr+H0YcWWvL0g65YqGYT4hWj1u9Qr91iN+Gf4ZCS7qeH/DAVPoVjsKWi
	vr1UPBgS+4DXR0fWJDPecrV+6xbPlDZxFGJrqPih3yZhCpbrzVbVZT5h/xxCd96JYr/nAAysUR/
	Sj6yr8jly5vwiqjmJjLZZgvIJuQ/NbyYNTgvm2qgSlmXucrkSwnSOi1
X-Received: by 2002:a05:6000:22c4:b0:487:35c:6e6b with SMTP id ffacd0b85a97d-4886704aa19mr3430312f8f.12.1790155829433;
        Wed, 23 Sep 2026 02:30:29 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684863d9sm5350009f8f.12.2026.09.23.02.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:30:28 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:30:27 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta
 <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Chris Zankel
 <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, "Paul E . McKenney" <paulmck@kernel.org>, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] ARC: Emulate two-byte cmpxchg
Message-ID: <20260923103027.22bd9ef4@pumpkin>
In-Reply-To: <20260922173354.14404-3-brads@mainlining.org>
References: <20260922173354.14404-1-brads@mainlining.org>
	<20260922173354.14404-3-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_023031_783825_DAEFBD7C 
X-CRM114-Status: GOOD (  19.59  )
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

On Tue, 22 Sep 2026 17:33:51 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> ARC has no two-byte atomic compare and swap, so the arch_cmpxchg_relaxed()
> macro switch lets case 2 fall through to BUILD_BUG() via default. Route case
> 2 through the new cmpxchg_emu_u16(), which takes the old and new
> values as unsigned long and narrows them itself, so the (uintptr_t)
> casts on _o_ and _n_ are no longer needed and the case 2 call passes
> them straight.
> 
> The switch also now tests sizeof(*(_p_)) instead of sizeof((_p_)),
> which switched on the pointer and made the size 1 and size 2 cases
> dead code, routing every sub-word cmpxchg() through the 32-bit
> llock/scond pair and comparing whole words against sub-word values,
> so the compare almost never succeeded.

Hmmm... that looks like it warrants a 'Fixes' tag.
Clearly no one uses 'arc'.

David

> The old and new values are
> now declared as unsigned long through (unsigned long)(0 ? *(_p_) :
> (old)), the idiom David Laight suggested, which type checks the
> arguments against the pointee, so cmpxchg(&p, 4, 5) no longer
> compiles silently.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/arc/include/asm/cmpxchg.h | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> index 76f43db0890f..4596edfefa95 100644
> --- a/arch/arc/include/asm/cmpxchg.h
> +++ b/arch/arc/include/asm/cmpxchg.h
> @@ -42,16 +42,19 @@
>  #define arch_cmpxchg_relaxed(ptr, old, new)				\
>  ({									\
>  	__typeof__(ptr) _p_ = (ptr);					\
> -	__typeof__(*(ptr)) _o_ = (old);					\
> -	__typeof__(*(ptr)) _n_ = (new);					\
> +	unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));		\
> +	unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));		\
>  	__typeof__(*(ptr)) _prev_;					\
>  									\
> -	switch(sizeof((_p_))) {						\
> +	switch (sizeof(*(_p_))) {						\
>  	case 1:								\
> -		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
> +		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, _old_, _new_);	\
> +		break;							\
> +	case 2:								\
> +		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, _old_, _new_);	\
>  		break;							\
>  	case 4:								\
> -		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
> +		_prev_ = (__typeof__(*(ptr)))__cmpxchg(_p_, _old_, _new_);			\
>  		break;							\
>  	default:							\
>  		BUILD_BUG();						\
> @@ -64,8 +67,8 @@
>  #define arch_cmpxchg(ptr, old, new)				        \
>  ({									\
>  	volatile __typeof__(ptr) _p_ = (ptr);				\
> -	__typeof__(*(ptr)) _o_ = (old);					\
> -	__typeof__(*(ptr)) _n_ = (new);					\
> +	unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));		\
> +	unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));		\
>  	__typeof__(*(ptr)) _prev_;					\
>  	unsigned long __flags;						\
>  									\
> @@ -102,7 +105,7 @@
>  	__typeof__(ptr) _p_ = (ptr);					\
>  	__typeof__(*(ptr)) _val_ = (val);				\
>  									\
> -	switch(sizeof(*(_p_))) {					\
> +	switch (sizeof(*(_p_))) {					\
>  	case 4:								\
>  		_val_ = __arch_xchg(_p_, _val_);			\
>  		break;							\


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
