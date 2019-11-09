Return-Path: <SRS0=PcqJ=ZB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E130C43331
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Nov 2019 13:50:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A6002077C
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Nov 2019 13:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xna3gYRl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A6002077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJ3G//7eXzE0WMMlrnUOdXeWcCumfRTod/sj+2ZLRd8=; b=Xna3gYRly9BJtp
	MYFhpG6CHNnhMQEhEXYngMui6JUFXkzPow15mYwILDeBzGyr/bcfmIBsTggEy8o4G1w4XZtsZndKt
	u3e/8eAzubcG+LpHWe9JBkNg3jg1WIo4w/+Uy6J4fSUby/H7Z10aFV5S1EtHXusGnM9xj/Ci84nMv
	PF5JkyEGQlzxnOAIwAMdb0W+/D5DiDhT10VKhNc3sU9+U6o4NCkqmxjQk2Kmbqof3unqirEOc3eQu
	zzxYt4ryrs14b1vTnUQZiMmmGu/0Lv4vKyUd5lqBdv33iNyoa1Ts2zaeb1hSmSNIwrhepGv2wjlB/
	5Zu2yEkVQFzWXZVbqzZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTR8B-000429-VT; Sat, 09 Nov 2019 13:50:23 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTR88-00041Z-Pu
 for linux-snps-arc@lists.infradead.org; Sat, 09 Nov 2019 13:50:22 +0000
Received: from windsurf (lfbn-1-2159-45.w90-76.abo.wanadoo.fr [90.76.216.45])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7690D24000F;
 Sat,  9 Nov 2019 13:50:12 +0000 (UTC)
Date: Sat, 9 Nov 2019 14:50:11 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH 2/3] arch/config.in.arc: Introduce ARC ISA
 toggle to ease downstream toggles
Message-ID: <20191109145011.28728dbd@windsurf>
In-Reply-To: <20191108174112.28183-3-vgupta@synopsys.com>
References: <20191108174112.28183-1-vgupta@synopsys.com>
 <20191108174112.28183-3-vgupta@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4git49 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191109_055020_975027_FF28A0D6 
X-CRM114-Status: GOOD (  13.61  )
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

Hello,

On Fri,  8 Nov 2019 09:41:11 -0800
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  arch/Config.in.arc | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index 284951b82cee..dbc608db39c6 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -1,3 +1,18 @@
> +choice
> +	prompt "Target ISA"
> +	default BR2_arcompact
> +	depends on BR2_arc
> +	help
> +	    Specific ARC ISA to use
> +
> +config BR2_arcompact
> +	bool "ARCompact ISA"
> +
> +config BR2_arcv2
> +	bool "ARCv2 ISA"
> +
> +endchoice

I don't think we want a choice for that. It should simply be implied by
the target CPU selection.

So instead, do it like this:

config BR2_ARC_ARCH_ISA_ARCOMPACT
	bool

config BR2_ARC_ARCH_ISA_ARCV2
	bool

(note: the names are just a proposal, there are probably some better
names)

>  choice
>  	prompt "Target CPU"
>  	default BR2_arc770d
> @@ -7,12 +22,15 @@ choice
>  
>  config BR2_arc750d
>  	bool "ARC 750D"
> +	depends on BR2_arcompact

Replace by:

	select BR2_ARC_ARCH_ISA_ARCOMPACT

>  
>  config BR2_arc770d
>  	bool "ARC 770D"
> +	depends on BR2_arcompact

Ditto.

>  
>  config BR2_archs
>  	bool "ARC HS38"
> +	depends on BR2_arcv2

	select BR2_ARC_ARCH_ISA_ARCV2

>  	help
>  	  Generic ARC HS capable of running Linux, i.e. with MMU,
>  	  caches and 32-bit multiplier. Also it corresponds to the default
> @@ -20,6 +38,7 @@ config BR2_archs
>  
>  config BR2_archs38
>  	bool "ARC HS38 with 64-bit mpy"
> +	depends on BR2_arcv2

	select BR2_ARC_ARCH_ISA_ARCV2


>  	help
>  	  Fully featured ARC HS capable of running Linux, i.e. with MMU,
>  	  caches and 64-bit multiplier.
> @@ -29,6 +48,7 @@ config BR2_archs38
>  
>  config BR2_archs38_full
>  	bool "ARC HS38 with Quad MAC & FPU"
> +	depends on BR2_arcv2

	select BR2_ARC_ARCH_ISA_ARCV2


>  	help
>  	  Fully featured ARC HS with additional support for
>  	   - Dual- and quad multiply and MC oprations
> @@ -39,6 +59,7 @@ config BR2_archs38_full
>  
>  config BR2_archs4x_rel31
>  	bool "ARC HS48 rel 31"
> +	depends on BR2_arcv2

	select BR2_ARC_ARCH_ISA_ARCV2

>  	help
>  	   Latest release of HS48 processor
>  	   - Dual- and quad multiply and MC oprations
> @@ -72,8 +93,8 @@ config BR2_GCC_TARGET_CPU
>  	default "hs4x_rel31"	 if BR2_archs4x_rel31
>  
>  config BR2_READELF_ARCH_NAME
> -	default "ARCompact"	if BR2_arc750d || BR2_arc770d
> -	default "ARCv2"		if BR2_archs || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
> +	default "ARCompact"	if BR2_arcompact

	default "ARCompact"	if BR2_ARC_ARCH_ISA_ARCOMPACT

> +	default "ARCv2"		if BR2_arcv2

	default "ARCv2"		if BR2_ARC_ARCH_ISA_ARCV2

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
