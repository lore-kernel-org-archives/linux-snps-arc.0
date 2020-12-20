Return-Path: <SRS0=7mKV=FY=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14E6C4361B
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Dec 2020 20:55:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A675923B70
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Dec 2020 20:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A675923B70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BvLOepMi9Mh+yyr1NWobq5C9rkhhB2MvebxsV41G+Es=; b=yn4h3YDh58W+0C5ZMaM/QUWW5
	yj53eG3pqYLuzoQv30t3DMOdw1TsRpIzBeOLOIVA3+AemmtKxWU5DF+3Xo3NmwrbwljtDLddadZXv
	V07fDslgA4Qxcew5x4spVRK24LhMn7eeViglEzq2ZstOXqVIy/YMBXqLK9v+VTUZ2zX5HR3cCgqlz
	3pneRc8WQtXpv5Fzg+NH8OStEKXQPYrYKlSoL/zWD7Y3dbCyrrm0MT9Cq0qrk9tq7aPR0N4mm0y1T
	6cZq7/uNygEJ39XfSpFqiK6X0Es9on1HE7uiNp04fQFfWhjS0IouOzYKTv9HkCx8LunBinBtJ4sWp
	Bh+s+7v6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kr5jK-0006Qa-SJ; Sun, 20 Dec 2020 20:55:02 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kr5jH-0006Pp-O9
 for linux-snps-arc@lists.infradead.org; Sun, 20 Dec 2020 20:55:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id 91so8905268wrj.7
 for <linux-snps-arc@lists.infradead.org>; Sun, 20 Dec 2020 12:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WU57UDH9iBA+SpWG/JBlCFUVWISWmdR25NDdKT5/S3c=;
 b=g4p3u8GmrJminYSYCpiWCYBbi6mwQemjkAQModu/zMOx9wAjm6GE9kLEsKYRl7dVEj
 glKQpshSdTb/svbVodf1zBvONtlM0hqU+/ASJYlrg+GHyf7B3aniYpW6hL5qyFHUe9Ix
 lyM27/ldSLW+DUqsuukDrn0L532vUYHp1EXmCnYgX8yY/BNGdoCxZMVzQylPJKEXjor0
 7CUK1uNmLxdxp2HNISAliGLGnmchfPeMMng5PO6Tj+v0H2MsbfbyDzxBkGZdkUPpuhme
 1cCOQxAuBPoqV1+ohAnY1R29b/umBR0yQxHFIEQ+gjql3qcv9vRJWeIni4JxQlSQhwcX
 /ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WU57UDH9iBA+SpWG/JBlCFUVWISWmdR25NDdKT5/S3c=;
 b=qUFfG7coygmejOZLAonyKHw95c1v+0lgOZHGvYxAmfI69vq4TdgJAPk/9g13VSk4qI
 yO/kYcGAgh/iqTUx5WcBXOL1AocLA7DU3Cr+nXPVmZoSP7Vrf1JzUiG/kIFifR7uc9SP
 8JbU//GXG7jrcGXxwgLAid6MqF8Zjr7UBsuRvyGwPINQTqQfLy6CiKZvHQWoe0v/VN2E
 sNjOcAQUuSoLwT89wXOf6gTs2YwQNscWOCKWgjysgQc0tf0//E5g9aP05yVOhvi85tTE
 ZFmlCi3ECxhDfY/9OptD+z5oD4QnHR+bQOQyK3HYaR/NC4src7xMGUoPD7vJzJUFLmLv
 DjVw==
X-Gm-Message-State: AOAM533So+bE5pNKeRfT1pGQy2qKJbu4M4Zy0jFoUTbpPAHvcqQa33Ai
 lOb+zERDu2Ts4JgOCt7aJik=
X-Google-Smtp-Source: ABdhPJwytmEUOzZSF9jWilBV08Nu0od0fJlT0cOl+k5I/CICI8GpuyJTO/fBARjwip72nszUqtF0rQ==
X-Received: by 2002:adf:d085:: with SMTP id y5mr15571261wrh.41.1608497695921; 
 Sun, 20 Dec 2020 12:54:55 -0800 (PST)
Received: from ?IPv6:2001:a61:2467:2f01:faca:3d43:5e40:30d1?
 ([2001:a61:2467:2f01:faca:3d43:5e40:30d1])
 by smtp.gmail.com with ESMTPSA id l8sm21563534wmf.35.2020.12.20.12.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Dec 2020 12:54:55 -0800 (PST)
Subject: Re: [PATCH] cacheflush.2: Document Architecture-specific variants
To: Alejandro Colomar <alx.manpages@gmail.com>,
 Dave Martin <Dave.Martin@arm.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 linux-man@vger.kernel.org
References: <20201214143852.16565-1-alx.manpages@gmail.com>
From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <53a3c827-3e83-441b-8192-afdf323ca296@gmail.com>
Date: Sun, 20 Dec 2020 21:54:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214143852.16565-1-alx.manpages@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_155459_953676_F5A46A9B 
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
 mtk.manpages@gmail.com, libc-alpha@sourceware.org,
 linux-snps-arc@lists.infradead.org, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Alex

On 12/14/20 3:38 PM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> ---
> 
> Hi Michael,
> 
> Please apply this patch after
> '[PATCH v5] cacheflush.2: Document __builtin___clear_cache() as a more
>  portable alternative'.

Thanks. Applied.

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

I made the formatting rather:

[[
.TP
M68K:
.nf
.BI "int cacheflush(unsigned long " addr ", int " scope ", int " cache ,
.BI "               unsigned long " len );
.fi
]]

That's for consistency wqith the SYNOPSIS sections, where .EX/.EE 
isn't used.

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


Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
