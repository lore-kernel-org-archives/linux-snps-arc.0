Return-Path: <SRS0=TnUX=MM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F13C07E9B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Jul 2021 20:58:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE9226108B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Jul 2021 20:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE9226108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aPZsONMAOUTC2bOkKBOvEEzI6h99OvsSW6GbZmSSDKY=; b=chYEg15wA0o9ea
	c1/hW90LMqli8hw7jktX7Qy4KytzICFv7DhRcycqpYP8AenYBTGQ6vGr5tcDnoqFCSa4LceoPiw+R
	TlDI9qW8wnM57eOjqwSBJ990vgWxgU/bTXsN+yKymOUQN1DKpfUj6OCrN1XRdzlF1006qoVU60pZq
	aaoIM1OYDmZctp+L9KothbNyHkCyFcPe+EGThYVB3eZc6QCAGlRVBd/NrzLuYbli5Kp+a3P8KYf3j
	yfHMc6X6V/L4m8+t800+Ah/BZgIgaxTNFYX3stVqYCdoP+UUOJ8ESPMMvTqsxnt3BTcF39TCR9JDy
	gbgKlDaeiSdH13Ob4wcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5wom-00DvrG-AB; Tue, 20 Jul 2021 20:58:20 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5woj-00DvoV-1l
 for linux-snps-arc@lists.infradead.org; Tue, 20 Jul 2021 20:58:18 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8930BC3788;
 Tue, 20 Jul 2021 20:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626814692; bh=EtNQPinTaKpowRpHFuddNLolFD1jOtYplnTAa+EONIo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rrmj8RSLHQuwg7ScGYS3Vu4T2T68+7Y1/e0q4CX2H0h5CPQIqMvsRuEE3PIRDEqsz
 etEYi0p4mmkkZduI/+a81LXYJyardnNEcrazeRUn+TwT5+/DgXSiGZ+EZnj2PX+hMb
 Xw8bX+MxA/u70c36l4L5mlxJ8Y+QSSlzPri1JDnLO+DrE86YNUjj0kHQvFrotaTpGV
 AsGlqgE9eNigva42kA2ztAOe7pCZRoWZ2m8g9an4gTQ0AfoWxHHvCSUABpcQ7iG27h
 7voHxY+Rk/KbdxyjO2AwCGUpMLGmvTnZgOved7fzdW54ByCRmmJlxWOyozOYvoqVg2
 zxJcSvW4sJ/Eg==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 9E04EA0268;
 Tue, 20 Jul 2021 20:58:11 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 1/2] ARC: fp: (micro)optimize FPU_STATUS read by eliding FWE
 bit clearing
Date: Tue, 20 Jul 2021 13:57:59 -0700
Message-Id: <20210720205800.1056218-2-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720205800.1056218-1-vgupta@synopsys.com>
References: <20210720205800.1056218-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_135817_187262_69CCD05A 
X-CRM114-Status: GOOD (  14.33  )
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

Any FPU_STATUS write needs setting the FWE bit (31) whcih just provides
a "control signal" to enable explicit write (vs. the side-effect of FPU
instructions).  However this bit is RAZ and write-only, thus effectively
never stored in FPU_STATUS register. Thus when reading the register
there is no need to clear it. This shaves off a BCLR instruction from
the fe*exceptino family of functions and while no big deal still makes
sense to do.

This came up when debugging a race in math/test-fenv-tls [1]

[1]: https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/54

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/arc/fpu_control.h | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sysdeps/arc/fpu_control.h b/sysdeps/arc/fpu_control.h
index c7d101e7838f..ae4348321c16 100644
--- a/sysdeps/arc/fpu_control.h
+++ b/sysdeps/arc/fpu_control.h
@@ -81,21 +81,20 @@ typedef unsigned int fpu_control_t;
 #  define _FPU_SETCW(cw) __asm__ volatile ("sr %0, [0x300]" : : "r" (cw))
 
 /*  Macros for accessing the hardware status word.
-    FWE bit is special as it controls if actual status bits could be wrritten
-    explicitly (other than FPU instructions). We handle it here to keep the
-    callers agnostic of it:
-      - clear it out when reporting status bits
-      - always set it when changing status bits.  */
+    Writing to FPU_STATUS requires a "control" bit FWE to be able to set the
+    exception flags directly (as opposed to side-effects of FP instructions).
+    That is done in the macro here to keeps callers agnostic of this detail.
+    And given FWE is write-only and RAZ, no need to "clear" it in _FPU_GETS
+    macro.  */
 #  define _FPU_GETS(cw)				\
     __asm__ volatile ("lr   %0, [0x301]	\r\n" 	\
-                      "bclr %0, %0, 31	\r\n" 	\
                       : "=r" (cw))
 
 #  define _FPU_SETS(cw)				\
     do {					\
-      unsigned int __tmp = 0x80000000 | (cw);	\
+      unsigned int __fwe = 0x80000000 | (cw);	\
       __asm__ volatile ("sr  %0, [0x301] \r\n" 	\
-                        : : "r" (__tmp));	\
+                        : : "r" (__fwe));	\
     } while (0)
 
 /* Default control word set at startup.  */
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
