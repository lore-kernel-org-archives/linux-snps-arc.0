Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04282C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:32:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C46B12080C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 21:32:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cue7+dOh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="V5TtnJPx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C46B12080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6RgWeSgeY4msBhlujHJgPbZUJKzG4yhRdxkC9LH23A=; b=Cue7+dOh9Zmj89
	4KjDwWWgw7rPkATRwEh4zL/DXiDJ2z6djA3Cjc/x7daHJe70gb3F2HHWpJpJsl5T8vk+OROPi4Uy8
	bX/SCE0k0oHwVG66wkiPUofI5LcE66iMGBGiXGz8zE/nMAXPsB8Q3dtLdEkHAwDr53+VXH+94i00g
	H3lREVJ28lV2SFAJpv4enGelv2GJ9CK91tQceiYPU21loIBzh2H6+EhzQTyAUB4La+ZTLnjr3JR7l
	5XxEL8pwTAi/LEA2ab4lnMbwrlLOWrY712w32iMdXQhbQ97ST8VGr6KOqWELuBxS9+2DW8INM8JYI
	ywZUFdHs9HYnAetgZhHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJOUj-0000bc-2S; Tue, 31 Mar 2020 21:32:25 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJOUf-0000ZR-QU
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 21:32:23 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 723A0C0F3B;
 Tue, 31 Mar 2020 21:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585690339; bh=jQUxmiUsZujoH0xZIAd2GoxFO6z1upn937GWwUvAN7E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V5TtnJPxRVbRrTX5YDkd3B4A3bA9aw3SicNm0+7M99YVD5bmIN2AVZn71Y8WdffXm
 JGWoAKo1XIeOtAIZ0zzQAvhdz/8QdOoMjZXUN4LdyyDC0Ke3D3ep/W5ENv+a+FlZMV
 vdLpgOaa0hTP66L623WSx/YOT7OOtlqkBBT4GOkhLbt+oKkJ85DF+ee6xzYSWsjgq2
 swrcsau+1zF38zFkGm7yaFs1etCOTJHqdYohvwb0cuXrGGoFnlIe4xOYh8o1vXUZ1w
 05q+ER5xmKr5S9LmLIMunf7CCzHLgkw0iym5QJmJ6WFvRYI2ZNw7Xt6Y1WJv7i9f0u
 fPIAFmSa7sPag==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 43240A0096;
 Tue, 31 Mar 2020 21:32:09 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v2] provide y2038 safe socket constants for
 default/asm-generic ABI
Date: Tue, 31 Mar 2020 14:32:08 -0700
Message-Id: <20200331213208.22543-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <alpine.DEB.2.21.2003312122350.30236@digraph.polyomino.org.uk>
References: <alpine.DEB.2.21.2003312122350.30236@digraph.polyomino.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_143221_890538_2667D503 
X-CRM114-Status: UNSURE (   8.89  )
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

These will be used by upcoming RV32 and ARC ports and any future ports.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
This is a straight copy of code originally written by Alistair, hence
adding his SOB as well
---
 sysdeps/unix/sysv/linux/bits/socket-constants.h | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sysdeps/unix/sysv/linux/bits/socket-constants.h b/sysdeps/unix/sysv/linux/bits/socket-constants.h
index 9dcc19cd5380..d02e1cbc7cf1 100644
--- a/sysdeps/unix/sysv/linux/bits/socket-constants.h
+++ b/sysdeps/unix/sysv/linux/bits/socket-constants.h
@@ -20,6 +20,8 @@
 # error "Never include <bits/socket-constants.h> directly; use <sys/socket.h> instead."
 #endif
 
+#include <bits/timesize.h>
+
 #define SOL_SOCKET 1
 #define SO_ACCEPTCONN 30
 #define SO_BROADCAST 6
@@ -30,9 +32,19 @@
 #define SO_OOBINLINE 10
 #define SO_RCVBUF 8
 #define SO_RCVLOWAT 18
-#define SO_RCVTIMEO 20
+#if (__TIMESIZE == 64 && __WORDSIZE == 32 \
+     && (!defined __SYSCALL_WORDSIZE || __SYSCALL_WORDSIZE == 32))
+# define SO_RCVTIMEO 66
+#else
+# define SO_RCVTIMEO 20
+#endif
 #define SO_REUSEADDR 2
 #define SO_SNDBUF 7
 #define SO_SNDLOWAT 19
-#define SO_SNDTIMEO 21
+#if (__TIMESIZE == 64 && __WORDSIZE == 32 \
+     && (!defined __SYSCALL_WORDSIZE || __SYSCALL_WORDSIZE == 32))
+# define SO_SNDTIMEO 67
+#else
+# define SO_SNDTIMEO 21
+#endif
 #define SO_TYPE 3
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
