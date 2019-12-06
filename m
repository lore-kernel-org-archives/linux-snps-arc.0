Return-Path: <SRS0=Lght=Z4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1086C43603
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Dec 2019 21:26:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 719BD20659
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Dec 2019 21:26:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YIy9VbcW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 719BD20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3RkkRTuLNomy5UI/XGz+DYkpJOEC0x+LZOhd3RxgkE=; b=YIy9VbcWoFxFa/
	J4Cvy6QQAIcOTFoGeX2cM8gCsP4xIsz/aClm2UN5Pcw5eaoJuZV+G1w9CSoQYMnNvsUYrye8mYotM
	zPKow0u5YSwHN4Ec70ry/H3MQK1ERbK3+6K0i09q38ixaIQikDlozynk5/SEsXfQbCRbAcRlEjPSp
	Df7mwn7XhSFwz60+dMRYMORoAdTb8CfsMdv84QFgr9uey57nkqP+X24c8P/XOhfyfbgfZvQpqIeWr
	jLq9yLQtVEjKflXhmYMcD8P/4cKIKveei36tx1AZ51lp2IpiU/GwV48kBmTVxxqB6gDljVxMFHSyN
	aFMG/ECRY1cc1cCY2Z1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idL7C-0000ga-Iz; Fri, 06 Dec 2019 21:26:18 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idL79-0000g4-QJ
 for linux-snps-arc@lists.infradead.org; Fri, 06 Dec 2019 21:26:17 +0000
X-Originating-IP: 86.210.146.109
Received: from windsurf.home (amarseille-658-1-11-109.w86-210.abo.wanadoo.fr
 [86.210.146.109])
 (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B6FE720003;
 Fri,  6 Dec 2019 21:26:13 +0000 (UTC)
Date: Fri, 6 Dec 2019 22:26:12 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [Buildroot] [PATCH 3/3] toolchain/ARC: Enable ability to build
 with upstream gcc/binutils
Message-ID: <20191206222612.6006c8ae@windsurf.home>
In-Reply-To: <20191206193924.18777-4-vgupta@synopsys.com>
References: <20191206193924.18777-1-vgupta@synopsys.com>
 <20191206193924.18777-4-vgupta@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4git49 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_132616_123910_CA6D3458 
X-CRM114-Status: GOOD (  14.56  )
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

On Fri,  6 Dec 2019 11:39:24 -0800
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> While ARC upstream gcc/binutils work, they are still trailing behind
> the more up to date code at github. To help expedite this gap, we want
> to test the upstreeam versiosn more often, hence this patch. It allows
> ARC tools to be built of upstream gcc/binutils.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  arch/Config.in.arc              | 4 ++++
>  package/binutils/Config.in.host | 6 +++---
>  package/binutils/binutils.mk    | 2 +-
>  package/gcc/Config.in.host      | 4 ++--
>  4 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index fdfafda31c72..c389ba8b42c9 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -59,6 +59,10 @@ config BR2_arc
>  	bool
>  	default y if BR2_arcle || BR2_arceb
>  
> +config BR2_arc_gh
> +	bool "ARC github tools"
> +	default y if BR2_arc

That's not how we want to handle this.

> +
>  config BR2_ENDIAN
>  	default "LITTLE" if BR2_arcle
>  	default "BIG"	 if BR2_arceb
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index 514f620086eb..78785878cecc 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -7,8 +7,8 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
>  
>  choice
>  	prompt "Binutils Version"
> -	default BR2_BINUTILS_VERSION_2_32_X if !BR2_arc && !BR2_csky
> -	default BR2_BINUTILS_VERSION_ARC if BR2_arc
> +	default BR2_BINUTILS_VERSION_2_32_X if !BR2_arc_gh && !BR2_csky
> +	default BR2_BINUTILS_VERSION_ARC if BR2_arc_gh
>  	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
>  	help
>  	  Select the version of binutils you wish to use.
> @@ -27,7 +27,7 @@ config BR2_BINUTILS_VERSION_2_33_X
>  
>  config BR2_BINUTILS_VERSION_ARC
>  	bool "binutils arc (2.31)"
> -	depends on BR2_arc
> +	depends on BR2_arc_gh

For binutils, you can already select any upstream version, or the ARC
specific version on ARC. So there is nothing to change here: you can
already select either upstream or ARC-specific.

> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 92af40b19fc3..d9f4c6cae14b 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -2,7 +2,7 @@ comment "GCC Options"

Ditto for gcc, you can already chose any upstream gcc version >= 7.x
for ARC, or the ARC-specific version.

So, I don't understand what your patch brings: what you describe in
your commit log is already possible today.

The following defconfig is already possible with Buildroot today:

BR2_arcle=y
BR2_archs38=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_BINUTILS_VERSION_2_33_X=y
BR2_GCC_VERSION_9_X=y

It builds an ARC HS38 glibc toolchain with upstream gcc 9.x and
upstream binutils 2.33.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
