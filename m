Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94356C433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 17:28:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5921C2068D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 17:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V3Le6mgA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wIRto1qk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5921C2068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JFku9VHCSmb73gTObhaWdYdkiFVrSJpZ4/5XoRA7xo=; b=V3Le6mgAP8glbg
	XvbVZFw2hsaQxAz5FFIQphlO1S/NzSbrZXIkMG6NZ3Xx98Or4RWnmMgc/YFxVoUvdobVLTJVqBjQT
	XOLA18Q6tUBs8v+diNxcQErsfKMVx1FNKhdNbhwonJw1v8bO2W6yeCX7oga6aB6yFn2GtII59EDPl
	2wzp2uc1l5i/maj5fb/v6GcsUGuHu81apZfpC7NhV1E15rDEYAr4T7Ap8JJXiPw31KPF9mAUI64TP
	PW6WTWGDCv6sY9NVoA92kT5oxlW5kUMKB1BOEX6RLPKz2B8yavA1r8a9SDa4Rh6enfdwgDdKEwT/V
	waduaZbGjDZHhdxukgoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgAiC-0004CI-Si; Tue, 02 Jun 2020 17:28:28 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgAiA-0004BN-39
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 17:28:27 +0000
Received: by mail-qk1-x741.google.com with SMTP id f18so13364177qkh.1
 for <linux-snps-arc@lists.infradead.org>; Tue, 02 Jun 2020 10:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g2G0aeGiXnUoGHIlRJMIG1KUn05a9cNwim0hJDwLgbQ=;
 b=wIRto1qk/P+o+I6/GIU8yyio481elIBYXwJ9PSsqCYik4UJGJoZDuHtdYKxSqQSaKT
 20CJjGdoZblnsvYwvINsgmdhZNotmhb4jBJmPl3YMdslwOjLKy8M31HYnLzRXPOyRIaF
 pJ+2tP6mdpXveiQcbeU2FjiXQetp9CYXJm1OlhCvhA4TTVwl+S4Ocs6OjCudTrJBsR0f
 qvJ8gq2/wOzhdvwv05aR3qGB7Sdjk/BFnS5jQ1bFsM4cx2EiliesF9EtlxtSPe6xyEaN
 bxK/GGMSS+bhaN+BVBT8FhlQaCN/GzJSJUmhNJ/4B4+useANshZvp/rkRgFihgRCjHIZ
 a/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=g2G0aeGiXnUoGHIlRJMIG1KUn05a9cNwim0hJDwLgbQ=;
 b=VUL5SFVyxKT6QSgn9lXU7cMtXj1OR980IlTOB0SH+65B/Qcaa6P64XqtWFtNCWjxG3
 0KeHUrIxCGkyM5VFoeo/2jxIEeZGLkiZhcOXamPn5XTuPjABcSUMkLhU+yPTRET38lnJ
 pbfhDvqD+F5mtbIffPWcAV76fuFxzSxiG2hUjfpM6AJJAcX8pr5POcAjZeVLI480OEZy
 vid/RuiHNLr5x7OFZTMut7cl2Zl0EDDmhSAWJrDKknv6ewn3d98NPnHs24RWa08yxLpu
 jdmkMoolrPX2ucbzacSXOEjyjFF7UeSpOP/3+HGulu9TgoUjmdKRXPMLTw4I4ZvVMDoO
 21+Q==
X-Gm-Message-State: AOAM5334lAkxLk9fb/m8ye0GNa92jGjzefel29Ao8gGEsULy8PzXsbZy
 6GmXTEAwn/QV3cm4nG+zPUUm+vUecGw=
X-Google-Smtp-Source: ABdhPJzTypzUUeXRmxJeRIdO3sVVP38CLeNu4oVWIoU91toPV3R9ruZ2ousJBN/ItDnOyE+cGPpnug==
X-Received: by 2002:a37:7c6:: with SMTP id 189mr2274441qkh.24.1591118904502;
 Tue, 02 Jun 2020 10:28:24 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id o6sm3068108qtd.59.2020.06.02.10.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 10:28:24 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] iee754: provide gcc builtins based generic fma
 functions
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, libc-alpha@sourceware.org
References: <20200602003541.21005-1-vgupta@synopsys.com>
 <20200602003541.21005-3-vgupta@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <65dcf094-13a6-fbeb-6920-07c13c7308b8@linaro.org>
Date: Tue, 2 Jun 2020 14:28:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602003541.21005-3-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_102826_135578_49292C2F 
X-CRM114-Status: GOOD (  13.45  )
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
> ---
>  sysdeps/generic/math-use-builtins.h         | 5 +++++
>  sysdeps/ieee754/dbl-64/s_fma.c              | 6 ++++++
>  sysdeps/ieee754/dbl-64/s_fmaf.c             | 6 ++++++
>  sysdeps/ieee754/float128/float128_private.h | 2 ++
>  sysdeps/ieee754/ldbl-128/s_fmal.c           | 5 +++++
>  5 files changed, 24 insertions(+)


LGTM with s390 fix pointed by Stefan.

Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

