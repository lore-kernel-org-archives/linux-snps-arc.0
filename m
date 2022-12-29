Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C34C4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Dec 2022 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pedmUcbgy6fhY7MZVB9/WxKAQjM4GC27IEsjQ6O5jf4=; b=tK+1CmUDfhetOHM9g2DQAep7Ih
	/xGSrhZAULFoWAlts19v3DkdKQbQynAaALux26OEz8r76flTHk6JEduZe/k983fNTETA9ii8KdT9U
	cF5vMZ7V1V1Hlk7RtBhtjTayCyt6Lemc75YsObK1Lo3p1He/mojDaPdvGXne9+zBZTXgJDaXvcGKB
	YZEAJAKcutW4sZZmKzyyueQCdxTPUW1cFxwMf+i1aFGbSXGvHe640m0FbxJFShrjqlJF7VDo42Ikd
	+iujHipALe3CBqQkx+FFuBiNEr4QW1s6mypGEx+Wj8KwsaMFBDJNm/SLWJvrE3X8VXjaoE9nn1SJ8
	ItoKCdgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAvg2-00HQ9a-B6; Thu, 29 Dec 2022 16:22:42 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAvfq-00HQ0C-39
	for linux-snps-arc@lists.infradead.org; Thu, 29 Dec 2022 16:22:33 +0000
Received: by mail-pg1-x531.google.com with SMTP id b12so12664557pgj.6
        for <linux-snps-arc@lists.infradead.org>; Thu, 29 Dec 2022 08:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMNgd8bQDMgdEx3QpMo3jWGl4T1DZKXjFMtqF5doPS4=;
        b=qXEmllgjQDDILSAqKv5rHoGkicbo4R4i0RBYCEbuy5JWCS9/AA+DWTMXLQgqDAappW
         903kwqubN40SB2KttGjjG54UgZAHr5bwFbysTxqCEokE3BNB09i/uefHEDV0SvFj1/tu
         1Lu+CFCesVDE+jl4EXnA8KkiboPktg6mieeJ7onX1tkrVdG7KvaiHAaOG9gcqJyJPbGd
         pCkV7szyzafl528HANkkvX+fSJQQtn4lOJvi8JPHEP8zM7yI6lOkG51EtxjdpiS6qS6y
         bkQ9rcSKWrjbuS7i9mSjttcyHwgDwy/ruAPC9lLbcJkXlwaOVpsqeXNx1gIuMeQUkJfm
         MIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMNgd8bQDMgdEx3QpMo3jWGl4T1DZKXjFMtqF5doPS4=;
        b=0X3V58NjKr51p2dazqv6XnRJgrZxQ3/TRqjR4biNXETRZXmI+PwoSODr36W1APhkwy
         C9gA+zDJxDNLs/+cflqmg2IIIFmYAiSzInnuPb0fWafQRCs/7AJ2eRb7TRnqm67ZQ/Lx
         OXRKqafXJG15NNCxVlEGiZW7PmYCaBBFFbPwtA7wm8tcsyd3RZlOvPzCz4KYDHudSof7
         sRshMBEV8tvXZsYIY+gvQWH1YRKkmfOzAS1U6m79MxiaUl0mOW/Hde8MNZ80b2MkqAML
         1UB3YGY+TZMplFt3gVeHUvp2qXO9i7gIUax1U1eY5d76T9L0xOCVPK6ohMM3D5KBvcL3
         BdhA==
X-Gm-Message-State: AFqh2ko7ZlfQKeN7TvzavkNyryGDELadnJg79UIzc83IVQCcfmzE2XQs
	TxZ6sxDSDKbJarlIslF9iyyNVQ==
X-Google-Smtp-Source: AMrXdXtoQHTvZGkC4TohzHT3/NWYHx9KB7DMUUCuZrQkc/ivfhp4AP56ANclvtUxYpd25RIK3u76xw==
X-Received: by 2002:a05:6a00:1c92:b0:576:f322:419f with SMTP id y18-20020a056a001c9200b00576f322419fmr28959611pfw.28.1672330946621;
        Thu, 29 Dec 2022 08:22:26 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id l190-20020a6225c7000000b005771d583893sm12598441pfl.96.2022.12.29.08.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:22:26 -0800 (PST)
Date: Thu, 29 Dec 2022 08:22:26 -0800 (PST)
X-Google-Original-Date: Thu, 29 Dec 2022 07:53:49 PST (-0800)
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
Message-ID: <mhng-8937d883-402e-4523-a023-8171ed0e386b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_082230_175019_FC6DBF5B 
X-CRM114-Status: GOOD (  14.78  )
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

Thanks!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
