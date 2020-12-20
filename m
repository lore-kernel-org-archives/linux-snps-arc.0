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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9608CC4361B
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Dec 2020 20:49:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7785E23B70
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Dec 2020 20:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7785E23B70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fJMGZcWih1nQQDDGnTfOBvZaD07VwmMUpYRhWZfjwtw=; b=ZxTnIDf3K9ZVAslLThVSGLMiZ
	RIrSGFgYt0TWHAgp2wa3NYeWxaMturWZQFabRhGuxhxMZvLhXfq/ISzVRaFIInhBzYaG82qCuR9uo
	qrN2+oNNroBd6ZdBei3JvozHyMpMgRp1hW/CxNsHsQU3PVxlFaA73tF9DVrBCF20fXOG4G4KRxyOT
	717zev/7x5q48hFuxHiWhXQI0CFLqZ8JAZwBJs2b2zp69DcWklQ/ZIUqfM6TtKKwEUHGPxEzyKHo0
	83z5tE8DvIAYdELa/NpHyLchUpn8owjR2wphgtGJen3OXguUUHYEv5CRNupnehzzR9kTVhdqx/aBd
	Ta+jiBYOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kr5dR-0006Fv-1J; Sun, 20 Dec 2020 20:48:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kr5dO-0006FK-90
 for linux-snps-arc@lists.infradead.org; Sun, 20 Dec 2020 20:48:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id y23so8927969wmi.1
 for <linux-snps-arc@lists.infradead.org>; Sun, 20 Dec 2020 12:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TPubNB4+o76pxV2jUsQ6FWuL944gZMCTKS2ZqkAshzg=;
 b=RoHWJA1AJ6mNViQl3u4462wV12SBTvCbZ32NzEy47tEk/PNyZm1QyISrphfNTSZMIF
 bs/j0XuXlETtcogZUEBTWXpHuCsAM0ZCReFahn+sQi8DXrqkMilVyh9m96Ol4bzmqMVs
 vhSiCc0Ypwr6kz/xxI0kKrqlZx5XRUqvg9HYLdzfIRntWV5RTSPlQR3I45Dk9Sum5mxt
 ZrQcCQ+eAYX+IlWb09PUIC6WtL+r0nvuRXUHZ8bDCX09HmTaWYVG1dC3Sv54+IJ2bDRk
 1tvSZW1qw4Y4+dw2/zYGupCh4Ld5PmkKbFXulXDJj0y6fE3m9NihWxw420iT80xgOPYj
 u/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TPubNB4+o76pxV2jUsQ6FWuL944gZMCTKS2ZqkAshzg=;
 b=huEmQjfQHkBdxTFVBYyaq3mJ6eki5kbMNrBFSF9ygnoA+nHX9n5MbIEcUvK3qUZI8M
 dGIp6tWbb/SWWpXNLMfkqSwfaFmtt//OyMMcFUB9f5eASe6iBU3S885FcOXXI5Qgca5X
 7McyUtfObmtFMT3lXowcbPzwo7XrtetwcUWRWk60b33HkgQRqNkMWCsZwcEhBrnaBJ8T
 TXxSSq+ZLMJtylIe9temhjL67HUkO3ky5b2HqHF6CI5cBXoAUHQ9MFDk1QEQkkGeQ44l
 dpZTx4hcX/NCQ8ukFL3XUdBCaDxP1kiH3QwERlHzjkD5sHZaLiAqmtBQgkj6WCImZeAY
 LoPA==
X-Gm-Message-State: AOAM533TJ6xatpEwfE6av+LveIgUzxXvS35etlviMjhvABIW/36L+kjD
 AGTKhsYs8ahrOH/H8YYBqRg=
X-Google-Smtp-Source: ABdhPJyFZ1y1fQoUFEQgChpe5AV9GnxIBBOW/0NVsMBb8a2iZBbXpetzu/KkPLQanNekpScVM9jCHQ==
X-Received: by 2002:a7b:ce14:: with SMTP id m20mr13509768wmc.149.1608497330655; 
 Sun, 20 Dec 2020 12:48:50 -0800 (PST)
Received: from ?IPv6:2001:a61:2467:2f01:faca:3d43:5e40:30d1?
 ([2001:a61:2467:2f01:faca:3d43:5e40:30d1])
 by smtp.gmail.com with ESMTPSA id z8sm20051199wmg.17.2020.12.20.12.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Dec 2020 12:48:49 -0800 (PST)
Subject: Re: [PATCH v6] cacheflush.2: Document __builtin___clear_cache() as a
 more portable alternative
To: Alejandro Colomar <alx.manpages@gmail.com>,
 Dave Martin <Dave.Martin@arm.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 linux-man@vger.kernel.org, Martin Sebor <msebor@redhat.com>
References: <e2424619-2a5a-a44a-2dc0-a16310725250@gmail.com>
 <20201215133019.14411-1-alx.manpages@gmail.com>
From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <924d4de5-5191-26fc-a040-2501d4c74f10@gmail.com>
Date: Sun, 20 Dec 2020 21:48:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215133019.14411-1-alx.manpages@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_154854_404482_72DA874D 
X-CRM114-Status: GOOD (  18.27  )
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
 mtk.manpages@gmail.com, gcc-patches@gcc.gnu.org,
 linux-snps-arc@lists.infradead.org, cfe-users@lists.llvm.org,
 cfe-dev@lists.llvm.org, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/15/20 2:30 PM, Alejandro Colomar wrote:
> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> Cc: Martin Sebor <msebor@redhat.com>
> Cc: Dave Martin <Dave.Martin@arm.com>
> ---
> 
> v6:
> - GCC has always exposed 'void *', as Martin Sebor noted.
>   It's Clang (and maybe others) that (following GCC's docs)
>   exposed 'char *'.

Thanks, Alex. Patch applied.

Cheers,

Michael

>  man2/cacheflush.2 | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
> index aba625721..7a2eed506 100644
> --- a/man2/cacheflush.2
> +++ b/man2/cacheflush.2
> @@ -86,6 +86,30 @@ On Linux, this call first appeared on the MIPS architecture,
>  but nowadays, Linux provides a
>  .BR cacheflush ()
>  system call on some other architectures, but with different arguments.
> +.SH NOTES
> +Unless you need the finer grained control that this system call provides,
> +you probably want to use the GCC built-in function
> +.BR __builtin___clear_cache (),
> +which provides a portable interface
> +across platforms supported by GCC and compatible compilers:
> +.PP
> +.in +4n
> +.EX
> +.BI "void __builtin___clear_cache(void *" begin ", void *" end );
> +.EE
> +.in
> +.PP
> +On platforms that don't require instruction cache flushes,
> +.BR __builtin___clear_cache ()
> +has no effect.
> +.PP
> +.IR Note :
> +On some GCC-compatible compilers,
> +the prototype for this built-in function uses
> +.I char *
> +instead of
> +.I void *
> +for the parameters.
>  .SH BUGS
>  Linux kernels older than version 2.6.11 ignore the
>  .I addr
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
