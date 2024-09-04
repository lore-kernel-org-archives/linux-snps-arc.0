Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6EDCD4F4A
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 23:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sCdGPOjk886PYuUHHW+tYRttbI392vxaiGcQO/h+7U=; b=XHGrIRK5Ux4t/4
	uqgIrD+cyzHvB5Ivm0DuDKfAcRO+E8HKrE15V/TCypALApAFJX4ii9J443L7n1hlI12rybNQmsO2y
	zvoelv6QoBPBVAk21AoWB5bniFf7mH2lvi1FtKZ1HUxLXq80mWVIaxdwuPAbrjDn+jTDCf0x/mX+Q
	FZBgnF7dz6wjdaO4241mgHHMFFOUMIIekMUatK3gTZWksnmG6ICCGn/zP2fvJnutE7ED3l33Xy06r
	HeT4csyKDYaher5XJ7rDM6F++NRVlVPnKpRBoAh5f9VwaxAR9iXPRJBmlws2iEG8nyatUW+ttzcSh
	7EhG1bJ+pcsDyREUZg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzk9-00000006P36-21ey;
	Wed, 04 Sep 2024 23:48:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slzk6-00000006P1c-1cYX
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Sep 2024 23:48:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53BE85C58A0;
	Wed,  4 Sep 2024 23:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF2BC4CECA;
	Wed,  4 Sep 2024 23:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725493733;
	bh=X36d1ZLy2VkgrLWOHRLYke7ZNl3jahnWeNpcJovYays=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y2gZoLH9QReVU2beUb37eQb86PpeBHhfuYh04yM6PcStHc5a1MJwX5bzTQip8QgIN
	 ThrZWo14eLlz72zPRNBf3CdFCnWWPvsoj7JrcDEd8MKK+uxKs1Gw7qXJMOWhXSwltr
	 9kEyPolldAhCurBcGOMorBnW0BLlhb2kEEAjjoDuSIJJ5ZfEIbYts6DnDX6nw31jA1
	 oezNgGSlDQtJdZCd0txWWcWX5wKt0e1/2xwyTczUJV2NA0hKXcts35xX4SFK6oi0iw
	 fONr6eZWZE7gL3WL+5tAWFKpZbcHjqNPH+JzGOWALncjhVORNz+4mxqqXlDqVoKZHU
	 mnHKIm6R+pFZA==
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
Subject: [PATCH 15/15] kbuild: use .init.rodata section unconditionally for cmd_wrap_S_dtb
Date: Thu,  5 Sep 2024 08:47:51 +0900
Message-ID: <20240904234803.698424-16-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904234803.698424-1-masahiroy@kernel.org>
References: <20240904234803.698424-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_164854_497254_F7761B03 
X-CRM114-Status: UNSURE (   9.36  )
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

Boot DTBs are now wrapped and compiled in scripts/Makefile.vmlinux.

The cmd_wrap_S_dtb rule in scripts/Makefile.dtbs is now only used
for generic purposes, so the .init.rodata section should be used
unconditionally.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.dtbs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 55998b878e54..436bfea85bb9 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -34,14 +34,12 @@ $(obj)/dtbs-list: $(dtb-y) FORCE
 # Assembly file to wrap dtb(o)
 # ---------------------------------------------------------------------------
 
-builtin-dtb-section = $(if $(filter arch/%, $(obj)),.dtb.init.rodata,.init.rodata)
-
 # Generate an assembly file to wrap the output of the device tree compiler
 quiet_cmd_wrap_S_dtb = WRAP    $@
       cmd_wrap_S_dtb = {								\
 		symbase=__$(patsubst .%,%,$(suffix $<))_$(subst -,_,$(notdir $*));	\
 		echo '\#include <asm-generic/vmlinux.lds.h>';				\
-		echo '.section $(builtin-dtb-section),"a"';				\
+		echo '.section .init.rodata,"a"';					\
 		echo '.balign STRUCT_ALIGNMENT';					\
 		echo ".global $${symbase}_begin";					\
 		echo "$${symbase}_begin:";						\
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
