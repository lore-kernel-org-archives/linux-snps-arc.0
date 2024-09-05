Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27433CD5BCA
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Sep 2024 14:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSVOU5vbIGFLy4Sxu+T5nWW8Wlv0pw3kh3S5W0za45c=; b=IVEaBFPH7UK/Et
	Q1lzrrCY2IWsEgi2/1+Bh2rSRLuyhBrqiQP0T7YFH1YZAVdE7y41AI4F1UFLmqCwOxHtYcIw2mqf9
	7W+S1YBhCcpBV2EhkW0/1zb3VesPSxsnTyIgbcJyIOnHf8SBmJyiVxNN9XPup8/o+KKKW5fSitxPI
	7pU79vFW7YlP44oj2voHs7phdxUuKeh6okRhc3FajXAZsumhDWfj4HmenvGxRiZn7VOWEHwhapD2L
	7o9w8MTxDiCS5BDmN4G7twLJTUqT2XYxJbWqhO9l6oM2VG+kkCZIgaY3iRBeBw45S7U+7kplI9GnG
	UQI1m67GQ3aVL29ExHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smDdP-00000008kpZ-2omt;
	Thu, 05 Sep 2024 14:38:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smDdM-00000008knj-2hTE
	for linux-snps-arc@lists.infradead.org;
	Thu, 05 Sep 2024 14:38:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72E58A44CC0;
	Thu,  5 Sep 2024 14:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0BEC4CEC3;
	Thu,  5 Sep 2024 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725547131;
	bh=vcauXydy8x37ftyhjB4duujVq1w/VunfLD6enxt17oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2YOjheRb949eFSbuKXatjy28tUv9s5L8nDgQqSRsR17dQMJ+g7E7wkszTSL9zpl5
	 oTl+nCCqjPxADrqKB+bPsOJp/UizpTcTQqyTd4neL2n6RVQk53ty0mfWT3IcffRER8
	 qxl3ktDVdKrJxSUHAssEYPPLPdSs8hB7uPIcX5NLfG+9xH+Jky46UPdfRkFOp0J7QA
	 zFRdgQyb9nO6bY7FFOjUApbFIrskY566QAcadTzw5xJq7C15ti1B0iTPLFF6cXPPVw
	 UI8TeWIaEK+rE31kEj1fNKmr59fODTo5ayUwL9UzF2f++VtPFasU2RDc+NQEQ/AoMN
	 7ja30u6a9UiYw==
Date: Thu, 5 Sep 2024 09:38:50 -0500
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 14/15] kbuild: rename CONFIG_GENERIC_BUILTIN_DTB to
 CONFIG_BUILTIN_DTB
Message-ID: <20240905143850.GD1517132-robh@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
 <20240904234803.698424-15-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904234803.698424-15-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_073852_826228_454FA2C4 
X-CRM114-Status: GOOD (  16.92  )
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

On Thu, Sep 05, 2024 at 08:47:50AM +0900, Masahiro Yamada wrote:
> Now that all architectures have migrated to the generic built-in
> DTB support, the GENERIC_ prefix is no longer necessary.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile                             | 2 +-
>  arch/arc/Kconfig                     | 2 +-
>  arch/loongarch/Kconfig               | 1 -
>  arch/microblaze/Kconfig              | 2 +-
>  arch/mips/Kconfig                    | 1 -
>  arch/nios2/platform/Kconfig.platform | 1 -
>  arch/openrisc/Kconfig                | 2 +-
>  arch/riscv/Kconfig                   | 1 -
>  arch/sh/Kconfig                      | 1 -
>  arch/xtensa/Kconfig                  | 2 +-
>  drivers/of/Kconfig                   | 2 +-
>  scripts/Makefile.vmlinux             | 2 +-
>  scripts/link-vmlinux.sh              | 2 +-
>  13 files changed, 8 insertions(+), 13 deletions(-)

> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index e1d3e5fb6fd2..70f169210b52 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -388,7 +388,6 @@ endchoice
>  config BUILTIN_DTB
>  	bool "Enable built-in dtb in kernel"
>  	depends on OF
> -	select GENERIC_BUILTIN_DTB
>  	help
>  	  Some existing systems do not provide a canonical device tree to
>  	  the kernel at boot time. Let's provide a device tree table in the

> diff --git a/arch/nios2/platform/Kconfig.platform b/arch/nios2/platform/Kconfig.platform
> index c75cadd92388..5f0cf551b5ca 100644
> --- a/arch/nios2/platform/Kconfig.platform
> +++ b/arch/nios2/platform/Kconfig.platform
> @@ -38,7 +38,6 @@ config NIOS2_DTB_PHYS_ADDR
>  config BUILTIN_DTB
>  	bool "Compile and link device tree into kernel image"
>  	depends on !COMPILE_TEST
> -	select GENERIC_BUILTIN_DTB

> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -1110,7 +1110,6 @@ config RISCV_ISA_FALLBACK
>  config BUILTIN_DTB
>  	bool "Built-in device tree"
>  	depends on OF && NONPORTABLE

Humm, maybe this NONPORTABLE option could be common and used to 
accomplish what I want here...

> -	select GENERIC_BUILTIN_DTB

> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 3b772378773f..b09019cd87d4 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -648,7 +648,6 @@ config BUILTIN_DTB
>  	bool "Use builtin DTB"
>  	default n
>  	depends on SH_DEVICE_TREE
> -	select GENERIC_BUILTIN_DTB

> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 5142e7d7fef8..53a227ca3a3c 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -2,7 +2,7 @@
>  config DTC
>  	bool
>  
> -config GENERIC_BUILTIN_DTB
> +config BUILTIN_DTB
>  	bool

I'm confused. We can't have the same config option twice, can we?

Rob

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
