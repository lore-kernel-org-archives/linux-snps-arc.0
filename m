Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74313C3F68F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 20:09:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4929724672
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 20:09:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rPh5cIGs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SjtQKbTn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4929724672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ged7AZHtcoeNV9yzgFHbo3iEEPLrhn9u8Y8G2KIywPw=; b=rPh5cIGs9os380
	sL0hCU+gwSOv3cjYxJ4jn2QyCnbp6AJzlruBXfkzY4M9l5W66/JdQ4vqaeQf8mjdrejreC0pQSPML
	3eBO/PhavlZvtlXoQ0ANPAT9m2DpQQs/4G74GybLIPaOnu2s6yHFODJF9d5hNOchjHghkYzRjbEJ8
	m3qkG4FS0r0gsyj77+UMWgLmZJovgPmrbNqV+lktWP8EZz3CMIDsIxZv/e8VCwjQh+bzp+aEZSoR0
	S5BpDynG2GzMjOFfWR+4H8lscpyTRdgRXx0gRpONJu/EimcK4uqu9LWof04HNNxWj54Hdux0G4z5J
	d0YtqGP0ffaR9M8yfqYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irSUm-0003W6-96; Tue, 14 Jan 2020 20:09:00 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irSUj-0003UX-7P
 for linux-snps-arc@lists.infradead.org; Tue, 14 Jan 2020 20:08:58 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D3C6F406F9;
 Tue, 14 Jan 2020 20:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579032536; bh=wjCdDOgqMcTow7rOK3qtHSf4KaODrAl2GNRfmy2/+is=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SjtQKbTngrT3ska2dntdhM9s2u0knGXeuUobsuIq+6lVd6q/fNNSeBGZnaH95NTkZ
 TVq2B2D7Vxhux3LHvio/QJw5MCr/vSc27nNLtbSOtyUYW9R7xAxxZUdTcbgrIBmpTE
 QQk4osqd6NNEUCaRb1vZFye+nWoktKMOvSTEsiFAmeEKs3JrIVUcShEBAAACL2aDs3
 dh7vXux/M9re2CDAmuZ0YLMwvsRezR7CG2XymtlWBcd+oOsrYljL/q/ceabsBYnmiK
 J6aLksgzKT/zpigz9GdmDd4tYcxa3srMKfUPZAmWqML7C9zInWzgOWsvwlxOGcMpkx
 a82DXgyl2yqFg==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.25])
 by mailhost.synopsys.com (Postfix) with ESMTP id 51704A0097;
 Tue, 14 Jan 2020 20:08:55 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Arnd Bergmann <arnd@arndb.de>, Khalid Aziz <khalid.aziz@oracle.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>,
 Aleksa Sarai <cyphar@cyphar.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [RFC 1/4] asm-generic/uaccess: don't define inline functions if
 noinline lib/* in use
Date: Tue, 14 Jan 2020 12:08:43 -0800
Message-Id: <20200114200846.29434-2-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200114200846.29434-1-vgupta@synopsys.com>
References: <20200114200846.29434-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_120857_303220_71851A97 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: linux-arch@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

There are 2 generic varaints of strncpy_from_user() / strnlen_user()
 (1). inline version in asm-generic/uaccess.h
 (2). optimized word-at-a-time version in lib/*

This patch disables #1 if #2 selected. This allows arches to continue
reusing asm-generic/uaccess.h for rest of code

This came up when switching ARC to generic word-at-a-time interface

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 include/asm-generic/uaccess.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index e935318804f8..74c14211377b 100644
--- a/include/asm-generic/uaccess.h
+++ b/include/asm-generic/uaccess.h
@@ -227,6 +227,7 @@ __strncpy_from_user(char *dst, const char __user *src, long count)
 }
 #endif
 
+#ifndef CONFIG_GENERIC_STRNCPY_FROM_USER
 static inline long
 strncpy_from_user(char *dst, const char __user *src, long count)
 {
@@ -234,6 +235,7 @@ strncpy_from_user(char *dst, const char __user *src, long count)
 		return -EFAULT;
 	return __strncpy_from_user(dst, src, count);
 }
+#endif
 
 /*
  * Return the size of a string (including the ending 0)
@@ -244,6 +246,7 @@ strncpy_from_user(char *dst, const char __user *src, long count)
 #define __strnlen_user(s, n) (strnlen((s), (n)) + 1)
 #endif
 
+#ifndef CONFIG_GENERIC_STRNLEN_USER
 /*
  * Unlike strnlen, strnlen_user includes the nul terminator in
  * its returned count. Callers should check for a returned value
@@ -255,6 +258,7 @@ static inline long strnlen_user(const char __user *src, long n)
 		return 0;
 	return __strnlen_user(src, n);
 }
+#endif
 
 /*
  * Zero Userspace
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
