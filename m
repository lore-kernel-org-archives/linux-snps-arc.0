Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598B7C433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 17:17:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 293EC206C3
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 17:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bYQW7MXw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qVcKp3GT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 293EC206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdXUD9Tc/fgWtE47+AYCIU1HO2qyfpmK5Jm9M18LlR0=; b=bYQW7MXwPZ8PHf
	F2INuCYZHuE4icj+XhhIw2kwkZOB9LQ476bWkEhBszm+hFrNoGKgTQsVHTQQaCDC0XeEwQ8Ex/gJ0
	B9jP7pLHRUdBQfRjHT05W7CZ8m8bSeQqcq/7ArQgvyod+Xc4ZsFX6cyIz1qzZhyXr8aVBzlgz8vgU
	7Ib+KtHetLxJ3NDVL6UsXHwjBMrRspauh+Ga7L0tgcbobR9LJ714bkReLDBoWMJlXte6oemQ92TC+
	hirCXhnfP+YQu9HjE3LC556yUCvdpnZrkFNz3HusnDb09THFRad/T1HTOQxkFR3uHMNgbNAWyVply
	hWFCOmXqfQeb3aOx4rww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgAXM-0006ye-9Y; Tue, 02 Jun 2020 17:17:16 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgAXK-0006xx-0O
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 17:17:15 +0000
Received: by mail-qk1-x742.google.com with SMTP id 205so13287789qkg.3
 for <linux-snps-arc@lists.infradead.org>; Tue, 02 Jun 2020 10:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YrXEWLcc6CBU681EFJZJX9fNaxXp2Fpfrm07fLPFxKw=;
 b=qVcKp3GTdTuAsCMCtqoiGmgGQdV30Ugto3r4y8KLYmpeGWxr0NeY4BU827opwOar+U
 ihWzzVZDHbvcE/JN/B/m9K9gb9brY0mbmNe0cNprHsU702c9Y0SOmZejCzQBfly3xwdm
 TrIgwCRV65dwaThRvhdCFeWrtwa78XMMNUxtqRaF/TSw4tss3oBY8Ae1e5Mx7XzwgW//
 EEeZ5QyR9PWU7sA5Bau6zSf1W9GryZEFQzqwRXUeBGSSpNB+m7woxi5U6+qghmEobM7A
 f5FVeJ3FWtS9rX7kVAgrJukY17B8aJ1EJI4/Q3c9xK1ZTgyouUEbmTjunb3apJYVdgaQ
 7vOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YrXEWLcc6CBU681EFJZJX9fNaxXp2Fpfrm07fLPFxKw=;
 b=be6F87appvBUvgMmOfpLLL37MYVPhIkWqhaNvlddR8Vmipn6ShnfpyDma/32VByhjs
 XQnzd6a8XGS56WvLVuo9alNg2tlPJC+/4nMyAmHEaTMU1fPWfADGKgtYr6llXf43FftW
 KvVaMnxLykU/zlmzssKNdmCzUrwmaFbsxftjWqSD/YNLbLxF13NcM5lxRV/LOamXP4wJ
 FC9KjeeKujoFdB5nYRU9vb1nzp0eZM2+mF55wwAnJNdp/XkhfyIRW7K/COEqO61vBH+2
 s7iMzYxVgCgYjdjr2Hgfo9P/mJXoUVxeSo9wP2cNu7DSs7fp17WjN4lRoAJ+mZlSI0D5
 SN7A==
X-Gm-Message-State: AOAM530bOYcsU/CvWA01fhx1l4ArTP3HW5mQI5Kbjs7wBOOFtLhnroFF
 FA6ZHrbmx41BZZiTKcoF/Rk7ga4bVco=
X-Google-Smtp-Source: ABdhPJy/qQHR0qv6enRudXJL8YyyXZK0gLNx1hMO/Sx3sP6zi4F1/75ZuwEpxp/EhC9gxeZHkjecFw==
X-Received: by 2002:a05:620a:200a:: with SMTP id
 c10mr25131443qka.218.1591118231463; 
 Tue, 02 Jun 2020 10:17:11 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id x54sm3259114qta.42.2020.06.02.10.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 10:17:11 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] iee754: provide gcc builtins based generic sqrt
 functions
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, libc-alpha@sourceware.org
References: <20200602003541.21005-1-vgupta@synopsys.com>
 <20200602003541.21005-2-vgupta@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ed5e23f3-0afa-9b51-514c-0018b596f405@linaro.org>
Date: Tue, 2 Jun 2020 14:17:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602003541.21005-2-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_101714_054854_1CED422A 
X-CRM114-Status: GOOD (  15.01  )
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
> Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>

