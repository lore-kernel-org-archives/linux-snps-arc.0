Return-Path: <SRS0=Gpdw=7S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FCCC433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jun 2020 20:26:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E066F207D0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Jun 2020 20:26:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UTFaD7r5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RiAO1YiH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E066F207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHO0nWsu6hA7PMouY0gPY76paCN8SKMgkJtbZI0MuXY=; b=UTFaD7r5uR7y7i
	ohdSf/niuJvHeucSqoMeobIgvBSWsgdI6zmWbvDAH2B8GJ7xrfHH5bXIJ/lVHHbbxQxuw3jVc0QDL
	FSUHhLyOzeq6uxaflShgauehfnd036HY81QhkRiHz8tC2lTu/FEpIarGN4pVQBPu824M55sPe/Xm8
	LMmYyydAFgXifs+xhAEz6r44sVDvG4YV/4tNCwffWWuH9J5xcClc16vDR/L6VoKqz07+RsifA7ePA
	glNDDHfNWhkgioUvOoI+XXaoRywKRT8jWX6zHuQFds5lWFYtWQWQylQ7G3hG8OdlqENDaeubtKaY7
	WNPBqx3k3uwjtx3RpeKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhIuw-0000rV-Ed; Fri, 05 Jun 2020 20:26:18 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhIut-0000qo-Ed
 for linux-snps-arc@lists.infradead.org; Fri, 05 Jun 2020 20:26:17 +0000
Received: by mail-qk1-x743.google.com with SMTP id c12so11069034qkk.13
 for <linux-snps-arc@lists.infradead.org>; Fri, 05 Jun 2020 13:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m8MWSr/bTJx0RC8kSTVPJYpzR9DWJ4T/iqNAh41Dfm0=;
 b=RiAO1YiH3IjH8OK8CY4JzGy7wLLCb2Wv1apjMLCvcS9nGjQXGHl3MAiKUueNQwEpR3
 6yPFkx+85kri4YlyeYw1O5rLvVLF5tjzHR3NzN+HS5mbJ9UVJjwyifKd7Xq7NzRZbdoZ
 3ouuFNBFpuNpmlvot4MveqVkk+P6cVWyitluXI9Wz+jfxTzTMKHShpN4Sb/alHHLdYhe
 4DwOlf534oLEeDxm8bRIuwlgFxU67fDXyQH4r0wupLYKrnlkl6do4tIQYNlZKHJXtey1
 grYJ8R7Hy8BJ3sSfGHpwEhTnzzk/6Ru7ifDiesfp01Twr9VoNYLx6p4KWqVEe8i4Gn3c
 aqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=m8MWSr/bTJx0RC8kSTVPJYpzR9DWJ4T/iqNAh41Dfm0=;
 b=UYGD+2g+oYGevLuMyxm26gkLK5NhD1Bub8U+RtZcHOyjZgAljalbkT8hVQS3udgonl
 sat7dU5wKzQvLHxnDVmB9CKEPhOqWnAOEXCZy0f2fbv2AHEnkRMKvOVRexDLBgIG70EM
 2AhmH587ONdlMCvdmm0IkDkPVGJanmukte0pzvqz6xCj0atDenyK0Goufu2BPPA4p8zP
 N/QEEQY8KQRN7FFjkZXY/nUnn5O+9jBDbSU6MX4ZnQvq9hA6vMsQ2N30apHHvUk5tknm
 M4uaHCi6SaW57JM+N68SgHQ1Yz8sXc1GXPv6D/YddkELzL5uNXXH9uspgmOn5UomttQi
 BZzQ==
X-Gm-Message-State: AOAM5327IQMWkni/Olxo5o/2mTAUZCv1OeUoa9m0XW7wPfePTLThIezN
 aJXoJWD1njV+eTD1rMP5EkChghcOV4g=
X-Google-Smtp-Source: ABdhPJzGAYENFc7p2wlkw8jcO6brdTqarX4hJposuhoeOZWmDBHZLMFsCMvmg/9mx1kw70gojSmHkg==
X-Received: by 2002:a37:b883:: with SMTP id
 i125mr11576948qkf.392.1591388773944; 
 Fri, 05 Jun 2020 13:26:13 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id v3sm743805qkh.130.2020.06.05.13.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2020 13:26:13 -0700 (PDT)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, libc-alpha@sourceware.org
References: <20200601221823.17861-1-vgupta@synopsys.com>
 <20200601221823.17861-3-vgupta@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH v2 2/2] ARC/dl-runtime helper macros
Message-ID: <6df84bde-8a21-c485-7cfa-3c2a00755ed2@linaro.org>
Date: Fri, 5 Jun 2020 17:26:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601221823.17861-3-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_132615_526769_8A5E7E3B 
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



On 01/06/2020 19:18, Vineet Gupta wrote:
> This is purely for review purposes to attest the interface defined
> in prior patch

LGTM with some style nits, however I think it should be pushed along with 
the ARC patchset.

Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

> ---
>  sysdeps/arc/dl-runtime.h | 42 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 sysdeps/arc/dl-runtime.h
> 
> diff --git a/sysdeps/arc/dl-runtime.h b/sysdeps/arc/dl-runtime.h
> new file mode 100644
> index 000000000000..529d49f5d0a1
> --- /dev/null
> +++ b/sysdeps/arc/dl-runtime.h
> @@ -0,0 +1,42 @@
> +/* Helpers for On-demand PLT fixup for shared objects. ARC version.

Double space after period.

> +   Copyright (C) 2017-2020 Free Software Foundation, Inc.
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
> +   License along with the GNU C Library.  If not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +/* PLT jump into resolver passes PC of PLTn, while _dl_fixup expects the
> +   address of corresponding .rela.plt entry.
> +
> +    - @plt0: runtime pc of first plt entry (DT_PLTGOT)
> +    - @pltn: runtime pc of plt entry being resolved
> +    - @size: size of .plt.rela entry (unused).  */
> +static inline uintptr_t
> +reloc_index (uintptr_t plt0, uintptr_t pltn, size_t size)
> +{
> +  unsigned long int idx = (unsigned long)pltn - (unsigned long)plt0;

I don't think the explicit cast is required here.

> +
> +  /* PLT trampoline is 16 bytes. */
> +  idx /= 16;
> +
> +  /* Exclude PLT0 and PLT1.  */
> +  return idx - 2;
> +}
> +
> +static inline uintptr_t
> +reloc_offset (uintptr_t plt0, uintptr_t pltn)
> +{
> +  size_t sz = sizeof (ElfW(Rela));
> +  return reloc_index(plt0, pltn, sz) * sz;

Space before parenthesis.

> +}
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
