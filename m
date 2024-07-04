Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB903C30653
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jul 2024 14:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CeD8Lv++2dpldEmMugIPNXBFmJFezCr0yILFNYQG5dM=; b=RR8Cz2pPocJwRa
	dr6JJUcyz74BOIfZFHVXCMcq4FABH4B1iWy9TMT3cUUxzkByWKvsSk7hLQ/OoJPuMqov16+zW4mpP
	2khPnR8zjvT/y4pqyshfowGXVufvUS7koJJB1SJMifYTlyqInFT6c2RpOWF2El6s0qZwkvlxEH7p/
	8pSm7svqpyLqeeMsdfqmQH29lEw0Y+08TOHtuT3MgdbeyUOdk9yJGaWnrdmweSZZcXV0U6wnBBwfY
	x48HRLx9xDzf6HfltUTt5+HLBCtk9KoWTasT/4glsTkawv/LJTkEbq8Lcyt5pUU4FeCuSTSsneh9d
	mfDCbm6VC7q6zLwhGAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNax-0000000DV2v-22ub;
	Thu, 04 Jul 2024 14:37:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNaD-0000000DUW0-0nAK;
	Thu, 04 Jul 2024 14:37:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1747CCE37C3;
	Thu,  4 Jul 2024 14:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7EDC4AF0A;
	Thu,  4 Jul 2024 14:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103830;
	bh=yu+0Yh/Zm5ePXyQSzCJDqob9b5xLVBd50xsCUlcp+Tg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jCJ5MSRg/EfhLOKompm72xYCQpKFpCkF1CZUzoHMuQZ0QaeislAVx6vtv3Q/ex6Kx
	 U64M0sGfsRjq+uGzHeKJb6ExfZvsLQ1XDmrF9Vi2rDq4W/FWos3MnyA9KeUqWE/XFN
	 Zs+gjpBRB22YkZdsgGczZFfH286xWqocMP+eZ3ApM5abcFClHdWutCPIjsVHXBFn69
	 Ujnp33IRJUiOLjib+qRov9/pMXR3Jx+0PTaAnvyq55vtDAd2kwPHDkXCqI5xlavxIR
	 OtOV7z11cYDscnHB+DYPyNCMVrmrWjhEwH1OFwFmcJ4fw6YkDmmYeYspLmtqfWg2cM
	 Co1Xpmt76CttQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Christian Brauner <brauner@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 04/17] loongarch: avoid generating extra header files
Date: Thu,  4 Jul 2024 16:35:58 +0200
Message-Id: <20240704143611.2979589-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073713_720215_952089FD 
X-CRM114-Status: UNSURE (   9.80  )
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

From: Arnd Bergmann <arnd@arndb.de>

The list of generated headers is rather outdated, some of these no longer
exist, while others are already listed in include/asm-generic/Kbuild
so there is no need to list them here.

As we start validating the list of headers against the files that exist,
the outdated ones now cause a warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/loongarch/include/asm/Kbuild | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/loongarch/include/asm/Kbuild b/arch/loongarch/include/asm/Kbuild
index c862672ed953..0db5ad14f014 100644
--- a/arch/loongarch/include/asm/Kbuild
+++ b/arch/loongarch/include/asm/Kbuild
@@ -1,28 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 generated-y += orc_hash.h
 
-generic-y += dma-contiguous.h
 generic-y += mcs_spinlock.h
 generic-y += parport.h
 generic-y += early_ioremap.h
 generic-y += qrwlock.h
 generic-y += qspinlock.h
-generic-y += rwsem.h
-generic-y += segment.h
 generic-y += user.h
-generic-y += stat.h
-generic-y += fcntl.h
 generic-y += ioctl.h
-generic-y += ioctls.h
-generic-y += mman.h
-generic-y += msgbuf.h
-generic-y += sembuf.h
-generic-y += shmbuf.h
 generic-y += statfs.h
-generic-y += socket.h
-generic-y += sockios.h
-generic-y += termbits.h
-generic-y += poll.h
 generic-y += param.h
-generic-y += posix_types.h
-generic-y += resource.h
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
