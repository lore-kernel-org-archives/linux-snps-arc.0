Return-Path: <SRS0=7mKV=FY=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA34EC4361B
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Dec 2020 15:36:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07CC623106
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Dec 2020 15:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07CC623106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uNulqQyHyyGvL/EQ4u5ACcjv+VkOxZcVxEqriqR2xyE=; b=ZGCZzur90iqwTjCbJu1t69xQN
	NiS6Ve2Z5MBxMf+mqiXJjvf7fQdZ6VVOStWJp5FBgsjN5MsJ2E25wZ2rLX4v1l98McMhkYP0kIDZo
	I8Fz2mbSPsGiiWfqBZVmvuZ1rPHilWGIeTQGtV998bHDAYnS9vuMkd/b1p+0s2VOWoxStZTSlfjql
	wA10q+nT+xPAqxQO8hEFafPivwJoxGglAFQkhbxrPV3WVkt97/kwN18nZC6Qp9Oku7vfng/qnYMCD
	pFeEAyUzKYNgZeIrGXj5UHsydtvOaOLcZmhfD8xntd8oQBWbEKZFRUbW2mSlNaUwfPnfMnIlaATnv
	zIjE6mBLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kr0kx-0004Dn-A3; Sun, 20 Dec 2020 15:36:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kr0kv-0004DN-6s
 for linux-snps-arc@lists.infradead.org; Sun, 20 Dec 2020 15:36:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id d26so8165004wrb.12
 for <linux-snps-arc@lists.infradead.org>; Sun, 20 Dec 2020 07:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GIxWxKRMw7SGkXKjHPxOnFiDqc9PfOlR1jMdml5CQBA=;
 b=CahlGOxs8PABDe3GI4PYpEjkHztw0ECNbKvQdGhykotf12SXD5PebrToXvYWEdpx1Y
 CHzD09G3+yTlH2FIQNuveJ4g59up9frZMEdma4QJbyVxBMptE8fIaeIEFBePoMSUnb/o
 DDbpnCZh/dERTZF22EWy7MCnpLr3+N4BwRQWJalwA2Zw0NwZOcdqwz2Rue4FNX91iKKM
 u5R7pnnFBb6/HAPGv8+WNj3KmQXlEOMmvmZFmqj1NI/XWJAgYkNUfacQg6mUVIKOVJBC
 vjAGMocHnFe60lbD3f8JFMI1U9j4LrBQFxbl7fB6nI3j+Id3NsxHZLihq8ZIm6SgtXgZ
 7fGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GIxWxKRMw7SGkXKjHPxOnFiDqc9PfOlR1jMdml5CQBA=;
 b=lT0I/Ya7FNDMrF3hV5E28bq5jEZwTAg9bagKjhVBABzF3Vmpnb6GxMWZd5f51nbodo
 YWwbwWofrK/tfXyI3FnjA+f9wc2FcC93hHxc93aqERfZePI4QnJhFMAkpHXYg+AvS92B
 UbbGatl53Hsyoh6u2I+yImD2PN24GdESjylTDNjFAcspVFwjrkMYHY8fcyi2Wsm6gT9j
 As3AWszlheMH5Ti4Tt3ePlJMqslmQtmsS3tcXa5hDFSw4NxRVmjrEbSntfM8qJs4yjmf
 1sKZE5o6Cnt1ASUxdXEJHsc31UxClOmrKCfgmW6c+19yM1w10s1erI/SHKV95tl/JcaJ
 zYrA==
X-Gm-Message-State: AOAM532CCQ6YWqKANpizNkqiOCHj9NAboG5y0QGbOpA5TKa85vzSykBm
 h+er70N1fyvWCehQW6m/JYs=
X-Google-Smtp-Source: ABdhPJxBdONObhh0opceXMVxKG0VzqzR4kUa2LRuF8cC1ictBN1LgRYp5x07gs9VLSIGJsDdlkdJcg==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr14333321wrn.122.1608478579945; 
 Sun, 20 Dec 2020 07:36:19 -0800 (PST)
Received: from [192.168.1.143] ([170.253.51.130])
 by smtp.gmail.com with ESMTPSA id k10sm21616433wrq.38.2020.12.20.07.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Dec 2020 07:36:19 -0800 (PST)
Subject: Ping: [PATCH] cacheflush.2: Document Architecture-specific variants
To: Michael Kerrisk <mtk.manpages@gmail.com>, linux-man@vger.kernel.org
References: <20201214143852.16565-1-alx.manpages@gmail.com>
From: "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <a0f3e871-4ad4-408c-f3ca-d5ba4344e307@gmail.com>
Date: Sun, 20 Dec 2020 16:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214143852.16565-1-alx.manpages@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_103621_311106_223226EB 
X-CRM114-Status: GOOD (  20.07  )
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vincent Chen <deanbo422@gmail.com>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 libc-alpha@sourceware.org, linux-snps-arc@lists.infradead.org,
 Dave Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Ping

On 12/14/20 3:38 PM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> ---
> 
> Hi Michael,
> 
> Please apply this patch after
> '[PATCH v5] cacheflush.2: Document __builtin___clear_cache() as a more
>  portable alternative'.
> 
> Thanks,
> 
> Alex
> 
>  man2/cacheflush.2 | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
> index fc35f1a0b..0761b429a 100644
> --- a/man2/cacheflush.2
> +++ b/man2/cacheflush.2
> @@ -31,6 +31,10 @@ cacheflush \- flush contents of instruction and/or data cache
>  .PP
>  .BI "int cacheflush(char *" addr ", int "nbytes ", int "cache );
>  .fi
> +.PP
> +.IR Note :
> +On some architectures,
> +there is no glibc wrapper for this system call; see NOTES.
>  .SH DESCRIPTION
>  .BR cacheflush ()
>  flushes the contents of the indicated cache(s) for the
> @@ -87,6 +91,44 @@ but nowadays, Linux provides a
>  .BR cacheflush ()
>  system call on some other architectures, but with different arguments.
>  .SH NOTES
> +.SS Architecture-specific variants
> +Glibc provides a wrapper for this system call,
> +with the prototype shown in SYNOPSIS,
> +for the following architectures:
> +ARC, CSKY, MIPS, and NIOS2.
> +.PP
> +On some other architectures,
> +Linux provides this system call, with different arguments:
> +.TP
> +M68K:
> +.PP
> +.in +4n
> +.EX
> +.BI "int cacheflush(unsigned long " addr ", int " scope ", int " cache ,
> +.BI "               unsigned long " len );
> +.EE
> +.in
> +.TP
> +SH:
> +.PP
> +.in +4n
> +.EX
> +.BI "int cacheflush(unsigned long " addr ", unsigned long " len ", int " op );
> +.EE
> +.in
> +.TP
> +NDS32:
> +.PP
> +.in +4n
> +.EX
> +.BI "int cacheflush(unsigned int " start ", unsigned int " end ", int " cache );
> +.EE
> +.in
> +.PP
> +On the above architectures,
> +glibc does not provide a wrapper for this system call; call it using
> +.BR syscall (2).
> +.SS GCC alternative
>  Unless you need the finer grained control that this system call provides,
>  you probably want to use the GCC built-in function
>  .BR __builtin___clear_cache (),
> 

-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
