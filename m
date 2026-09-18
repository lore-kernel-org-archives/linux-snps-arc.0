Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08619C982D7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Sep 2026 08:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NizvV4OyxvMaR/TRdLtqIVFW/WKjfR0hRNfrd8IIJw=; b=feSPda/o6TTZwU
	eS8WRTD+iSMmOJf7tBfzALy8Rw78Xl0H+WDQYCZy42Ilr/DXdhFKsoN5gPJL03sVGT01GnbC2Qgih
	UqetC3Hn2DTIJQTeEXqN2SbQlEDPTHo9tNNWmbRuDnXt7i/NYiKbusdIINoUcT2eZBpOrfPBJdbg7
	TtPlpLUMTuk0Vqat8VkM2aeEu82MRaa/9xDHzJC+HIda6pm1G/l65HCv7hnbPzX2qA6xEoEnUvyin
	RAAEY3obTid5W1w2M6LOJSwBCVhASazQI7U2YS8vDiHvKg9LTeUiLcjH2QUViEcEZhexb3WWmW1Uo
	470aBKuSbVcXmKA+PeoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7URd-0000000DsRi-1khN;
	Fri, 18 Sep 2026 08:59:45 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7URa-0000000DsQX-28OY
	for linux-snps-arc@lists.infradead.org;
	Fri, 18 Sep 2026 08:59:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48586861639so200098f8f.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 18 Sep 2026 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789721980; x=1790326780; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ebKeWW1b/FCTysKRCA2qCKC9jXPhUpw/tMxPeazltLI=;
        b=R1Nf9Z+GHdFSOsyIuFA1cZdihqXOHmpBfFWUxNAWaymV1zb8qBdDKEMGC+ohSsleZP
         hfJHwi2YEyB0v0rGd3ocQQrAqpbeXz8jcKB5PqZ4G+3W1QAJ5ZiGnAzHKHsmqX9Weuvq
         jOXlPoSzlhhLfaUUr4QJrvG6NcSbLB3TipKtVOidLoucNOL0XL+GSvzLaEqH6TJ+qaFw
         kxh+fP+CvOD5rNtebHrhOOaBlrlGPTL++MCbvrEn8phZjaCv5z/o6NvW6aS6k28VeVlB
         uL/LuqbgkwWBK+bvQc86oS24Ekz+BRX8baKH+fLJgriCtqU2lGri11nZN9x7XhfUDwBV
         jbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789721980; x=1790326780;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebKeWW1b/FCTysKRCA2qCKC9jXPhUpw/tMxPeazltLI=;
        b=0wbY5wfvGKy+dP6EcmGHQkfzhVEbgYRz2AAQ61vlATpVe3CZYwkl6Tp2EYbw59TRFs
         6rpDI/RHl2KmiGq9mu9vN6t1SW8q9Rkb931C8xWuz/4DCnA+rzCJifFYLzKCk7IPa1nH
         0VIE4NfXg7t3USsFHqwGT2oU5LzmOAMMRWkQaAghpF1CU0KFiJ3trz6cRn2eisVlml7S
         Ci8W0f9JybcZdepmW2WAs8bVQSNpzoecK1L72eRTL6kgVERqoXPr210PVCWsMlf/cBOJ
         tkh+dDzGDBPhkZbAsqiR/2LdMufslcKkDFzwZIv23hmtwc1YbSZP+4+fHuZUksJFTEYD
         Lg2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0W8cFTfcfbs5lXcu6t6w/dMPq2J8BVDKCizsXVDmICPXSQlqithLYzvoxoeeZBImeF/Jy1bqb8zgEKpvuew==@lists.infradead.org
X-Gm-Message-State: AFuF++nIAvgPvxqo2a5g7jS0PNu5lpm26P+PQqw+xp5Q0+mb+UCO3teN
	3v0m+viYyDlzluHrTf1sPLzhaaidgiidkOsvxfPlF829IKEIqKN5jHoO
