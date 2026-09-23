Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F065C982FA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2026 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+lB3m8rlDmm7qND4lRXJwrN35/MDxMN9eNoMUiNcRU=; b=Y3YiX6beNMxOKD
	oHf0lYYDYC3ZWeSW3iuBKGndmxNI8vxRK9nhr/XU6p5ritdYfYlYS5Uzf2MDB8ySPYLko9GOn2Oo2
	Lt/bdlP1EigIN5Psi4gsp0trdbZx4ZgOD1GGtm3V6keMBZ2v+sVxDNBbcdr26uNy5mE174I1/ArIb
	dJ0ckBncqheBgeS1Rr4p5olKdiXn01nGcgD+RHxx7LsuW1xK7tvsuWgE62AqdfHafWWALt/QzADvn
	ibWmh28SzdkSvxxe2qqTqYmnLtXpE14kPlx4zVuDSOty+ineLcCttW7/9Xt72AkXZc0fPP/rHnynT
	lUB0CF/diBnDILdN/IfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JHQ-00000007jKY-3mzl;
	Wed, 23 Sep 2026 09:28:44 +0000
Received: from mail-wr2-x24.google.com ([2a00:1450:4864:30::24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JHP-00000007jJR-09Ol
	for linux-snps-arc@lists.infradead.org;
	Wed, 23 Sep 2026 09:28:44 +0000
Received: by mail-wr2-x24.google.com with SMTP id ffacd0b85a97d-482f63546c3so599978f8f.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 23 Sep 2026 02:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790155720; x=1790760520; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Op+1G3Jxi9SdULjib67/1vBJNLUR2DhfwMdslr3CGLI=;
        b=m4ExG1QYfAPXY44sEPAB3NGMStPIRGKWozZ2H4Cn5oVghgBLpOiZ7cvQEUjcBeevjb
         qrXmCkGI3N5eHLBEg3AS0hdquddBzlsjR4sjEBmbeLEB80NVmT6Ia9scNeum71kMbX9t
         fGl0Y0z3wYXxnDMoVDfXEMfx/n9Jtjm96se/RZ2u6eJDOU2LIesOYye+12te7USmjXji
         b27WzvmCdrQMPWdgYbJW6kZsYCWBZBFV9UeK43vghOXQq5eHr1m5Owx7zs0YAW0FkelD
         rQnkLGG983IjUZbPmK9LnYAD4ereJQjAVsmpiVDWg6/ID0ApuzkuOco5jw0ZBDkXfXPE
         iNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790155720; x=1790760520;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Op+1G3Jxi9SdULjib67/1vBJNLUR2DhfwMdslr3CGLI=;
        b=RvhgtvV0VfT82tdA1+2/HoCdHZQzHP10cA97yOv01hohoPiViJOMIBMNX9wNcL5zwy
         Gn28vVDYIJe4CYkwNlKCnuxlcYL1jhu6jjJnatbAtEvToFXUYLIEMOKtOfolDk8TYSVP
         aXZ7tTiqs8wxhUOrIrM3iNHSg/g6XPymaOJmUIe9SI59FbmF9OK/VAQ+G34Xy/SjaL3a
         A4ojajjtKLgox4vWlgu1ifR3h5O7AcjgtYPGNJQlPG76vBX1knQ6fCD7aRyey0HfAdRB
         stFzYyC5Sss2GqaAiM+HZTZySbML0Ln90iuaoqyVadyzJfKyrS88Izdo6/at49QH0vi4
         ZhNg==
X-Forwarded-Encrypted: i=1; AKwUvBze5EabK/7e7gJMC5ld14gf4Gai9O1tZsOVR3SFMXsmQqtweRFmMBCSUj3bEMB9n0EqSeuhcTwSm1KmusKoEw==@lists.infradead.org
X-Gm-Message-State: AFuF++nPnLjJ07zRkwVfVXcCqsj9bxcNMaOLcxYG9QVmoCSK3GekZ4kL
	gRvaLimEVpCXXTgCxJrjbwcaG9R76WLNDt4ZhM5WPMcokDLvZK1a9za6
X-Gm-Gg: AYBFou2AZKN+5CO8R2FI/wDycIO8rJ+MfwtoRODC7qC5zG2iFwK85d0VKghrPaF7yZA
	Y+LjyM6TGxb2UaA+xypwhnTZzWAPcuDtwNJhW6uRaIVFH88yyUEFk/gxTVwGR00P7RnTeIuheZ2
	itWlhIfqr/DwV1n1ydcRViHQcMIPKBHl2A479QBWEJxzEJKo3pQ6nkebncKeE38VKKysl6BjmGn
	SAt3q5vZI/k7Kxpta0n2Qu6jaD1En02VOUkyZyqqJ3eA0UhOnsg27cFgLyl0iNqZWcxA83AUkHp
	UFXPwbtt8bGTr+o4/9TH9krrObeF/fb5XaLm4amGVeUN+Fn7SxqBwc5vULlnZiwBpK0LuVbukaS
	rHD42mivNrgAf1j7Jt0T4lxAoqUZLwiUHvlCPEww3272DussVBvaq+UCsALAf/bBBGNqxD3SRwU
	y4bBLyLRt+NtFRtO0fd4d9FCtlQKnXo6P85fhtYXt1P77RlC3cjhHd5ztxTRJ68iOPTfZ1lj2Dj
	sW/U8XNEc4DpOPGVxkrkJiHEcDaMAg2t/yVWecVOAS8Gw==
X-Received: by 2002:a05:6000:3ce:b0:485:8c16:5ef6 with SMTP id ffacd0b85a97d-488670b342cmr3399764f8f.48.1790155719650;
        Wed, 23 Sep 2026 02:28:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm5584975f8f.19.2026.09.23.02.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:28:39 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:28:37 +0100
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
Subject: Re: [PATCH 3/5] sh: Emulate two-byte cmpxchg
Message-ID: <20260923102837.2b46d772@pumpkin>
In-Reply-To: <20260922173354.14404-4-brads@mainlining.org>
References: <20260922173354.14404-1-brads@mainlining.org>
	<20260922173354.14404-4-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_022843_095884_40594DA7 
X-CRM114-Status: GOOD (  20.45  )
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

On Tue, 22 Sep 2026 17:33:52 +0000
Bradley Morgan <brads@mainlining.org> wrote:

You missed v4 from the subject line of all the patches.

> SH has no byte or halfword atomic memory operations, so the __cmpxchg()
> switch routes case 1 through cmpxchg_emu_u8() and lets case 2 fall
> through to __cmpxchg_called_with_bad_pointer(), which is declared but
> never defined, so a two-byte cmpxchg() fails at link time. Route case
> 2 through the new cmpxchg_emu_u16(), which takes the old and new
> values as unsigned long, so the (unsigned long) casts move off the
> call and into _old_ and _new_ declarations that type check the old
> and new arguments against *ptr through (unsigned long)(0 ? *ptr : _o_),
> the idiom David Laight suggested, so cmpxchg(&p, 4, 5) no longer
> compiles silently.
> 
> Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/sh/include/asm/cmpxchg.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
> index 1e5dc5ccf7bf..b87f59107b4e 100644
> --- a/arch/sh/include/asm/cmpxchg.h
> +++ b/arch/sh/include/asm/cmpxchg.h
> @@ -59,6 +59,8 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
>  	switch (size) {
>  	case 1:
>  		return cmpxchg_emu_u8(ptr, old, new);
> +	case 2:
> +		return cmpxchg_emu_u16(ptr, old, new);
>  	case 4:
>  		return __cmpxchg_u32(ptr, old, new);
>  	}
> @@ -70,8 +72,10 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
>    ({									 \
>       __typeof__(*(ptr)) _o_ = (o);					 \
>       __typeof__(*(ptr)) _n_ = (n);					 \
> -     (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)_o_,		 \
> -				    (unsigned long)_n_, sizeof(*(ptr))); \
> +     unsigned long _old_ = (unsigned long)(0 ? *ptr : _o_);	 \
> +     unsigned long _new_ = (unsigned long)(0 ? *ptr : _n_);	 \
> +     (__typeof__(*(ptr))) __cmpxchg((ptr), _old_,				 \
> +				    _new_, sizeof(*(ptr)));	 \

Minor niggle if you have to do these again...
That line doesn't look long enough to need splitting.
More generally if you add 'unsigned long _rval_' and put a final cast
at the bottom the the #define the code will probably look neater.

David

>    })
>  
>  #include <asm-generic/cmpxchg-local.h>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
