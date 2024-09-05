Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A04CD5BC9
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Sep 2024 15:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OtRGQSTwOzrMJmcBhoATk8S2vH90W7Y1zeQukUB7FY=; b=wLSsYCC77oIJrk
	5Yo3QEuwHKom6Vxo5DC/Pkm7kyeUG7/9D4GD9Isv9ZMVmqfhJpNrF7kJVjrfVghhqTVl0YtQ7Gjv1
	sYxPpxXoCM931iOJwPdZur+V6EpjtDFX0Wk6ijfzo4Kh8JQHcfhPgcQLmxanAs9u17kjNLkppOdzU
	we25z8WGBylsN9SdLGHRfaBVBjiNfV49XDYB255KNsuAea1Octf87Xbxf6uGv9ZgO6Xg3eFdXx1kc
	PGDffcRrCS0RPG/dCxTmMvJvalQp1BsXosNWJ/kxiZEVM4w66tSwa9qx9Gq1BxXCvCaWNxJaw73IM
	77BPY2nson/zZZHtcxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smDyv-00000008qoa-3Fvs;
	Thu, 05 Sep 2024 15:01:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smCpM-00000008aTx-2UNS
	for linux-snps-arc@bombadil.infradead.org;
	Thu, 05 Sep 2024 13:47:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CuTdjCpNUHd9setnsAQICkKH5pcy75n+8z8yw43BeXo=; b=NbNyAJquKjCacvFo2QmzxTdl6Y
	UwFgiZBGc3cI3ctPldPUjqF7dkyfBBl5Lpbu284/mFtdQRWCXQr+2eC6EqVdjQ63T40reR7Ho1Xa8
	7V1ORhlQALeDzQzwu74yiIAPBlhbCFVqtzm7i4BCY2lmKUxN8vrv+YAlQ7lh8ktZYsadTiNi7TBMB
	cdqHMATtfvf5PgM2HfvxCSeUMw4nDqIBt4U+Pyk60HHt8G9GqIlQOKOW4aEhoGTezEghl/xOkjVTe
	z43gHJY77Uguf07aswwL4CgapzAs7M1Sf3+AVwLqSrzYVO+A113m5GW5cAWytmMBfpB076m0ksLGu
	+qjfV7Bg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1smCpJ-00000000UQt-11OB
	for linux-snps-arc@lists.infradead.org;
	Thu, 05 Sep 2024 13:47:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E44D5C5CB2;
	Thu,  5 Sep 2024 13:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A2AC4CEC3;
	Thu,  5 Sep 2024 13:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725544025;
	bh=sI5y1eSjN/a3YRMxRNTDqjn+umUQqLG8Dfm4wjCbFBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hG3XYGg+PqbEtyngI9vHEb6I1j0nyAJYiHN5ILgGHvGp+2OlXYGrewuoVaVqMTf2w
	 Lrac4i91ypCHaxArChDtDfvVKJV9Rf7A7V5w9XBUM3sVb6Wo/2lqJGKD7f+byYFrW2
	 STFmhKuuciQNq4dMNXkvcJqO9fur6POG6X49W71ELClXa1rZE7uJyYCsT+1ZrDRwef
	 uZYTH9DFlfShePSHrtyT5B5gzy6SLOxa+h9JUvemcOmi3BCieaPOMlC2Fl5tFtNqpR
	 f1emNRzha4d12ghwG30AmwYtkWQmc+ShIX80S0tMxvoZCxmCAwu7T2I/K7hAsut9n5
	 3RTZ2d3yZvAEQ==
Date: Thu, 5 Sep 2024 08:47:04 -0500
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 03/15] kbuild: move non-boot builtin DTBs to .init.rodata
 section
Message-ID: <20240905134704.GB1517132-robh@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
 <20240904234803.698424-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904234803.698424-4-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_144709_623062_9428764F 
X-CRM114-Status: GOOD (  22.31  )
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

On Thu, Sep 05, 2024 at 08:47:39AM +0900, Masahiro Yamada wrote:
> Some architectures support embedding boot DTB(s) in vmlinux. These
> architectures, except MIPS and MicroBlaze, expect a single DTB in
> the .dtb.init.rodata section. MIPS embeds multiple DTBs in vmlinux.
> MicroBlaze embeds a DTB in its own __fdt_blob section instead of the
> .dtb.init.rodata section.
> 
> For example, RISC-V previously allowed embedding multiple DTBs, but
> only the first DTB in the .dtb.init.rodata section was used. Commit
> 2672031b20f6 ("riscv: dts: Move BUILTIN_DTB_SOURCE to common Kconfig")
> ensured only one boot DTB is embedded.
> 
> Meanwhile, commit 7b937cc243e5 ("of: Create of_root if no dtb provided
> by firmware") introduced another DTB into the .dtb.init.rodata section.
> 
> The symbol dump (sorted by address) for ARCH=riscv nommu_k210_defconfig
> is now as follows:
> 
>     00000000801290e0 D __dtb_start
>     00000000801290e0 D __dtb_k210_generic_begin
>     000000008012b571 D __dtb_k210_generic_end
>     000000008012b580 D __dtb_empty_root_begin
>     000000008012b5c8 D __dtb_empty_root_end
>     000000008012b5e0 D __dtb_end
> 
> The .dtb.init.rodata section contains the following two DTB files:
> 
>     arch/riscv/boot/dts/canaan/k210_generic.dtb
>     drivers/of/empty_root.dtb
> 
> This is not an immediate problem because the boot code chooses the
> first DTB, k210_generic.dtb. The second one, empty_root.dtb is ignored.
> However, relying on the link order (i.e., the order in Makefiles) is
> fragile.
> 
> Only the boot DTB should be placed in the .dtb.init.rodata because the
> arch boot code generally does not know the DT name, thus it uses the
> __dtb_start symbol to find it.
> 
> empty_root.dtb is looked up by name, so it can be moved to the generic
> .init.rodata section.
> 
> When CONFIG_OF_UNITTEST is enabled, more unittest DTBOs are embedded in
> the .dtb.init.rodata section. These are also looked up by name, so can
> be moved to the .init.rodata section.
> 
> I added the __initdata annotation to the overlay_info data array because
> modpost knows the .init.rodata section is discarded, and would otherwise
> warn about it.
> 
> The implementation is kind of cheesy; the section is .dtb.init.rodata
> under the arch/ directory, and .init.rodata section otherwise. This will
> be refactored later.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  drivers/of/unittest.c | 2 +-
>  scripts/Makefile.dtbs | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
