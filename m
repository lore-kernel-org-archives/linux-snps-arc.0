Return-Path: <SRS0=SdQC=GP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C58C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5595423117
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5595423117
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7iPwtXHvwSyNLlgX8IzYOtQqMav3iqPAtmZr0CqOsM4=; b=oCliZ9NIJwg8lW2ObQRhGZmC5
	yTCljqdTJC27jA9xTJHHGqL3fp50zNAAjLw6Z77MyEiDVTSO8lmdokOGU5Jbj5rcYqC2lYpSQyv8E
	r1Z7jWmaIRI6TFUuBsbcwvrZzi1iJXpRdfcSD9HTOClUtHSLZcOBFpXNhaMDx4sRnDsU73koN3v68
	dpZMPUCFOZnyqYZdpkOOU20Rf9UeJkVtZZsf8oQBCf3cmChcVUVWnxYmqdRn95ZhCAVV60kNejKwH
	O3EH8890ne1BNmjARt45tttpGQ3m+dPUqM/uyeZVq1A9y19k0vX66jXiy3B1TbPRKLWt5cPB3tPOo
	X5PylJBTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJHd-0002N9-Uz; Tue, 12 Jan 2021 13:00:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJFD-00013r-3K
 for linux-snps-arc@lists.infradead.org; Tue, 12 Jan 2021 12:57:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88BFF2312B;
 Tue, 12 Jan 2021 12:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456274;
 bh=eBbR2U7dAFsZt9BIBmqw9WGdszmTO2BdNTVg/VuAMz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IW2DmJ/qREynkjCEJia1TOhfhJmHCjpNsn/f+Cl5IePGRKfz2tvu31rJUZat/0S3R
 gSxsAU/3UVECzCBA45VcMJYZNeLbSn8LBkpNGZ4JJbatEAf7lIe6SnaDID5dLoDFoM
 VtPGmJxIvUhAHse2q0LDlidW9n6MxHyLdZGKFZFXPsKOID3uXGbTwnc8yo7K63/vX6
 88xnaJN4nzvxFnyi86sMd0baKNvQcA3y7M4cGVoB9gEQgOW5Co5Sml05qhX9Neemqb
 srov/a1BFoiV364i4aLbtyXqzVcosnI6iGq01QvWopZDwB836yjzKoG4z8mPClU6TT
 dd+RdNLsqF6hQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 03/13] ARC: build: add boot_targets to PHONY
Date: Tue, 12 Jan 2021 07:57:39 -0500
Message-Id: <20210112125749.71193-3-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125749.71193-1-sashal@kernel.org>
References: <20210112125749.71193-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075755_605016_3B504C33 
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
index 1146ca5fc349b..ef5e8ea042158 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -101,6 +101,7 @@ boot		:= arch/arc/boot
 
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
