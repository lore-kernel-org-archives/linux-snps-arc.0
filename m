Return-Path: <SRS0=EH8H=7O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CB3C433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 17:10:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B9F206E2
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 17:10:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdzzlAXG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gm6749Au"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50B9F206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFko72EZTSfLo8pB27bccaz1Z0FQW98VLfs576dQkT0=; b=pdzzlAXGc1s0I1
	D24cemBpxhhtyt2sAPbIxA+UXmEHZmooVysPoAYvzktI2zGox/8gWfqPfx0vh1I56ejw/SIXdPsfh
	fJuEGt17+dUsTIK2/htJnghkWR9TTw+ASXUZEByNVNqrDu3lIs1lrWl2aj27wu+b/3gRpLelfZkOg
	2/y9Eu91F/lQmOFBDgVlw9R8bN2/k+OCp5QbrLGgoun5rxYEfC4Uru13z1o00/kJ8ytU0aPjDxSa+
	CTQ1CHHicF/Cn9tevaBLXZwzSnIt71DTJkO4K0svIlitbNpOeW4sMG2+8tUH5ZFAMxQAhpKq3pz+s
	+R4fuIr1/i6XcDXHHpGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfnxe-0007tM-Ew; Mon, 01 Jun 2020 17:10:54 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfnxa-0007sc-Sk
 for linux-snps-arc@lists.infradead.org; Mon, 01 Jun 2020 17:10:52 +0000
Received: by mail-qt1-x842.google.com with SMTP id y1so8246647qtv.12
 for <linux-snps-arc@lists.infradead.org>; Mon, 01 Jun 2020 10:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f8vKA/UUe6xQW49tjqvrN2ERCOC++OY3p8wBNXUMlHM=;
 b=gm6749Au21X/HKAq/0qoyidWJ2BuOVwZjIBNNo9rgy2yxYSciTEYAxCecrJxGpKGh9
 qMyH1xOO/VZkqZ0mR/UeA9nVBHOMvbQ7MFrX5haiftobblZ9BhTGXCbnc2rjRAiRJyu0
 CKrnq6+3aO7NgMVRWhkl634taLWBXRTZDk2zsdH+sOPoYleMLBC9Br/WTrVixCJ8qbOf
 2yPVtQ+vz7DmvoZN1X1eeAqgZzymGmNUukO5VE49vIod5TMZkpFxcyUQhUu+TJ/oloFD
 7FH8Fyn6dftnxL7nAbgE/rVzJBKtP8s7uauEwSALJInr7HY1U1rhj9jDNLl62TTNcgRG
 M9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=f8vKA/UUe6xQW49tjqvrN2ERCOC++OY3p8wBNXUMlHM=;
 b=er0DbMY+wJTz/yyy9RCWpu+UHC4j40X8sNqTpYN54PVtszfUXluOnIK8LScAEvLhAn
 kER7zRXpL/jvEcX6RAGQ3WU9TktOP0B2yUE1RAlDEYRoP6knwqn+zool3FSoz6XCtYE6
 1j5kBb1/lprK6MJVR8/ZQQuJFW9iwxZPGQWWKwb9/EJrjWRBx4vceXvIiYk0Lwva0DHa
 o168aztOp+C42c+X9C2eereK0dRSKBW1/43Oe/7d4CcG1zOAVbyeyM3P0NMAWF6zc2UP
 O2IlwBK57qpSStBsCwMZgvcjKavox6nbC0nL5qUpvPP6R2TyrVOtlAut58pmAVtCzr9P
 IvZg==
X-Gm-Message-State: AOAM530SzfHGKiLiWnyxqtXNsCoImimW8kBq+N9ZAHpIjJEJpTbDUQQU
 +oJv2hgXt0RLR7yx/QJn71cHAt3Lv20=
X-Google-Smtp-Source: ABdhPJxO2j543HZNhASBSwsUwnhwHabS9rq/vUpi+NatG+osEOcXG07SQ04qus4yUZkouLsI/7h+sQ==
X-Received: by 2002:ac8:134a:: with SMTP id f10mr23566842qtj.123.1591031448310; 
 Mon, 01 Jun 2020 10:10:48 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id
 g11sm11054924qkk.123.2020.06.01.10.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 10:10:47 -0700 (PDT)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, libc-alpha@sourceware.org
References: <20200530020047.5490-1-vgupta@synopsys.com>
 <20200530020047.5490-6-vgupta@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH 5/5] powerpc/fpu: use generic fma functions
Message-ID: <8eb04259-7529-cbb4-81b8-d5b0f56eb6b8@linaro.org>
Date: Mon, 1 Jun 2020 14:10:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200530020047.5490-6-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_101050_939100_79F70D50 
X-CRM114-Status: GOOD (  19.49  )
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



On 29/05/2020 23:00, Vineet Gupta wrote:

LGTM, thanks.

