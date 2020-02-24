Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05BBC38BE1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 18:34:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E21A20838
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 18:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fqKUA7ll";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XHKeuGEp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E21A20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=js5c/AaDao6sxO4aHWtQVFna1ooyYs7FeJQWKlKoRU0=; b=fqKUA7lln9ZATl
	vCyEkFlZ4cZ4abIjsMuMv8eTO9AlXH+QvxKLWtQrzDuM9giqcqCzqC81RPP39IePGbvacwMngMfUI
	/GwiKmg/WWVVJqdb6+1SPfW98963wWI2RXkb0PqnticxYaNio7hfK4licW/ifV9rJh9vbsBy1jdH4
	yusY4BvNwm5RJ92mIjGjB8e9yQ1Jvsgdg60uBb8IYJpUppng9T8Mik338Y5g3hydyddiZ6lhVaw+4
	2zI6IUPqoae/I/UHmU3pGI6I687R68DW7PJqlVa9OvfrmI+dgMypyIKjB5NQminHNp5ruZWLR/fWV
	1tuo1ffu5Y+mS3JP/OfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6IYk-0000g6-A5; Mon, 24 Feb 2020 18:34:26 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6IYg-0000Sp-Mt
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 18:34:24 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5973EC04D7;
 Mon, 24 Feb 2020 18:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582569261; bh=+DXCnfjaFK638fGlWaC+q6ownQXOxyuLJMqngqdt4bs=;
 h=From:To:Cc:Subject:Date:From;
 b=XHKeuGEpKfg9uey+iaxssV9uqhbiMOEX6Mdo9izMltEDiuXuKLIj3RzjYCWOF/cyQ
 iFRk4W9o2lBpzr6oyc8PGYhaPvZmjpKeMlRPAYKOAHX/el6vLOzzEM/csdfATOaOUp
 F4xwepc+IT7q4QGDHT+kzRzPF3x9XCtU+iw2N+GO9HXvVSGRLIEGGZmcjWoMr4ECty
 fKWleo9hWlSefpgqh0x5mQcM+SCtoydEgqxBZ/gIntVzQlP7+n2pXucrYhtgHEXbW6
 LXlnR6scSa17xpOx869WF8dr8pFCOfSaeCg6Qw0iyUKzBKtO4Cn0/3c8A1sW39R9wT
 MhGTB6nBRK8uA==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.26])
 by mailhost.synopsys.com (Postfix) with ESMTP id A2A6BA005E;
 Mon, 24 Feb 2020 18:34:14 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org,
	arnd@arndb.de
Subject: [PATCH] Force 64-bit time based syscalls for TIMESIZE==64 on 32-bit
 arches
Date: Mon, 24 Feb 2020 10:34:13 -0800
Message-Id: <20200224183413.13629-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_103422_782464_66962D5C 
X-CRM114-Status: UNSURE (   6.66  )
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
Cc: alistair23@gmail.com, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org, lukma@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This provides better out-of-box support for 32-bit arches with 64-bit
time_t

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/unix/sysv/linux/generic/sysdep.h | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sysdeps/unix/sysv/linux/generic/sysdep.h b/sysdeps/unix/sysv/linux/generic/sysdep.h
index 23defce7c3e1..27b0079a2a71 100644
--- a/sysdeps/unix/sysv/linux/generic/sysdep.h
+++ b/sysdeps/unix/sysv/linux/generic/sysdep.h
@@ -17,6 +17,7 @@
    <https://www.gnu.org/licenses/>.  */
 
 #include <bits/wordsize.h>
+#include <bits/timesize.h>
 #include <kernel-features.h>
 #include <sysdeps/unix/sysdep.h>
 #include <sysdeps/unix/sysv/linux/sysdep.h>
@@ -33,3 +34,50 @@
 #define __NR_pread __NR_pread64
 #define __NR_pwrite __NR_pwrite64
 #endif
+
+/* Override syscalls for asm-generic ABIs with 64-bit time.  */
+#if __WORDSIZE == 32 && __TIMESIZE == 64
+
+# undef __NR_futex
+# define __NR_futex __NR_futex_time64
+
+# undef __NR_rt_sigtimedwait
+# define __NR_rt_sigtimedwait __NR_rt_sigtimedwait_time64
+
+# undef __NR_ppoll
+# define __NR_ppoll __NR_ppoll_time64
+
+# undef __NR_utimensat
+# define __NR_utimensat __NR_utimensat_time64
+
+# undef __NR_pselect6
+# define __NR_pselect6 __NR_pselect6_time64
+
+# undef __NR_recvmmsg
+# define __NR_recvmmsg __NR_recvmmsg_time64
+
+# undef __NR_semtimedop
+# define __NR_semtimedop __NR_semtimedop_time64
+
+# undef __NR_mq_timedreceive
+# define __NR_mq_timedreceive __NR_mq_timedreceive_time64
+
+# undef __NR_mq_timedsend
+# define __NR_mq_timedsend __NR_mq_timedsend_time64
+
+# undef __NR_clock_getres
+# define __NR_clock_getres __NR_clock_getres_time64
+
+# undef __NR_timerfd_settime
+# define __NR_timerfd_settime __NR_timerfd_settime64
+
+# undef __NR_timerfd_gettime
+# define __NR_timerfd_gettime __NR_timerfd_gettime64
+
+# undef __NR_sched_rr_get_interval
+# define __NR_sched_rr_get_interval __NR_sched_rr_get_interval_time64
+
+# undef __NR_clock_adjtime
+# define __NR_clock_adjtime __NR_clock_adjtime64
+
+#endif
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
