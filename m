Return-Path: <SRS0=Gpdw=7S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B73C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jun 2020 20:16:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C882220810
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jun 2020 20:16:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N9ShEKEG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmXCMpVq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C882220810
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93p8aOUAB4RIEJxog4KIDBDDiAtdL12H657iJhzFr3s=; b=N9ShEKEG1XuQPm
	gIAISrKnXp137FXSGHofr7hIRahi6h3yYoh7xRgZ5dTzrOp5p1TBE1YK5a+xcvSFcTjY873GV0yUW
	GixKkX7juUDwIfXEea5UBsLDQ7vrKZZQEnx/MMczl0sWhfnGlStT65Mp6DP6iBEhFTktIpB08kjHk
	bFS0Qyl3tNfkgMefzMnvml43svq9WwrPub7VQeIe5MI/u1mM13767T5gIBVmezTLOvrw2aLWCHQqX
	vM5drY15K/PdJ9A1DLJP59e/7CfCTJx0QAzHP+nenTlK5IFkTeEebifTt2Pt1bPntH51B49hRzYym
	dHPHUP6ksaeN5xiTJAkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhIl8-0003Yz-Np; Fri, 05 Jun 2020 20:16:10 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhIl6-0003Ya-91
 for linux-snps-arc@lists.infradead.org; Fri, 05 Jun 2020 20:16:10 +0000
Received: by mail-qt1-x842.google.com with SMTP id d27so9627543qtg.4
 for <linux-snps-arc@lists.infradead.org>; Fri, 05 Jun 2020 13:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yC9/IlyOcVnoybvqoeo2L0PgnISEjr7Dr/iVb7oKsFg=;
 b=HmXCMpVqBqikuSzSq/K7CEmrYEynh4eBmc6r8GmiLXAvuG0SWLnrxWmhpnENSyJ5/k
 xcSogFF+HvV0Br46/ySiQK43WfPaxw0xW75So30ffAHjwy0nyqjqG6KCiUAZUzkdOKo+
 gUK1OAi5DtlgKSuK+o5/XmSMxZX9IVI2g8gUv7ZMo405U8B2MZCeblaJ0Il1bAMfLS3U
 10jXZppCMZ/prESP1AVsMKkY5WdgYW2LxaYIgXX9v8zLCQGOwfhwek+rwxoWUkTVMmRV
 tP0JXcbJYsRiUBxkqLax8mxoV4KcEsgHdbw+IyXzmCDuV8e0F58nhOohWaymgbIuzKEb
 dJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yC9/IlyOcVnoybvqoeo2L0PgnISEjr7Dr/iVb7oKsFg=;
 b=Wvt+GkXEsgaj9uIWOKLvlTczj3fu8lVM9KBepZI7g9Qy8aTCUqvwesLozq7oSjVaga
 IkdUJswDTWeIo9IbVckfn/5ml6sh8aC3CJPaMogiafIlkdJ8Qbm9bd/f1a97ulzMzbV0
 oHhtwNAeRBf/6Jg7SV0Ke3zh9XHc+DlGuttShH6UrgKplih8Wkv7FnYzddkppsZy+1ao
 FrFmmu1VkzScjkzZen5LwPPFyDAI1U8MRj52v6+UWt/KuMwHFaOYLV7O2sAlIB2++V6g
 uxQcFMRLy0AhfHl4UOiiVtsSa1AmYANd+4rqWqIvTQ9982hwMahW4lXrDBwa56+MGyOH
 jwEw==
X-Gm-Message-State: AOAM530MF4PDFr6cLEt5j9QgvU4fKer3fVZBObGRWUV3ads4mecMB70W
 jIrO3FnnAcj8+R4eKByCCp5Ddb5xgrY=
X-Google-Smtp-Source: ABdhPJxy/UargPdElKZNfkx6hlUjQGK4QU2HB5//0QCbVvfyyeoS8/CCvQY97YgpcsUfEuVEeNvpHw==
X-Received: by 2002:aed:3f17:: with SMTP id p23mr12051692qtf.346.1591388166512; 
 Fri, 05 Jun 2020 13:16:06 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id d16sm796244qte.49.2020.06.05.13.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2020 13:16:06 -0700 (PDT)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, libc-alpha@sourceware.org
References: <20200601221823.17861-1-vgupta@synopsys.com>
 <20200601221823.17861-2-vgupta@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH v2 1/2] dl-runtime: reloc_{offset,index} now functions
 arch overide'able
Message-ID: <34af7ce6-e0a2-1391-3be3-a4df7fc10ecd@linaro.org>
Date: Fri, 5 Jun 2020 17:16:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601221823.17861-2-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_131608_387232_10BEC209 
X-CRM114-Status: GOOD (  24.15  )
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



On 01/06/2020 19:18, Vineet Gupta wrote:
> The existing macros are fragile and expect local variables with a
> certain name. Fix this by defining them as functions with default
> implementation in a new header dl-runtime.h which arches can override
> if need be.
> 
> This came up during ARC port review, hence the need for argument pltgot
> in reloc_index() which is not needed by existing ports.
> 
> This patch potentially only affects hppa/x86 ports,
> build tested for both those configs and a few more.
> 
> Suggested-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

LGTM, thanks.  There are just style nits in the one-line comment
for new files.

Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

