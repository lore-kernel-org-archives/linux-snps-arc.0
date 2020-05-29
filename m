Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D9CC433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 14:12:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1E7420707
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 14:12:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UtoJOGu6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GTdxMOZU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1E7420707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHWgsLZG1OOx6Wn6cLNDnVgejH/tvl48Pkt9K3PG13w=; b=UtoJOGu6K75nGp
	0N9MR/MB53lSYtG+iXMTyH5HPr4azrawTsFXZXpdkWD3mOGyZG9JHoDkys6rkCFvM78VxADXzHCfF
	rysa9iC50xkSk73gfWyRAWICz7Vx5lN4gtPv50z7s+AbeOFAZ/WBeRHdfyzVHoJvkSJ5nHltSjNfb
	3LwajsEsF9qE2J1zofUVbjWi1YeHGnUoja98ldVIN6fGzqmkjbk4DRVbpivdmA9eko6olM0wyyYBi
	05aAFmEb8Rf0Pi4H4QGyFwl3lKqba5pR5mVbBDvuM6X3HLWCVbxf5VGSXgDm1U8jYnCPlBHm1CjMu
	TZZQIJFH/PObESwnfa+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jefki-0004ud-PS; Fri, 29 May 2020 14:12:52 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jefkd-0004u8-Lq
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 14:12:51 +0000
Received: by mail-qt1-x843.google.com with SMTP id b11so2011611qtt.3
 for <linux-snps-arc@lists.infradead.org>; Fri, 29 May 2020 07:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2FxDdgyUykAoOk1uoOlLLemN8gj6c7usFsebTGn8Atg=;
 b=GTdxMOZUhZAM+jJwJXCQ8xTsb/x4RcSQw3KGv5FHIuzsXzypr7EfPLB0x7SQBVlxOD
 /MTK8taGaPiTatlQXBHZFYXoEnHaUIv/bY0lLrxzq9K2M6oAc+gz+Is2Vt9JsjXDTLER
 RcQKRWBLFSS0dIye2eKOhkNSKWilnSU2MxKldYi8p9T7Afq1/T81ZEE/o5CF908TDQVl
 yY/73c1qmtSMJjoBALsb99e/h4ntuuReZCKrNrTmGKm01qgWOXrGWoK51ZNpoLMBmo52
 oxN0wD1+dVsRqcgotBhBP6OMdZ4GSeK2QzYi2R0F1iL66T1rGsERyAB1ra8GH/uJJdSF
 UDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2FxDdgyUykAoOk1uoOlLLemN8gj6c7usFsebTGn8Atg=;
 b=kOSW6QivRJd96A6Q5wzbZeDidShGhlWUsZT+F6QwrpuQ0hII8Y3FFx5qGZuC5Bgkkc
 QzdkdtXwVsbl1u7m+R3CTcKkwkPnVfIUwLVn/aGFJgL+hUL2ca3v4gykQJ3JLYs3c/Zl
 NV4q6FekpEBl4bJV1UKnWx1n1JGu3UEG4ESXPoeoTq5rfOPkCE/JX7vgE70jbeSurjOV
 XqCAz3Ba1Xxq2SASTOc6hqXrEK8s4JoEVw6qimpOHnCr9tRxHTy1XueeijGUKb+PhrDG
 JFMZ23XB91l2rCM/UHYfHJ4XMqzvqy5oHJYakeC9tO0opiCtJBVux3xsVYKZzn3Wcbsg
 Ax3A==
X-Gm-Message-State: AOAM5324PYuoFFDujpcCu2Z6PVzBgXyfZWXS+nKS5FaKrsxnYOgPe/Sx
 Ofv7LEXFp+PvNc3ULOLFAYgb9NcKP1g=
