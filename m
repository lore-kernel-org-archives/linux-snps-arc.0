Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4444CD4F4A
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0TmBQ78o333wJWHWFV/NhtVzjqlg6ZHluC6I9XLQCCw=; b=O05sP2auo5Tjzi
	Z9TX7JaZXmCRgP9K3tB2C3Llyl0b6BGN8tm58E3gHowYunaaRFogvOi97KaTDKDf/k/NWu9cnyOFj
	kS24kWtwBpaZ1SYjcUyewCvsMLlgz9Hvzecsk+RQ5WGq2ff4V06OoTVGtUk9ViI2uWND+voNtINtI
	vNJqoLF/97S/4vv5vOFYg//bkmauuijmlkXqB2KYfn8glHOemBDpla4kICkNMsG4vPj9NV5Gj3+hT
	sE/GwtWFpfi7Ri/LzrEEz2buaAuYlK1D+FxaOs4LxqF5ttzwiG7GYt5xx6BrN4Dmcob99y7/E+AKp
	QUazU5WOc7xt8SshTRiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjV-00000006Ojk-1HbO;
	Wed, 04 Sep 2024 23:48:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzjR-00000006Oj9-3MZD
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA9EA5C568A;
	Wed,  4 Sep 2024 23:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43CFC4CEC2;
	Wed,  4 Sep 2024 23:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493692;
	bh=CYB/GfmJdrDKFu/H7+2VE0eaf6pWF3nzHTyM2uXXS0s=;
	h=From:To:Cc:Subject:Date:From;
	b=RT2v4k9zK9bwOPUoGHeKemzwjs6HcZHc9uadsz+sT47ccy03nMcEiNemuV+05QDFD
	 cTGu9bQ62Oro11VYbqFHWEpAJJhNwON0Eaa6SeJzAiV8VCPU4DA/9F4+ZwcbTuq7UT
	 JUpFO+Nh3cyVgUPV0sbAu7UEw7FAQ7DdwzXz72CtdnR2ehJPACjPq7LZ25gw82amWi
	 PEaHSf0ORFQBXRBlLYpi9V74RRnBI7oJ1VbspaHEbvtaPePfwUkKzjTKiFg5by4im1
	 xCG6hJb09f5Zr7/O10dE5gp7qaNG2hInuCTgD9Ol0mQ9N6vOfbd6rv97gmBNnCwRfy
	 nq95NYW9Qa1+A==
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
Subject: [PATCH 00/15] kbuild: refactor DTB build rules, introduce a generic built-in boot DTB support
Date: Thu,  5 Sep 2024 08:47:36 +0900
Message-ID: <20240904234803.698424-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164813_994708_B5E0DD38 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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


01 and 02 are kbuild cleanups.
03 and 04 parepare to wrap boot DTBs in scripts/Makefile.vmlinux.

My plan is to 05-13 to each arch ML in the next cycle, but they are included
in this patch set so that reviewers can understand what will happen in
the future.