> ---
>  elf/dl-runtime.c            | 28 +++++++++++++++++-----------
>  elf/dl-runtime.h            | 30 ++++++++++++++++++++++++++++++
>  sysdeps/hppa/dl-runtime.c   |  4 ----
>  sysdeps/hppa/dl-runtime.h   | 31 +++++++++++++++++++++++++++++++
>  sysdeps/x86_64/dl-runtime.c |  9 ---------
>  sysdeps/x86_64/dl-runtime.h | 35 +++++++++++++++++++++++++++++++++++
>  6 files changed, 113 insertions(+), 24 deletions(-)
>  create mode 100644 elf/dl-runtime.h
>  create mode 100644 sysdeps/hppa/dl-runtime.h
>  delete mode 100644 sysdeps/x86_64/dl-runtime.c
>  create mode 100644 sysdeps/x86_64/dl-runtime.h
> 
> diff --git a/elf/dl-runtime.c b/elf/dl-runtime.c
> index cf5f1d3e82e1..85a229f6f019 100644
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

Ok.

> @@ -180,9 +177,12 @@ _dl_profile_fixup (
>  			l, reloc_arg);
>      }
>  
> +  const uintptr_t pltgot = (uintptr_t) D_PTR (l, l_info[DT_PLTGOT]);
> +
>    /* This is the address in the array where we store the result of previous
>       relocations.  */
> -  struct reloc_result *reloc_result = &l->l_reloc_result[reloc_index];
> +  struct reloc_result *reloc_result
> +    = &l->l_reloc_result[reloc_index (pltgot, reloc_arg, sizeof (PLTREL))];
>  
>   /* CONCURRENCY NOTES:
>  


Ok.
> @@ -219,8 +219,11 @@ _dl_profile_fixup (
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

Ok.

> @@ -485,11 +488,14 @@ _dl_call_pltexit (struct link_map *l, ElfW(Word) reloc_arg,
>  		  const void *inregs, void *outregs)
>  {
>  #ifdef SHARED
> +  const uintptr_t pltgot = (uintptr_t) D_PTR (l, l_info[DT_PLTGOT]);
> +
>    /* This is the address in the array where we store the result of previous
>       relocations.  */
>    // XXX Maybe the bound information must be stored on the stack since
>    // XXX with bind_not a new value could have been stored in the meantime.
> -  struct reloc_result *reloc_result = &l->l_reloc_result[reloc_index];
> +  struct reloc_result *reloc_result =
> +    &l->l_reloc_result[reloc_index (pltgot, reloc_arg, sizeof (PLTREL))];
>    ElfW(Sym) *defsym = ((ElfW(Sym) *) D_PTR (reloc_result->bound,
>  					    l_info[DT_SYMTAB])
>  		       + reloc_result->boundndx);

Ok.

> diff --git a/elf/dl-runtime.h b/elf/dl-runtime.h
> new file mode 100644
> index 000000000000..dd87d799465e
> --- /dev/null
> +++ b/elf/dl-runtime.h
> @@ -0,0 +1,30 @@
> +/* Helpers for On-demand PLT fixup for shared objects. Generic version.

Double space after period.

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
> +reloc_index (uintptr_t plt0, uintptr_t pltn, size_t size)
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
> index 000000000000..be3bc929c74c
> --- /dev/null
> +++ b/sysdeps/hppa/dl-runtime.h
> @@ -0,0 +1,31 @@
> +/* Helpers for On-demand PLT fixup for shared objects. HPAA version.

Double space after period.

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
> +reloc_index (uintptr_t plt0, uintptr_t pltn, size_t size)
> +{
> +  return (pltn & ~PA_GP_RELOC )/ size;
> +}

Ok,

> diff --git a/sysdeps/x86_64/dl-runtime.c b/sysdeps/x86_64/dl-runtime.c
> deleted file mode 100644
> index b625d1e88257..000000000000
> --- a/sysdeps/x86_64/dl-runtime.c
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -/* The ABI calls for the PLT stubs to pass the index of the relocation
> -   and not its offset.  In _dl_profile_fixup and _dl_call_pltexit we
> -   also use the index.  Therefore it is wasteful to compute the offset
> -   in the trampoline just to reverse the operation immediately
> -   afterwards.  */
> -#define reloc_offset reloc_arg * sizeof (PLTREL)
> -#define reloc_index  reloc_arg
> -
> -#include <elf/dl-runtime.c>

Ok.

> diff --git a/sysdeps/x86_64/dl-runtime.h b/sysdeps/x86_64/dl-runtime.h
> new file mode 100644
> index 000000000000..b82fdce8367d
> --- /dev/null
> +++ b/sysdeps/x86_64/dl-runtime.h
> @@ -0,0 +1,35 @@
> +/* Helpers for On-demand PLT fixup for shared objects. x86_64 version.

Double space after period.

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
> +/* The ABI calls for the PLT stubs to pass the index of the relocation
> +   and not its offset.  In _dl_profile_fixup and _dl_call_pltexit we
> +   also use the index.  Therefore it is wasteful to compute the offset
> +   in the trampoline just to reverse the operation immediately
> +   afterwards.  */
> +static inline uintptr_t
> +reloc_offset (uintptr_t plt0, uintptr_t pltn)
> +{
> +  return pltn * sizeof (ElfW(Rela));
> +}
> +
> +static inline uintptr_t
> +reloc_index (uintptr_t plt0, uintptr_t pltn, size_t size)
> +{
> +  return pltn;
> +}
> 

Ok.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
