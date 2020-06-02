Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C403FC433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 17:31:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CEE22068D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 17:31:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="seSoJi8D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="stGNKtSW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CEE22068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOGAQbti0UqyiKkHVxItyLmpFOx/axIpJ2/zabl92So=; b=seSoJi8Dut5Y8P
	NMeaHZ3ENcVV8A39+qTzdHFr0/ZhfrCNHUL0suKBauiVy1OKByNzoC5H/nb5uja1YVI/13jBOvIPJ
	w/K7wUPpOnLGHY0TmQVliRkXPkxjgr3c5fL076a4kgznHMY5iffZQc5xbG/3WP4rD3m3aPGz4t3t8
	dNYTo6hxyegseRv7T6PoZvGmsI8/AFVCRmOPz0tEJNd2uEyJufeIQtnG9vSzlmlDjyoQ1SRZzXqCC
	yp3yLegYtLlGgghqJSEyhWe6EhhsQyljdVg2MTRe+E7XDbBGCYy30WIucs5U8nLM7cpJm1lbYN1+o
	8LAa0FjPEhhenrhzEp1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgAlN-0006mn-Jx; Tue, 02 Jun 2020 17:31:45 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgAlI-0006mI-Jl
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 17:31:44 +0000
Received: by mail-qk1-x743.google.com with SMTP id w3so13311728qkb.6
 for <linux-snps-arc@lists.infradead.org>; Tue, 02 Jun 2020 10:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/zoxe3eBXQ/xj/BvmZgHX0at+kPDQ9srF49BRPJYYrg=;
 b=stGNKtSWTBoTVE8Qm4idcNr/gC5S9cQNWk3SkU20C6vo3NgMwjUg+ceqxbY+wxVHWt
 dXkY/Mq9PbW5RQ5qZE4Xf5SUbosKPIXHLUfEQ17yZChaaRHajRkggZA1w4ypluIYsG3m
 Psb/wf88yXvtbVRLIXgm/adZBM2i/xZVi8hH/hjy31S2oGfwTJx4Bb1pxpQfoEUsoV/s
 m34sDK71eld7fxRuWWdOeQe6nIE0A9obnpAhQw9UJTnW+P/TgO8JGFYvb/QRMfjk6fZo
 nG3ptH2r9O6d2mOiD92VnOngw4Kg1LyufF98uPMyWgGANWFoSj0d1QPYvzGvoUpXyQzv
 P5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/zoxe3eBXQ/xj/BvmZgHX0at+kPDQ9srF49BRPJYYrg=;
 b=KmCvAeVPidqyxT/xWA+4n4+d4vxHYuYLt9BmV6OgHJN1W23yb2kRjqWD4F3VxKA2GL
 ZajI2X0xMBLx3gFhHs+r7TKC8LSWLMykHRTU0hikVlv0x3a+cJP+DC7KuLaJz5DkpfNf
 D/NpsTtddaWCHeBEVlcx3cB6qNnGXBIX3AKdKknMj7GLlf+swb8aj4cTA1P16KRIun+X
 wDiJubGYUietcEJa7K+8nAt4p62GH0bKI8F4UDoqKjqUei6BIHjfYzUF81FEOeS2G/xO
 RJZYq4ma9Lz1hu+eUeO70Wk1+KibOzN+XuP8VHjmNxaWzbR6Aae5lu9+ah+hwtbJk0Wc
 oX4g==
X-Gm-Message-State: AOAM532mINrMqIv0FSJOMUxuy210RDz1YShi2m5vnEpus4BiSxtV5/D8
 yHQTUqGFctOgOzFS8FaJA90qZvrOdkU=
X-Google-Smtp-Source: ABdhPJyVqg+h2+cfmWBhhMtAGzDNpyd4cvAXGF++QMySjLDtBmqebfrdSntds7VDTuRLYVKHITzX9g==
X-Received: by 2002:a37:a292:: with SMTP id
 l140mr25796979qke.171.1591119098596; 
 Tue, 02 Jun 2020 10:31:38 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id r64sm2744435qkd.16.2020.06.02.10.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 10:31:38 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] aarch/fpu: use generic builtins based math
 functions
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, libc-alpha@sourceware.org
References: <20200602003541.21005-1-vgupta@synopsys.com>
 <20200602003541.21005-4-vgupta@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b885b731-dbae-ebbc-6561-71267138bbdf@linaro.org>