LGTM with the small nit below and the s390 fix pointed by Stefan.

Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

> ---
>  sysdeps/generic/math-use-builtins.h |  3 +++
>  sysdeps/ieee754/dbl-64/e_sqrt.c     |  6 ++++++
>  sysdeps/ieee754/flt-32/e_sqrtf.c    | 16 ++++++++++------
>  3 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/sysdeps/generic/math-use-builtins.h b/sysdeps/generic/math-use-builtins.h
> index 8a39ef58bc95..fc724c824a17 100644
> --- a/sysdeps/generic/math-use-builtins.h
> +++ b/sysdeps/generic/math-use-builtins.h
> @@ -60,4 +60,7 @@
>  # define USE_COPYSIGNF128_BUILTIN 0
>  #endif
>  
> +#define USE_SQRT_BUILTIN 0
> +#define USE_SQRTF_BUILTIN 0
> +
>  #endif /* math-use-builtins.h */

Ok.

> diff --git a/sysdeps/ieee754/dbl-64/e_sqrt.c b/sysdeps/ieee754/dbl-64/e_sqrt.c
> index d42a1a4eb6e9..518a8ae5cdaf 100644
> --- a/sysdeps/ieee754/dbl-64/e_sqrt.c
> +++ b/sysdeps/ieee754/dbl-64/e_sqrt.c
> @@ -41,6 +41,7 @@
>  #include <math_private.h>
>  #include <fenv_private.h>
>  #include <libm-alias-finite.h>
> +#include <math-use-builtins.h>
>  
>  /*********************************************************************/
>  /* An ultimate sqrt routine. Given an IEEE double machine number x   */
> @@ -50,6 +51,10 @@
>  double
>  __ieee754_sqrt (double x)
>  {
> +#if USE_SQRT_BUILTIN
> +  return __builtin_sqrt (x);
> +#else
> +  /* Use generic implementation.  */
>    static const double
>      rt0 = 9.99999999859990725855365213134618E-01,
>      rt1 = 4.99999999495955425917856814202739E-01,
> @@ -138,6 +143,7 @@ __ieee754_sqrt (double x)
>  	return (x - x) / (x - x); /* sqrt(-ve)=sNaN */
>        return 0x1p-256 * __ieee754_sqrt (x * 0x1p512);
>      }
> +#endif /* ! USE_SQRT_BUILTIN  */
>  }
>  #ifndef __ieee754_sqrt
>  libm_alias_finite (__ieee754_sqrt, __sqrt)

Ok.

> diff --git a/sysdeps/ieee754/flt-32/e_sqrtf.c b/sysdeps/ieee754/flt-32/e_sqrtf.c
> index b339444301aa..d85a04162983 100644
> --- a/sysdeps/ieee754/flt-32/e_sqrtf.c
> +++ b/sysdeps/ieee754/flt-32/e_sqrtf.c
> @@ -16,12 +16,15 @@
>  #include <math.h>
>  #include <math_private.h>
>  #include <libm-alias-finite.h>
> -
> -static	const float	one	= 1.0, tiny=1.0e-30;
> +#include <math-use-builtins.h>
>  
>  float
>  __ieee754_sqrtf(float x)
>  {
> +#if USE_SQRTF_BUILTIN
> +	return __builtin_sqrtf (x);
> +#else
> +	/* Use generic implementation.  */
>  	float z;
>  	int32_t sign = (int)0x80000000;
>  	int32_t ix,s,q,m,t,i;
> @@ -70,10 +73,10 @@ __ieee754_sqrtf(float x)
>  
>      /* use floating add to find out rounding direction */
>  	if(ix!=0) {
> -	    z = one-tiny; /* trigger inexact flag */
> -	    if (z>=one) {
> -		z = one+tiny;
> -		if (z>one)
> +	    z = 0x1p0 - 0x1.4484cp-100; /* trigger inexact flag */

Period and double space before '*/'.

> +	    if (z >= 0x1p0) {
> +		z = 0x1p0 + 0x1.4484cp-100;
> +		if (z > 0x1p0)
>  		    q += 2;
>  		else
>  		    q += (q&1);
> @@ -83,6 +86,7 @@ __ieee754_sqrtf(float x)
>  	ix += (m <<23);
>  	SET_FLOAT_WORD(z,ix);
>  	return z;
> +#endif /* ! USE_SQRTF_BUILTIN  */
>  }
>  #ifndef __ieee754_sqrtf
>  libm_alias_finite (__ieee754_sqrtf, __sqrtf)
> 

Ok.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
