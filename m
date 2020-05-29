Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392E9C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 12:58:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07EE2207F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 12:58:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mSwiP79/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YXVljGFm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07EE2207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLqHbDom6YGf6KOh03baG7vmkJhdlJe32EBMN1NfifM=; b=mSwiP79/5OHWyd
	GZJsUxkgPuIRS1SkITPSR40y1rqspn/63CpOTpM4DoKmw3a71CDCGxW8E1s3561IunBWZy4UaYUzI
	QrdfbFoL2tbKlxrK1xQuPysZK3bj+FigqfP73l+1L8XZRwqSH7cY5L0sRfU8k+Jg5fkcjML55nmIV
	ESAAljDllmgVOAKEZdLRMZ1KzcuTDEKI3sDmE7S2dD5nEtK0uWT6H2WVa5U+78AC/u9VbGJiTA2M6
	0t4uwB8ONdAUc+e9k/pnX30S3MaGlLxh+b0ZYdfaUkWjCQCfkKZQNSW+7ICSCpEbxQA/MHRscpHn2
	eB3W366NYozjGxmrS1Nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeean-0004n5-Hq; Fri, 29 May 2020 12:58:33 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeeak-0004mV-6S
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 12:58:31 +0000
Received: by mail-qk1-x742.google.com with SMTP id w3so2026356qkb.6
 for <linux-snps-arc@lists.infradead.org>; Fri, 29 May 2020 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mRlYgfMas7zfkENmUnmjUPKm81MLGXKIWiWfBhtf8xY=;
 b=YXVljGFmCV5ifY/NY6VXep00jXCZkQuNfsOsKPJwRFig8LyclyfUMJP6OoTOsYun6F
 xSvmp7FBGmyRNzNYrlm+vwzo21cxrTW23t6lhSP/7Nr3hlLYNuYF9agR/KIMBqpt400O
 3ZdnH9ATGox/e6VMuAGYI3SZVaLBGqbjGowoUojlSaRN+zmTLoGV5/r43yHB2NRGCkiV
 W9Dh0sRKPY5+rZVRnW3xwMbiLGBYF8oQxmkVVTnz9NIriMwOBw3axpFo79YrB02VArYA
 yJ4pO0r8kRDM2ZohYlI3Z+GAkuPdheeQx4/D5f4uvkvJINOuMbDWqHeU1yTAhallMbY6
 n1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mRlYgfMas7zfkENmUnmjUPKm81MLGXKIWiWfBhtf8xY=;
 b=IWBqodbmnfMUFtMOfclB9Kcpc9QF+EMVptBIN2s+fNEtxxetazmfxi4zmPXDoiBGN8
 uoj6fSCY3KJEx+wBFN8o/muiQTELd2lO8HR6lut79njvu6kEej8+YPqXNr0mMjH2CCeL
 h6Lmfb2pBeChsbd8cvxF4Pe1PZ5b12hlR0gRTSZJWDrB48L/RvYMV/k6ASAKdVzQ3wpB
 aNruVVpyyRZVqMRji4pNJhBNFJ2FLH1IxaDW26aTikRilnEdrPGOQ9Kxdh6kIEgyWmKF
 Ka5k6Ydqhckn/pBG2es5vHHUiuAzB18aUoWc3mgCYU458VnAPeTKnybFpmo67c0K+dDO
 VQUg==
X-Gm-Message-State: AOAM530ukcBCC39V32uV3QRl6u/XCD6yFlyFi6HvxNY3jz4nRvwAqYp1
 LA6wpwjp9R580dOK/85vmC/oFy5TgCw=
X-Google-Smtp-Source: ABdhPJxkcjx+qP45QxDAlWVUNLj4QHGSeuWedHUn8oKqkK1Lw2wqkoQXPwGLTrHBMY4svUIN256dEQ==
X-Received: by 2002:a37:6fc6:: with SMTP id k189mr7320997qkc.289.1590757107054; 
 Fri, 29 May 2020 05:58:27 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id q34sm7566334qtd.89.2020.05.29.05.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 05:58:26 -0700 (PDT)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, libc-alpha@sourceware.org
References: <20200528194345.9829-1-vgupta@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH] dl-runtime: reloc_{offset,index} now functions arch
 overide'able
