Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FDCC30653
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jul 2024 14:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuJgIky05MTgEZYYfO4+pJXXFJyZAqYUKXVFJbsxJtc=; b=c4Cl6ALBrv2ib7
	8hLIoA67P+nTsl/+uh3iuBYdSqlSLI4LXIS3zWdYLjCsHy6J0KSd+veuOfQOq9MIlg0ZOHHfielk5
	xunST3SmmzoZ7KuJv8HZoonWDbQil2BIxZ7tnZbl050DarvKql69q+MBK6KnC/5XfgxAoRrAL+rfP
	+MG1nuqz1tM9fONSgQml0bR+tjD6dbjU3A5eHfd5rHA1xe7LqQFIX139AT5JGlemInqGU+OdJPWRI
	BtoHLZzSLlo9y2HxdsbMCz9ZF+qFkc2p6zC+7615F4EJOPpwPmyjJt/PXxFPYRM+mznDxwn52DA6s
	JxEqyI8pTj8unNrx6+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNaV-0000000DUiw-3p6O;
	Thu, 04 Jul 2024 14:37:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNZw-0000000DUOQ-2AxE;
	Thu, 04 Jul 2024 14:36:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AA3D627B2;
	Thu,  4 Jul 2024 14:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F2EC3277B;
	Thu,  4 Jul 2024 14:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103815;
	bh=Hoz6/13PMjczW4hIS2TpZOmnWw/mZHnZjGM4bmj8L1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nCiIyr9LHjT5gUMAqoc6oHpgAmakmhniho62gRjn0hsAsoOu9+Sc78uaog7gP3Vud
	 j6SMlBVVZkQX2t/Nnq6MTUVEq4TxtyRnuGcjT4TVsdMjoDnx9Rt2tB4l2URlWTDoIp
	 foynXcxXtGpBNWFYhV8RBl4Sba2UQ1RB+Qd5rI775P5uqxVslaCnMOxWNDMX5M2dIU
	 N7L4dnblnsifwD8Zq28c7/BF3A8WZw+iKy8w8p6UQjtEQu42q0gBTZOvrDf3WR3paV
	 a9Ubmkxx5E1NS+6CQBfcBHmUOxKdj6Cak9qg83LEdyoo+Mo87pF1TRBvRS+B3NhvEc
	 quE1rDW6FiEEg==
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
Subject: [PATCH 02/17] csky: drop asm/gpio.h wrapper
Date: Thu,  4 Jul 2024 16:35:56 +0200
Message-Id: <20240704143611.2979589-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073656_710000_43D070F9 
X-CRM114-Status: UNSURE (   9.19  )
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

The asm/gpio.h header is gone now that all architectures just use
gpiolib, and so the redirect is no longer valid.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/include/asm/Kbuild | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/csky/include/asm/Kbuild b/arch/csky/include/asm/Kbuild
index 1117c28cb7e8..13ebc5e34360 100644
--- a/arch/csky/include/asm/Kbuild
+++ b/arch/csky/include/asm/Kbuild
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 generic-y += asm-offsets.h
 generic-y += extable.h
-generic-y += gpio.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += qrwlock.h
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
