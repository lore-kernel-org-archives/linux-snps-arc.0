Return-Path: <SRS0=SdQC=GP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF10C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 12:59:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DD4D2311A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 12:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DD4D2311A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5ZZHtQKn4pPPj2o0p2IocSmlI8uZhXTIB8lWWbfR2R4=; b=IYUcC1WIEdIy2x3EqrZWyOiYG
	GKTARvPXHLS+7vD+IbzlPjwjR/FccZhIdpQRdPtm7SVgL3OjrOFsiVram3inGFYlJTaLpkU0dE76O
	Cd1+24cnxQK8xgJ7OAL/XQk5kJCDATE7UThmuEvB7GRVPRQJ0bHglxaZZdqBlDb7RDPC0SsryL8QI
	5b5I+8L+mGPk7sKUmZZNn1pS31JTx1mTCHFAVoc3qi7w7SPww1y5aRjs3oLmHYhJYMXTnSCxrwObz
	hlb6WPO2dOSN1VcL91pOTGXDVKftgq20fZQmBHPukQLeX7PrZy1tn3DkyHUM+c2UnxTxVXzAhv8Xf
	eSm7/JUjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJGq-0001zZ-Dx; Tue, 12 Jan 2021 12:59:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJEp-0000qf-LO
 for linux-snps-arc@lists.infradead.org; Tue, 12 Jan 2021 12:57:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3340F2310F;
 Tue, 12 Jan 2021 12:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456250;
 bh=o8UI3yBkRQdprQxc+IiJ5N44niPZfN1ywHkbHW68BFE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gbX0W6bZ13RfAhRXibLWgPIbrgs3Viv+4iPxM7PvQAarRnhsl50UIX9QGVrEzk09f
 nJeIteZDpy3b/sYcwyaAFz4moxszuXLyKc951xJr4sQbpYBps7dLVOIVm9g9x8H0a5
 L9T4IOZBCun5k03fk3PboAE/9h+BoOSKAcQ+/ehpvBTVAtzO5yDiCvBsgfCoBwDrbg
 rcwRIAmjX/ehZ0fNbNTfjUIL095/pg1iMiSfDsH3EbJbZZHRWSrvIRbOd6XSfwkdIX
 Zn+XVoc4IukmT/20MmuuOj5gvJoTXDhjIwiczGBy+F9GBJCZPU3erYmaIs2yiwaJ7p
 059mlgMJz5pNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 03/16] ARC: build: add boot_targets to PHONY
Date: Tue, 12 Jan 2021 07:57:12 -0500
Message-Id: <20210112125725.71014-3-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125725.71014-1-sashal@kernel.org>
References: <20210112125725.71014-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075732_016603_121C1944 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: Sasha Levin <sashal@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 0cfccb3c04934cdef42ae26042139f16e805b5f7 ]

The top-level boot_targets (uImage and uImage.*) should be phony
targets. They just let Kbuild descend into arch/arc/boot/ and create
files there.

If a file exists in the top directory with the same name, the boot
image will not be created.

You can confirm it by the following steps:

  $ export CROSS_COMPILE=<your-arc-compiler-prefix>
  $ make -s ARCH=arc defconfig all   # vmlinux will be built
  $ touch uImage.gz
  $ make ARCH=arc uImage.gz
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  # arch/arc/boot/uImage.gz is not created

Specify the targets as PHONY to fix this.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index cbb110309ae1c..99c55f015ce86 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -93,6 +93,7 @@ boot		:= arch/arc/boot
 
 boot_targets := uImage uImage.bin uImage.gz uImage.lzma
 
+PHONY += $(boot_targets)
 $(boot_targets): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
-- 
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
