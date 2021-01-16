Return-Path: <SRS0=Q4Kc=GT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8633DC433DB
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Jan 2021 15:35:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8D9E23119
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Jan 2021 15:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8D9E23119
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2n6xa9gilfIeK8ymYFmMQkLLbhVAgeV30SRTzySWps4=; b=F/KBXt6CFx+NX4G2SLRainV1N
	l2wC8qs5hMn/NSZMWG9uJCnbfE9ZwQGkGTIfXixA1W3J1xWsY7me726vEu8yYJPux8fkgO9a/C0Yg
	mQynk2fvEkVKx8wXKONSRkD0MWd1/BOjNjdcvUhV3rTqVYoZv65GOwiF2i+cWK87faEaEv3C/jvz7
	khSY2usbfDQuEgsKeXpb0xLJ2oROIFjtMOx4/e+W9+Nu/rbQe5UjpuMt6xHFLqMX/iYcG+RoN2S4+
	n9kafiK7NR0dlRm/73AzwDCA+OzmZS+Z0m46Viw5N3zY6WG+DC4z+LZgtXGmV7fNoFah19hW3RVYU
	+3jd5h8dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0nc8-00064s-PJ; Sat, 16 Jan 2021 15:35:44 +0000
Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0nc6-00064V-R9
 for linux-snps-arc@lists.infradead.org; Sat, 16 Jan 2021 15:35:44 +0000
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1021:5979:3424:ca69])
 (Authenticated sender: yann.morin.1998)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CD2A45FFA1;
 Sat, 16 Jan 2021 16:35:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Jan 2021 16:35:29 +0100
Date: Sat, 16 Jan 2021 16:35:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH 1/4] ARC: Add support for generic HS48
 processor
Message-ID: <20210116153529.GK2375@scaer>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
 <20210115200319.4139041-2-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115200319.4139041-2-vgupta@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_103542_997468_6644C512 
X-CRM114-Status: GOOD (  18.03  )
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
Cc: buildroot@busybox.net, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Vineet, All,

On 2021-01-15 12:03 -0800, Vineet Gupta spake thusly:
> For the HS48 processor, BR currently builds with -mcpu=hs4x_rel31 which
> generates suboptimal code as it inhibits delay slot and back-back ST and so on.
> 
> Enable a new variant to build with -mcpu=hs4x for normal codegen.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  arch/Config.in.arc | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index fdfafda31c72..259d6f3ab8b9 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -39,9 +39,14 @@ config BR2_archs38_full
>  
>  config BR2_archs4x_rel31
>  	bool "ARC HS48 rel 31"
> +	help
> +	   Build for HS48 release 3.1
> +
> +config BR2_archs4x
> +	bool "ARC HS48"
>  	help
>  	   Latest release of HS48 processor
> -	   - Dual- and quad multiply and MC oprations
> +	   - Dual and Quad multiply and MAC operations
>  	   - Double-precision FPU
>  
>  endchoice
> @@ -49,7 +54,7 @@ endchoice
>  # Choice of atomic instructions presence
>  config BR2_ARC_ATOMIC_EXT
>  	bool "Atomic extension (LLOCK/SCOND instructions)"
> -	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
> +	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31 || BR2_archs4x

Those started to be rather long lines, so I split them.

>  config BR2_ARCH
>  	default "arc"	if BR2_arcle
> @@ -70,10 +75,11 @@ config BR2_GCC_TARGET_CPU
>  	default "hs38"	 if BR2_archs38_64mpy
>  	default "hs38_linux"	 if BR2_archs38_full
>  	default "hs4x_rel31"	 if BR2_archs4x_rel31
> +	default "hs4x"	 if BR2_archs4x
>  
>  config BR2_READELF_ARCH_NAME
>  	default "ARCompact"	if BR2_arc750d || BR2_arc770d
> -	default "ARCv2"		if BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
> +	default "ARCv2"		if BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31 || BR2_archs4x

Ditto.

>  choice
>  	prompt "MMU Page Size"
> @@ -93,7 +99,7 @@ choice
>  
>  config BR2_ARC_PAGE_SIZE_4K
>  	bool "4KB"
> -	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
> +	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31 || BR2_archs4x

In fact, the only variant that does not have 4K pages is 750d, so I
inverted the logic to:

    depends on !BR2_arc750d

So the lines are not too long anymore.

If the situation becones more complex than that, then we could introduce
intermediate symbols, like;

    config BR2_ARC_HAS_4K_PAGES
        bool

which could then be selected by the variants that do have it, e.g.:

    config BR2_archs4x
        bool "ARC HS48"
        select BR2_ARC_HAS_4K_PAGES

and then the 4K choice would depend on it;

    config BR2_ARC_PAGE_SIZE_4K
        bool "4KB"
        depends on BR2_ARC_HAS_4K_PAGES

I was about to do that, but if 750d is definitely the only variant to
not support those 4K or 16K pages, this would be overkill...

>  config BR2_ARC_PAGE_SIZE_8K
>  	bool "8KB"
> @@ -103,7 +109,7 @@ config BR2_ARC_PAGE_SIZE_8K
>  
>  config BR2_ARC_PAGE_SIZE_16K
>  	bool "16KB"
> -	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
> +	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31 || BR2_archs4x

Ditto.

Regards,
Yann E. MORIN.

>  endchoice
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
