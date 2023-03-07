Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705FCC678D5
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Mar 2023 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7oZFmJ9mKb8Z58IjlwtvFzHv6G1no/TfNwBRyNYdKY=; b=4kZH3Git33oXvB
	t+F28QHoLr09HiB8yeeU3E5+3Xy78NWQsiF/HWl78f0/JuyaYztCYU9A2toi412i1gePPJvTtQS3o
	RhFDUFR3MAMuXSjetGcRBZH0CrFJ8IWQGnbPpdodRQRJBsRXQUTeEo3e7D50qeiae+yjPMAMlsgQC
	LveAxg0SQUbwlUgUPmPwtV6Q4E7ZG+h+0DX6V5m7YMUtidHRA4tE4PH1c5i1Y8MHftr8mNMdseBLg
	7mK4c5bXfXboLPK5YQ8DjlncHs44TRmbT4ONSujQVvAxYtkaMI38WRO0r3MW/3UNfvE2bG9/IP48I
	5ratMoVNX4Eky11U1WqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZW4K-0001b7-Qu; Tue, 07 Mar 2023 12:05:24 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZW2H-0000JU-8A
	for linux-snps-arc@lists.infradead.org; Tue, 07 Mar 2023 12:03:19 +0000
Received: by mail-oi1-x22c.google.com with SMTP id bk32so9372675oib.10
        for <linux-snps-arc@lists.infradead.org>; Tue, 07 Mar 2023 04:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678190596;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A3bzN9xyTF1UYWyBo0gCqntIyceSZwlQ/Xh92SOpM08=;
        b=cGH183OqhuFt5Wgsgtp5RAeQSQbOmbWowV8hnQAsHRRdq0Q8WOqVDrYdySxvmcoclk
         Clej9S5XFM3QNJ8coN/F7gDw72HkWssNqA11HY1zOf0vcjb7WW+4DBz06VYi+6hgvBVR
         EOsHq9kD616NlfKqgX9TUfWnMeHZ9Sm+p6BWfv6+Y0pQxi++5UmWIo/H67ZK0er8RLXV
         Pyo2OqzlTWr/nmbhrNSfrvloVPBgBrz+lJSRTGQPH46vILQQUua+EWEyI+xeoSXtmg9o
         Bf5BCv80a+99JVYZ0JqK/0IhOxGU7/BnKLmRGgHPvJM9bG4/FFuE0AxamyoIBw41aAPE
         Br4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678190596;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3bzN9xyTF1UYWyBo0gCqntIyceSZwlQ/Xh92SOpM08=;
        b=Ugjq+L9kPl+lQgP+1OYpaK8gjRzH9+xcoU0uSASqLYCEDTQ4lYaEWbSLKju1iOh/8D
         fkVAt8vBVrPF48+rlxNTPqVnAcoLWvB4b6za6lsjntiJ9kqe6+a7ReAetYLbR0HDSrAR
         5WxHhejvUB5uaxMcqGgWSJoFWBvW8r6v1BjiFRI1XKSoGHIDtJ7G560Qlhy3mux11gQ7
         YTE7OaXncaNgp/pXb3Or9IoY1Qtt0EgykGMGF3dBredcQZWVg/EMyP+xSt8aAHjbAqLt
         u9BRj2icQixbqZTu0s4WOmfprcFGpBY20g5L2f3N2XZBPxEEGJ3sCCTkStzmQiWR3PFZ
         XgvQ==
X-Gm-Message-State: AO0yUKWd6uWbjoQ/zKRstK/GsLttkJZVYYsFTbqGMKBGCoVaja+9JzWe
	Vtle0Ddl052aSlGoLASK3Khb0hmZVobbXk4En3EDbQ==
X-Google-Smtp-Source: AK7set/8dZkF9X9bBui0a8/YDhasroE69GrT9hdaOkh0X5/JtAkYuEr+RTaTiSpqQUx29C7Wgt4qeA==
X-Received: by 2002:a54:4684:0:b0:384:3473:66ad with SMTP id k4-20020a544684000000b00384347366admr5857679oic.39.1678190594589;
        Tue, 07 Mar 2023 04:03:14 -0800 (PST)
