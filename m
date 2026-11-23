Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C87606A31A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 23 Nov 2026 00:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=shuHu6/n;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HTa7Ez/O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CuILqkB1WxD1FRS02/0KBQ9b0UT1en6HeRgVuZVZWjE=; b=shuHu6/nvb4/qviLatmqmdWP3w
	vxuH2Zuk5qmozc9NTnOWytlgCTgSnT5R6GnHw+24WZS+jZY8ZaM2ptCokTxqrDx8UYVMxq6LzZRyU
	JfkCMcEblpOWQ+SX6XQvr8hmk0OQpYFo147v1vFMJXyPKZuMXOK1X9m9XnSz4PYDO30L7UhuuhGg0
	nvEzCo4oNq2DSfYYpE6qUn8xgfD0UxR2M2lLV026gDY32QvYby43w0L6OaIs97lpqwNYgVZ2ZHDDr
	eekayF/Uw/LvBHo8dZcsZ7JkVKR29O38sJhYN149QrBYZQnKibAI+IKQdBs0QhSmpCVI12b0HKOaJ
	wQxh7Fkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVHa8-00000001wpX-0ZHn;
	Mon, 23 Nov 2026 00:06:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVHa6-00000001wpQ-0FED
	for linux-snps-arc@lists.infradead.org;
	Mon, 23 Nov 2026 00:06:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 304F96024D;
	Mon, 23 Nov 2026 00:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956871F000CA;
	Mon, 23 Nov 2026 00:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795392408;
	bh=j396iNs6n8mwHjvnju6Q3Rqztxsxxxg9N6gX1fPcUyI=;
	h=From:To:Cc:Subject:Date;
	b=HTa7Ez/O2ANZR1CPlIxy3tn13dUBUhraoG3thr+GFkL8p1uS2hcFE1xO9siRBumVt
	 KFS38JqL+LdVavVBXQ8DJKBrH2Ydqa2BOcJ2mSzWHB9Qoy5eyfLYRMJh2Uet8BW0NB
	 G9T4h1pSCZ6+ThqHWi5+5Ttq7beOH/6hDqMW6jjt3bf/eUZtdd52WzdkliBHru/j63
	 Ceq67NEcsDzTonEUvpJjs1x7wv6VqnrjJFoxSXkNOmP8xeeht4psIoVq03NFjt9KFY
	 XGnWwcbenDLHXPwkMTEYTVmqKrtnCsHc9n50dCJ6y8HyhZRxmnG44UnBtymOhzCbcg
	 DjsuI2eKHj76w==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2] ARC: stop linking libgcc
Date: Sun, 22 Nov 2026 16:06:45 -0800
Message-ID: <20261123000645.2097033-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
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

libgcc elision can break -Os builds as older gcc generate millicode
thunks: disable them with -mno-millicode.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 868805ffcfea..d8633354a47a 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -71,10 +71,12 @@ cflags-$(disable_small_data)		+= -mno-sdata
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= -mbig-endian
 ldflags-$(CONFIG_CPU_BIG_ENDIAN)	+= -EB
 
-LIBGCC	= $(shell $(CC) $(cflags-y) --print-libgcc-file-name)
+# Millicode thunks for prologue/epilogue (e.g. at -Os) live in libgcc,
+# which neither the kernel nor modules link against
+cflags-y				+= -mno-millicode
 
 # Modules with short calls might break for calls into builtin-kernel
-KBUILD_CFLAGS_MODULE	+= -mlong-calls -mno-millicode
+KBUILD_CFLAGS_MODULE	+= -mlong-calls
 
 # Finally dump eveything into kernel build system
 KBUILD_CFLAGS	+= $(cflags-y)
@@ -86,7 +88,7 @@ core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
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
