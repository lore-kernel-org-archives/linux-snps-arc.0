Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99297C88E50
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Sep 2026 22:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Umz5vTdmpo6FnUbGdi0zfmgUVvpmUzzFqh/RurR3gs=; b=pBQyC/89ZXINC4
	Yfbq+moTfcFrkeuyHj51D0icJlBsS4OQLFPQQhXcHBMn/4/Io2wtf7BKgZ9cZ6bOf7h5Pr3UFVQes
	3vkF3wOUrLOFpYzBWPTFWdeHD00zfeW+DwvlEz9OVrDFS3jdlE/9QrgwMNtJDxsj6Sxv4MEIBa48W
	q5BumSPvU0ZQZNFBiJX9j0goaQu7h8TLYe7BQaHs6uY0zdA39+oEciL+uuvX9L7fsP/Ok35/eBtlU
	GZ87u5v0NVWNkfVQndjD/Nu83AHh0rxU9zvcM2loL3VuCfsPXmphAXe0H2dIwUa0fnYXA2vxOlzko
	oy612oaCZWDjZumsnKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Rx-00000000EOa-0xsE;
	Fri, 11 Sep 2026 22:10:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Rt-00000000ENY-0lgs
	for linux-snps-arc@lists.infradead.org;
	Fri, 11 Sep 2026 22:10:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso16423505e9.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 11 Sep 2026 15:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164619; x=1789769419; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1CitEInQG9IH8hFfkxw+Dy1+TcxOBHzYjUh6RK88Fgs=;
        b=Vu6dKsPcNI5U9U7anAngoqYq+QRvUlGMvbGoSrQ6Fx6TDM4YpLscW+5Ma9uZTM3Wci
         m/TLsPX7wv2t11xVLFjQfehrf1CBVrkCWyyRzbvTFjSd+sMHBBb+YZYaPoK44oaCOVH8
         9Fi9FKfWDWHyGpYlSqBAaCseBtuM50Tc4CHE4tl2ZZQunwVxZRy6L27ImirAU0XqMcE9
         QZBv8X3tK2l1KEy7N285Gw69qnMqSWATCvYfhN6/cevQmqMdXu7jjQ++MzPmlMm6Raq0
         keIL4hqZqMxzqQBxTDdTW+6v7Qq3IfZ1fiGVHXy+LteCx01+8u6TLJ5YyPeoN8u95ROe
         ZJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164619; x=1789769419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CitEInQG9IH8hFfkxw+Dy1+TcxOBHzYjUh6RK88Fgs=;
        b=FsDD736ACbrsaEOzbkdXtm05UeBOKgTzZDK/BK04P2KW7cK7Y2///DEWDxiIZkI+Un
         j9i7cdp3v71xzMn4daK4u8vBUmCbEAarDjZSz2B9ZJTI6u7l08XakT7tR68YcRVRQVrP
         AsP4/YqOtMldH+SD1c1iPaJ546G2Zv9tvu06doIclu8ecROr+wUVJIrhM5lEK9gkQ3RS
         TLf/4daU4/H41gyeJsq3OfsAeeKtqWWgsaHf86HtQe8oi3ji+BAsHzeAFf+tsHHzSgOI
         QTGcxvbBZM1nvZywFg57fEX7a9pFDyPGi7HRGzjc1ukd05DSdWc4BzGCoOkSFA8YTsCj
         ezpw==
X-Forwarded-Encrypted: i=1; AKwUvBzgTsRUl5mkPojNKco2VAm1tWbr/39P9aWwWTZS5MCLJda9eYi/OoVFOIOdwypGqpbgOY08JIXLIx7FyrHHpw==@lists.infradead.org
X-Gm-Message-State: AFuF++ngshhhkHSDAf4QgkfXTATtVRTOlmYJfs9ARVBRwP4uW0Pf2Kkc
	WKgYEEcFufhXv3h5X+ySfIJN02gC6ZiP6TKi9oADu8bx2LnafNJEPdEc