Date: Tue, 2 Jun 2020 14:31:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602003541.21005-4-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_103140_685605_B0D5B3EE 
X-CRM114-Status: GOOD (  20.20  )
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



On 01/06/2020 21:35, Vineet Gupta wrote:
> introduce sysdep header math-use-builtins.h to replace aarch64
> impementations with corresponding generic ones

s/impementations/implementations and missing ':'.

> 
>  - newly inroduced generic sqrt{,f}, fma{,f}
>  - existing floor{,f}, nearbyint{,f}, rint{,f}, round{,f}, trunc{,f}
>  - Note that generic copysign was already enabled (via generic
>    math-use-builtins.h) now thru sysdep header
> 
> This is supposed to be a non functional change
> Passes build-many for aarch64-linux-gnu

LGTM (just double check if the objects generated by the removed 
implementations did not changed).

Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

> ---
>  sysdeps/aarch64/fpu/e_sqrt.c            | 27 ----------
>  sysdeps/aarch64/fpu/e_sqrtf.c           | 27 ----------
>  sysdeps/aarch64/fpu/math-use-builtins.h | 71 +++++++++++++++++++++++++
>  sysdeps/aarch64/fpu/s_floor.c           | 29 ----------
>  sysdeps/aarch64/fpu/s_floorf.c          | 29 ----------
>  sysdeps/aarch64/fpu/s_fma.c             | 28 ----------
>  sysdeps/aarch64/fpu/s_fmaf.c            | 28 ----------
>  sysdeps/aarch64/fpu/s_nearbyint.c       | 28 ----------
>  sysdeps/aarch64/fpu/s_nearbyintf.c      | 28 ----------
>  sysdeps/aarch64/fpu/s_rint.c            | 29 ----------
>  sysdeps/aarch64/fpu/s_rintf.c           | 29 ----------
>  sysdeps/aarch64/fpu/s_round.c           | 29 ----------
>  sysdeps/aarch64/fpu/s_roundf.c          | 29 ----------
>  sysdeps/aarch64/fpu/s_trunc.c           | 29 ----------
>  sysdeps/aarch64/fpu/s_truncf.c          | 29 ----------
>  15 files changed, 71 insertions(+), 398 deletions(-)
>  delete mode 100644 sysdeps/aarch64/fpu/e_sqrt.c
>  delete mode 100644 sysdeps/aarch64/fpu/e_sqrtf.c
>  create mode 100644 sysdeps/aarch64/fpu/math-use-builtins.h
>  delete mode 100644 sysdeps/aarch64/fpu/s_floor.c
>  delete mode 100644 sysdeps/aarch64/fpu/s_floorf.c
>  delete mode 100644 sysdeps/aarch64/fpu/s_fma.c
>  delete mode 100644 sysdeps/aarch64/fpu/s_fmaf.c
>  delete mode 100644 sysdeps/aarch64/fpu/s_nearbyint.c
>  delete mode 100644 sysdeps/aarch64/fpu/s_nearbyintf.c
>  delete mode 100644 sysdeps/aarch64/fpu/s_rint.c
>  delete mode 100644 sysdeps/aarch64/fpu/s_rintf.c
>  delete mode 100644 sysdeps/aarch64/fpu/s_round.c
>  delete mode 100644 sysdeps/aarch64/fpu/s_roundf.c
>  delete mode 100644 sysdeps/aarch64/fpu/s_trunc.c
>  delete mode 100644 sysdeps/aarch64/fpu/s_truncf.c
> 
> diff --git a/sysdeps/aarch64/fpu/e_sqrt.c b/sysdeps/aarch64/fpu/e_sqrt.c
> deleted file mode 100644
> index abb67ef7b061..000000000000
> --- a/sysdeps/aarch64/fpu/e_sqrt.c
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -/* Square root of floating point number.
> -   Copyright (C) 2015-2020 Free Software Foundation, Inc.
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public
> -   License as published by the Free Software Foundation; either
> -   version 2.1 of the License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#include <math_private.h>
> -#include <libm-alias-finite.h>
> -
> -double
> -__ieee754_sqrt (double d)
> -{
> -  return __builtin_sqrt (d);
> -}
> -libm_alias_finite (__ieee754_sqrt, __sqrt)

Ok.

> diff --git a/sysdeps/aarch64/fpu/e_sqrtf.c b/sysdeps/aarch64/fpu/e_sqrtf.c
> deleted file mode 100644
> index 13008a4f45d6..000000000000
> --- a/sysdeps/aarch64/fpu/e_sqrtf.c
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -/* Single-precision floating point square root.
> -   Copyright (C) 2015-2020 Free Software Foundation, Inc.
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public
> -   License as published by the Free Software Foundation; either
> -   version 2.1 of the License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#include <math_private.h>
> -#include <libm-alias-finite.h>
> -
> -float
> -__ieee754_sqrtf (float s)
> -{
> -  return __builtin_sqrtf (s);
> -}
> -libm_alias_finite (__ieee754_sqrtf, __sqrtf)

Ok.

> diff --git a/sysdeps/aarch64/fpu/math-use-builtins.h b/sysdeps/aarch64/fpu/math-use-builtins.h
> new file mode 100644
> index 000000000000..50a1ba0db5ea
> --- /dev/null
> +++ b/sysdeps/aarch64/fpu/math-use-builtins.h
> @@ -0,0 +1,71 @@
> +/* Using math gcc builtins instead of generic implementation.  aarch64 version.
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
> +   License along with the GNU C Library; if not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#ifndef MATH_USE_BUILTINS_H
> +#define MATH_USE_BUILTINS_H	1
> +
> +#include <features.h> /* For __GNUC_PREREQ.  */
> +
> +/* Define these macros to 1 to use __builtin_xyz instead of the
> +   generic implementation.  */
> +#define USE_NEARBYINT_BUILTIN 1
> +#define USE_NEARBYINTF_BUILTIN 1
> +#define USE_NEARBYINTL_BUILTIN 0
> +#define USE_NEARBYINTF128_BUILTIN 0
> +
> +#define USE_RINT_BUILTIN 1
> +#define USE_RINTF_BUILTIN 1
> +#define USE_RINTL_BUILTIN 0
> +#define USE_RINTF128_BUILTIN 0
> +
> +#define USE_FLOOR_BUILTIN 1
> +#define USE_FLOORF_BUILTIN 1
> +#define USE_FLOORL_BUILTIN 0
> +#define USE_FLOORF128_BUILTIN 0
> +
> +#define USE_CEIL_BUILTIN 1
> +#define USE_CEILF_BUILTIN 1
> +#define USE_CEILL_BUILTIN 0
> +#define USE_CEILF128_BUILTIN 0
> +
> +#define USE_TRUNC_BUILTIN 1
> +#define USE_TRUNCF_BUILTIN 1
> +#define USE_TRUNCL_BUILTIN 0
> +#define USE_TRUNCF128_BUILTIN 0
> +
> +#define USE_ROUND_BUILTIN 1
> +#define USE_ROUNDF_BUILTIN 1
> +#define USE_ROUNDL_BUILTIN 0
> +#define USE_ROUNDF128_BUILTIN 0
> +
> +#define USE_COPYSIGNL_BUILTIN 1
> +#if __GNUC_PREREQ (7, 0)
> +# define USE_COPYSIGNF128_BUILTIN 1
> +#else
> +# define USE_COPYSIGNF128_BUILTIN 0
> +#endif
> +
> +#define USE_SQRT_BUILTIN 1
> +#define USE_SQRTF_BUILTIN 1
> +
> +#define USE_FMA_BUILTIN 1
> +#define USE_FMAF_BUILTIN 1
> +#define USE_FMAL_BUILTIN 0
> +#define USE_FMAF128_BUILTIN 0
> +
> +#endif

