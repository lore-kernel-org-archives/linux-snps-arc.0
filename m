Return-Path: <SRS0=wxyZ=GU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CEEC433DB
	for <linux-snps-arc@archiver.kernel.org>; Sun, 17 Jan 2021 20:34:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1866E205ED
	for <linux-snps-arc@archiver.kernel.org>; Sun, 17 Jan 2021 20:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1866E205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v0ci+hpe7VNkRBsrrlhUVsQTJucpclb+sjSxn+WxMwU=; b=sQ7jRFFVH/5/aa6P4+4k9jfPD
	qu/DY8+cg57wx7SlnCwByA8dngg20DGddmCqV7dRVg5Wt6XhXBSFUnwoKLrZtuLgkCBeYVu3XlvfD
	GeO5tqgGIOPlOsEq/jcI/5zvpNHjO7+TCYvegrU4JGhCnl/+l+oS5YL6sOCbQs0r3HoUWX0zo07/n
	u91wmrE2JrerSdx0zA1GzRr6P6+6dfArDS8botvp0022pqxpEzE0z4qGjV0+NCng+dJ6n6z8Uje0v
	+P5K1hLV9skadjn8b9+GZYu9kMssgWU7uZhp7OZwPSswgLblUwt9icO1R4+SWXxAC4rSYOUEwrZbG
	ra2ZTckEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Ekj-00037R-K4; Sun, 17 Jan 2021 20:34:25 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Ekh-00036s-P7
 for linux-snps-arc@lists.infradead.org; Sun, 17 Jan 2021 20:34:24 +0000
Received: by mail-ej1-x62d.google.com with SMTP id by1so14451760ejc.0
 for <linux-snps-arc@lists.infradead.org>; Sun, 17 Jan 2021 12:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KiYGOnuh3oxYzt0UIK72MDtuuNQAPRMD/wk8kArmgSg=;
 b=AXOi5xZqzfxoEglDl8jLsrTW0XeKLSrcvq2nqOEljc/ykG8Bersbu+hmLkmvnjM9cc
 rMzvYb6I6grdacA1op6kFT3PQCszkmyQ3Cz8XIX5KxMf69elOjTTI/nac+gYwafNPRmE
 NIN4tIkqRT5FTacyyTYOOtdELoNs3Ou/vrnk+VRv5b8y0cjEYNwznFwxXF4gVPzlCE1q
 whZTlYZ7BNn3ObX1sS6syuWUvRaKHAci6/jT5XqQ9Ph3WXzWNIY3gEKvWfiSICSUMk6C
 6QzEaIol4yjH4iFN0bVmPCfJ9SE7veoAcQQSQZi33uoEDW6vfXz8oWpHpv24d25U57YQ
 /1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KiYGOnuh3oxYzt0UIK72MDtuuNQAPRMD/wk8kArmgSg=;
 b=Q3XuVkEk8evnIGMa0S6+HIjxZ/inQkPD8mW3rGPmULTQfEeAME4d2rFPJetnYbaCfS
 pLdM04Z/XOHcox9G7Dv2Khw5y3ycZ4511Wb0UJoZNfat/u99/47vkWSkHaBeJD3jnV4+
 zyKxCWiKvWmEy3PfFVhyyQmXG4YScUToIlE/X6V4o4dyjNtczuFX9gBjNGHex3L+GPrf
 qYisa//0L1CIf8pYBn6xT9QTEHCkDtbjgnh+ulDXFehbZsMBx6FRlG/X0+sd4B/kgjKX
 fMV75/FuPFvDpQlVxbdRVcuFHiV5TC55CteQ9StwO6JH2Y81jgiXLfhmr1UGPqgbXISW
 5OAQ==
X-Gm-Message-State: AOAM53390Q+BbTmVZs1nM9OI3stNWnUYr5IsjfC3/Ck2H4uyc5cuMeRU
 GVK/DHNMc5G0KuQfWeGrdjtn3wVEngA=
X-Google-Smtp-Source: ABdhPJwbTPx3/TdAb4F/XCyD1EyeCnzd03vRuDnwHTiarwdwWyLCIst8C1LDDSjJDR8aNbxCWbTSQA==
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr2124582ejz.407.1610915660809; 
 Sun, 17 Jan 2021 12:34:20 -0800 (PST)
Received: from ?IPv6:2001:a61:244d:fe01:9fb1:d962:461a:45e8?
 ([2001:a61:244d:fe01:9fb1:d962:461a:45e8])
 by smtp.gmail.com with ESMTPSA id w13sm9499190edx.20.2021.01.17.12.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 12:34:19 -0800 (PST)
Subject: Re: [PATCH] cacheflush.2: Update SYNOPSIS for glibc wrapper
To: Alejandro Colomar <alx.manpages@gmail.com>
References: <20210116145632.7636-1-alx.manpages@gmail.com>
From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <a2418a0e-9b21-4a02-dc0b-98936c0887fa@gmail.com>
Date: Sun, 17 Jan 2021 21:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210116145632.7636-1-alx.manpages@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_153423_855007_D854D702 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: linux-man@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vincent Chen <deanbo422@gmail.com>, Nick Hu <nickhu@andestech.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, Martin Sebor <msebor@redhat.com>,
 Guo Ren <guoren@kernel.org>, mtk.manpages@gmail.com,
 Vineet Gupta <vgupta@synopsys.com>, libc-alpha@sourceware.org,
 linux-snps-arc@lists.infradead.org, Dave Martin <Dave.Martin@arm.com>,
 Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Alex,

On 1/16/21 3:56 PM, Alejandro Colomar wrote:
> Glibc uses 'void *' instead of 'char *'.
> And the prototype is declared in <sys/cacheflush.h>.
> 
> ......
> 
> $ syscall='cacheflush';
> $ ret='int';
> $ find glibc/ -type f -name '*.h' \
>   |xargs pcregrep -Mn "(?s)^[\w\s]*${ret}\s*${syscall}\s*\(.*?;";
> glibc/sysdeps/unix/sysv/linux/nios2/sys/cachectl.h:27:
> extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
> glibc/sysdeps/unix/sysv/linux/mips/sys/cachectl.h:35:
> extern int cacheflush (void *__addr, const int __nbytes, const int __op) __THROW;
> glibc/sysdeps/unix/sysv/linux/arc/sys/cachectl.h:30:
> extern int cacheflush (void *__addr, int __nbytes, int __op) __THROW;
> glibc/sysdeps/unix/sysv/linux/csky/sys/cachectl.h:30:
> extern int cacheflush (void *__addr, const int __nbytes,
> 		       const int __op) __THROW;
> 
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>

Thanks. Patch applied.

Cheers,

Michael

> ---
>  man2/cacheflush.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
> index 2cf624f3a..0496879ca 100644
> --- a/man2/cacheflush.2
> +++ b/man2/cacheflush.2
> @@ -27,9 +27,9 @@
>  cacheflush \- flush contents of instruction and/or data cache
>  .SH SYNOPSIS
>  .nf
> -.B #include <asm/cachectl.h>
> +.B #inlcude <sys/cacheflush.h>
>  .PP
> -.BI "int cacheflush(char *" addr ", int "nbytes ", int "cache );
> +.BI "int cacheflush(void *" addr ", int "nbytes ", int "cache );
>  .fi
>  .PP
>  .IR Note :
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