X-Google-Smtp-Source: ABdhPJxj/QZHUOPqcTDtSS6WW7dHrWq8i9GekAmRjDn9/xIEsIpRYGq0Et9zl3j7sbOODBI3BshFmg==
X-Received: by 2002:ac8:1285:: with SMTP id y5mr9246658qti.245.1590761564971; 
 Fri, 29 May 2020 07:12:44 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id
 x186sm7078829qkd.125.2020.05.29.07.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 07:12:44 -0700 (PDT)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, libc-alpha@sourceware.org
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-7-vgupta@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH v6 06/13] ARC: hardware floating point support
Message-ID: <de8975a0-bb03-8cec-be97-56f8c4e2a2f3@linaro.org>
Date: Fri, 29 May 2020 11:12:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423014126.10417-7-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_071247_760526_D1522F19 
X-CRM114-Status: GOOD (  19.39  )
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



On 22/04/2020 22:41, Vineet Gupta via Libc-alpha wrote:
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

As prior patch we do not use DCO, but rather copyright assignment.

Some comments below.

> ---
>  sysdeps/arc/fpu/e_sqrt.c        |  27 ++++++++
>  sysdeps/arc/fpu/e_sqrtf.c       |  27 ++++++++
>  sysdeps/arc/fpu/fclrexcpt.c     |  36 +++++++++++
>  sysdeps/arc/fpu/fegetenv.c      |  37 +++++++++++
>  sysdeps/arc/fpu/fegetmode.c     |  31 ++++++++++
>  sysdeps/arc/fpu/fegetround.c    |  32 ++++++++++
>  sysdeps/arc/fpu/feholdexcpt.c   |  43 +++++++++++++
>  sysdeps/arc/fpu/fesetenv.c      |  48 +++++++++++++++
>  sysdeps/arc/fpu/fesetexcept.c   |  32 ++++++++++
>  sysdeps/arc/fpu/fesetmode.c     |  40 ++++++++++++
>  sysdeps/arc/fpu/fesetround.c    |  40 ++++++++++++
>  sysdeps/arc/fpu/feupdateenv.c   |  51 +++++++++++++++
>  sysdeps/arc/fpu/fgetexcptflg.c  |  31 ++++++++++
>  sysdeps/arc/fpu/fraiseexcpt.c   |  39 ++++++++++++
>  sysdeps/arc/fpu/fsetexcptflg.c  |  38 ++++++++++++
>  sysdeps/arc/fpu/ftestexcept.c   |  33 ++++++++++
>  sysdeps/arc/fpu/s_fma.c         |  28 +++++++++
>  sysdeps/arc/fpu/s_fmaf.c        |  28 +++++++++
>  sysdeps/arc/fpu_control.h       | 106 ++++++++++++++++++++++++++++++++
>  sysdeps/arc/get-rounding-mode.h |  38 ++++++++++++
>  sysdeps/arc/math-tests-trap.h   |  27 ++++++++
>  sysdeps/arc/tininess.h          |   1 +
>  22 files changed, 813 insertions(+)
>  create mode 100644 sysdeps/arc/fpu/e_sqrt.c
>  create mode 100644 sysdeps/arc/fpu/e_sqrtf.c
>  create mode 100644 sysdeps/arc/fpu/fclrexcpt.c
>  create mode 100644 sysdeps/arc/fpu/fegetenv.c
>  create mode 100644 sysdeps/arc/fpu/fegetmode.c
>  create mode 100644 sysdeps/arc/fpu/fegetround.c
>  create mode 100644 sysdeps/arc/fpu/feholdexcpt.c
>  create mode 100644 sysdeps/arc/fpu/fesetenv.c
>  create mode 100644 sysdeps/arc/fpu/fesetexcept.c
>  create mode 100644 sysdeps/arc/fpu/fesetmode.c
>  create mode 100644 sysdeps/arc/fpu/fesetround.c
>  create mode 100644 sysdeps/arc/fpu/feupdateenv.c
>  create mode 100644 sysdeps/arc/fpu/fgetexcptflg.c
>  create mode 100644 sysdeps/arc/fpu/fraiseexcpt.c
>  create mode 100644 sysdeps/arc/fpu/fsetexcptflg.c
>  create mode 100644 sysdeps/arc/fpu/ftestexcept.c
>  create mode 100644 sysdeps/arc/fpu/s_fma.c
>  create mode 100644 sysdeps/arc/fpu/s_fmaf.c
>  create mode 100644 sysdeps/arc/fpu_control.h
>  create mode 100644 sysdeps/arc/get-rounding-mode.h
>  create mode 100644 sysdeps/arc/math-tests-trap.h
>  create mode 100644 sysdeps/arc/tininess.h
> 
> diff --git a/sysdeps/arc/fpu/e_sqrt.c b/sysdeps/arc/fpu/e_sqrt.c
> new file mode 100644
> index 000000000000..abb67ef7b061
> --- /dev/null
> +++ b/sysdeps/arc/fpu/e_sqrt.c
> @@ -0,0 +1,27 @@
> +/* Square root of floating point number.
> +   Copyright (C) 2015-2020 Free Software Foundation, Inc.
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
> +#include <math_private.h>
> +#include <libm-alias-finite.h>
> +
> +double
> +__ieee754_sqrt (double d)
> +{
> +  return __builtin_sqrt (d);
> +}
> +libm_alias_finite (__ieee754_sqrt, __sqrt)

I think it is better to extend to math-use-builtins.h for cover 
e_sqrt{f} so we can also adapt to other architecutes.

> diff --git a/sysdeps/arc/fpu/e_sqrtf.c b/sysdeps/arc/fpu/e_sqrtf.c
> new file mode 100644
> index 000000000000..13008a4f45d6
> --- /dev/null
> +++ b/sysdeps/arc/fpu/e_sqrtf.c
> @@ -0,0 +1,27 @@
> +/* Single-precision floating point square root.
> +   Copyright (C) 2015-2020 Free Software Foundation, Inc.
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
> +#include <math_private.h>
> +#include <libm-alias-finite.h>
> +
> +float
> +__ieee754_sqrtf (float s)
> +{
> +  return __builtin_sqrtf (s);
> +}
> +libm_alias_finite (__ieee754_sqrtf, __sqrtf)

Same as before.

> diff --git a/sysdeps/arc/fpu/fclrexcpt.c b/sysdeps/arc/fpu/fclrexcpt.c
> new file mode 100644
> index 000000000000..549968dcd465
> --- /dev/null
> +++ b/sysdeps/arc/fpu/fclrexcpt.c
> @@ -0,0 +1,36 @@
> +/* Clear given exceptions in current floating-point environment.
> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fpu_control.h>
> +
> +int
> +feclearexcept (int excepts)
> +{
> +  unsigned int fpsr;
> +
> +  _FPU_GETS (fpsr);
> +
> +  /* Clear the relevant bits, FWE is preserved.  */
> +  fpsr &= ~excepts;
> +
> +  _FPU_SETS (fpsr);
> +
> +  return 0;
> +}
> +libm_hidden_def (feclearexcept)
Ok.

