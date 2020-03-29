Return-Path: <SRS0=FlKf=5O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A69C43331
	for <linux-snps-arc@archiver.kernel.org>; Sun, 29 Mar 2020 04:16:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3E3620733
	for <linux-snps-arc@archiver.kernel.org>; Sun, 29 Mar 2020 04:16:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G49hMYa4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AnYw3bYs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3E3620733
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7uA3johOIR3gZp/KYKWiQFxOW645n5mffp36U6tZpWY=; b=G49hMYa4MgcCLx
	Aw8klspZnM7n90bxCQbntZ3M3b0ZQAVF8FzdxpPfOOLO9saTacA9qcgSAVsbQJTiP+sOTARgB+Sh6
	aKQQp3nV8m19egLC82zbyfHLFhMJU0ewMtctDsTnUxbXaiILSZvNsqGa96vWVhtx1V4bpg06vdZe6
	N6K6rL+p9rSgIz5rSOV707TS2nzwEDMLmO87QS8s9ehlGUwikNFIuRLC6pfhfbqyEg6HxBzqNeAMn
	ntKWR4LMf3HHm5QYvU0xycVr+G1dHRJqH8l/AkCej3hLXzLkUINdT6TLXxdFwwwtBzLEfNbYKz73A
	UV0yGUPLH+z7Nl/3OImg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIPN3-0008UX-BO; Sun, 29 Mar 2020 04:16:25 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIPN1-0008Tn-50
 for linux-snps-arc@lists.infradead.org; Sun, 29 Mar 2020 04:16:24 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 56F8D40570;
 Sun, 29 Mar 2020 04:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585455382; bh=65n8aFtN734bVs9xTJXK19tmxPqznoqzwE4dJ33iTjk=;
 h=From:To:Cc:Subject:Date:From;
 b=AnYw3bYs+dprlFyfF7XLEgwp1ZcwaONFEfkTvtQuLpA/BKIbPX/3bw4DO6HLM3xPi
 BChyclZPj9OzVBzgd4BqvnyghDQQo/uVpcojTyBwtivXnrmF2PhNyTrn+1b2zbY8gB
 fet41sbEzp0aLZkNvam6s+LfH9oJDFdp1XjJ/SMRn1FcGeX5me6haXSWnMBlZQ/8oR
 asGcOtnErkx4/OJaDQivp4gfpklQEd1OJ18A01nJcAvWAcqR1liFfa3VE7iXbKzJL+
 51Jdq+bBhpA6LnppdkV96/t845qHVPG9pu3DRp32NaFexev/+PezAs0bqWtTAAz/ai
 2k3DUQCHDgnGQ==
Received: from vineetg-Latitude-E7450.internal.synopsys.com (unknown
 [10.13.182.230])
 by mailhost.synopsys.com (Postfix) with ESMTP id 43D4AA0077;
 Sun, 29 Mar 2020 04:16:13 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH] provide y2038 safe socket constants
Date: Sat, 28 Mar 2020 21:16:12 -0700
Message-Id: <20200329041612.4071-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200328_211623_202540_6DDD5448 
X-CRM114-Status: UNSURE (   8.11  )
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
 Alistair Francis <alistair.francis@wdc.com>, Lukasz Majewski <lukma@denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

These will be used by upcoming RV32 and ARC ports and any future ports

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/unix/sysv/linux/bits/socket-constants.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sysdeps/unix/sysv/linux/bits/socket-constants.h b/sysdeps/unix/sysv/linux/bits/socket-constants.h
index 9dcc19cd5380..8a48ae7d0ca2 100644
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
@@ -30,9 +32,17 @@
 #define SO_OOBINLINE 10
 #define SO_RCVBUF 8
 #define SO_RCVLOWAT 18
-#define SO_RCVTIMEO 20
+#if __TIMESIZE == 64 && __WORDSIZE == 32
+# define SO_RCVTIMEO 66
+#else
+# define SO_RCVTIMEO 20
+#endif
 #define SO_REUSEADDR 2
 #define SO_SNDBUF 7
 #define SO_SNDLOWAT 19
-#define SO_SNDTIMEO 21
+#if __TIMESIZE == 64 && __WORDSIZE == 32
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
