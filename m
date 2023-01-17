Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48A0C63797
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Jan 2023 14:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BIu4doP8g42SAMN6YEZn6hazZ+YWUiypBpas5oqH5E=; b=D2tPeSDwxPgQC6
	Nvq8xRAqSp2gIqUwTPa5i9AXfKiNX7kJMGhUtVtY58Hp+SiXpvGA61RMheUH35+NzmLszKqqgSSac
	OkPtubSKAZG7hDWqHMzX3GZSN/FPtfFjbojm/i+VDYAAx48NECw0PvLuE6cJxpBs9tQGIrC+wqssT
	dtC2kZu8aE5ccOxU7vGy2t04mVFbQhnLrK4g6tzXI3WY1BD5hguQUmfOWNQEWUezwXLTRaReZo1ZS
	6s9/Qc2HnqOnMe28tZXh0cuusAbpwYYsZdIWhrwbyvtKYbrT8i7TxDNIDvbZkIKRzVsaC4XdM6+QE
	UPZsRj/EVvlvNNnF7NyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHn0N-00EdMn-Ah; Tue, 17 Jan 2023 14:32:03 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHn0K-00EdLK-EW
	for linux-snps-arc@lists.infradead.org; Tue, 17 Jan 2023 14:32:01 +0000
Received: by mail-oi1-x230.google.com with SMTP id p185so4910965oif.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 17 Jan 2023 06:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k2nuHqByQG7Cm1bhdJh5z2+H0GPxRJPieZhH62NQFLM=;
        b=Qsle6EQezldkihlL2aWYVB8eXX7qDT2a7YXymUVHNGBzYU9y3KMZXLRQC5vXuCpaYV
         rVVNfl7S/gJedxXoJbWFqL1nv8N+ZjarpFeaA3S0uTV19/qZA/ZNmiENAvALt+I4TbXo
         90On/T+WX0z5QcycKq4lF4aFkji3UW4peBkwxtpj7l2bEVcKGo9RrMbJzEtpt2IqD5Jj
         hEQUg1PQnrDyMRikJgnKt5/K+fbKd0Ur2IxxTeDf5JWoMBuR5B1X389YLfpPPp6SDDk/
         ZMT1B18sJ4OySW1LmbaTYnVxbtmRTlQ0oQ5v2DPxUYnQ3iXN8tW1WWa8LcYxfUkuENF+
         gqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2nuHqByQG7Cm1bhdJh5z2+H0GPxRJPieZhH62NQFLM=;
        b=iCGQDQqXKmjg4/XcR02ApBcCGaHFbTbF8FlPXEllU93DlpiOO0hwHsd+JEMCA5Vq0D
         ZGLezZZMz6DMOyq3rdy34iX/6wIo6WXF9nCGTQv3oVjDTfbxi3YpC8csqwo2sHv07AOc
         MLVuYmJCsWxjoOmTwD8uZREuhINkdXUcDon0rScwRKm8I0EA+3UDgsLKKsnJ7GjFb7Qb
         g+SZI042Tq8yNP3xtOiDXcG93vC9zFCpc6kym5znUlLFpijKbgTK5g6hIpxBdBEaFNQb
         QP7Ux0ps+ZOa93IaRMGDHkCSZFNH2JLRiYqnoE96tLUxnX3TolzoI4JAwlfZruDuJBOa
         KtyQ==
X-Gm-Message-State: AFqh2kpyRys1ixb2pyRK41LAMcD+mYaR2ks//5nInnuvcOmbdclWjEka
	ZX6Abi5Sh6MsBOWeZ92YtSZ0rA==
X-Google-Smtp-Source: AMrXdXtGCxZ5NII2X39KlU1OyyeQxKSRoNHcc8AmLHhClIge5rDugpP0yBlg8Xl8H8N4k1PO9MJJag==
X-Received: by 2002:a05:6808:138c:b0:35b:e81d:285b with SMTP id c12-20020a056808138c00b0035be81d285bmr1921799oiw.28.1673965916703;
        Tue, 17 Jan 2023 06:31:56 -0800 (PST)
Received: from ?IPV6:2804:1b3:a7c1:1652:49fa:2dd7:dbd:38f6? ([2804:1b3:a7c1:1652:49fa:2dd7:dbd:38f6])
        by smtp.gmail.com with ESMTPSA id d62-20020aca3641000000b0035ba52d0efasm14500730oia.52.2023.01.17.06.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 06:31:55 -0800 (PST)
