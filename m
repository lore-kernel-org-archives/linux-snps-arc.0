Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B5760A263F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Nov 2026 06:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4GXvXbXh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0HI//mr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iHLY6oNYFNA/NB9CnNW+q9RtPbqxUbu8Xkj/EdOefOE=; b=4GXvXbXhtI606kWMHdtHXBoo6c
	nJt+DHqajBsrzl8UJNpYrau3UFdcmm6Xqb/0pQlW8ZCDp6/QVdasChp5E9b7Om19vgCIqo13xBCav
	GDT+qlgHIHsZKQkvXA1nytN5msAADF4eEt9YdFbU3eqpAvnsc0EqD1jiKgnwyt5nDLDLNxKR+bZlD
	3eDQYQG8XAGo087tbWk0NAbral3EvG+nJ5aZdTNPn5gY0WjwIqlaOxM/ntYQPak//Lp4Iw1jbTHOU
	a+nqRUTNayzFsx+vOeCWDLG9DEfCW0EV2fFyGilhWodLy6L01XZxifTtSr9K/TI0PmeLeypjIXcF8
	90E/Pzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvBn-0000000AxLi-1L0p;
	Thu, 19 Nov 2026 06:00:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvBl-0000000AxKe-2w5m
	for linux-snps-arc@lists.infradead.org;
	Thu, 19 Nov 2026 06:00:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 296A961E25;
	Thu, 19 Nov 2026 06:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C4A1F000C8;
	Thu, 19 Nov 2026 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795068004;
	bh=uhvIZHMzMR8LEDCjN4KMVMcwIuHWxcvFz3+gSq5p+wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I0HI//mrpL69nBp7nOs0fZaqfwbAmU0OR7V0z4bIeviLSGYAK4m9pExNi7YHJ+YIe
	 0bsoCFSCfFuGdZUox+7HAjWN9L1C6kMJCfirjvUrz0p4YiaRQRN1TSLZjrvKpOnubU
	 IJ7aeDRLrP/p5//+Ncyfhj8TE4X2LfHrhlHtztTZ+AvPSQLt29RZA15GZKA6CbbMHO
	 LN6rhpa6l9CwhTJ21XOC1MMbWQMBvpj16XpElAj05km17QdVpI9lQkIqxpvNsGbiIu
	 pvMJ3B/itCBrQqYnmvdQ7ojdmzuPV/5k2SkYa2CURh+xrDYRHfzLKR7EV7ayGjuGgh
	 7EiGgy70pRgmA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 4/4] ARC: stop linking libgcc
Date: Wed, 18 Nov 2026 21:59:58 -0800
Message-ID: <20261119055958.1621709-5-vgupta@kernel.org>
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

With the generic lib/ versions of the shift/multiply/compare helpers,
the 32-bit divide routines (only needed without hardware div/rem) and
clz/ctz all provided by the kernel, and the 64/64 divide and floating
point routines gone, nothing in the kernel or modules resolves against
libgcc any more.

Drop it from the link so that any new dependency on it (e.g. a raw
64-bit division instead of div_u64()) shows up as a build failure
rather than silently pulling in libgcc code.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 868805ffcfea..9f34198d74a3 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -71,8 +71,6 @@ cflags-$(disable_small_data)		+= -mno-sdata
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= -mbig-endian
 ldflags-$(CONFIG_CPU_BIG_ENDIAN)	+= -EB
 
-LIBGCC	= $(shell $(CC) $(cflags-y) --print-libgcc-file-name)
-
 # Modules with short calls might break for calls into builtin-kernel
 KBUILD_CFLAGS_MODULE	+= -mlong-calls -mno-millicode
 
@@ -86,7 +84,7 @@ core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
 core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
 core-$(CONFIG_ARC_SOC_HSDK)	+= arch/arc/plat-hsdk/
 
-libs-y		+= arch/arc/lib/ $(LIBGCC)
+libs-y		+= arch/arc/lib/
 
 boot		:= arch/arc/boot
 
-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