X-Gm-Gg: AYBFou3isQ7yCdFDZeyEVPe3cjjkLxeIJ2gIRi1v1SL0Ducs1Z4QIieehqhxJRL9i5Z
	rviOdlazBmqX8UN8L5tprBWZPFlptoLrYgVuODYgWAqDsHxmxwShvpj6ZSAVEPaK5+lhqOS5lSC
	sKllwG71ysrvYrWV2SaewLQ6T7w0fizwUDfMnhq+N+WbS2SMsx6vBWUiDptv28xFDuQY5g6wnHS
	tsM6HkZsP0vYU/ZA4fz4EZNIPNDhjHoR3i7Z63nsuR2295yV+izM/gmsIplB2Mx+X+GzOYnMjxV
	631q/ilZPQXzFK/EMkkzR+N9QYENnXRLyaahD1Lm/eFvyMN8SkJcdIVEsNIIrd24HACemsvYBwW
	CULh8nrXvzgHjuaFmmxURJF5PAJqNXgXnKFXx6zmw+4x+nDD7tD/SwGTLKlt9Oyh16O7gOip0cg
	qD1S96fp0htcUJTWuAus3etbIdOe60FL6BE2xXerXHwSdbmr2wjmyEMw4DAU3B418AH4lA/WHHO
	RSN8flf6ica04l3Az3uvbom3kwaIjJTI4bS
X-Received: by 2002:a05:600c:8b41:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49e6198865dmr87033975e9.8.1789164618893;
        Fri, 11 Sep 2026 15:10:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm69553525e9.1.2026.09.11.15.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:10:18 -0700 (PDT)
Date: Fri, 11 Sep 2026 23:10:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, frederic@kernel.org,
 neeraj.upadhyay@kernel.org, boqun@kernel.org, joelagnelf@nvidia.com,
 rcu@vger.kernel.org, "Andrew Morton" <akpm@linux-foundation.org>, "Arnd
 Bergmann" <arnd@arndb.de>, linux-arch@vger.kernel.org, "Vineet Gupta"
 <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, "Russell King"
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, "Guo Ren"
 <guoren@kernel.org>, linux-csky@vger.kernel.org, "Yoshinori Sato"
 <ysato@users.sourceforge.jp>, "Rich Felker" <dalias@libc.org>, "John Paul
 Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org,
 "Chris Zankel" <chris@zankel.net>, "Max Filippov" <jcmvbkbc@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] lib: Add two-byte cmpxchg emulation function
Message-ID: <20260911231017.550f8cd1@pumpkin>
In-Reply-To: <20260911192540.20983-2-brads@mainlining.org>
References: <20260911192540.20983-1-brads@mainlining.org>
	<20260911192540.20983-2-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151021_250803_4431D3C2 
X-CRM114-Status: GOOD (  17.56  )
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

On Fri, 11 Sep 2026 19:25:34 +0000
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
> The Kconfig symbol gating this file is renamed from
> ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
> selects both the one-byte and the two-byte emulation.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/Kconfig                |  2 +-
>  arch/arc/Kconfig            |  2 +-
>  arch/arm/Kconfig            |  2 +-
>  arch/csky/Kconfig           |  2 +-
>  arch/sh/Kconfig             |  2 +-
>  arch/xtensa/Kconfig         |  2 +-
>  include/linux/cmpxchg-emu.h |  1 +
>  lib/Makefile                |  2 +-
>  lib/cmpxchg-emu.c           | 35 ++++++++++++++++++++++++++++++++---
>  9 files changed, 40 insertions(+), 10 deletions(-)
> 
...
> diff --git a/include/linux/cmpxchg-emu.h b/include/linux/cmpxchg-emu.h
> index 998deec67740..fee8171fa05e 100644
> --- a/include/linux/cmpxchg-emu.h
> +++ b/include/linux/cmpxchg-emu.h
> @@ -11,5 +11,6 @@
>  #define __LINUX_CMPXCHG_EMU_H
>  
>  uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> +uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);

Why uintptr_t? Shouldn't it just be u16?
(Which probably means the code would better if it was just 'unsigned int')

David


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