This new addition, along with the aarch64 one, makes me wonder if
it would be better to decompose the USE_* defined in multiple files
so the architecture adds only the required ones (instead of copy/paste
the whole file with the generic ones).

Also for powerpc, maybe a future cleanup would to move the logic
to select the builtin to math-use-builtins.h. Something like:

  #ifdef _ARCH_PWR5X
  #  define USE_FLOOR_BUILTIN 1
  #  define USE_FLOORF_BUILTIN 1
  #else
  #  define USE_FLOOR_BUILTIN 0
  #  define USE_FLOORF_BUILTIN 0
  #endif
  #define USE_FLOORL_BUILTIN 0
  #define USE_FLOORF128_BUILTIN 0

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>

> ---
>  sysdeps/powerpc/fpu/math-use-builtins.h | 70 +++++++++++++++++++++++++
>  sysdeps/powerpc/fpu/s_fma.c             | 27 ----------
>  sysdeps/powerpc/fpu/s_fmaf.c            | 27 ----------
>  3 files changed, 70 insertions(+), 54 deletions(-)
>  create mode 100644 sysdeps/powerpc/fpu/math-use-builtins.h
>  delete mode 100644 sysdeps/powerpc/fpu/s_fma.c
>  delete mode 100644 sysdeps/powerpc/fpu/s_fmaf.c
> 
> diff --git a/sysdeps/powerpc/fpu/math-use-builtins.h b/sysdeps/powerpc/fpu/math-use-builtins.h
> new file mode 100644
> index 000000000000..9bdde66cf1de
> --- /dev/null
> +++ b/sysdeps/powerpc/fpu/math-use-builtins.h
> @@ -0,0 +1,70 @@
> +/* Using math gcc builtins instead of generic implementation.  PowerPC version.
> +   Copyright (C) 2019-2020 Free Software Foundation, Inc.
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
> +#define USE_NEARBYINT_BUILTIN 0
> +#define USE_NEARBYINTF_BUILTIN 0
> +#define USE_NEARBYINTL_BUILTIN 0
> +#define USE_NEARBYINTF128_BUILTIN 0
> +
> +#define USE_RINT_BUILTIN 0
> +#define USE_RINTF_BUILTIN 0
> +#define USE_RINTL_BUILTIN 0
> +#define USE_RINTF128_BUILTIN 0
> +
> +#define USE_FLOOR_BUILTIN 0
> +#define USE_FLOORF_BUILTIN 0
> +#define USE_FLOORL_BUILTIN 0
> +#define USE_FLOORF128_BUILTIN 0
> +
> +#define USE_CEIL_BUILTIN 0
> +#define USE_CEILF_BUILTIN 0
> +#define USE_CEILL_BUILTIN 0
> +#define USE_CEILF128_BUILTIN 0
> +
> +#define USE_TRUNC_BUILTIN 0
> +#define USE_TRUNCF_BUILTIN 0
> +#define USE_TRUNCL_BUILTIN 0
> +#define USE_TRUNCF128_BUILTIN 0
> +
> +#define USE_ROUND_BUILTIN 0
> +#define USE_ROUNDF_BUILTIN 0
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
> +#define USE_SQRT_BUILTIN 0
> +#define USE_SQRTF_BUILTIN 0
> +
> +#define USE_FMA_BUILTIN 1
> +#define USE_FMAF_BUILTIN 1
> +#define USE_FMAL_BUILTIN 0
> +
> +#endif /* math-use-builtins.h */

Ok.

> diff --git a/sysdeps/powerpc/fpu/s_fma.c b/sysdeps/powerpc/fpu/s_fma.c
> deleted file mode 100644
> index 9ddd13253485..000000000000
> --- a/sysdeps/powerpc/fpu/s_fma.c
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -/* Compute x * y + z as ternary operation.  PowerPC version.
> -   Copyright (C) 2019-2020 Free Software Foundation, Inc.
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
> -#include <sysdep.h>
> -#include <libm-alias-double.h>
> -
> -double
> -__fma (double x, double y, double z)
> -{
> -  return __builtin_fma (x, y, z);
> -}
> -libm_alias_double (__fma, fma)

Ok.

> diff --git a/sysdeps/powerpc/fpu/s_fmaf.c b/sysdeps/powerpc/fpu/s_fmaf.c
> deleted file mode 100644
> index d132c20125bb..000000000000
> --- a/sysdeps/powerpc/fpu/s_fmaf.c
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -/* Compute x * y + z as ternary operation.  PowerPC version.
> -   Copyright (C) 2019-2020 Free Software Foundation, Inc.
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
> -#include <sysdep.h>
> -#include <libm-alias-float.h>
> -
> -float
> -__fmaf (float x, float y, float z)
> -{
> -  return __builtin_fmaf (x, y, z);
> -}
> -libm_alias_float (__fma, fma)
> 

Ok.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
