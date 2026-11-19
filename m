Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5C6606A32C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Nov 2026 06:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XdGOjnDY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWv3kH2W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nNwfH4l4lHAwhCyaJs99dP472zRov2yA2CnAV3NYhoA=; b=XdGOjnDY8bA6CFMEkIx3KVa0/F
	460WRVRL/GfuSoO09Ad6K06nALPmiAI581Dto73Rx5qLKGcWnJrMw5iEiYEG7srEEEuGqr7++LyZl
	TF0EmYRF4zswxUaF8aESGf4jtAdYOxvH4oPauiGVZ8o5WfzLPSAmiLXCNmekVmnU+Fr7GFvctEzBg
	sdqc3PdiIslrbXh6Vto1NPUrEC5kbSwESJF9cH5RyUbt3Z1qzgLVDViE6oOKbbkVOu2+Gkf89lF3W
	0GzAcj95ti5LYgzL6nQJfp6PMbRJ6JxZPJgMmkeACFMOVuYl7LjpWZsjRk/P23vsU2udVVilwEPAV
	67Qz8mvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvBn-0000000AxLt-1W9L;
	Thu, 19 Nov 2026 06:00:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvBm-0000000AxKG-0Lhg
	for linux-snps-arc@lists.infradead.org;
	Thu, 19 Nov 2026 06:00:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B312162147;
	Thu, 19 Nov 2026 06:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5601F000CA;
	Thu, 19 Nov 2026 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795068004;
	bh=kuhk+mB3UN8TnKb2oXuI2U8lqT5dSWUKA9kFr3P8Umc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hWv3kH2W4TVguDWJ7xj57brSEj8AVcfF/sQttbqifokFZJLK5ZoUBSMe83j7eB0L7
	 JiNEVVnTS3mRnPtpB++dRiPLDDJzI+87ol58IpRDobkxQWKSykl49WxFrdIDqWGNle
	 Kmbi5kWcgkLX4RwoP3g/uBR0DgVsOj7pMIv+EBTG8Zue4xPYbS8T+xthZHvesKSPH4
	 kHGteTtNiiFmsRsc0bxWXHoFPNCPZrN9yYDLnJbTujP3YgF5VJ0zVxnT3zfMzLHTFX
	 GRa2AU6T7ZzAvlgwqofBazQU0uEIepRhKo5IQ8ttzIOeHMG0iX4Uuxxd2kl9faV2Vz
	 8drrzo1KD1cQA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 3/4] Revert "ARC: Strip libgcc debug information when generating BTF"
Date: Wed, 18 Nov 2026 21:59:57 -0800
Message-ID: <20261119055958.1621709-4-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119055958.1621709-1-vgupta@kernel.org>
References: <20261119055958.1621709-1-vgupta@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This reverts commit ca201ad6e92a1924138e83ff966f7a091e3bbe6e.

This is in preparation of libgcc dependency removal.
And its better then deleteing those bits anyways.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Makefile     | 9 +--------
 arch/arc/lib/Makefile | 8 --------
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 4ea705a331c7..868805ffcfea 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -86,14 +86,7 @@ core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
 core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
 core-$(CONFIG_ARC_SOC_HSDK)	+= arch/arc/plat-hsdk/
 
-libs-y		+= arch/arc/lib/
-
-ifdef CONFIG_DEBUG_INFO_BTF
-export LIBGCC := $(LIBGCC)
-libs-y		+= arch/arc/lib/libgcc.a
-else
-libs-y		+= $(LIBGCC)
-endif
+libs-y		+= arch/arc/lib/ $(LIBGCC)
 
 boot		:= arch/arc/boot
 
diff --git a/arch/arc/lib/Makefile b/arch/arc/lib/Makefile
index 2807ee24f27e..30158ae69fd4 100644
--- a/arch/arc/lib/Makefile
+++ b/arch/arc/lib/Makefile
@@ -13,11 +13,3 @@ lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs-unaligned.o
 else
 lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs.o
 endif
-
-# libgcc can contain complex floating-point debug types unsupported by BTF.
-# Strip only the debug information from a local copy of the selected archive.
-always-$(CONFIG_DEBUG_INFO_BTF) += libgcc.a
-OBJCOPYFLAGS_libgcc.a := --strip-debug
-
-$(obj)/libgcc.a: $(LIBGCC) FORCE
-	$(call if_changed,objcopy)
-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
