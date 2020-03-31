Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BB7C2D0EE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:47:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713CC20838
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:47:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="an3foOgd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KV2LLo6x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 713CC20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGjXXaJXQUiLi565iCcG/WCZV33McAGbSk5I/MvCSKg=; b=an3foOgdJ/9w4e
	zQoMYenTdQHPRufn6wXbZYu2RF6YmflnnrvbaEweOwCoMsjneaWrDHzi5wABX4OXZIWEwM/pe1wGx
	H+PynArx9GlMjFZH3hRh1W6piTPZrwRxjRr/PUyI8VjncYgOV75jM6O+BigVfr81GiZZik0d1AgT8
	VwqRdPQgRPpxJlznHt9cy+17NDc6Ksn2cWHu2SVtHklsEM8GLirl5vIBEgo84cq35nlWGH0RCZ6oC
	7k7bsZRDVeWyCGO+F6C/NbPOuKan1sty2SbjhQwouXeR+6Gpeo165kqwVrXEwYdkzE1caBPQAvIUZ
	R471xIyK0IohKxOOFzOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJOjM-0002ET-Nv; Tue, 31 Mar 2020 21:47:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJOjJ-0002Aa-0S
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 21:47:30 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6E2F2C0F3B;
 Tue, 31 Mar 2020 21:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585691248; bh=rPmAmuuhlE/HW5naKnmZm40aHq6t5heaJ/JgXQEwwFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KV2LLo6xmqupwqmP5Yy0Vbbz8wVJlWldj9mGxeSTVIwz6JPW6E3Q5+6fuc31GTIsz
 fEoJOwfsaJ/v/YcSAgafxEs5i++wkaiVNG9R7XK8YvlWsByu7wLC6D6nvflVKaSplp
 Px/QHWPCV7FK8pWb2MEuxGqSePFQHKAClwOz93UnDbl/k7k2XtunrpiYwjF8ideCvU
 yU/lRhuXu+eXtpHxoMjxRjvhmbyHXoki9hK1J2Os1eykLsDgwu/qe1lZptvQBqo82T
 4tXbJKZJDGd+9F9i2nPqn7AQdJp5bGF00JwHsAd3lh48j5zQW+VCqssn3s8kqR/H+H
 mLVasG+i4Tyvw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id ECCF0A007B;
 Tue, 31 Mar 2020 21:47:20 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v3] Make any 32-bit time based syscalls unavailable for
 TIMESIZE==64
Date: Tue, 31 Mar 2020 14:47:17 -0700
Message-Id: <20200331214717.23902-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312183325.594-1-vgupta@synopsys.com>
References: <20200312183325.594-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_144729_101718_7FB56C55 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: Stepan Golosunov <stepan@golosunov.pp.ru>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>

An older asm-generic syscall ABI may have kernel provide 32-bit
time syscalls, so undef them to not mix 32/64 in 64-bit time regime.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
Changes since v2
  - Made x32 safe

Changes since v1
  - don't redirect these to 64-bit variants
---
 sysdeps/unix/sysv/linux/generic/sysdep.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sysdeps/unix/sysv/linux/generic/sysdep.h b/sysdeps/unix/sysv/linux/generic/sysdep.h
index 40b4b955ca1b..b83e17e1c9d1 100644
--- a/sysdeps/unix/sysv/linux/generic/sysdep.h
+++ b/sysdeps/unix/sysv/linux/generic/sysdep.h
@@ -17,6 +17,7 @@
    <https://www.gnu.org/licenses/>.  */
 
 #include <bits/wordsize.h>
+#include <bits/timesize.h>
 #include <kernel-features.h>
 #include <sysdeps/unix/sysdep.h>
 #include <sysdeps/unix/sysv/linux/sysdep.h>
@@ -25,3 +26,26 @@
 #ifdef __NR_llseek
 # define __NR__llseek __NR_llseek
 #endif
+
+#if (__TIMESIZE == 64 && __WORDSIZE == 32 \
+     && (!defined __SYSCALL_WORDSIZE || __SYSCALL_WORDSIZE == 32))
+
+/* Don't provide 32-bit time syscalls even if the kernel ABI provides
+   them (Older variants of asm-generic ABIs e.g. ARC).  */
+
+# undef __NR_futex
+# undef __NR_rt_sigtimedwait
+# undef __NR_ppoll
+# undef __NR_utimensat
+# undef __NR_pselect6
+# undef __NR_recvmmsg
+# undef __NR_semtimedop
+# undef __NR_mq_timedreceive
+# undef __NR_mq_timedsend
+# undef __NR_clock_getres
+# undef __NR_timerfd_settime
+# undef __NR_timerfd_gettime
+# undef __NR_sched_rr_get_interval
+# undef __NR_clock_adjtime
+
+#endif
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
