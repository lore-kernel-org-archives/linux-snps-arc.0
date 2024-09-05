Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5529ECD5BC7
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Sep 2024 14:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8mz2dcx2hpnkkGcmRr6YqvSNqrOOMKTR1biFJZ1Vs8=; b=bqTXVTDZAyCVMQ
	dB2nlrpMznicCfez3hFvLlwlzke165FuBXD5ZvnGOuUyWIBAUMdb7ZNLhHWVmb4p3fuv85IRIYpyx
	TYbcm6JE6vygjmQoKA120lNZ+T4vpviugZDpxtWC8v6FrXm4rWXBNnFFGKpFTEsarN/r52oHGhVqq
	FDBbLuW1OPgCmyKVeS/vqPAWlY+lPesi7EgT5ZkDgwm6X2dEPzWDsgtVJZ5daAtwOX0agZH9zcqjv
	LhxykpXrjEy/tfXoxL/MQg7zeQ9B3gUd85xs96Wyo/hvS4coxFfm71hhezzIoy4x1KKd8ctSz4R63
	Zy+GuqTsz60AdbrAlF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smDS0-00000008i2b-3txz;
	Thu, 05 Sep 2024 14:27:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smDIc-00000008fyL-3IeG
	for linux-snps-arc@lists.infradead.org;
	Thu, 05 Sep 2024 14:17:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73EFB5C57E0;
	Thu,  5 Sep 2024 14:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8CEC4CEC5;
	Thu,  5 Sep 2024 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725545845;
	bh=VAsU1NPVx46+oHGO/6plAI5dIfBi0YcOt0DaaDbKjLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFlSoz8rkTTbo6bRypczPyDGNTAdcHGaNe4+ud1iEdvPScL5zsY6gXuQwI6CvpKrf
	 kb4ihMVDldhscSSsfHbmhoH/PWpMTKph+bqm6rpV5JhbXLyJsaKdgKQ2SY6GOkOv+V
	 jbhcXI0cJlzZlU930yYV0HyVmXnTQgBECu8rdgv1h1q1pENqG3MNrEk6YDvB8mzSOM
	 o6wcO2ZrgYztEMzYZbC5na7z7I4/F+VeCGjxgN9Li2p7NzDtlgOZ5M1rr5RGK94SKB
	 l2ETcB3SXFO01fzOF5U6dc9ITgDjmzWK9zC6yK8p1DOG30XqDsBBbrvDE4t9gCYr5F
	 kHF1NRLmB71LA==
Date: Thu, 5 Sep 2024 09:17:23 -0500
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 04/15] kbuild: add generic support for built-in boot DTBs
Message-ID: <20240905141723.GC1517132-robh@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
 <20240904234803.698424-5-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904234803.698424-5-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_071726_981936_CC00EFA4 
X-CRM114-Status: GOOD (  30.72  )
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

