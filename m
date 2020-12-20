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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B80C4361B
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Dec 2020 15:35:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D468F23106
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Dec 2020 15:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D468F23106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MB6Y+NnzBlGCtdczc3IXbUXYDfCa2Ey/J/Ps9DOj2mk=; b=Je1pH9I9IiXb/U0NC0yIkcgDL
	/adLKjxpfrawLKe1MB5cPoaZS9ZM5Y0+2abZ3HVuUPotH9cCDsWiquZzeH3l/s94/wj7rcULrv2zS
	32d+ao6x/iuQDYLipdh1kWbB8oX29DChXdxuuFM35ph7HcTK6UR/ntUb+eZB2XEFhl/6hcQnYVOCz
	0ZERhiG8n+v5JwQq/vUzKnXTFNcXFAvgP8R2oOIPWSGptXNXKmNtUXVWzbXl0S/HRzgrKlN01jrob
	xTcw5Xk/Bwf/jNziZlp8EQrSTAoUhwrHrIulWlUU2XPDSeJzkkFLxHbvIrHlg3/On6x2t8gocFmvO
	dNlcnqTsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kr0kO-0004Bl-HG; Sun, 20 Dec 2020 15:35:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kr0kL-0004BE-Ry
 for linux-snps-arc@lists.infradead.org; Sun, 20 Dec 2020 15:35:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id w5so8176430wrm.11
 for <linux-snps-arc@lists.infradead.org>; Sun, 20 Dec 2020 07:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5HVwshWceEn2lPtPbYv3aAtF6ZGhn8pIjPtnQbkTvDA=;
 b=q+BDvMJRODbQExlaDDEkj0FSUlD79RbsMbzm98BN/l52215hOiPC57SZgL3YeFCxEq
 096qYI+VUHp7wvp2tOxIAC8V2oM6LNDSUCfo3d6wSkRCWv8iv859UEQ66d4XBy7nolZ5
 oC0GvxVCzWKwJ58xxR8gdVtJ32PoDOWYXWHQWcZMDGmubrILwsr2QGgNFkDHk/UaqbVF
 +tonNyQFfmENHgVOZ4y6R0NEIkjNLgSTkSihbU8HIkq2bZIB0SIJ6EvPTrh5HVZZ3zOz
 eopbUN/PdvsF82qTWlTjkJTk0l/2S9YnhSsLWJg9O7UQYsqFT0Ggu7PQXtdX/MvjF/ls
 VzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5HVwshWceEn2lPtPbYv3aAtF6ZGhn8pIjPtnQbkTvDA=;
 b=i3AeJipmBKKQeLvus35X5qnhc+esrRAv1+8P7lB80kB8ycI9lsEvVjRbkktGJUdAqK
 YoTGOmiinq10YrKJRkw1ZCYKhzQLzcOsbPW1h6IV9nT6AFhkOUfYd7mDkkHzvnJO50Ij
 GqxXv0QLcbgn7+wTWpbJa65nT8AAck/MqZ/u4139giplILEPKVLAqz/oYlwnGjrqKdUV
 DF7DDURGt2teMt98ZXN/8AUG7nQOcv1cmQYy77cUWEI24IwTK9twOgaNnl8k5R6BUHpT
 3BhwxOWA4Vh6Yri1j60u1N6uInhVktMtmAtQGwhpbJQBqCqZzhIx2nhw8afKmuGnRuJW
 pg1A==
X-Gm-Message-State: AOAM5335vbpIQQl0Qj/XIf4cXzpoIJpnsNOVUk4Z6Kn1ASS8H4sfIbq9
 bHyCh0AMOj35/LXJuB1evZI=
X-Google-Smtp-Source: ABdhPJzb8tZphtylC985kZv/GrLmarLQTNgjw/LUgwYXkJ4kV7KENi4AqmH/EuiEAFwDGVjuPiplRQ==
X-Received: by 2002:adf:c642:: with SMTP id u2mr3104350wrg.243.1608478541290; 
 Sun, 20 Dec 2020 07:35:41 -0800 (PST)
Received: from [192.168.1.143] ([170.253.51.130])
 by smtp.gmail.com with ESMTPSA id g11sm23431536wrq.7.2020.12.20.07.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Dec 2020 07:35:40 -0800 (PST)
Subject: Ping: [PATCH v6] cacheflush.2: Document __builtin___clear_cache() as
 a more portable alternative
To: Michael Kerrisk <mtk.manpages@gmail.com>, linux-man@vger.kernel.org
References: <e2424619-2a5a-a44a-2dc0-a16310725250@gmail.com>
 <20201215133019.14411-1-alx.manpages@gmail.com>
From: "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <fa3c7a2b-e364-568a-26c0-def6d494f98b@gmail.com>
Date: Sun, 20 Dec 2020 16:35:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215133019.14411-1-alx.manpages@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_103545_965004_21E5ACB7 
X-CRM114-Status: GOOD (  17.95  )
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
 linux-csky@vger.kernel.org, cfe-users@lists.llvm.org,
 Martin Sebor <msebor@redhat.com>, Guo Ren <guoren@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 gcc-patches@gcc.gnu.org, linux-snps-arc@lists.infradead.org,
 Dave Martin <Dave.Martin@arm.com>, cfe-dev@lists.llvm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Ping

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
> 
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
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
