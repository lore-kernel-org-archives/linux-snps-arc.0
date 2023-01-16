Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEA0C54EBE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Jan 2023 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0swATGoOp906AxFXZx+XeHkNAdlStJIAqoJRS7EzRUQ=; b=GKtq1x+unkf/tr
	BP7JVRHBPMhpGTRlhHKsss8Ycu/tvpdivOpb/KMuca/wkXM28xNtJY8J0/3FTQD6YiyLsFJDY4sXj
	NZejfIsrClkal5xEvX/oKAZamKucEuA5h87oZNJeP21YdKy0+4hjbVq9DJYhRz5ZKr6jTRRZ36KKw
	A0JxLN+29ej1szGgH1b+7Onl7aO6hiad5ORaD0jhL/bLp07Lk6z+kkdrUDSehg66G8lyzWaEWAJTB
	vlixADKgbq0vXLxj8FClOfcO5mavp4/zm2YgYrxT/mQvFzfi1hktPhypLfDgLYQeFqH7C4eAUPGmz
	SwKJvadvPHMPdMK7ITrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQQG-00AsTk-2S; Mon, 16 Jan 2023 14:25:16 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQJi-00ApNA-2f
	for linux-snps-arc@lists.infradead.org; Mon, 16 Jan 2023 14:18:32 +0000
Received: by mail-oi1-x22e.google.com with SMTP id s124so6655175oif.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 16 Jan 2023 06:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QhXObj82nBcQEYJAA1ad2r04kCOEU7ksJDCUDcSKqfM=;
        b=tI6CSUZ00xKAcoJU6fK06ndrKdAPulBob6ZSlrajIa8BTR+1Xyp1sS0TlfpZX5E9qk
         +cs4oheyV7sr8YUpzCdBPB7RjpVDM4hgG//KZaMw7pNjxUAY1tVEm67vDtj3SdSDkiLg
         bG9l+QI9xL9XOFYCsjeDX5MIyJ4yoVrKPjgF1+zbbd/cHgDrMXf4AzOetHuSwRKPza8L
         7uOFtIWgsvDxFkIA0gJdhO+gnsPpN9CbHZex3dQiloS5kqodQ5ctcxI6z+fbvFnLz7j1
         phpz/yo7giantvh4XstzCMeJl0FUBbsnuPWn8bwppaQO3RVQHMgDMJMLdX5pxenWWO66
         V09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhXObj82nBcQEYJAA1ad2r04kCOEU7ksJDCUDcSKqfM=;
        b=2lnyko9UgraUlNGeSiV5+AGV/jkHPoM1MUG1bdMh0xhcaHwQ5lX1MvsEEf7LFAmygW
         v33MHbZJjae84I21qAb+uS/Xl7Cvwii0bsoKR8aA0gQQCnQgYtj1CIC4boI0K78yh8jG
         69nJnVJXACIBR+adGc47FdLnpSahPi7GqYCtVKNoFaT7fO7XqXVnXIBgGBVpQUW++8FD
         AEnjtHzTMHR4vhv+YnpK+yNRo9mnbnz0usup9nexJi9QcxhSMl7FxfTQfo/sX5fRGX4o
         XnOk3iW6ATQ49B/ZkCb5SGlr1j0PqtDW+iyS/m6ve5Fgoem+hjAVg1/NoPfw+JzrlCEa
         K5jQ==
X-Gm-Message-State: AFqh2krqf7ETkTsAuKeiFPv3wGOmJnus2cSUy9NBn+LzJJALP5Yad8Yv
	5nu49wTNciyy3g3yKqggXylLIL6x+14n64TZt3w=
X-Google-Smtp-Source: AMrXdXt5Y9rnGnK2jQgoDuMD7ftHG31yjnqkT68npF4s6OTj6xY9XkGWS94On/TyZDa1XCCQvXgE3w==
X-Received: by 2002:a05:6808:120d:b0:364:9e70:2d77 with SMTP id a13-20020a056808120d00b003649e702d77mr8126360oil.20.1673878708565;
        Mon, 16 Jan 2023 06:18:28 -0800 (PST)
Received: from ?IPV6:2804:1b3:a7c1:1652:49fa:2dd7:dbd:38f6? ([2804:1b3:a7c1:1652:49fa:2dd7:dbd:38f6])
        by smtp.gmail.com with ESMTPSA id r42-20020a056808212a00b00364e8f85c08sm2368092oiw.21.2023.01.16.06.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 06:18:27 -0800 (PST)
Message-ID: <882721d2-adb1-1cbd-cd06-d7902dc9d2e7@linaro.org>
Date: Mon, 16 Jan 2023 11:18:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] ARC:fpu: add extra capability check before use of sqrt
 and fma builtins
Content-Language: en-US
To: Pavel.Kozlov@synopsys.com, libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org
References: <20221221162849.12301-1-kozlov@synopsys.com>
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <20221221162849.12301-1-kozlov@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_061830_192879_9B490F06 
X-CRM114-Status: GOOD (  18.80  )
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



On 21/12/22 13:28, Pavel.Kozlov--- via Libc-alpha wrote:
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
> ---
>  sysdeps/arc/fpu/math-use-builtins-fma.h  | 14 ++++++++++++--
>  sysdeps/arc/fpu/math-use-builtins-sqrt.h | 14 ++++++++++++--
>  2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/sysdeps/arc/fpu/math-use-builtins-fma.h b/sysdeps/arc/fpu/math-use-builtins-fma.h
> index eede75aa41be..082badf48201 100644
> --- a/sysdeps/arc/fpu/math-use-builtins-fma.h
> +++ b/sysdeps/arc/fpu/math-use-builtins-fma.h
> @@ -1,4 +1,14 @@
> -#define USE_FMA_BUILTIN 1
> -#define USE_FMAF_BUILTIN 1
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
>  #define USE_FMAL_BUILTIN 0
>  #define USE_FMAF128_BUILTIN 0

This is wrong, sqrt use macro do not belong for the fma switch file.

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

This is ok.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