Ok.

> diff --git a/sysdeps/aarch64/fpu/s_floor.c b/sysdeps/aarch64/fpu/s_floor.c
> deleted file mode 100644
> index d7d3e9336a6e..000000000000
> --- a/sysdeps/aarch64/fpu/s_floor.c
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
> -
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public License as
> -   published by the Free Software Foundation; either version 2.1 of the
> -   License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#define NO_MATH_REDIRECT
> -#include <math.h>
> -#include <libm-alias-double.h>
> -
> -double
> -__floor (double x)
> -{
> -  return __builtin_floor (x);
> -}
> -
> -libm_alias_double (__floor, floor)

Ok.

> diff --git a/sysdeps/aarch64/fpu/s_floorf.c b/sysdeps/aarch64/fpu/s_floorf.c
> deleted file mode 100644
> index 625ff4375702..000000000000
> --- a/sysdeps/aarch64/fpu/s_floorf.c
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
> -
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public License as
> -   published by the Free Software Foundation; either version 2.1 of the
> -   License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#define NO_MATH_REDIRECT
> -#include <math.h>
> -#include <libm-alias-float.h>
> -
> -float
> -__floorf (float x)
> -{
> -  return __builtin_floorf (x);
> -}
> -
> -libm_alias_float (__floor, floor)