Message-ID: <407f62f4-bba8-9829-c854-d16ac6a444d9@linaro.org>
Date: Tue, 17 Jan 2023 11:31:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] ARC:fpu: add extra capability check before use of sqrt
 and fma builtins
Content-Language: en-US
To: Pavel.Kozlov@synopsys.com, libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org
References: <20221221162849.12301-1-kozlov@synopsys.com>
 <20230117121223.2635-1-kozlov@synopsys.com>
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <20230117121223.2635-1-kozlov@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_063200_517194_3BED9BFE 
X-CRM114-Status: GOOD (  21.11  )
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



On 17/01/23 09:12, Pavel.Kozlov--- via Libc-alpha wrote:
> From: Pavel Kozlov <pavel.kozlov@synopsys.com>
> 
> Add extra check for compiler definitions to ensure that compiler provides
> sqrt and fma hw fpu instructions else use software implementation.
> 
> As divide/sqrt and FMA hw support from CPU side is optional,
> the compiler can be configured by options to generate hw FPU instructions,
> but without use of FDDIV, FDSQRT, FSDIV, FSSQRT, FDMADD and FSMADD
> instructions. In this case __builtin_sqrt and __builtin_sqrtf provided by
> compiler can't be used inside the glibc code, as these builtins are used
> in implementations of sqrt() and sqrtf() functions but at the same time
> these builtins unfold to sqrt() and sqrtf(). So it is possible to receive
> code like that:
> 
> 0001c4b4 <__ieee754_sqrtf>:
>    1c4b4:    0001 0000      b     0         ;1c4b4 <__ieee754_sqrtf>
> 
> The same is also true for __builtin_fma and __builtin_fmaf.

LGTM, thanks.  You might need to check with Carlos O'Donnel to see it you
could install this for 2.36.

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>

> 
> ---
> Changes in v2:
>  - Fixed macros definitions for FMA
> 
>  sysdeps/arc/fpu/math-use-builtins-fma.h  | 14 ++++++++++++--
>  sysdeps/arc/fpu/math-use-builtins-sqrt.h | 14 ++++++++++++--
>  2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/sysdeps/arc/fpu/math-use-builtins-fma.h b/sysdeps/arc/fpu/math-use-builtins-fma.h
> index eede75aa41be..2acd8113ce2c 100644
> --- a/sysdeps/arc/fpu/math-use-builtins-fma.h
> +++ b/sysdeps/arc/fpu/math-use-builtins-fma.h
> @@ -1,4 +1,14 @@
> -#define USE_FMA_BUILTIN 1
> -#define USE_FMAF_BUILTIN 1
> +#if defined __ARC_FPU_DP_FMA__
> +# define USE_FMA_BUILTIN 1
> +#else
> +# define USE_FMA_BUILTIN 0
> +#endif
> +
> +#if defined __ARC_FPU_SP_FMA__
> +# define USE_FMAF_BUILTIN 1
> +#else
> +# define USE_FMAF_BUILTIN 0
> +#endif
> +
>  #define USE_FMAL_BUILTIN 0
>  #define USE_FMAF128_BUILTIN 0
> diff --git a/sysdeps/arc/fpu/math-use-builtins-sqrt.h b/sysdeps/arc/fpu/math-use-builtins-sqrt.h
> index e94c915ba66a..a449bc609295 100644
> --- a/sysdeps/arc/fpu/math-use-builtins-sqrt.h
> +++ b/sysdeps/arc/fpu/math-use-builtins-sqrt.h
> @@ -1,4 +1,14 @@
> -#define USE_SQRT_BUILTIN 1
> -#define USE_SQRTF_BUILTIN 1
> +#if defined __ARC_FPU_DP_DIV__
> +# define USE_SQRT_BUILTIN 1
> +#else
> +# define USE_SQRT_BUILTIN 0
> +#endif
> +
> +#if defined __ARC_FPU_SP_DIV__
> +# define USE_SQRTF_BUILTIN 1
> +#else
> +# define USE_SQRTF_BUILTIN 0
> +#endif
> +
>  #define USE_SQRTL_BUILTIN 0
>  #define USE_SQRTF128_BUILTIN 0

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
