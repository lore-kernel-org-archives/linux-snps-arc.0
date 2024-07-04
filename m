Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4166C3271E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jul 2024 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sK1Fhl6pl4vRe4AULBYFxYZLLKHPH+X2nRFz5sRxfKE=; b=eU1nu0TIhwBlcP
	0Nm4BxSH/kIr62FMXfqb2uZEZvsCwVmR6ZoJbbaph7KFchRMIlIG/zJ7L084nrtc1mWc/vEeMVEnd
	BkTmRHXfNFy0mgYMJ24FYAPsIZhTMH58BHFCbbNE7llYBRpqiobp9LsBsg9atx5jHP9PHRtFhy7mW
	tWs0K4rpbWh1QXEZkvApCqzj3Wz0vcctpmWlg9FauVp0bCvpGrLcCc6MeuMPpnh4EQmhHHbnpqVFd
	Oyt/ehtsjjw10u0KGl2R+lMWNhn4UBUgfhHyEcpcJZ8Gzao+hTiR9DjIIj7HeyPsqTVnDwwXb0JTy
	IzNZ3anVpKl66frUqZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNbH-0000000DVI9-1MMQ;
	Thu, 04 Jul 2024 14:38:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNaJ-0000000DUbI-099s;
	Thu, 04 Jul 2024 14:37:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F776627AA;
	Thu,  4 Jul 2024 14:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC61C4AF0F;
	Thu,  4 Jul 2024 14:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103837;
	bh=u4YCGPtZ1hWFRjjAbr/hm2CUFSMfgKe1rJDb2sF1EEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tc/9AtSIv5Qo2uEtjpY5zLOUDy7pcNjquWveACh0n01h2HakOuJc/AssgiwDtzMFG
	 ZgsSyrktW/wag3+XshQJeRGnAyJ4fRLbul8Crgu41615xmDkZ1txy9uJu1kt3ZqCxu
	 9FaXeFUEwzz7/MNoErM4N4ka4k8xk/Mgsav3s+vqiZ38qYs9PbrDAMjpBH85H+Ffkr
	 GD3vABxdXpGiDYO2yweztXzoufQlbvApRhfsFHBib7/8oymLavFV7+s1od7ZxTthJ3
	 bKVfCD2+fNrK8GbFcGmQUA4i1IXn0Ojy+q9dFPs7sF8lEoCiZpiGSPFfjgwFJNUMUM
	 w5Dm3N4kSp2qw==
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
Subject: [PATCH 05/17] kbuild: verify asm-generic header list
Date: Thu,  4 Jul 2024 16:35:59 +0200
Message-Id: <20240704143611.2979589-6-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073719_247094_BFBD33EE 
X-CRM114-Status: GOOD (  11.57  )
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

In order to integrate the system call header generation with generating
the asm-generic wrappers, restrict the generated headers to those that
actually exist in include/asm-generic/.

The path is already known, so add these as a dependency.

The asm-generic/bugs.h header was removed in commit 61235b24b9cb ("init:
Remove check_bugs() leftovers"), which now causes a build failure, so
drop it from the list.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/asm-generic/Kbuild   | 1 -
 scripts/Makefile.asm-generic | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index b20fa25a7e8d..df7ed81c4589 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -9,7 +9,6 @@ mandatory-y += archrandom.h
 mandatory-y += barrier.h
 mandatory-y += bitops.h
 mandatory-y += bug.h
-mandatory-y += bugs.h
 mandatory-y += cacheflush.h
 mandatory-y += cfi.h
 mandatory-y += checksum.h
diff --git a/scripts/Makefile.asm-generic b/scripts/Makefile.asm-generic
index 1486abf34c7c..69434908930e 100644
--- a/scripts/Makefile.asm-generic
+++ b/scripts/Makefile.asm-generic
@@ -46,7 +46,7 @@ all: $(generic-y)
 	$(if $(unwanted),$(call cmd,remove))
 	@:
 
-$(obj)/%.h:
+$(obj)/%.h: $(srctree)/$(generic)/%.h
 	$(call cmd,wrap)
 
 # Create output directory. Skip it if at least one old header exists
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
