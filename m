Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02880C636D4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Feb 2023 05:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jn2GOdBuD4BkTSCWisgVPTRMJCGt3/RKJ7C+3SiajR4=; b=jOWKYEUwn8LDsOomg9uPyMq1jX
	nSU6im0aOQ5/YkqnbiOGyOJej+vDiI9J2LwD0nl9FmYdfFmWVY7hTgaz0H0acTJwNbHRc/7HCY3n9
	3kC28Zlng3mM7q8oWGMvS8S+w4eOYKBJABhwU/afyTJ6OfatQ7GDj1iATr7yoBwKo6UkcviaeXEKP
	bVHAY8+5Be8xWzyOGp2lcgJMUPMmXt3Nx8xNiRGS3ovtibxCiTEJjxUR4u01VNqpVxPsAYjeqEpAR
	slTdNJYaATwSXd3QqwYJu2Qu30H9cVg1F4WVyQi904UkKkFp/XdVxYdiv5vOmUGT4RJvuelBCo8Lf
	Na5CrEhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSAFe-004mAp-MK; Wed, 15 Feb 2023 05:22:42 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSAFT-004m6f-ED
	for linux-snps-arc@lists.infradead.org; Wed, 15 Feb 2023 05:22:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id 16so11812051pfo.8
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Feb 2023 21:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tV+nl5/6nbPk/6HA5pQX/rHuTHF5S4E9f4KJMF/h5x0=;
        b=fhWxOvSg47bnqh1vlUb0tg8U7zRfENd11uhGOf5Jsz/ZocWHFEI68pLXo5d9vBVXvT
         wSDFNO3/CV6QVriW/uJf7uSjBsTIo2nfhwr90ljf0Mtrv3l+ZNz03APZ/NoeYJxIi8AS
         eT1BnG6scYkTL0mRsKAhicVLLfSox5xFSJlK+m4CcZ2f/19AZeBmn0TeLDNpHHUJ+j//
         pNGe52xRL7NHFqYuRqi8NBAMhHiUAqm3krXcV9gB6lQ+ZUL8htkaq+hcUOto2vJWmQ/P
         1t61ly6hek8z31+cUX+0shb1PAvYlU/KvbO9KdB05jwbmNe1/Zq0XZpFJiImeu8sqMJC
         uFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV+nl5/6nbPk/6HA5pQX/rHuTHF5S4E9f4KJMF/h5x0=;
        b=3cSEfj+a/uvs+KxtoQ6ae7IObcMMlFIpw65wx7Gw8UvinvwCQt3pxQJ+Mhfnry3+/Y
         K8Ba0svxLM6r85kuHESY39XS9eaxVSPB4P3asvFl8M2uKdKaJ7DNb/iU3mM5V2elTfFP
         OM9ZaTQCjuIGDb/BgSsF/rpfbM1IafgQ7Fxsk98GNZ/YpSg44qNEDkttkdb8tNr684rs
         CDOwIZrskYSTeIiUiZYmAslqVHr3LYAJJ6EORXkA9+VG1NVVB/CJ2XD0r9OsGTleQg08
         X+UQptJ4RBO+UF8SbJFsnHlsv43+eezR6yBZBDUsj15GLX4P2cEs24LeXXFlY3dValEn
         D0Gg==
X-Gm-Message-State: AO0yUKWffB3OBmfbWJ+FkJTqUD3UT49KsP3mJKfOJOFQeqfSm//J3jzc
	SP9jny00Bw5SBu5Y4Jj0QFM4bQ==
X-Google-Smtp-Source: AK7set/rdrNLm8tItidqjsvagDbtl5rYMULe1MueAmQXNPzlIf4+Jxy35EVuWqAlcqe6sRrK/ndqkQ==
X-Received: by 2002:aa7:9f85:0:b0:577:272f:fdb with SMTP id z5-20020aa79f85000000b00577272f0fdbmr600755pfr.29.1676438545117;
        Tue, 14 Feb 2023 21:22:25 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id n14-20020aa78a4e000000b005a8d396ae27sm2788868pfa.8.2023.02.14.21.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 21:22:24 -0800 (PST)
Date: Tue, 14 Feb 2023 21:22:24 -0800 (PST)
X-Google-Original-Date: Tue, 14 Feb 2023 21:22:11 PST (-0800)
Subject: Re: [PATCH 13/19] arch/riscv: rename internal name __xchg to __arch_xchg
In-Reply-To: <20221222114635.1251934-14-andrzej.hajda@intel.com>
CC: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
  linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
  linux-mips@vger.kernel.org, openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
  intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
  Arnd Bergmann <arnd@arndb.de>, rodrigo.vivi@intel.com, akpm@linux-foundation.org,
  andriy.shevchenko@linux.intel.com, peterz@infradead.org, boqun.feng@gmail.com, mark.rutland@arm.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andrzej.hajda@intel.com
Message-ID: <mhng-e75808d7-21de-4ef8-a606-b7c652a1f38e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_212231_693478_6E80806F 
X-CRM114-Status: GOOD (  15.52  )
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

On Thu, 22 Dec 2022 03:46:29 PST (-0800), andrzej.hajda@intel.com wrote:
> __xchg will be used for non-atomic xchg macro.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  arch/riscv/include/asm/atomic.h  | 2 +-
>  arch/riscv/include/asm/cmpxchg.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
> index 0dfe9d857a762b..bba472928b5393 100644
> --- a/arch/riscv/include/asm/atomic.h
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -261,7 +261,7 @@ c_t arch_atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n)	\
>  static __always_inline							\
>  c_t arch_atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)		\
>  {									\
> -	return __xchg(&(v->counter), n, size);				\
> +	return __arch_xchg(&(v->counter), n, size);			\
>  }									\
>  static __always_inline							\
>  c_t arch_atomic##prefix##_cmpxchg_relaxed(atomic##prefix##_t *v,	\
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 12debce235e52d..2f4726d3cfcc25 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -114,7 +114,7 @@
>  					    _x_, sizeof(*(ptr)));	\
>  })
>
> -#define __xchg(ptr, new, size)						\
> +#define __arch_xchg(ptr, new, size)					\
>  ({									\
>  	__typeof__(ptr) __ptr = (ptr);					\
>  	__typeof__(new) __new = (new);					\
> @@ -143,7 +143,7 @@
>  #define arch_xchg(ptr, x)						\
>  ({									\
>  	__typeof__(*(ptr)) _x_ = (x);					\
> -	(__typeof__(*(ptr))) __xchg((ptr), _x_, sizeof(*(ptr)));	\
> +	(__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));	\
>  })
>
>  #define xchg32(ptr, x)							\

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
