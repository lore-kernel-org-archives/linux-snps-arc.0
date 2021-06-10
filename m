Return-Path: <SRS0=IYFD=LE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7BCC48BD1
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Jun 2021 23:56:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38960613CF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Jun 2021 23:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38960613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=huvkarFJM5pzsO0urfyANLqVU81FrIi6F2COnh1yEtQ=; b=GQtHSmi+KLhiHb
	Uiw/fHzZ3DqFS1scJvEB4WKcOtrj6ULzeu0Z7zyXxiGlAOS9sYZftjlJsyROCnuTBDANosOPW8v97
	CWCApkxezRpjzi/Lv/c8QA9ZdSWwtPxdyn/NItLudTOIVW8x1nxpCr6fEbFHAqKCw3oW4euK96rhb
	b7zjs4g1WU7DeyHlJ8V3K8R8/l/8l6NbWzQcmZIdBEl89XeeZBgFvk19JBBv28jhsCJFKx1Uv6w8f
	YcBoepV/Jijyf6X0DpeW4mBXG4tkLmUDT5LprFgNVQbpzOliKgZF1gyQkg7rUi2jargd0bHtuOGbp
	22J+xGLISQ5ZU8h43IVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrUXW-002zxy-L8; Thu, 10 Jun 2021 23:56:46 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrUXT-002zxW-8A
 for linux-snps-arc@lists.infradead.org; Thu, 10 Jun 2021 23:56:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id o9so1037497pgd.2
 for <linux-snps-arc@lists.infradead.org>; Thu, 10 Jun 2021 16:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lexgNWKD+GrwedYrNyIr+8VQl79Jux5mczugGGcvcEI=;
 b=kziLZY1w3m2hJfVWJOCacMUB2zEiy6reAKeMbqP4OJTDSS6u0FF9LEEFCm/YMy+iyL
 HlnQGjYdgsrVsfbWY7AR2G3zzZl1rvMjVJRWwkqhCD1NaXx+24gZPC6o5O6ejV/OBvVq
 ydOUBu/y/o1pRC0od8l0/kMfmNBidBVHxo/tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lexgNWKD+GrwedYrNyIr+8VQl79Jux5mczugGGcvcEI=;
 b=LlGk1xY4rN5YAVCxlihGRJrWQ4GS0Y22ug42ZBdveev6rLpRzpcTkHKKeAWxLvpTMw
 ozI+ZaIVW+1pHDmP0n6UB7j14aJKXPqimKSbuVH4AzIUGdG4FKfdOIcRE0ZVCDLBO2RV
 9EUhftPGA5e0y5rzpJarMRnjBAU7qd196F/3A9hdX6MDsf3YZKKWgl+Ubhedh44Px2pU
 3ODyHzHqk6bTucz7NMwKbNChG5I6pZq/k7HFS6p2C4R6z0VaeDiavt5ZfIanbs6bsezG
 4MskwkJWmA3GWnx1DoALmaBugEkiETJhsMb1QhbSk26j9tC1gPlvmsaFPNa588S9Nlmx
 /wVQ==
X-Gm-Message-State: AOAM530CoAiS0+ieYFPtat+POF/EpWdQkhHc5DtYxvsh5eRjk631WVSl
 fxRmZdzKMWKAbfbrasHHrwaAue0jJ6GABA==
X-Google-Smtp-Source: ABdhPJz8xaiotblriOaDK72bhdHZGRRJLw3W8/YM7a9jgrhttzY5ZOHMu4xhe0nUb5MrxEhTOwjIoQ==
X-Received: by 2002:a62:77d0:0:b029:2e9:a7ca:9c50 with SMTP id
 s199-20020a6277d00000b02902e9a7ca9c50mr5410193pfc.5.1623369401822; 
 Thu, 10 Jun 2021 16:56:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c21sm3311683pfi.44.2021.06.10.16.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 16:56:41 -0700 (PDT)
Date: Thu, 10 Jun 2021 16:56:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Subject: Re: [PATCH] ARC: fix CONFIG_HARDENED_USERCOPY
Message-ID: <202106101656.C79AEC493@keescook>
References: <20210609221211.2457203-1-vgupta@synopsys.com>
 <202106101001.C736237@keescook>
 <53daee07-9c5b-9cf9-f08a-524afaee762a@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53daee07-9c5b-9cf9-f08a-524afaee762a@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_165643_333850_C0590ED3 
X-CRM114-Status: GOOD (  14.73  )
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

On Thu, Jun 10, 2021 at 06:56:48PM +0000, Vineet Gupta wrote:
> On 6/10/21 10:02 AM, Kees Cook wrote:
> > On Wed, Jun 09, 2021 at 03:12:11PM -0700, Vineet Gupta wrote:
> >> Currently enabling this triggers a warning
> >>
> >> | usercopy: Kernel memory overwrite attempt detected to kernel text (offset 155633, size 11)!
> >> | usercopy: BUG: failure at mm/usercopy.c:99/usercopy_abort()!
> >> |
> >> |gcc generated __builtin_trap
> >> |Path: /bin/busybox
> >> |CPU: 0 PID: 84 Comm: init Not tainted 5.4.22
> >> |
> >> |[ECR ]: 0x00090005 => gcc generated __builtin_trap
> >> |[EFA ]: 0x9024fcaa
> >> |[BLINK ]: usercopy_abort+0x8a/0x8c
> >> |[ERET ]: memfd_fcntl+0x0/0x470
> >> |[STAT32]: 0x80080802 : IE K
> >> |BTA: 0x901ba38c SP: 0xbe161ecc FP: 0xbf9fe950
> >> |LPS: 0x90677408 LPE: 0x9067740c LPC: 0x00000000
> >> |r00: 0x0000003c r01: 0xbf0ed280 r02: 0x00000000
> >> |r03: 0xbe15fa30 r04: 0x00d2803e r05: 0x00000000
> >> |r06: 0x675d7000 r07: 0x00000000 r08: 0x675d9c00
> >> |r09: 0x00000000 r10: 0x0000035c r11: 0x61206572
> >> |r12: 0x9024fcaa r13: 0x0000000b r14: 0x0000000b
> >> |r15: 0x00000000 r16: 0x90169ffc r17: 0x90168000
> >> |r18: 0x00000000 r19: 0xbf092010 r20: 0x00000001
> >> |r21: 0x00000011 r22: 0x5ffffff1 r23: 0x90169ff1
> >> |r24: 0xbe196c00 r25: 0xbf0ed280
> >> |
> >> |Stack Trace:
> >> | memfd_fcntl+0x0/0x470
> >> | usercopy_abort+0x8a/0x8c
> >> | __check_object_size+0x10e/0x138
> >> | copy_strings+0x1f4/0x38c
> >> | __do_execve_file+0x352/0x848
> >> | EV_Trap+0xcc/0xd0
> > What was the root cause here? Was it that the init section gets freed
> > and reused for kmalloc?
> 
> Right. ARC _stext was encompassing the init section (to cover the init 
> code) so when init gets freed and used by kmalloc, 
> check_kernel_text_object() trips as it thinks the allocated pointer is 
> in kernel .text. Actually I should have added this to changelog.

Great! Yeah, if you respin it with that added, please consider it:

Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!

-- 
Kees Cook

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