Received: from ?IPV6:2804:1b3:a7c3:d849:85a1:d2e8:5a25:72e7? ([2804:1b3:a7c3:d849:85a1:d2e8:5a25:72e7])
        by smtp.gmail.com with ESMTPSA id r8-20020a0568080aa800b00383cc29d6b2sm4976238oij.51.2023.03.07.04.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 04:03:13 -0800 (PST)
Message-ID: <54b35884-f250-e212-38eb-b0604f496246@linaro.org>
Date: Tue, 7 Mar 2023 09:03:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] ARC: run child from the separate start block in
 __clone
Content-Language: en-US
To: Pavel.Kozlov@synopsys.com, libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org
References: <20230302161019.27192-1-kozlov@synopsys.com>
 <20230302161019.27192-2-kozlov@synopsys.com>
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <20230302161019.27192-2-kozlov@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_040317_342714_2E1E4B09 
X-CRM114-Status: GOOD (  14.28  )
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



On 02/03/23 13:10, Pavel Kozlov via Libc-alpha wrote:
> From: Pavel Kozlov <pavel.kozlov@synopsys.com>
> 
> For better debug experience use separate code block with extra
> cfi_* directives to run child (same as in __clone3).

LGTM, thanks.

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>

> ---
>  sysdeps/unix/sysv/linux/arc/clone.S | 40 ++++++++++++++++++-----------
>  1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/sysdeps/unix/sysv/linux/arc/clone.S b/sysdeps/unix/sysv/linux/arc/clone.S
> index 766649625658..0029aaeb8170 100644
> --- a/sysdeps/unix/sysv/linux/arc/clone.S
> +++ b/sysdeps/unix/sysv/linux/arc/clone.S
> @@ -20,9 +20,6 @@
>  #include <sysdep.h>
>  #define _ERRNO_H	1
>  #include <bits/errno.h>
> -#include <tcb-offsets.h>
> -
> -#define CLONE_SETTLS		0x00080000
>  
>  /* int clone(int (*fn)(void *), void *child_stack,
>             int flags, void *arg, ...
> @@ -63,19 +60,9 @@ ENTRY (__clone)
>  	ARC_TRAP_INSN
>  
>  	cmp	r0, 0		/* return code : 0 new process, !0 parent.  */
> +	beq	thread_start_clone
>  	blt	L (__sys_err2)	/* < 0 (signed) error.  */
> -	jnz	[blink]		/* Parent returns.  */
> -
> -	/* child jumps off to @fn with @arg as argument
> -           TP register already set by kernel.  */
> -	jl.d	[r10]
> -	mov	r0, r11
> -
> -	/* exit() with result from @fn (already in r0).  */
> -	mov	r8, __NR_exit
> -	ARC_TRAP_INSN
> -	/* In case it ever came back.  */
> -	flag	1
> +	j	[blink]		/* Parent returns.  */
>  
>  L (__sys_err):
>  	mov	r0, -EINVAL
> @@ -89,5 +76,28 @@ L (__sys_err2):
>  	       position independent.  */
>  	b   __syscall_error
>  PSEUDO_END (__clone)
> +
> +
> +	.align 4
> +	.type thread_start_clone, %function
> +thread_start_clone:
> +	cfi_startproc
> +	/* Terminate call stack by noting ra is undefined.  */
> +	cfi_undefined (blink)
> +
> +	/* Child jumps off to @fn with @arg as argument.  */
> +	jl.d	[r10]
> +	mov	r0, r11
> +
> +	/* exit() with result from @fn (already in r0).  */
> +	mov	r8, __NR_exit
> +	ARC_TRAP_INSN
> +
> +	/* In case it ever came back.  */
> +	flag	1
> +
> +	cfi_endproc
> +	.size thread_start_clone, .-thread_start_clone
> +
>  libc_hidden_def (__clone)
>  weak_alias (__clone, clone)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
