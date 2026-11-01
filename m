Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC5E606A322
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2026 01:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kYL2JodV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dMaUfqfF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rVu1v2FqzIjk11PfwH4IaH1yGzZMSLyQUcffEzBmRvE=; b=kYL2JodVRR/HuEaeeTEoascnlx
	2ut5nK5Ob7ns22sssF7OqKxSe19zKRiMCXtfSR+8Eqej/xEnhrVYkanHyATL3D8bLWx1tl5AvbnuS
	3gaC8A2qmECpYJblRN3ONJs/OJNFAJZvYAyhHoE4MDx8MPq0JVGvTyqau1s6aXW5QNPrMglrM3lU5
	kJtiXsZyltOqS3gP2bOtIeSw8czSs/lvyeVpsO7o/fBKcBkG1/qDKwCgpiKxvvOqeCah3bq1oksBX
	ECQ6B9KIZBSYWYmTsyVP95qKTyf1KPz4psBFcxRC0mZ7Ze3L8fcgTz6lFUfx2XxwLelBPX3Anlebc
	xcyaGFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNJzR-0000000DmvP-0PDL;
	Sun, 01 Nov 2026 01:04:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNJzQ-0000000DmvD-0Aki
	for linux-snps-arc@lists.infradead.org;
	Sun, 01 Nov 2026 01:04:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E060A60054;
	Sun,  1 Nov 2026 01:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCF61F000C1;
	Sun,  1 Nov 2026 01:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793495042;
	bh=VYTTSTczGEfRjwG36VgyHOdbxUJfLIKC4RqA43YT4FI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dMaUfqfFCmP2M/5asa9VfGfocDpvlcu6SRHwzVzXC/BL3wHIIK9hgIYeXm3GJDlbs
	 c0K9bYDs8skteMMZqjB2cdoaVGNOUxRIjTXG1syF3zZkjwZTV4HaPQ6zslX/CmdJHW
	 AJA9AkEhlxfRVwznhCnU4GgFT8zLcccntfgH0CFE0zdZNMjoZaZxTHHVAW8ydsMq4V
	 Kb2WLbEN2wbuPO09oS26AsJzF5r9RtsmfiTMPobH9QBcUU1T1PR3Cstk1/BLgnkruE
	 LKlyULpBXK7nNBvRkGEkZFZb1QOBWT+rDnc+QlnFqPSJ9aGAzyMondqeZri+E3VGr7
	 sm3ZllZ4g44JA==
Message-ID: <09db4d22-2836-4656-8c6a-a7e5377710fb@kernel.org>
Date: Sat, 31 Oct 2026 18:04:01 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARC: Strip libgcc debug information when generating BTF
To: Sasha Levin <sashal@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
References: <20261015154044.4058618-1-sashal@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20261015154044.4058618-1-sashal@kernel.org>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/15/26 08:40, Sasha Levin wrote:
> ARC links against the compiler's libgcc archive. The ARC GNU 2023.03
> toolchain ships this library with debug information, including complex
> floating-point types in integer arithmetic helpers such as __udivdi3.
> These types reach vmlinux even though the kernel does not use complex
> floating-point arithmetic.
>
> When floating-point BTF encoding is enabled, pahole rejects those types:
>
>    Complex, interval and imaginary float types are not supported
>    Error while encoding BTF.
>    FAILED: load BTF from .tmp_vmlinux1.BTF.1: No such file or directory
>
> KernelCI's upgrade to pahole 1.31 exposed this long-standing problem as
> failed ARC builds. As of 1.32, pahole still rejects these types, and
> older versions will stay in use, so the kernel build has to keep them
> out of vmlinux. Commit f122668ddcce ("ARC: Add eBPF JIT support")
> documented the same failure along with a workaround of disabling
> floating-point BTF encoding, but that also discards supported
> floating-point types from kernel BTF.
>
> For CONFIG_DEBUG_INFO_BTF, generate a debug-stripped copy of the selected
> libgcc archive in the output tree and link that copy. Preserve the archive
> structure so that only needed helpers are linked, and use the normal
> Kbuild objcopy rule to track input and command changes. The trade-off is
> that vmlinux in BTF-enabled builds no longer carries DWARF for the libgcc
> helpers. Debug information for kernel code, the installed toolchain and
> non-BTF builds stay unchanged.
>
> Reproduced and tested with ARC GCC 12.2.1 and pahole 1.31 and 1.32 using
> an ARCv2 tinyconfig with BPF_SYSCALL and DWARF4/BTF enabled. Before and
> after vmlinux.o files are identical after stripping debug information.
>
> Fixes: db16c1fe92d7 ("bpf: Generate BTF_KIND_FLOAT when linking vmlinux")
> Link: https://github.com/kernelci/kernelci-core/commit/e71b8c9f42253180596e734c18965a5aad80c8c5
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   arch/arc/Makefile     | 9 ++++++++-
>   arch/arc/lib/Makefile | 8 ++++++++
>   2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index 868805ffcfeab..4ea705a331c7c 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -86,7 +86,14 @@ core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
>   core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
>   core-$(CONFIG_ARC_SOC_HSDK)	+= arch/arc/plat-hsdk/
>   
> -libs-y		+= arch/arc/lib/ $(LIBGCC)
> +libs-y		+= arch/arc/lib/
> +
> +ifdef CONFIG_DEBUG_INFO_BTF
> +export LIBGCC := $(LIBGCC)
> +libs-y		+= arch/arc/lib/libgcc.a
> +else
> +libs-y		+= $(LIBGCC)
> +endif
>   
>   boot		:= arch/arc/boot
>   
> diff --git a/arch/arc/lib/Makefile b/arch/arc/lib/Makefile
> index 30158ae69fd4a..2807ee24f27e6 100644
> --- a/arch/arc/lib/Makefile
> +++ b/arch/arc/lib/Makefile
> @@ -13,3 +13,11 @@ lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs-unaligned.o
>   else
>   lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs.o
>   endif
> +
> +# libgcc can contain complex floating-point debug types unsupported by BTF.
> +# Strip only the debug information from a local copy of the selected archive.
> +always-$(CONFIG_DEBUG_INFO_BTF) += libgcc.a
> +OBJCOPYFLAGS_libgcc.a := --strip-debug
> +
> +$(obj)/libgcc.a: $(LIBGCC) FORCE
> +	$(call if_changed,objcopy)

I'm working on getting rid of libgcc linking for ARC.
This requires adding some GENERIC_LIB_* routines, but as part of that 
series I'll propose a revert of this and then the dropping the first link.
Don't intend to revert this per se, but revert just makes it cleaner.

Just FYI.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