> 
> diff --git a/sysdeps/generic/math-use-builtins.h b/sysdeps/generic/math-use-builtins.h
> index fc724c824a17..cf25ed8a2138 100644
> --- a/sysdeps/generic/math-use-builtins.h
> +++ b/sysdeps/generic/math-use-builtins.h
> @@ -63,4 +63,9 @@
>  #define USE_SQRT_BUILTIN 0
>  #define USE_SQRTF_BUILTIN 0
>  
> +#define USE_FMA_BUILTIN 0
> +#define USE_FMAF_BUILTIN 0
> +#define USE_FMAL_BUILTIN 0
> +#define USE_FMAF128_BUILTIN 0
> +
>  #endif /* math-use-builtins.h */
> diff --git a/sysdeps/ieee754/dbl-64/s_fma.c b/sysdeps/ieee754/dbl-64/s_fma.c
> index 876df6e78bdc..9dc5b132b9ee 100644
> --- a/sysdeps/ieee754/dbl-64/s_fma.c
> +++ b/sysdeps/ieee754/dbl-64/s_fma.c
> @@ -25,6 +25,7 @@
>  #include <fenv_private.h>
>  #include <libm-alias-double.h>
>  #include <tininess.h>
> +#include <math-use-builtins.h>
>  
>  /* This implementation uses rounding to odd to avoid problems with
>     double rounding.  See a paper by Boldo and Melquiond:
> @@ -33,6 +34,10 @@
>  double
>  __fma (double x, double y, double z)
>  {
> +#if USE_FMA_BUILTIN
> +  return __builtin_fma (x, y, z);
> +#else
> +  /* Use generic implementation.  */
>    union ieee754_double u, v, w;
>    int adjust = 0;
>    u.d = x;
> @@ -292,6 +297,7 @@ __fma (double x, double y, double z)
>        v.ieee.mantissa1 |= j;
>        return v.d * 0x1p-108;
>      }
> +#endif /* ! USE_FMA_BUILTIN  */
>  }
>  #ifndef __fma
>  libm_alias_double (__fma, fma)
> diff --git a/sysdeps/ieee754/dbl-64/s_fmaf.c b/sysdeps/ieee754/dbl-64/s_fmaf.c
> index 57329d0a87fe..93b8660d5242 100644
> --- a/sysdeps/ieee754/dbl-64/s_fmaf.c
> +++ b/sysdeps/ieee754/dbl-64/s_fmaf.c
> @@ -23,6 +23,7 @@
>  #include <math-barriers.h>
>  #include <fenv_private.h>
>  #include <libm-alias-float.h>
> +#include <math-use-builtins.h>
>  
>  /* This implementation relies on double being more than twice as
>     precise as float and uses rounding to odd in order to avoid problems
> @@ -33,6 +34,10 @@
>  float
>  __fmaf (float x, float y, float z)
>  {
> +#if USE_FMAF_BUILTIN
> +  return __builtin_fmaf (x, y, z);
> +#else
> +  /* Use generic implementation.  */
>    fenv_t env;
>  
>    /* Multiplication is always exact.  */
> @@ -60,6 +65,7 @@ __fmaf (float x, float y, float z)
>  
>    /* And finally truncation with round to nearest.  */
>    return (float) u.d;
> +#endif /* ! USE_FMAF_BUILTIN  */
>  }
>  #ifndef __fmaf
>  libm_alias_float (__fma, fma)
> diff --git a/sysdeps/ieee754/float128/float128_private.h b/sysdeps/ieee754/float128/float128_private.h
> index f97463d9dc1b..ab6fc9f3c9cf 100644
> --- a/sysdeps/ieee754/float128/float128_private.h
> +++ b/sysdeps/ieee754/float128/float128_private.h
> @@ -154,6 +154,8 @@
>  #define USE_ROUNDL_BUILTIN USE_ROUNDF128_BUILTIN
>  #undef USE_COPYSIGNL_BUILTIN
>  #define USE_COPYSIGNL_BUILTIN USE_COPYSIGNF128_BUILTIN
> +#undef USE_FMAL_BUILTIN
> +#define USE_FMAL_BUILTIN USE_FMAF128_BUILTIN
>  
>  /* IEEE function renames.  */
>  #define __ieee754_acoshl __ieee754_acoshf128
> diff --git a/sysdeps/ieee754/ldbl-128/s_fmal.c b/sysdeps/ieee754/ldbl-128/s_fmal.c
> index 7475015bcec6..a610499e47c7 100644
> --- a/sysdeps/ieee754/ldbl-128/s_fmal.c
> +++ b/sysdeps/ieee754/ldbl-128/s_fmal.c
> @@ -25,6 +25,7 @@
>  #include <math_private.h>
>  #include <libm-alias-ldouble.h>
>  #include <tininess.h>
> +#include <math-use-builtins.h>
>  
>  /* This implementation uses rounding to odd to avoid problems with
>     double rounding.  See a paper by Boldo and Melquiond:
> @@ -33,6 +34,9 @@
>  _Float128
>  __fmal (_Float128 x, _Float128 y, _Float128 z)
>  {
> +#if USE_FMAL_BUILTIN
> +  return __builtin_fmal (x, y, z);
> +#else
>    union ieee854_long_double u, v, w;
>    int adjust = 0;
>    u.d = x;
> @@ -296,5 +300,6 @@ __fmal (_Float128 x, _Float128 y, _Float128 z)
>        v.ieee.mantissa3 |= j;
>        return v.d * L(0x1p-228);
>      }
> +#endif /* ! USE_FMAL_BUILTIN  */
>  }
>  libm_alias_ldouble (__fma, fma)
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