X-Gm-Gg: AYBFou18HlCr38TYKhHU/FzO2QhdF/+PJnPjg0sRHaXHDQG1f//BB2KUJIU3RC9+ucb
	LSkxwnpQ2K2RXCMHb2l91VCpnaijjzG5dGWoOqgBgroY4lZ1R4YhY6amJta5kWCRUum9wYejAWl
	RDEBu6S/wh0W/gXOWloTrFKUIKR4GYLjYlXQCcmJU6vArOqHPHK9n8Hv1bUk5WRjKbJXtHW6XQu
	2894etxAZlnHw9+3plrorJjA7XhST+XpnUbXZXqBnNfoMVwdaP/WXIN3a+dzz+YlPV0RFTWSMA9
	BPQLFFpDgOr8Db/joIU4DdRovLhyzJWdGlaxXyNbxvPjp/lZxX6RCNoNO5z4jT6lco2/olu5vXC
	kwl5AqekKyw1jLSSzGBd5ehNRVcEFCK07qJTRL7I/7u3/KcGoG9zs/6dPl8u4CYbu6FZkb/K6RH
	SoN6qcAw+WP2tjcggJUvtM3S3LomtNXhmG45yyRkJZqnJpMXQTrYiNvtScGv3qoox7IEloh7FZP
	XiI86kp6ArLj6UKfEqZbYNysI//I9BTIeFG
X-Received: by 2002:a5d:6f06:0:b0:485:8d9c:47d2 with SMTP id ffacd0b85a97d-48713c7ef38mr9129868f8f.30.1789721980248;
        Fri, 18 Sep 2026 01:59:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872008f34dsm2547841f8f.36.2026.09.18.01.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:59:39 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:59:38 +0100
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
Subject: Re: [PATCH v3 1/5] lib: Add two-byte cmpxchg emulation function
Message-ID: <20260918095938.6082a31a@pumpkin>
In-Reply-To: <20260917163830.3748-2-brads@mainlining.org>
References: <20260917163830.3748-1-brads@mainlining.org>
	<20260917163830.3748-2-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_015942_580747_F33FC4D3 
X-CRM114-Status: GOOD (  24.96  )
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

On Thu, 17 Sep 2026 16:38:26 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> cmpxchg_emu_u8() emulates one-byte cmpxchg() in terms of four-byte
> cmpxchg() for the architectures lacking native one-byte atomics.
> The same architectures also lack native two-byte cmpxchg(), where
> such an operation is not supported and either fails to compile via
> BUILD_BUG() or fails to link, because the bad pointer sentinels
> these architectures declare are never defined.
> 
> Add cmpxchg_emu_u16(), the two-byte sibling. It reads the enclosing
> word with READ_ONCE(), splices the two target bytes through a union
> and loops on cmpxchg() of the full word until the compare succeeds.
> Like cmpxchg_emu_u8() it is fully ordered.
> 
> Unlike cmpxchg_emu_u8() it casts the old and new values to u16
> internally and returns unsigned long, taking the old and new values
> as unsigned long, per the suggestion from David Laight. The switch
> statements in the architecture macros instantiate every size case,
> so a cmpxchg() on a pointer type checks the two-byte case as well,
> and a u16 parameter or return would make the macro casts and return
> conversions warn there. With unsigned long parameters and return the
> call sites need no narrowing casts, pointer exchanges compile warning
> free, and the function still compares and returns exactly the 16 bits
> the caller asked for, which matches the hardware cmpxchg r16
> behaviour where a 16-bit compare only looks at the low 16 bits of
> the register.
> 
> The Kconfig symbol gating this file is renamed from
> ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
> selects both the one-byte and the two-byte emulation.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
...
> diff --git a/lib/cmpxchg-emu.c b/lib/cmpxchg-emu.c
> index 27f6f97cb60d..ac1c84383887 100644
> --- a/lib/cmpxchg-emu.c
> +++ b/lib/cmpxchg-emu.c
> @@ -1,10 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * Emulated 1-byte cmpxchg operation for architectures lacking direct
> - * support for this size.  This is implemented in terms of 4-byte cmpxchg
> - * operations.
> + * Emulated 1-byte and 2-byte cmpxchg operations for architectures lacking
> + * direct support for these sizes.  These are implemented in terms of
> + * 4-byte cmpxchg operations.
>   *
> - * Copyright (C) 2024 Paul E. McKenney.
> + * Copyright (C) 2024 Paul E. McKenney <paulmck@kernel.org>
> + * Copyright (C) 2026 Bradley Morgan <brads@mainlining.org>
>   */
>  
>  #include <linux/types.h>
> @@ -40,6 +41,35 @@ uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new)
>  		instrument_atomic_read_write(p, 1);
>  		ret = data_race(cmpxchg(p32, old32.w, new32.w)); // Overridden above.
>  	} while (ret != old32.w);
> -	return old;
> +	return (u16)old;
>  }
>  EXPORT_SYMBOL_GPL(cmpxchg_emu_u8);

Where did the (u16) cast come from?
If you want to mask 'old' to 8 bits it would be more reasonable to change
the function prototype.
(Although I can never remember whether the caller or called code is
responsible for masking the value.)

David


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
