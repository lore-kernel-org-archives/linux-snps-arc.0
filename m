Return-Path: <SRS0=SdQC=GP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7AAC433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 13:01:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2022310F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 13:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D2022310F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uIBFWqgd/NQMe2zJxMQluTrQzE9UBDNW8Ad/fiPiacs=; b=g15tRR1tHPZuIfCna3A+E4/MWr
	zZW6FI49UEYaUOeG+KEGCszh3YMqaEmcYC50dTzpVkvpeAwOIWoKttv6XV2DG1Q9b0EUhmVFpUal2
	6cIzgd4rlVCAu5tS2U+hRLAPJLyeph0xAwpx808MBAHY91oGy99L9Hggf2MbMryR/rvyEZRyc+CzN
	ctAt9KSZDM0Ismtb8GPaXrUecchvR97V2YCLQWRoWu/CbZ5iDTWF44oGEmJ+YydCzhg7pkHniqbWU
	MykODbkkmRUdNAqA9VFWio1gYG/Mzk3MVz8OL6UdUQSckzXdoC0IlQMFapILw0EpMnlguYw3g3Psl
	V9ClBlpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJIp-0002zt-0V; Tue, 12 Jan 2021 13:01:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJFj-0001Ni-0K
 for linux-snps-arc@lists.infradead.org; Tue, 12 Jan 2021 12:58:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D078123117;
 Tue, 12 Jan 2021 12:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456305;
 bh=eTOgMSs1N1PxgfxMoj1wYstzx8Qpt5KjBgDBV0XfFRs=;
 h=From:To:Cc:Subject:Date:From;
 b=s3WjL2OXVmKm3tBabmYY+rJVYlltoMdXt1WNCffLR5eHwSJw4raa4e2cVPN4oT3ZR
 rrGGhUmEll1kHZBKqATTjZP0hUwsCs8G20mvLg9CcLuirVCaA9w5uVIkJS9puJvnDF
 2QxDB+AmQ4/alsidr/VA7H91VhRQzb8stVJVeazyGBJ/H1isoxE3bB9dlSrkA9mhSn
 mYl8grMCt7Fj4vkFAWluErHAjo8+gPnXaV/J+NqAM/puqmN2a8wZ5VXWzBmZV/qJFC
 xDYfjjpn8kW/uVje7d39kv5L7dW4TzCHehrSZKSBujQXL7Waux1uAt8jYHgnX7itId
 2+BPWE+F3GOKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 1/8] ARC: build: add boot_targets to PHONY
Date: Tue, 12 Jan 2021 07:58:16 -0500
Message-Id: <20210112125823.71463-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075827_356829_B618AD23 
X-CRM114-Status: GOOD (  10.59  )
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
index 8f8d53f08141d..150656503c117 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -108,6 +108,7 @@ bootpImage: vmlinux
 
 boot_targets += uImage uImage.bin uImage.gz
 
+PHONY += $(boot_targets)
 $(boot_targets): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
-- 
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