> diff --git a/sysdeps/arc/fpu/fegetenv.c b/sysdeps/arc/fpu/fegetenv.c
> new file mode 100644
> index 000000000000..058652aeb685
> --- /dev/null
> +++ b/sysdeps/arc/fpu/fegetenv.c
> @@ -0,0 +1,37 @@
> +/* Store current floating-point environment.
> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fpu_control.h>
> +
> +int
> +__fegetenv (fenv_t *envp)
> +{
> +  unsigned int fpcr;
> +  unsigned int fpsr;
> +
> +  _FPU_GETCW (fpcr);
> +  _FPU_GETS (fpsr);
> +  envp->__fpcr = fpcr;
> +  envp->__fpsr = fpsr;
> +
> +  return 0;
> +}
> +libm_hidden_def (__fegetenv)
> +weak_alias (__fegetenv, fegetenv)
> +libm_hidden_weak (fegetenv)
> diff --git a/sysdeps/arc/fpu/fegetmode.c b/sysdeps/arc/fpu/fegetmode.c
> new file mode 100644
> index 000000000000..1f04c2d745fa
> --- /dev/null
> +++ b/sysdeps/arc/fpu/fegetmode.c
> @@ -0,0 +1,31 @@
> +/* Store current floating-point control modes.
> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fpu_control.h>
> +
> +int
> +fegetmode (femode_t *modep)
> +{
> +  unsigned int fpcr;
> +
> +  _FPU_GETCW (fpcr);
> +  *modep = fpcr;
> +
> +  return 0;
> +}
> diff --git a/sysdeps/arc/fpu/fegetround.c b/sysdeps/arc/fpu/fegetround.c
> new file mode 100644
> index 000000000000..99d4aeee31b7
> --- /dev/null
> +++ b/sysdeps/arc/fpu/fegetround.c
> @@ -0,0 +1,32 @@
> +/* Return current rounding direction.
> +   Copyright (C) 1998-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fenv_private.h>
> +
> +int
> +__fegetround (void)
> +{
> +  unsigned int fpcr;
> +  _FPU_GETCW (fpcr);
> +
> +  return (fpcr >> __FPU_RND_SHIFT) & __FPU_RND_MASK;
> +}
> +libm_hidden_def (__fegetround)
> +weak_alias (__fegetround, fegetround)
> +libm_hidden_weak (fegetround)
> diff --git a/sysdeps/arc/fpu/feholdexcpt.c b/sysdeps/arc/fpu/feholdexcpt.c
> new file mode 100644
> index 000000000000..4b849a3cf05b
> --- /dev/null
> +++ b/sysdeps/arc/fpu/feholdexcpt.c
> @@ -0,0 +1,43 @@
> +/* Store current floating-point environment and clear exceptions.
> +   Copyright (C) 2000-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fenv_private.h>
> +
> +int
> +__feholdexcept (fenv_t *envp)
> +{
> +  unsigned int fpcr;
> +  unsigned int fpsr;
> +
> +  _FPU_GETCW (fpcr);
> +  _FPU_GETS (fpsr);
> +
> +  envp->__fpcr = fpcr;
> +  envp->__fpsr = fpsr;
> +
> +  fpsr &= ~FE_ALL_EXCEPT;
> +
> +  _FPU_SETCW (fpcr);
> +  _FPU_SETS (fpsr);
> +
> +  return 0;
> +}
> +libm_hidden_def (__feholdexcept)
> +weak_alias (__feholdexcept, feholdexcept)
> +libm_hidden_weak (feholdexcept)
> diff --git a/sysdeps/arc/fpu/fesetenv.c b/sysdeps/arc/fpu/fesetenv.c
> new file mode 100644
> index 000000000000..828b51cf8afa
> --- /dev/null
> +++ b/sysdeps/arc/fpu/fesetenv.c
> @@ -0,0 +1,48 @@
> +/* Install given floating-point environment (doesnot raise exceptions).
> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fpu_control.h>
> +
> +int
> +__fesetenv (const fenv_t *envp)
> +{
> +  unsigned int fpcr;
> +  unsigned int fpsr;
> +
> +  if (envp == FE_DFL_ENV)
> +    {
> +      fpcr = _FPU_DEFAULT;
> +      fpsr = _FPU_FPSR_DEFAULT;
> +    }
> +  else
> +    {
> +      /* No need to mask out reserved bits as they are IoW.  */
> +      fpcr = envp->__fpcr;
> +      fpsr = envp->__fpsr;
> +    }
> +
> +  _FPU_SETCW (fpcr);
> +  _FPU_SETS (fpsr);
> +
> +  /* Success.  */
> +  return 0;
> +}
> +libm_hidden_def (__fesetenv)
> +weak_alias (__fesetenv, fesetenv)
> +libm_hidden_weak (fesetenv)
> diff --git a/sysdeps/arc/fpu/fesetexcept.c b/sysdeps/arc/fpu/fesetexcept.c
> new file mode 100644
> index 000000000000..0a1bcf763bee
> --- /dev/null
> +++ b/sysdeps/arc/fpu/fesetexcept.c
> @@ -0,0 +1,32 @@
> +/* Set given exception flags.
> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fpu_control.h>
> +
> +int
> +fesetexcept (int excepts)
> +{
> +  unsigned int fpsr;
> +
> +  _FPU_GETS (fpsr);
> +  fpsr |= excepts;
> +  _FPU_SETS (fpsr);
> +
> +  return 0;
> +}
> diff --git a/sysdeps/arc/fpu/fesetmode.c b/sysdeps/arc/fpu/fesetmode.c
> new file mode 100644
> index 000000000000..2fedaedb9e01
> --- /dev/null
> +++ b/sysdeps/arc/fpu/fesetmode.c
> @@ -0,0 +1,40 @@
> +/* Install given floating-point control modes.
> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fpu_control.h>
> +
> +int
> +fesetmode (const femode_t *modep)
> +{
> +  unsigned int fpcr;
> +
> +  if (modep == FE_DFL_MODE)
> +    {
> +      fpcr = _FPU_DEFAULT;
> +    }
> +  else
> +    {
> +      /* No need to mask out reserved bits as they are IoW.  */
> +      fpcr = *modep;
> +    }
> +
> +  _FPU_SETCW (fpcr);
> +
> +  return 0;
> +}
> diff --git a/sysdeps/arc/fpu/fesetround.c b/sysdeps/arc/fpu/fesetround.c
> new file mode 100644
> index 000000000000..7a3526112e30
> --- /dev/null
> +++ b/sysdeps/arc/fpu/fesetround.c
> @@ -0,0 +1,40 @@
> +/* Set current rounding direction.
> +   Copyright (C) 1998-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fenv_private.h>
> +
> +int
> +__fesetround (int round)
> +{
> +  unsigned int fpcr;
> +
> +  _FPU_GETCW (fpcr);
> +
> +  if (((fpcr >> __FPU_RND_SHIFT) & __FPU_RND_MASK) != round)
> +    {
> +      fpcr &= ~(__FPU_RND_MASK << __FPU_RND_SHIFT);
> +      fpcr |= (round & __FPU_RND_MASK) << __FPU_RND_SHIFT;
> +      _FPU_SETCW (fpcr);
> +    }
> +
> +  return 0;
> +}
> +libm_hidden_def (__fesetround)
> +weak_alias (__fesetround, fesetround)
> +libm_hidden_weak (fesetround)
> diff --git a/sysdeps/arc/fpu/feupdateenv.c b/sysdeps/arc/fpu/feupdateenv.c
> new file mode 100644
> index 000000000000..f2729e732499
> --- /dev/null
> +++ b/sysdeps/arc/fpu/feupdateenv.c
> @@ -0,0 +1,51 @@
> +/* Install given floating-point environment and raise exceptions,
> +   without clearing currently raised exceptions.
> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fpu_control.h>
> +
> +int
> +__feupdateenv (const fenv_t *envp)
> +{
> +  unsigned int fpcr;
> +  unsigned int fpsr;
> +
> +  _FPU_GETS (fpsr);
> +
> +  if (envp == FE_DFL_ENV)
> +    {
> +      fpcr = _FPU_DEFAULT;
> +    }
> +  else
> +    {
> +      fpcr = envp->__fpcr;
> +
> +      /* currently raised exceptions need to be preserved.  */
> +      fpsr |= envp->__fpsr;
> +    }
> +
> +  _FPU_SETCW (fpcr);
> +  _FPU_SETS (fpsr);
> +
> +  /* Success.  */
> +  return 0;
> +}
> +libm_hidden_def (__feupdateenv)
> +weak_alias (__feupdateenv, feupdateenv)
> +libm_hidden_weak (feupdateenv)
> diff --git a/sysdeps/arc/fpu/fgetexcptflg.c b/sysdeps/arc/fpu/fgetexcptflg.c
> new file mode 100644
> index 000000000000..9d1423eaeecb
> --- /dev/null
> +++ b/sysdeps/arc/fpu/fgetexcptflg.c
> @@ -0,0 +1,31 @@
> +/* Store current representation for exceptions, ARC version.
> +   Copyright (C) 1998-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fenv_private.h>
> +
> +int
> +fegetexceptflag (fexcept_t *flagp, int excepts)
> +{
> +  unsigned int fpsr;
> +
> +  _FPU_GETS (fpsr);
> +  *flagp = fpsr & excepts;
> +
> +  return 0;
> +}
> diff --git a/sysdeps/arc/fpu/fraiseexcpt.c b/sysdeps/arc/fpu/fraiseexcpt.c
> new file mode 100644
> index 000000000000..9b9d6a951f42
> --- /dev/null
> +++ b/sysdeps/arc/fpu/fraiseexcpt.c
> @@ -0,0 +1,39 @@
> +/* Raise given exceptions.
> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fpu_control.h>
> +#include <float.h>
> +#include <math.h>
> +
> +int
> +__feraiseexcept (int excepts)
> +{
> +  unsigned int fpsr;
> +
> +  /* currently raised exceptions are not cleared.  */
> +  _FPU_GETS (fpsr);
> +  fpsr |= excepts;
> +
> +  _FPU_SETS (fpsr);
> +
> +  return 0;
> +}
> +libm_hidden_def (__feraiseexcept)
> +weak_alias (__feraiseexcept, feraiseexcept)
> +libm_hidden_weak (feraiseexcept)
> diff --git a/sysdeps/arc/fpu/fsetexcptflg.c b/sysdeps/arc/fpu/fsetexcptflg.c
> new file mode 100644
> index 000000000000..b8e495692145
> --- /dev/null
> +++ b/sysdeps/arc/fpu/fsetexcptflg.c
> @@ -0,0 +1,38 @@
> +/* Set floating-point environment exception handling, ARC version.
> +   Copyright (C) 1998-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fpu_control.h>
> +
> +int
> +fesetexceptflag (const fexcept_t *flagp, int excepts)
> +{
> +  unsigned int fpsr;
> +
> +  _FPU_GETS (fpsr);
> +
> +  /* Clear the bits first.  */
> +  fpsr &= ~excepts;
> +
> +  /* Now set those bits, copying them over from @flagp.  */
> +  fpsr |= *flagp & excepts;
> +
> +  _FPU_SETS (fpsr);
> +
> +  return 0;
> +}
> diff --git a/sysdeps/arc/fpu/ftestexcept.c b/sysdeps/arc/fpu/ftestexcept.c
> new file mode 100644
> index 000000000000..84fd3cf0469c
> --- /dev/null
> +++ b/sysdeps/arc/fpu/ftestexcept.c
> @@ -0,0 +1,33 @@
> +/* Test exception in current environment.
> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <fenv.h>
> +#include <fpu_control.h>
> +#include <fenv_private.h>
> +#include <stdio.h>
> +
> +int
> +fetestexcept (int excepts)
> +{
> +  unsigned int fpsr;
> +
> +  _FPU_GETS (fpsr);
> +
> +  return fpsr & excepts;
> +}
> +libm_hidden_def (fetestexcept)
> diff --git a/sysdeps/arc/fpu/s_fma.c b/sysdeps/arc/fpu/s_fma.c
> new file mode 100644
> index 000000000000..48bb40482dc9
> --- /dev/null
> +++ b/sysdeps/arc/fpu/s_fma.c
> @@ -0,0 +1,28 @@
> +/* Copyright (C) 1996-2020 Free Software Foundation, Inc.
> +
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
> +#include <math.h>
> +#include <libm-alias-double.h>
> +
> +double
> +__fma (double x, double y, double z)
> +{
> +  return __builtin_fma (x, y, z);
> +}
> +
> +libm_alias_double (__fma, fma)

Same as for sqrt{f}.

> diff --git a/sysdeps/arc/fpu/s_fmaf.c b/sysdeps/arc/fpu/s_fmaf.c
> new file mode 100644
> index 000000000000..544f32e27aec
> --- /dev/null
> +++ b/sysdeps/arc/fpu/s_fmaf.c
> @@ -0,0 +1,28 @@
> +/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
> +
> +   This file is part of the GNU C Library.
> +
> +   The GNU C Library is free software; you can redistribute it and/or
> +   modify it under the terms of the GNU Lesser General Public License as
> +   published by the Free Software Foundation; either version 2.1 of the
> +   License, or (at your option) any later version.
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
> +#include <math.h>
> +#include <libm-alias-float.h>
> +
> +float
> +__fmaf (float x, float y, float z)
> +{
> +  return __builtin_fmaf (x, y, z);
> +}
> +
> +libm_alias_float (__fma, fma)
> diff --git a/sysdeps/arc/fpu_control.h b/sysdeps/arc/fpu_control.h
> new file mode 100644
> index 000000000000..121656ff7d8c
> --- /dev/null
> +++ b/sysdeps/arc/fpu_control.h
> @@ -0,0 +1,106 @@
> +/* FPU control word bits.  ARC version.
> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#ifndef _FPU_CONTROL_H
> +#define _FPU_CONTROL_H
> +
> +/* ARC FPU control register bits.
> +
> +  [  0] -> IVE: Enable invalid operation exception.
> +           if 0, soft exception: status register IV flag set.
> +           if 1, hardware exception trap (not supported in Linux yet).
> +  [  1] -> DZE: Enable division by zero exception.
> +           if 0, soft exception: status register IV flag set.
> +           if 1, hardware exception: (not supported in Linux yet).
> +  [9:8] -> RM: Rounding Mode:
> +           00 - Rounding toward zero.
> +           01 - Rounding to nearest (default).
> +           10 - Rounding (up) toward plus infinity.
> +           11 - Rounding (down)toward minus infinity.
> +
> +   ARC FPU status register bits.
> +
> +   [ 0]  -> IV: flag invalid operation.
> +   [ 1]  -> DZ: flag division by zero.
> +   [ 2]  -> OV: flag Overflow operation.
> +   [ 3]  -> UV: flag Underflow operation.
> +   [ 4]  -> IX: flag Inexact operation.
> +   [31]  -> FWE: Flag Write Enable.
> +            If 1, above flags writable explicitly (clearing),
> +            else IoW and only writable indirectly via bits [12:7].  */
> +
> +#include <features.h>
> +
> +#if !defined(__ARC_FPU_SP__) &&  !defined(__ARC_FPU_DP__)
> +
> +# define _FPU_RESERVED 0xffffffff
> +# define _FPU_DEFAULT  0x00000000
> +typedef unsigned int fpu_control_t;
> +# define _FPU_GETCW(cw) (cw) = 0
> +# define _FPU_SETCW(cw) (void) (cw)
> +# define _FPU_GETS(cw) (cw) = 0
> +# define _FPU_SETS(cw) (void) (cw)
> +extern fpu_control_t __fpu_control;
> +
> +#else
> +
> +#define _FPU_RESERVED		0
> +
> +/* The fdlibm code requires strict IEEE double precision arithmetic,
> +   and no interrupts for exceptions, rounding to nearest.
> +   So only RM set to b'01.  */
> +# define _FPU_DEFAULT		0x00000100
> +
> +/* Actually default needs to have FWE bit as 1 but that is already
> +   ingrained into _FPU_SETS macro below.  */
> +#define  _FPU_FPSR_DEFAULT	0x00000000
> +
> +#define __FPU_RND_SHIFT		8
> +#define __FPU_RND_MASK		0x3
> +
> +/* Type of the control word.  */
> +typedef unsigned int fpu_control_t;
> +
> +/* Macros for accessing the hardware control word.  */
> +#  define _FPU_GETCW(cw) __asm__ volatile ("lr %0, [0x300]" : "=r" (cw))
> +#  define _FPU_SETCW(cw) __asm__ volatile ("sr %0, [0x300]" : : "r" (cw))
> +
> +/*  Macros for accessing the hardware status word.
> +    FWE bit is special as it controls if actual status bits could be wrritten
> +    explicitly (other than FPU instructions). We handle it here to keep the
> +    callers agnostic of it:
> +      - clear it out when reporting status bits
> +      - always set it when changing status bits.  */
> +#  define _FPU_GETS(cw)				\
> +    __asm__ volatile ("lr   %0, [0x301]	\r\n" 	\
> +                      "bclr %0, %0, 31	\r\n" 	\
> +                      : "=r" (cw))
> +
> +#  define _FPU_SETS(cw)				\
> +    do {					\
> +      unsigned int __tmp = 0x80000000 | (cw);	\
> +      __asm__ volatile ("sr  %0, [0x301] \r\n" 	\
> +                        : : "r" (__tmp));	\
> +    } while (0)
> +

