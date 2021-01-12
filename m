Return-Path: <SRS0=SdQC=GP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC858C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4965E2310F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4965E2310F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VaiVcugIkhksE2EBIoBXn6Sa8HJZ4ipa9pOrVPVW8Wg=; b=fiYK4KUbf6g6pMsqY377/dHhs1
	7haroMqPZvLEfcNN9fUWgXgFWEfN6IUAtMah+3WxmnTCLTP7LoNWYiHPxf8IRyLqXtgtGi/7Sm07A
	kj9VfkL68iCAxwXkR+cpTa50TGIDlFeyphUVqR3N7jk9utSmFujg9k4qs5WyA+oAFBU7Ptg48cERb
	5yUE4vbQlJTmk/Jbv8wQDYzwn3s+JUIZ4fmkniEYazZEjBUInqRMXrThLal0E5NShJzLY4YlWcrx4
	M09efXtv73zvy6Kxe0/PXUuMSO3cK1fLjKvIJQTXIGWYT57izF9tqA8kAZKz5YXfsfPYfKJTsQq0j
	xLX1lcMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJI6-0002e2-S8; Tue, 12 Jan 2021 13:00:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJFV-0001Fe-AF
 for linux-snps-arc@lists.infradead.org; Tue, 12 Jan 2021 12:58:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C05052311A;
 Tue, 12 Jan 2021 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456292;
 bh=bkzbPcHxcN/DM4HPuvrVe94k+onOrF2TMurpnbCymt4=;
 h=From:To:Cc:Subject:Date:From;
 b=ABBuPHqXnA2uwfJ8lMozhNbSalHK1XBXvQX69/hM3aYJ/EGnY30wIuLRyDYzl9cJG
 vuKnxysZPl7SkSp8xHd7FyDzjQ/8tAj8hGfhlemmCk3KYXPvXQHmo7tIKdhFc3IjM/
 Xj3dRmpByJqGcMnaRXGCKiLysU6jomD63XCaaekNTWdu0E04h1PYftUw6pcWhDjdcP
 b9hfWIAhZI/N6EuROnID1jtwy2GgsEGm2uUS1eRSGhechYWzrWvCpvmtK2uwgPW0LV
 H7AGLKvEfDX29UPPGewTIWKM/+aDk3DUijZASERLMrCFyERxk0T+mLXzWbckVWuK6P
 FRAnqF68n0YNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 1/8] ARC: build: add boot_targets to PHONY
Date: Tue, 12 Jan 2021 07:58:02 -0500
Message-Id: <20210112125810.71348-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075813_495201_1E1A7CAB 
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
index fd79faab78926..5dc2d73c64994 100644
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