On Thu, Sep 05, 2024 at 08:47:40AM +0900, Masahiro Yamada wrote:
> Some architectures embed boot DTBs in vmlinux. A potential issue for
> these architectures is a race condition during parallel builds because
> Kbuild descends into arch/*/boot/dts/ twice.
> 
> One build thread is initiated by the 'dtbs' target, which is a
> prerequisite of the 'all' target in the top-level Makefile:
> 
>   ifdef CONFIG_OF_EARLY_FLATTREE
>   all: dtbs
>   endif
> 
> For architectures that support the embedded boot dtb, arch/*/boot/dts/
> is visited also during the ordinary directory traversal in order to
> build obj-y objects that wrap DTBs.
> 
> Since these build threads are unaware of each other, they can run
> simultaneously during parallel builds.
> 
> This commit introduces a generic build rule to scripts/Makefile.vmlinux
> to support embedded boot DTBs in a race-free way. Architectures that
> want to use this rule need to select CONFIG_GENERIC_BUILTIN_DTB.
> 
> After the migration, Makefiles under arch/*/boot/dts/ will be visited
> only once to build only *.dtb files.
> 
> This change also aims to unify the CONFIG options used for embedded DTBs
> support. Currently, different architectures use different CONFIG options
> for the same purposes.
> 
> The CONFIG options are unified as follows:
> 
>  - CONFIG_GENERIC_BUILTIN_DTB
> 
>    This enables the generic rule for embedded boot DTBs. This will be
>    renamed to CONFIG_BUILTIN_DTB after all architectures migrate to the
>    generic rule.
> 
>  - CONFIG_BUILTIN_DTB_NAME
> 
>    This specifies the path to the embedded DTB.
>    (relative to arch/*/boot/dts/)
> 
>  - CONFIG_BUILTIN_DTB_ALL
> 
>    If this is enabled, all DTB files compiled under arch/*/boot/dts/ are
>    embedded into vmlinux. Only used by MIPS.

I started to do this a long time ago, but then decided we didn't want to 
encourage this feature. IMO it should only be for legacy bootloaders or 
development/debug. And really, appended DTB is more flexible for the 
legacy bootloader case.

In hindsight, a common config would have been easier to limit new 
arches...

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile                 |  7 ++++++-
>  drivers/of/Kconfig       |  6 ++++++
>  scripts/Makefile.vmlinux | 44 ++++++++++++++++++++++++++++++++++++++++
>  scripts/link-vmlinux.sh  |  4 ++++
>  4 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 145112bf281a..1c765c12ab9e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1417,6 +1417,10 @@ ifdef CONFIG_OF_EARLY_FLATTREE
>  all: dtbs
>  endif
>  
> +ifdef CONFIG_GENERIC_BUILTIN_DTB
> +vmlinux: dtbs
> +endif
> +
>  endif
>  
>  PHONY += scripts_dtc
> @@ -1483,7 +1487,8 @@ endif # CONFIG_MODULES
>  CLEAN_FILES += vmlinux.symvers modules-only.symvers \
>  	       modules.builtin modules.builtin.modinfo modules.nsdeps \
>  	       compile_commands.json rust/test \
> -	       rust-project.json .vmlinux.objs .vmlinux.export.c
> +	       rust-project.json .vmlinux.objs .vmlinux.export.c \
> +               .builtin-dtbs-list .builtin-dtb.S
>  
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES += include/config include/generated          \
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index dd726c7056bf..5142e7d7fef8 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -2,6 +2,12 @@
>  config DTC
>  	bool
>  
> +config GENERIC_BUILTIN_DTB
> +	bool

So that we don't add new architectures to this, I would like something 
like:

# Do not add new architectures to this list
depends on MIPS || RISCV || MICROBLAZE ...

Yes, it's kind of odd since the arch selects the option...

For sure, we don't want this option on arm64. For that, I can rely on 
Will and Catalin rejecting a select, but on some new arch I can't.

> +
> +config BUILTIN_DTB_ALL
> +	bool

Can this be limited to MIPS?

> +
>  menuconfig OF
>  	bool "Device Tree and Open Firmware support"
>  	help
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 5ceecbed31eb..4626b472da49 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -17,6 +17,50 @@ quiet_cmd_cc_o_c = CC      $@
>  %.o: %.c FORCE
>  	$(call if_changed_dep,cc_o_c)
>  
> +quiet_cmd_as_o_S = AS      $@
> +      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $<
> +
> +%.o: %.S FORCE
> +	$(call if_changed_dep,as_o_S)
> +
> +# Built-in dtb
> +# ---------------------------------------------------------------------------
> +
> +quiet_cmd_wrap_dtbs = WRAP    $@
> +      cmd_wrap_dtbs = {							\
> +	echo '\#include <asm-generic/vmlinux.lds.h>';			\
> +	echo '.section .dtb.init.rodata,"a"';				\
> +	while read dtb; do						\
> +		symbase=__dtb_$$(basename -s .dtb "$${dtb}" | tr - _);	\
> +		echo '.balign STRUCT_ALIGNMENT';			\

Is this always guaranteed to be at least 8 bytes? That's the required 
alignment for dtbs and assumed by libfdt.

> +		echo ".global $${symbase}_begin";			\
> +		echo "$${symbase}_begin:";				\
> +		echo '.incbin "'$$dtb'" ';				\
> +		echo ".global $${symbase}_end";				\
> +		echo "$${symbase}_end:";				\
> +	done < $<;							\
> +	} > $@

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
