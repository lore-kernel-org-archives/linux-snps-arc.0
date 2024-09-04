Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFE5CD4F4D
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2gBtN7sGRWr1f29HOQIP36R6Rfx96YqVhtRAMBNPcM=; b=MZPN4Q9qzeuGgh
	7C3W2xkuGmIS/Y0zh40dKuOmrcJddubRTwSxx30wJW2LeWJjd4zyToaTWJtnk4XRjpzlpNorIgKNp
	mGd1eSlKTIzPBh3itmUgKzsMjhzBV1nfyDMg17LbVwjx/IGTP11VWk3LT8ooFwckzPemo56dg2TC4
	Z1Ednbzsr7gZui1zXxcflTsiMOhfCc7jWZWmi3eQWi3yyhInkmXDT1epb+5Bp/NQ5Ji2i2zciJHqz
	3E8lbYXJsPLIiKyY6idwKGFzdWs0SBQ76C/KyGjf1jDGM7QGNENvIM2JOoVEtlb1++2UvIgOs/Suv
	slA26zbP4S5RKkrQ0u+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjb-00000006OmV-3CVQ;
	Wed, 04 Sep 2024 23:48:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjZ-00000006Ol5-2FMN
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AEC85C5924;
	Wed,  4 Sep 2024 23:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AE1C4CECA;
	Wed,  4 Sep 2024 23:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493700;
	bh=i8mV+tLCUsiRlMheHxr5JXcHpK1KBT9MA15Lx4XtwsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p01iU+/DYZkCBKD+GyQL6lhOUiwSAj3Q1p6CnM5OK22KlkOrax1RJmnOt6LB+Apcp
	 bBsoAvnElMn/98XgiSLlemsa6C5HW/rv7FKWbV6kl3CK0ePwXVTZbjoL/ze9Fw35XS
	 ZEREPhLP5y69C6m0zSQK869zMAs82s9olIqLjlw/pJOMh0mG/dVnu2rGBGfLFYt3UN
	 tI68kjCfCFD7m+fooNeuc9s8i0JX+k92EzrAa6o2Xd3XrtR0rJmnaR2F8AwHwjQfny
	 HMsXX52wEpzDPlUyGWF3q+UPziBedRSvRDFKfyH8H63HLv61KQxdKOEhJkAhmGjAWC
	 HCCTVgsTH+96w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 03/15] kbuild: move non-boot builtin DTBs to .init.rodata section
Date: Thu,  5 Sep 2024 08:47:39 +0900
Message-ID: <20240904234803.698424-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164821_822864_1D4FAB65 
X-CRM114-Status: GOOD (  16.89  )
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

Some architectures support embedding boot DTB(s) in vmlinux. These
architectures, except MIPS and MicroBlaze, expect a single DTB in
the .dtb.init.rodata section. MIPS embeds multiple DTBs in vmlinux.
MicroBlaze embeds a DTB in its own __fdt_blob section instead of the
.dtb.init.rodata section.

For example, RISC-V previously allowed embedding multiple DTBs, but
only the first DTB in the .dtb.init.rodata section was used. Commit
2672031b20f6 ("riscv: dts: Move BUILTIN_DTB_SOURCE to common Kconfig")
ensured only one boot DTB is embedded.

Meanwhile, commit 7b937cc243e5 ("of: Create of_root if no dtb provided
by firmware") introduced another DTB into the .dtb.init.rodata section.

The symbol dump (sorted by address) for ARCH=riscv nommu_k210_defconfig
is now as follows:

    00000000801290e0 D __dtb_start
    00000000801290e0 D __dtb_k210_generic_begin
    000000008012b571 D __dtb_k210_generic_end
    000000008012b580 D __dtb_empty_root_begin
    000000008012b5c8 D __dtb_empty_root_end
    000000008012b5e0 D __dtb_end

The .dtb.init.rodata section contains the following two DTB files:

    arch/riscv/boot/dts/canaan/k210_generic.dtb
    drivers/of/empty_root.dtb

This is not an immediate problem because the boot code chooses the
first DTB, k210_generic.dtb. The second one, empty_root.dtb is ignored.
However, relying on the link order (i.e., the order in Makefiles) is
fragile.

Only the boot DTB should be placed in the .dtb.init.rodata because the
arch boot code generally does not know the DT name, thus it uses the
__dtb_start symbol to find it.

empty_root.dtb is looked up by name, so it can be moved to the generic
.init.rodata section.

When CONFIG_OF_UNITTEST is enabled, more unittest DTBOs are embedded in
the .dtb.init.rodata section. These are also looked up by name, so can
be moved to the .init.rodata section.

I added the __initdata annotation to the overlay_info data array because
modpost knows the .init.rodata section is discarded, and would otherwise
warn about it.

The implementation is kind of cheesy; the section is .dtb.init.rodata
under the arch/ directory, and .init.rodata section otherwise. This will
be refactored later.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/of/unittest.c | 2 +-
 scripts/Makefile.dtbs | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index fd8cb931b1cc..f5d18ae01c90 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3585,7 +3585,7 @@ OVERLAY_INFO_EXTERN(overlay_bad_symbol);
 OVERLAY_INFO_EXTERN(overlay_bad_unresolved);
 
 /* entries found by name */
-static struct overlay_info overlays[] = {
+static __initdata struct overlay_info overlays[] = {
 	OVERLAY_INFO(overlay_base, -9999, 0),
 	OVERLAY_INFO(overlay, 0, 0),
 	OVERLAY_INFO(overlay_0, 0, 0),
diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 46009d5f1486..55998b878e54 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -34,12 +34,14 @@ $(obj)/dtbs-list: $(dtb-y) FORCE
 # Assembly file to wrap dtb(o)
 # ---------------------------------------------------------------------------
 
+builtin-dtb-section = $(if $(filter arch/%, $(obj)),.dtb.init.rodata,.init.rodata)
+
 # Generate an assembly file to wrap the output of the device tree compiler
 quiet_cmd_wrap_S_dtb = WRAP    $@
       cmd_wrap_S_dtb = {								\
 		symbase=__$(patsubst .%,%,$(suffix $<))_$(subst -,_,$(notdir $*));	\
 		echo '\#include <asm-generic/vmlinux.lds.h>';				\
-		echo '.section .dtb.init.rodata,"a"';					\
+		echo '.section $(builtin-dtb-section),"a"';				\
 		echo '.balign STRUCT_ALIGNMENT';					\
 		echo ".global $${symbase}_begin";					\
 		echo "$${symbase}_begin:";						\
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
