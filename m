Return-Path: <SRS0=IYFD=LE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4530C47094
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Jun 2021 17:03:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEDD1613DD
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Jun 2021 17:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEDD1613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzCgjaZ8aPJaB7wpUOkHzFa9NuLVh2H9uyscBMWRdq0=; b=y09KM7woRUXorx
	h670ysgGh0GwS4axsR8ouDQGUT5NgZnTo0mG1l17BTcMm6hqEyxwimiIArZXLYp+mcToJQsMaRFqB
	OxIu5RsSLAG/QVkTEcJgSCFd52Az1Kn7ZL0EehwodkplsZq0426t2O8Nxr2iN5cT1QaKI2ijk5gMK
	o9GnuTRcpHqkQLWvhIgtYUdtu5uaeSgKilMhZ63hkcv4xdCGLnp25aYWN4OtigHt1d/R1ZdiDDt5D
	aS/6dwCgZ0sCX43tAM76mf/xWnQjrx4m7hv89apeGoG/iNZaui2p/o1FX6nxnDtDLTxidMegOafYX
	deZDr+tveHDdW5AAAyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrO5d-001roO-Sh; Thu, 10 Jun 2021 17:03:33 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrO4P-001rOv-TL
 for linux-snps-arc@lists.infradead.org; Thu, 10 Jun 2021 17:02:19 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 md2-20020a17090b23c2b029016de4440381so4241635pjb.1
 for <linux-snps-arc@lists.infradead.org>; Thu, 10 Jun 2021 10:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DFno52efUHRX/mrHIdXIM5EVWDxxcdBxCPj4akxqiI4=;
 b=T34zxBzdrnXEUe75kxZbRkp8BKqAYn2Ot8WZ66CBEOeeXK6pJfW6HatSmjR7SVJTGq
 n8gVA4JejqRmjT2O2LFf9acKlBb+HuH7awYhFpOkgjAKna1zcVBguLbpu3KpghefAi6R
 REfHIVvnRWGaYfllJ1fs+Ubpx6LdKGUVCLGgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DFno52efUHRX/mrHIdXIM5EVWDxxcdBxCPj4akxqiI4=;
 b=cgDyDIDzStNT4L8amn8v28BZEjowNa/rnKFsNiok14bjZ4ooDbS5RoVB6Am5C+qt+t
 3Pwfe6iusNweaYTtk6L/AmgqW8JAv1GmEe+qPFe2zGHSPUouN4s61cjs486hB5qPOx/0
 f7Fo1f1pO2ed9ZkoNZGwr5Lzsh6TTfykwr2GlyMlcnbcdAg88Sd3UJsU/BR2g8BS3cZh
 j+JS/mrDYholch/xem3FNYlOV1c0BIh2KIoJmwCq86FdiL1xN1sDPHXsdQ+zuH5X3l/K
 X7en3CjICShzXlb+SIi44YHVIg5biX8ltQVShU/uQiK9CQOs0CxnFl46qemeYSBXf5fg
 glqg==
X-Gm-Message-State: AOAM531ZgHdD75WPfCW018ds1ZQ4RqPM9G8CQ7l97d78vhD1DzlggAym
 grpYRWZCDMIu03cDGabe8ckIgZ8JjYWCSQ==
X-Google-Smtp-Source: ABdhPJzBCZjTolox13lXzWEEStyCPpStfGYIEo9IC0Ld9oywhvQz6F3CPrQ0wrEIEwtP/0Rjhs+UrQ==
X-Received: by 2002:a17:902:ee8c:b029:fe:dc5f:564 with SMTP id
 a12-20020a170902ee8cb02900fedc5f0564mr5756641pld.71.1623344534061; 
 Thu, 10 Jun 2021 10:02:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o16sm2885105pfu.75.2021.06.10.10.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 10:02:13 -0700 (PDT)
Date: Thu, 10 Jun 2021 10:02:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Subject: Re: [PATCH] ARC: fix CONFIG_HARDENED_USERCOPY
Message-ID: <202106101001.C736237@keescook>
References: <20210609221211.2457203-1-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609221211.2457203-1-vgupta@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_100218_005466_2A66D617 
X-CRM114-Status: GOOD (  16.09  )
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

On Wed, Jun 09, 2021 at 03:12:11PM -0700, Vineet Gupta wrote:
> Currently enabling this triggers a warning
> 
> | usercopy: Kernel memory overwrite attempt detected to kernel text (offset 155633, size 11)!
> | usercopy: BUG: failure at mm/usercopy.c:99/usercopy_abort()!
> |
> |gcc generated __builtin_trap
> |Path: /bin/busybox
> |CPU: 0 PID: 84 Comm: init Not tainted 5.4.22
> |
> |[ECR ]: 0x00090005 => gcc generated __builtin_trap
> |[EFA ]: 0x9024fcaa
> |[BLINK ]: usercopy_abort+0x8a/0x8c
> |[ERET ]: memfd_fcntl+0x0/0x470
> |[STAT32]: 0x80080802 : IE K
> |BTA: 0x901ba38c SP: 0xbe161ecc FP: 0xbf9fe950
> |LPS: 0x90677408 LPE: 0x9067740c LPC: 0x00000000
> |r00: 0x0000003c r01: 0xbf0ed280 r02: 0x00000000
> |r03: 0xbe15fa30 r04: 0x00d2803e r05: 0x00000000
> |r06: 0x675d7000 r07: 0x00000000 r08: 0x675d9c00
> |r09: 0x00000000 r10: 0x0000035c r11: 0x61206572
> |r12: 0x9024fcaa r13: 0x0000000b r14: 0x0000000b
> |r15: 0x00000000 r16: 0x90169ffc r17: 0x90168000
> |r18: 0x00000000 r19: 0xbf092010 r20: 0x00000001
> |r21: 0x00000011 r22: 0x5ffffff1 r23: 0x90169ff1
> |r24: 0xbe196c00 r25: 0xbf0ed280
> |
> |Stack Trace:
> | memfd_fcntl+0x0/0x470
> | usercopy_abort+0x8a/0x8c
> | __check_object_size+0x10e/0x138
> | copy_strings+0x1f4/0x38c
> | __do_execve_file+0x352/0x848
> | EV_Trap+0xcc/0xd0

What was the root cause here? Was it that the init section gets freed
and reused for kmalloc?

> 
> Fixes: https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/15
> Reported-by: Evgeniy Didin <didin@synopsys.com>
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  arch/arc/kernel/vmlinux.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arc/kernel/vmlinux.lds.S b/arch/arc/kernel/vmlinux.lds.S
> index 33ce59d91461..e2146a8da195 100644
> --- a/arch/arc/kernel/vmlinux.lds.S
> +++ b/arch/arc/kernel/vmlinux.lds.S
> @@ -57,7 +57,6 @@ SECTIONS
>  	.init.ramfs : { INIT_RAM_FS }
>  
>  	. = ALIGN(PAGE_SIZE);
> -	_stext = .;
>  
>  	HEAD_TEXT_SECTION
>  	INIT_TEXT_SECTION(L1_CACHE_BYTES)
> @@ -83,6 +82,7 @@ SECTIONS
>  
>  	.text : {
>  		_text = .;
> +		_stext = .;
>  		TEXT_TEXT
>  		SCHED_TEXT
>  		CPUIDLE_TEXT
> -- 
> 2.25.1
> 

-- 
Kees Cook

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
