Return-Path: <SRS0=SdQC=GP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9655C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73EC023117
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73EC023117
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PfCBLJIHt9z07NoJ7a/VdKuTF8rG7aQ+H8w0bf0vWUE=; b=ZIc5AKSPRtPwLRB5c22U6Wz+EJ
	1/Mhk8F+LD795u2tEPzFlGd79FG4C4yt+UfxdYZPMteYoxTcm8uW0hqerTsk1uVCNEVIK+HSX4QHd
	F2vOmTVzoLuLkQr4XL1yGyVShFd5rh79pSONjXpzf4mD+mxi6zwdntcyqWG2uUNZ3AU5n2I5yJTpg
	ocymz9VRyRjqShAFv8WqKQ4uT4k4gg2L/kYGkezBnUDTcdf9GjrOTcOx94pScUUSwxY776BdpCGsN
	T9BygdKABsatfyqrVJKmTd43b1hTDnEeM6CUkV8IpY80TpzbMKGLTTO59cGU7Fv1rodGR4qBVVAZV
	0Ex+bLrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJHP-0002Hd-Ul; Tue, 12 Jan 2021 13:00:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJFA-00012R-NH
 for linux-snps-arc@lists.infradead.org; Tue, 12 Jan 2021 12:57:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EEA42313E;
 Tue, 12 Jan 2021 12:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456271;
 bh=pSem51RdnDaXFatIK8DqrHQsjQCa0nlot9Q/lpqOReE=;
 h=From:To:Cc:Subject:Date:From;
 b=CrQQzUcLylPLImRhQW53zdlIDwm9wOJGip5vqMeuw2sGixNnyT5ySmrRrWx+/fFpB
 HfKI5K+yC6Dh5SVgWqzGXIixjiKo2hO9NOhCabI586FA+f2Gp6Ip1ZNrbrt48QpBmV
 PG9L1u3JumfcFdinfZ2AowHCvvnhARZAdD47fo6SU/6gBlO6wgEvjPPXmQZxt/JzxC
 bh6GszSzT5PE6isxTPmIfElIG88GJ0hywINkQKF7WYXihElyzmCXq0+h8OpuWS5DNC
 4E/ODb0kdr5y8c4aYE2LGeQTiZyJuPIhmXvZiLtIp7Mrpm1FkfO/cIrKUynyTDsdeZ
 lmmvYFjadlL3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 01/13] ARC: build: remove non-existing bootpImage
 from KBUILD_IMAGE
Date: Tue, 12 Jan 2021 07:57:37 -0500
Message-Id: <20210112125749.71193-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075752_865755_A1AFFE90 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

[ Upstream commit 9836720911cfec25d3fbdead1c438bf87e0f2841 ]

The deb-pkg builds for ARCH=arc fail.

  $ export CROSS_COMPILE=<your-arc-compiler-prefix>
  $ make -s ARCH=arc defconfig
  $ make ARCH=arc bindeb-pkg
  SORTTAB vmlinux
  SYSMAP  System.map
  MODPOST Module.symvers
  make KERNELRELEASE=5.10.0-rc4 ARCH=arc KBUILD_BUILD_VERSION=2 -f ./Makefile intdeb-pkg
  sh ./scripts/package/builddeb
  cp: cannot stat 'arch/arc/boot/bootpImage': No such file or directory
  make[4]: *** [scripts/Makefile.package:87: intdeb-pkg] Error 1
  make[3]: *** [Makefile:1527: intdeb-pkg] Error 2
  make[2]: *** [debian/rules:13: binary-arch] Error 2
  dpkg-buildpackage: error: debian/rules binary subprocess returned exit status 2
  make[1]: *** [scripts/Makefile.package:83: bindeb-pkg] Error 2
  make: *** [Makefile:1527: bindeb-pkg] Error 2

The reason is obvious; arch/arc/Makefile sets $(boot)/bootpImage as
the default image, but there is no rule to build it.

Remove the meaningless KBUILD_IMAGE assignment so it will fallback
to the default vmlinux. With this change, you can build the deb package.

I removed the 'bootpImage' target as well. At best, it provides
'make bootpImage' as an alias of 'make vmlinux', but I do not see
much sense in doing so.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 2917f56f0ea43..98d31b701a97c 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -99,12 +99,6 @@ libs-y		+= arch/arc/lib/ $(LIBGCC)
 
 boot		:= arch/arc/boot
 
-#default target for make without any arguments.
-KBUILD_IMAGE	:= $(boot)/bootpImage
-
-all:	bootpImage
-bootpImage: vmlinux
-
 boot_targets += uImage uImage.bin uImage.gz
 
 $(boot_targets): vmlinux
-- 
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