Message-ID: <4c346276-085a-6e2d-16a4-c2b88252a74d@linaro.org>
Date: Fri, 29 May 2020 09:58:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200528194345.9829-1-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_055830_271021_5839260F 
X-CRM114-Status: GOOD (  23.85  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 28/05/2020 16:43, Vineet Gupta wrote:
> The existing macros are fragile and expect local variables with a
> certain name. Fix this by defining them as functions with defaul
> timplementation in a new header dl-runtime.h which arches can overrid
> eif need be.
> 
> This came up during ARC port review.
> 
> This patch potentially only affects hppa/x86 ports,
> build tested for both those configs and a few more.
> 
> Suggested-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

LGTM, thanks.

Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

> ---
>  elf/dl-runtime.c                              | 24 +++++++-------
>  elf/dl-runtime.h                              | 30 ++++++++++++++++++
>  sysdeps/hppa/dl-runtime.c                     |  4 ---
>  sysdeps/hppa/dl-runtime.h                     | 31 +++++++++++++++++++
>  sysdeps/x86_64/{dl-runtime.c => dl-runtime.h} | 13 ++++++--
>  5 files changed, 84 insertions(+), 18 deletions(-)
>  create mode 100644 elf/dl-runtime.h
>  create mode 100644 sysdeps/hppa/dl-runtime.h
>  rename sysdeps/x86_64/{dl-runtime.c => dl-runtime.h} (60%)
> 
> diff --git a/elf/dl-runtime.c b/elf/dl-runtime.c
> index cf5f1d3e82e1..62f90579370b 100644
> --- a/elf/dl-runtime.c
> +++ b/elf/dl-runtime.c
> @@ -27,6 +27,7 @@
>  #include "dynamic-link.h"
>  #include <tls.h>
>  #include <dl-irel.h>
> +#include <dl-runtime.h>
>  
>  
>  #if (!ELF_MACHINE_NO_RELA && !defined ELF_MACHINE_PLT_REL) \
> @@ -42,13 +43,6 @@
>  # define ARCH_FIXUP_ATTRIBUTE
>  #endif
>  
> -#ifndef reloc_offset
> -# define reloc_offset reloc_arg
> -# define reloc_index  reloc_arg / sizeof (PLTREL)
> -#endif
> -
> -
> -
>  /* This function is called through a special trampoline from the PLT the
>     first time each PLT entry is called.  We must perform the relocation
>     specified in the PLT of the given shared object, and return the resolved
> @@ -68,8 +62,11 @@ _dl_fixup (
>      = (const void *) D_PTR (l, l_info[DT_SYMTAB]);
>    const char *strtab = (const void *) D_PTR (l, l_info[DT_STRTAB]);
>  
> +  const uintptr_t pltgot = (uintptr_t) D_PTR (l, l_info[DT_PLTGOT]);
> +
>    const PLTREL *const reloc
> -    = (const void *) (D_PTR (l, l_info[DT_JMPREL]) + reloc_offset);
> +    = (const void *) (D_PTR (l, l_info[DT_JMPREL])
> +		      + reloc_offset (pltgot, reloc_arg));
>    const ElfW(Sym) *sym = &symtab[ELFW(R_SYM) (reloc->r_info)];
>    const ElfW(Sym) *refsym = sym;
>    void *const rel_addr = (void *)(l->l_addr + reloc->r_offset);

Ok (it should be dead code eliminated by compiler if reloc_offset does not
use the pltgot field, as for default implementation).

> @@ -182,7 +179,8 @@ _dl_profile_fixup (
>  
>    /* This is the address in the array where we store the result of previous
>       relocations.  */
> -  struct reloc_result *reloc_result = &l->l_reloc_result[reloc_index];
> +  struct reloc_result *reloc_result
> +    = &l->l_reloc_result[reloc_index (reloc_arg, sizeof (PLTREL))];
>  
>   /* CONCURRENCY NOTES:
>  
> @@ -219,8 +217,11 @@ _dl_profile_fixup (
>  	= (const void *) D_PTR (l, l_info[DT_SYMTAB]);
>        const char *strtab = (const char *) D_PTR (l, l_info[DT_STRTAB]);
>  
> +      const uintptr_t pltgot = (uintptr_t) D_PTR (l, l_info[DT_PLTGOT]);
> +
>        const PLTREL *const reloc
> -	= (const void *) (D_PTR (l, l_info[DT_JMPREL]) + reloc_offset);
> +	= (const void *) (D_PTR (l, l_info[DT_JMPREL])
> +			  + reloc_offset (pltgot, reloc_arg));
>        const ElfW(Sym) *refsym = &symtab[ELFW(R_SYM) (reloc->r_info)];
>        const ElfW(Sym) *defsym = refsym;
>        lookup_t result;
> @@ -489,7 +490,8 @@ _dl_call_pltexit (struct link_map *l, ElfW(Word) reloc_arg,
>       relocations.  */
>    // XXX Maybe the bound information must be stored on the stack since
>    // XXX with bind_not a new value could have been stored in the meantime.
> -  struct reloc_result *reloc_result = &l->l_reloc_result[reloc_index];
> +  struct reloc_result *reloc_result =
> +    &l->l_reloc_result[reloc_index (reloc_arg, sizeof (PLTREL))];
>    ElfW(Sym) *defsym = ((ElfW(Sym) *) D_PTR (reloc_result->bound,
>  					    l_info[DT_SYMTAB])
>  		       + reloc_result->boundndx);

Ok.

> diff --git a/elf/dl-runtime.h b/elf/dl-runtime.h
> new file mode 100644
> index 000000000000..ed5db3ba51b7
> --- /dev/null
> +++ b/elf/dl-runtime.h
> @@ -0,0 +1,30 @@
> +/* Helpers for On-demand PLT fixup for shared objects, Generic version.

Maybe period here?

> +   Copyright (C) 2020 Free Software Foundation, Inc.
> +   This file is part of the GNU C Library.
> +
> +   The GNU C Library is free software; you can redistribute it and/or
> +   modify it under the terms of the GNU Lesser General Public
> +   License as published by the Free Software Foundation; either
> +   version 2.1 of the License, or (at your option) any later version.
> +
> +   The GNU C Library is distributed in the hope that it will be useful,
> +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +   Lesser General Public License for more details.
> +
> +   You should have received a copy of the GNU Lesser General Public
> +   License along with the GNU C Library; if not, write to the Free
> +   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> +   02111-1307 USA.  */
> +
> +static inline uintptr_t
> +reloc_offset (uintptr_t plt0, uintptr_t pltn)
> +{
> +  return pltn;
> +}
> +
> +static inline uintptr_t
> +reloc_index (uintptr_t pltn, size_t size)
> +{
> +  return pltn / size;
> +}

Ok.

> diff --git a/sysdeps/hppa/dl-runtime.c b/sysdeps/hppa/dl-runtime.c
> index 885a3f1837cb..2d061b150f06 100644
> --- a/sysdeps/hppa/dl-runtime.c
> +++ b/sysdeps/hppa/dl-runtime.c
> @@ -17,10 +17,6 @@
>     Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
>     02111-1307 USA.  */
>  
> -/* Clear PA_GP_RELOC bit in relocation offset.  */
> -#define reloc_offset (reloc_arg & ~PA_GP_RELOC)
> -#define reloc_index  (reloc_arg & ~PA_GP_RELOC) / sizeof (PLTREL)
> -
>  #include <elf/dl-runtime.c>
>  
>  /* The caller has encountered a partially relocated function descriptor.

Ok.

> diff --git a/sysdeps/hppa/dl-runtime.h b/sysdeps/hppa/dl-runtime.h
> new file mode 100644
> index 000000000000..cfde0ec991e3
> --- /dev/null
> +++ b/sysdeps/hppa/dl-runtime.h
> @@ -0,0 +1,31 @@
> +/* Helpers for On-demand PLT fixup for shared objects, HPAA version.

Maybe period instead of comma here?

> +   Copyright (C) 2020 Free Software Foundation, Inc.
> +   This file is part of the GNU C Library.
> +
> +   The GNU C Library is free software; you can redistribute it and/or
> +   modify it under the terms of the GNU Lesser General Public
> +   License as published by the Free Software Foundation; either
> +   version 2.1 of the License, or (at your option) any later version.
> +
> +   The GNU C Library is distributed in the hope that it will be useful,
> +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +   Lesser General Public License for more details.
> +
> +   You should have received a copy of the GNU Lesser General Public
> +   License along with the GNU C Library; if not, write to the Free
> +   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> +   02111-1307 USA.  */
> +
> +/* Clear PA_GP_RELOC bit in relocation offset.  */
> +static inline uintptr_t
> +reloc_offset (uintptr_t plt0, uintptr_t pltn)
> +{
> +  return pltn & ~PA_GP_RELOC;
> +}
> +
> +static inline uintptr_t
> +reloc_index (uintptr_t pltn, size_t size)
> +{
> +  return (pltn & ~PA_GP_RELOC )/ size;
> +}

Ok.

> diff --git a/sysdeps/x86_64/dl-runtime.c b/sysdeps/x86_64/dl-runtime.h
> similarity index 60%
> rename from sysdeps/x86_64/dl-runtime.c
> rename to sysdeps/x86_64/dl-runtime.h
> index b625d1e88257..494ff47b7091 100644
> --- a/sysdeps/x86_64/dl-runtime.c
> +++ b/sysdeps/x86_64/dl-runtime.h
> @@ -3,7 +3,14 @@
>     also use the index.  Therefore it is wasteful to compute the offset
>     in the trampoline just to reverse the operation immediately
>     afterwards.  */
> -#define reloc_offset reloc_arg * sizeof (PLTREL)
> -#define reloc_index  reloc_arg
> +static inline uintptr_t
> +reloc_offset (uintptr_t plt0, uintptr_t pltn)
> +{
> +  return pltn * sizeof (ElfW(Rela));
> +}
>  
> -#include <elf/dl-runtime.c>
> +static inline uintptr_t
> +reloc_index (uintptr_t pltn, size_t size)
> +{
> +  return pltn;
> +}
> 

Ok.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