Although this code follow other architectures, I think it woudl be better
to move forward a macro that emulates function calls and use proper
static inline function instead for _FPU_* (as for get-rounding-mode.h).

> +/* Default control word set at startup.  */
> +extern fpu_control_t __fpu_control;
> +
> +#endif
> +
> +#endif /* fpu_control.h */
> diff --git a/sysdeps/arc/get-rounding-mode.h b/sysdeps/arc/get-rounding-mode.h
> new file mode 100644
> index 000000000000..cfa5c34473ac
> --- /dev/null
> +++ b/sysdeps/arc/get-rounding-mode.h
> @@ -0,0 +1,38 @@
> +/* Determine floating-point rounding mode within libc.  ARC version.
> +   Copyright (C) 1998-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#ifndef _ARC_GET_ROUNDING_MODE_H
> +#define _ARC_GET_ROUNDING_MODE_H	1
> +
> +#include <fenv.h>
> +#include <fpu_control.h>
> +
> +static inline int
> +get_rounding_mode (void)
> +{
> +#if defined(__ARC_FPU_SP__) ||  defined(__ARC_FPU_DP__)
> +  unsigned int fpcr;
> +  _FPU_GETCW (fpcr);
> +
> +  return (fpcr >> __FPU_RND_SHIFT) & __FPU_RND_MASK;
> +#else
> +  return FE_TONEAREST;
> +#endif
> +}
> +
> +#endif /* get-rounding-mode.h */

Ok.

> diff --git a/sysdeps/arc/math-tests-trap.h b/sysdeps/arc/math-tests-trap.h
> new file mode 100644
> index 000000000000..1a3581396573
> --- /dev/null
> +++ b/sysdeps/arc/math-tests-trap.h
> @@ -0,0 +1,27 @@
> +/* Configuration for math tests: support for enabling exception traps.
> +   ARC version.
> +   Copyright (C) 2014-2020 Free Software Foundation, Inc.
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
> +#ifndef ARC_MATH_TESTS_TRAP_H
> +#define ARC_MATH_TESTS_TRAP_H 1
> +
> +/* Trapping exceptions are optional on ARC
> +   and not supported in Linux kernel just yet.  */
> +#define EXCEPTION_ENABLE_SUPPORTED(EXCEPT)	((EXCEPT) == 0)
> +
> +#endif /* math-tests-trap.h.  */

Ok.

> diff --git a/sysdeps/arc/tininess.h b/sysdeps/arc/tininess.h
> new file mode 100644
> index 000000000000..1db37790f881
> --- /dev/null
> +++ b/sysdeps/arc/tininess.h
> @@ -0,0 +1 @@
> +#define TININESS_AFTER_ROUNDING	1
> 

Ok.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