Masahiro Yamada (15):
  kbuild: add intermediate targets for Flex/Bison in
    scripts/Makefile.host
  kbuild: split device tree build rules into scripts/Makefile.dtbs
  kbuild: move non-boot builtin DTBs to .init.rodata section
  kbuild: add generic support for built-in boot DTBs
  MIPS: migrate to generic rule for built-in DTBs
  riscv: migrate to the generic rule for built-in DTB
  LoongArch:  migrate to the generic rule for built-in DTB
  ARC: migrate to the generic rule for built-in DTB
  openrisc: migrate to the generic rule for built-in DTB
  xtensa: migrate to the generic rule for built-in DTB
  nios2: migrate to the generic rule for built-in DTB
  sh: migrate to the generic rule for built-in DTB
  microblaze: migrate to the generic rule for built-in DTB
  kbuild: rename CONFIG_GENERIC_BUILTIN_DTB to CONFIG_BUILTIN_DTB
  kbuild: use .init.rodata section unconditionally for cmd_wrap_S_dtb

 Makefile                                      |   7 +-
 arch/arc/Kconfig                              |   7 +-
 arch/arc/Makefile                             |   3 -
 arch/arc/boot/dts/Makefile                    |   9 +-
 arch/arc/configs/axs101_defconfig             |   2 +-
 arch/arc/configs/axs103_defconfig             |   2 +-
 arch/arc/configs/axs103_smp_defconfig         |   2 +-
 arch/arc/configs/haps_hs_defconfig            |   2 +-
 arch/arc/configs/haps_hs_smp_defconfig        |   2 +-
 arch/arc/configs/hsdk_defconfig               |   2 +-
 arch/arc/configs/nsim_700_defconfig           |   2 +-
 arch/arc/configs/nsimosci_defconfig           |   2 +-
 arch/arc/configs/nsimosci_hs_defconfig        |   2 +-
 arch/arc/configs/nsimosci_hs_smp_defconfig    |   2 +-
 arch/arc/configs/tb10x_defconfig              |   2 +-
 arch/arc/configs/vdk_hs38_defconfig           |   2 +-
 arch/arc/configs/vdk_hs38_smp_defconfig       |   2 +-
 arch/loongarch/Kbuild                         |   1 -
 arch/loongarch/boot/dts/Makefile              |   2 -
 arch/microblaze/Kbuild                        |   1 -
 arch/microblaze/Kconfig                       |   5 +
 arch/microblaze/boot/dts/Makefile             |   5 -
 arch/microblaze/boot/dts/linked_dtb.S         |   2 -
 arch/microblaze/kernel/vmlinux.lds.S          |   2 +-
 arch/mips/Kconfig                             |   1 +
 arch/mips/Makefile                            |   3 -
 arch/mips/boot/dts/Makefile                   |   2 -
 arch/mips/boot/dts/brcm/Makefile              |   2 -
 arch/mips/boot/dts/cavium-octeon/Makefile     |   2 -
 arch/mips/boot/dts/ingenic/Makefile           |   2 -
 arch/mips/boot/dts/lantiq/Makefile            |   2 -
 arch/mips/boot/dts/loongson/Makefile          |   2 -
 arch/mips/boot/dts/mscc/Makefile              |   3 -
 arch/mips/boot/dts/mti/Makefile               |   2 -
 arch/mips/boot/dts/pic32/Makefile             |   2 -
 arch/mips/boot/dts/ralink/Makefile            |   2 -
 arch/nios2/Kbuild                             |   2 +-
 arch/nios2/boot/dts/Makefile                  |   4 +-
 arch/nios2/kernel/prom.c                      |   2 +-
 arch/nios2/platform/Kconfig.platform          |  10 +-
 arch/openrisc/Kbuild                          |   1 -
 arch/openrisc/Kconfig                         |   3 +-
 arch/openrisc/boot/dts/Makefile               |   2 +-
 arch/openrisc/configs/or1klitex_defconfig     |   2 +-
 arch/openrisc/configs/or1ksim_defconfig       |   2 +-
 arch/openrisc/configs/simple_smp_defconfig    |   2 +-
 arch/riscv/Kbuild                             |   1 -
 arch/riscv/Kconfig                            |   2 +-
 arch/riscv/boot/dts/Makefile                  |   2 -
 arch/riscv/configs/nommu_k210_defconfig       |   2 +-
 .../riscv/configs/nommu_k210_sdcard_defconfig |   2 +-
 arch/sh/Kbuild                                |   1 -
 arch/sh/Kconfig                               |   6 +-
 arch/sh/boot/dts/Makefile                     |   2 +-
 arch/sh/kernel/setup.c                        |   4 +-
 arch/xtensa/Kbuild                            |   2 +-
 arch/xtensa/Kconfig                           |   3 +-
 arch/xtensa/boot/dts/Makefile                 |   2 +-
 arch/xtensa/configs/audio_kc705_defconfig     |   2 +-
 arch/xtensa/configs/cadence_csp_defconfig     |   2 +-
 arch/xtensa/configs/generic_kc705_defconfig   |   2 +-
 arch/xtensa/configs/nommu_kc705_defconfig     |   2 +-
 arch/xtensa/configs/smp_lx200_defconfig       |   2 +-
 arch/xtensa/configs/virt_defconfig            |   2 +-
 arch/xtensa/configs/xip_kc705_defconfig       |   2 +-
 drivers/of/Kconfig                            |   6 +
 drivers/of/fdt.c                              |   2 +-
 drivers/of/unittest.c                         |   6 +-
 scripts/Makefile.build                        |  58 +++----
 scripts/Makefile.dtbs                         | 142 ++++++++++++++++++
 scripts/Makefile.host                         |   5 +
 scripts/Makefile.lib                          | 115 --------------
 scripts/Makefile.vmlinux                      |  44 ++++++
 scripts/link-vmlinux.sh                       |   4 +
 74 files changed, 294 insertions(+), 256 deletions(-)
 delete mode 100644 arch/microblaze/boot/dts/linked_dtb.S
 create mode 100644 scripts/Makefile.dtbs

-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
