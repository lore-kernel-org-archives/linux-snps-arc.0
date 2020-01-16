Return-Path: <SRS0=rUT0=3F=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44ADC3F68F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 00:21:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA33222C3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 00:21:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t98Q1UmT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Odv047Zp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA33222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpMo6Wu3Yy3yh7AtnqINFEMd6WZjdTMeKt/DFEzvRiA=; b=t98Q1UmTVfas2H
	e7Pth6TUQFyBuV5zw0NnIFgQ8c+rk74VvZXTECM9mK0o4UxP0N71gHmFTm59EO6Rtdaj5n91A8a3g
	7eo2wqftmVgAOQcWHz5I+1kOTDCcuwtUnFumI1eO+UyZ1hKB7TnHTaoIggKZlkXTj8YVqbSmejiMA
	+ykAVplDPCoIuTcHYmmjuEJi/ulWc+4yqm3FSHl4e3s7JEq0oE5Zpv2Q5LO2XKfPKP6k6Io7faudn
	tgpNvfFFa9gISOm5YARvsase1BBSvOvmzxjS0E0/NXczPvbwfVAf/sdjCnKOzUrWl/FBfxGNXAwuW
	0WihInr8fdB9h3Yljv/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irsuh-0005RS-HM; Thu, 16 Jan 2020 00:21:31 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irsue-0005QI-E8
 for linux-snps-arc@lists.infradead.org; Thu, 16 Jan 2020 00:21:29 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3F5564070F;
 Thu, 16 Jan 2020 00:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579134087; bh=2QRPZlUmPMVnUxkrOMmW/dmjBL5xHEJTZroz7aCHYDg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Odv047ZpM5euFeHCEiCsWsNDvJZiylISOtDuFISKUcwjrnwcf/LAwpqVPDhcKbhot
 OETgHA3iK15nzCOHthNKRS/pH/LW12mwbL4CiE7XfdgtBcIwBDZoqNl2ABVH9ei71k
 AKNyzazvUrwk3Votu625wgKWczHGyH3DMAQDC73+vZw7BGiqAY0ThCHk1snRB4ogMh
 Sh+25mtnYtW03Ugl8BoXTG3rx4zq9ivsTxCzc9WjD25o1I2Oh2iy27vGbAHKBmxcBr
 JkRIw0cqViHXe/kQAGdqaUH9BgxFh3tJhOJLTIPuf+23YoyhkIBgB128vxE+6dMs0/
 sYTDwelsA/B5Q==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.20])
 by mailhost.synopsys.com (Postfix) with ESMTP id A6F56A0061;
 Thu, 16 Jan 2020 00:21:26 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH v2 1/2] asm-generic/uaccess: don't define inline functions if
 noinline lib/* in use
Date: Wed, 15 Jan 2020 16:21:23 -0800
Message-Id: <20200116002124.17988-2-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116002124.17988-1-vgupta@synopsys.com>
References: <20200116002124.17988-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_162128_501936_850E3796 
X-CRM114-Status: UNSURE (   9.71  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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
 include/asm-generic/uaccess.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/asm-generic/uaccess.h b/include/asm-generic/uaccess.h
index e935318804f8..2ea7f4e0e60e 100644
--- a/include/asm-generic/uaccess.h
+++ b/include/asm-generic/uaccess.h
@@ -212,6 +212,7 @@ static inline int __get_user_fn(size_t size, const void __user *ptr, void *x)
 
 extern int __get_user_bad(void) __attribute__((noreturn));
 
+#ifndef CONFIG_GENERIC_STRNCPY_FROM_USER
 /*
  * Copy a null terminated string from userspace.
  */
@@ -234,7 +235,11 @@ strncpy_from_user(char *dst, const char __user *src, long count)
 		return -EFAULT;
 	return __strncpy_from_user(dst, src, count);
 }
+#else
+extern long strncpy_from_user(char *dest, const char __user *src, long count);
+#endif
 
+#ifndef CONFIG_GENERIC_STRNLEN_USER
 /*
  * Return the size of a string (including the ending 0)
  *
@@ -255,6 +260,9 @@ static inline long strnlen_user(const char __user *src, long n)
 		return 0;
 	return __strnlen_user(src, n);
 }
+#else
+extern __must_check long strnlen_user(const char __user *str, long n);
+#endif
 
 /*
  * Zero Userspace
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