Ok.

> diff --git a/sysdeps/aarch64/fpu/s_fma.c b/sysdeps/aarch64/fpu/s_fma.c
> deleted file mode 100644
> index 48bb40482dc9..000000000000
> --- a/sysdeps/aarch64/fpu/s_fma.c
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -/* Copyright (C) 1996-2020 Free Software Foundation, Inc.
> -
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public
> -   License as published by the Free Software Foundation; either
> -   version 2.1 of the License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#include <math.h>
> -#include <libm-alias-double.h>
> -
> -double
> -__fma (double x, double y, double z)
> -{
> -  return __builtin_fma (x, y, z);
> -}
> -
> -libm_alias_double (__fma, fma)

Ok.

> diff --git a/sysdeps/aarch64/fpu/s_fmaf.c b/sysdeps/aarch64/fpu/s_fmaf.c
> deleted file mode 100644
> index 544f32e27aec..000000000000
> --- a/sysdeps/aarch64/fpu/s_fmaf.c
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
> -
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public License as
> -   published by the Free Software Foundation; either version 2.1 of the
> -   License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#include <math.h>
> -#include <libm-alias-float.h>
> -
> -float
> -__fmaf (float x, float y, float z)
> -{
> -  return __builtin_fmaf (x, y, z);
> -}
> -
> -libm_alias_float (__fma, fma)

Ok.

> diff --git a/sysdeps/aarch64/fpu/s_nearbyint.c b/sysdeps/aarch64/fpu/s_nearbyint.c
> deleted file mode 100644
> index 59a57dd39ba1..000000000000
> --- a/sysdeps/aarch64/fpu/s_nearbyint.c
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
> -
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public License as
> -   published by the Free Software Foundation; either version 2.1 of the
> -   License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#include <math.h>
> -#include <libm-alias-double.h>
> -
> -double
> -__nearbyint (double x)
> -{
> -  return __builtin_nearbyint (x);
> -}
> -
> -libm_alias_double (__nearbyint, nearbyint)

Ok.

> diff --git a/sysdeps/aarch64/fpu/s_nearbyintf.c b/sysdeps/aarch64/fpu/s_nearbyintf.c
> deleted file mode 100644
> index f52968ae2bbd..000000000000
> --- a/sysdeps/aarch64/fpu/s_nearbyintf.c
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
> -
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public License as
> -   published by the Free Software Foundation; either version 2.1 of the
> -   License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#include <math.h>
> -#include <libm-alias-float.h>
> -
> -float
> -__nearbyintf (float x)
> -{
> -  return __builtin_nearbyintf (x);
> -}
> -
> -libm_alias_float (__nearbyint, nearbyint)

Ok.

> diff --git a/sysdeps/aarch64/fpu/s_rint.c b/sysdeps/aarch64/fpu/s_rint.c
> deleted file mode 100644
> index bdd757167e0c..000000000000
> --- a/sysdeps/aarch64/fpu/s_rint.c
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
> -
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public License as
> -   published by the Free Software Foundation; either version 2.1 of the
> -   License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#define NO_MATH_REDIRECT
> -#include <math.h>
> -#include <libm-alias-double.h>
> -
> -double
> -__rint (double x)
> -{
> -  return __builtin_rint (x);
> -}
> -
> -libm_alias_double (__rint, rint)

Ok.

> diff --git a/sysdeps/aarch64/fpu/s_rintf.c b/sysdeps/aarch64/fpu/s_rintf.c
> deleted file mode 100644
> index 8cf7c63d6dda..000000000000
> --- a/sysdeps/aarch64/fpu/s_rintf.c
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
> -
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public License as
> -   published by the Free Software Foundation; either version 2.1 of the
> -   License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#define NO_MATH_REDIRECT
> -#include <math.h>
> -#include <libm-alias-float.h>
> -
> -float
> -__rintf (float x)
> -{
> -  return __builtin_rintf (x);
> -}
> -
> -libm_alias_float (__rint, rint)

Ok.

> diff --git a/sysdeps/aarch64/fpu/s_round.c b/sysdeps/aarch64/fpu/s_round.c
> deleted file mode 100644
> index d2fd5f34117a..000000000000
> --- a/sysdeps/aarch64/fpu/s_round.c
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
> -
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public License as
> -   published by the Free Software Foundation; either version 2.1 of the
> -   License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#define NO_MATH_REDIRECT
> -#include <math.h>
> -#include <libm-alias-double.h>
> -
> -double
> -__round (double x)
> -{
> -  return __builtin_round (x);
> -}
> -
> -libm_alias_double (__round, round)

Ok.

> diff --git a/sysdeps/aarch64/fpu/s_roundf.c b/sysdeps/aarch64/fpu/s_roundf.c
> deleted file mode 100644
> index e51214e86cd2..000000000000
> --- a/sysdeps/aarch64/fpu/s_roundf.c
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
> -
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public License as
> -   published by the Free Software Foundation; either version 2.1 of the
> -   License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#define NO_MATH_REDIRECT
> -#include <math.h>
> -#include <libm-alias-float.h>
> -
> -float
> -__roundf (float x)
> -{
> -  return __builtin_roundf (x);
> -}
> -
> -libm_alias_float (__round, round)

Ok.

> diff --git a/sysdeps/aarch64/fpu/s_trunc.c b/sysdeps/aarch64/fpu/s_trunc.c
> deleted file mode 100644
> index bac23a5e269d..000000000000
> --- a/sysdeps/aarch64/fpu/s_trunc.c
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
> -
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public License as
> -   published by the Free Software Foundation; either version 2.1 of the
> -   License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#define NO_MATH_REDIRECT
> -#include <math.h>
> -#include <libm-alias-double.h>
> -
> -double
> -__trunc (double x)
> -{
> -  return __builtin_trunc (x);
> -}
> -
> -libm_alias_double (__trunc, trunc)

Ok.

> diff --git a/sysdeps/aarch64/fpu/s_truncf.c b/sysdeps/aarch64/fpu/s_truncf.c
> deleted file mode 100644
> index 6a025c084a5a..000000000000
> --- a/sysdeps/aarch64/fpu/s_truncf.c
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
> -
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public License as
> -   published by the Free Software Foundation; either version 2.1 of the
> -   License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, see
> -   <https://www.gnu.org/licenses/>.  */
> -
> -#define NO_MATH_REDIRECT
> -#include <math.h>
> -#include <libm-alias-float.h>
> -
> -float
> -__truncf (float x)
> -{
> -  return __builtin_truncf (x);
> -}
> -
> -libm_alias_float (__trunc, trunc)
> 


Ok.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
