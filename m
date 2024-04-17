Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D93EC4345F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Apr 2024 02:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WwlKXSadKhT68Mq/fU58l9CQ6c7OkBClrhfUuaktn2g=; b=xkFqj+U03c91eO
	ttbwuJjlEhy6NK0ajeq8Ye0YU0VwtNDrZppUfM8/ocfCaThYoC2F+BR2hSHy+BFSCSWF1OxIRsak1
	35SV+TFxouN8SNxTSoasVuzuep07tC8AK/BdgXGAzWCRpamI+yHidLGjWSHrBUd20CWnqg9tBmhmp
	WNJOKyiLCEXPLOpIdy/mAJZrIHUL3QlIMa7yj05w/mCWBMA0uhOoxDSYeavIIm88hLjWBg1O1PdOj
	pdlA9+gUWrgQLtNH6vn0uJ4kCELx/+AKFxStNgvBkPonFB70/nnZlRABdYBnc9IPylW77y4A8Z04J
	Q3AYsjoCoE2zS52t/otQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwuti-0000000ESSI-3SjD;
	Wed, 17 Apr 2024 02:19:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwutg-0000000ESRO-0jTB
	for linux-snps-arc@lists.infradead.org;
	Wed, 17 Apr 2024 02:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8EA87CE1138;
	Wed, 17 Apr 2024 02:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D357C113CE;
	Wed, 17 Apr 2024 02:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713320376;
	bh=j7kB9fJgc9g+2BT1vi9wrK3itKid4LCQkt7eYZoFfnI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=WCkBVez3QaYI7b4NH7s0rITSAl7Ce9OrpYb/eHWHf9M+XcLW/cvY9+0d8g3+rhzxd
	 SxZBRXLSAH3umFnSj1GAXSeK2llNNXWr3vEviZzBnwz8SkORAQGsAqtI92GlLSAvDy
	 XTZfuD2gLvH6xQu8zchKaz0WWOt50wzz0ZyR0NMrBqyk3GSK4S43JlgIcgw485rqaq
	 iVWTxQt2RJkGXKIKoiUaI9UzAX8dLkB67R9VIiMIGEZkha7lw7Qxfro+c/myDmCZCP
	 87Sy8bd4be6Db6A5Yn5hUu/alypjSMfq/0tDKu9U6YdndyiJsUmA000+G6aqdmTIAh
	 GM+F6HRUHd3Og==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 32A07CE0C37; Tue, 16 Apr 2024 19:19:32 -0700 (PDT)
Date: Tue, 16 Apr 2024 19:19:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linux-sh list <linux-sh@vger.kernel.org>,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>
Subject: Re: sh: arc: cmpxchg.h:50:12: error: implicit declaration of
 function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
Message-ID: <e782ab32-6276-4947-a1ee-5864dc71dbe5@paulmck-laptop>
References: <CA+G9fYvMdqT3BFNkspktVVtVqd=en8-x3Oz1Ekfia+cceV2LHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYvMdqT3BFNkspktVVtVqd=en8-x3Oz1Ekfia+cceV2LHQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_191940_602644_518061E1 
X-CRM114-Status: GOOD (  12.98  )
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Apr 15, 2024 at 04:17:01PM +0530, Naresh Kamboju wrote:
> The arc and sh defconfig builds failed due to following build warnings / errors
> on the Linux next-20240415 with gcc-9 and gcc-11.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Following builds failed.
> sh:
> arc:
>  - defconfig
>  - tinyconfig
>  - allnoconfig
>  - vdk_hs38_smp_defconfig
> 
> Build log:
> --------
> In file included from arch/arc/include/asm/atomic.h:13,
>                  from include/linux/atomic.h:7,
>                  from include/asm-generic/bitops/lock.h:5,
>                  from arch/arc/include/asm/bitops.h:188,
>                  from include/linux/bitops.h:70,
>                  from include/linux/log2.h:12,
>                  from kernel/bounds.c:13:
> include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
> arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of
> function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
>    50 |   _prev_ = cmpxchg_emu_u8((volatile u8 *)_p_, _o_, _n_); \
>       |            ^~~~~~~~~~~~~~
> 
> Steps to reproduce:
> ---
> # tuxmake --runtime podman --target-arch arc --toolchain gcc-9
> --kconfig defconfig
> # tuxmake --runtime podman --target-arch sh --toolchain gcc-11
> --kconfig defconfig
> 
> 
> Links:
> ---
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240415/testrun/23463978/suite/build/test/gcc-9-defconfig/details/
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2f7sIl2MlKB5Fgq7JtTpYQ9lnXw/
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240415/testrun/23463981/suite/build/test/gcc-11-defconfig/details/

Thank you for testing this!  Does the following diff (to be folded into
the originals with attribution) help?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index c3833e18389f4..40101f9d88d45 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -8,6 +8,7 @@
 
 #include <linux/build_bug.h>
 #include <linux/types.h>
+#include <linux/cmpxchg-emu.h>
 
 #include <asm/barrier.h>
 #include <asm/smp.h>
diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
index 27a9040983cfe..726b3ad9c8703 100644
--- a/arch/sh/include/asm/cmpxchg.h
+++ b/arch/sh/include/asm/cmpxchg.h
@@ -9,6 +9,7 @@
 
 #include <linux/compiler.h>
 #include <linux/types.h>
+#include <linux/cmpxchg-emu.h>
 
 #if defined(CONFIG_GUSA_RB)
 #include <asm/cmpxchg-grb.h>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
