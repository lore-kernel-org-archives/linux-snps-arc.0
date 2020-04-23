Return-Path: <SRS0=M/q7=6H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95981C5518C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Apr 2020 01:41:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CB7B2074F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Apr 2020 01:41:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HOnmHADK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BxNm+2tg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CB7B2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRPMIG0ItWIAdU0zTF40f4udBalkAdANB+VQ/A2rKlM=; b=HOnmHADKzdvhoF
	useI2wEZdiUlTdwZOOu13Ymh0n/lqzXdEPB69PJtaFocsZr67sqarWfVLDbg0t38TgqGVgn/EdkBF
	a+Jy3rHiq97qwt4ivRe1tRnx3yzFDB4gQG6BXr+hE9ttD8tU/pN7iAKb172azfD12uhRcsVFQj12G
	wmTdgROGjPuTj76H+roZOfWRIx12knRxtEcJeUGGh4liwVdYcY90VlhgMPQurv49DBlfZX/ljuyfr
	PjxrQmFop7p61RMRCLWb4773kwlUevscpF/C0hFb6V5IqzrL/RCP7R7UhYzlSPzKtWlLMnjoSl4EV
	gyJZwfTRkKXOG4BgzNeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRQs5-0004sM-An; Thu, 23 Apr 2020 01:41:45 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRQru-0004kG-48
 for linux-snps-arc@lists.infradead.org; Thu, 23 Apr 2020 01:41:42 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 03D1C4016F;
 Thu, 23 Apr 2020 01:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587606094; bh=D6Htm9wYYrFl/K82tNzHjwXnK/0bBgOemEKiQqOSasE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BxNm+2tgcR06NCfCnJdmv3cGgqjDSXH+Qgp5xaOXrBMnhaFGPZbMQhldzsY5Z2K2n
 JkCJ8+xsg8R2lyxvVRG/lglwDkL1Uz5pWLehVRjAqaRs7MaWzQxu5hhGub8o2UhVq8
 7C/Lw455p9PzP16mNJe3w94j1VXyu1Rwb91DFgjVtQlca93xw4L2ezIp5+/5C/S7+J
 p83ffCMrC181Ueap5QtsMZcYdO9e+Ej88MqaWVOe+EqUchfKV1fJAWam5aq90IHspG
 K1MDErMa2Eq3pE5oNqGGVAH1exwBTxiGPNNhYsYWHoif8A9C/4sVRjP+lLIlQhNfr2
 +CY5XP3xFsKCg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id CA4C2A009C;
 Thu, 23 Apr 2020 01:41:33 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v6 13/13] Documentation for ARC port
Date: Wed, 22 Apr 2020 18:41:26 -0700
Message-Id: <20200423014126.10417-14-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423014126.10417-1-vgupta@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_184134_164172_797D92F3 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 NEWS                | 9 +++++++++
 README              | 1 +
 manual/install.texi | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/NEWS b/NEWS
index 0e627b34057d..d59c1ffb96e1 100644
--- a/NEWS
+++ b/NEWS
@@ -15,6 +15,15 @@ Major new features:
 
 * New locale added: ckb_IQ (Kurdish/Sorani spoken in Iraq)
 
+* Support for Synopsys ARC HS cores (ARCv2 ISA) running Linux.
+
+  Port requires at least
+    - binutils-2.32 (binutils-2_31-branch: commit 6ce881c15fc4, 2018-10-04)
+    - gcc 8.3 (gcc-8-stable: commit 0d5ba57508c5, 2019-01-29)
+    - Linux kernel 5.1+ (64-bit time and offsets)
+
+  Both Little and Big-Endian supported
+
 * The GNU C Library now loads audit modules listed in the DT_AUDIT and
   DT_DEPAUDIT dynamic section entries of the main executable.
 
diff --git a/README b/README
index 31c5da0405bd..903f07e4840a 100644
--- a/README
+++ b/README
@@ -24,6 +24,7 @@ The GNU C Library supports these configurations for using Linux kernels:
 
 	aarch64*-*-linux-gnu
 	alpha*-*-linux-gnu
+	arc*-*-linux-gnu
 	arm-*-linux-gnueabi
 	csky-*-linux-gnuabiv2
 	hppa-*-linux-gnu
diff --git a/manual/install.texi b/manual/install.texi
index 71bf47cac659..e1f15656cdc0 100644
--- a/manual/install.texi
+++ b/manual/install.texi
@@ -507,6 +507,8 @@ the newest version of the compiler that is known to work for building
 release time, GCC 9.2.1 is the newest compiler verified to work to build
 @theglibc{}.
 
+For ARC architecture builds, GCC 8.3 or higher is needed.
+
 For multi-arch support it is recommended to use a GCC which has been built with
 support for GNU indirect functions.  This ensures that correct debugging
 information is generated for functions selected by IFUNC resolvers.  This
@@ -528,6 +530,8 @@ No other assembler or linker has the necessary functionality at the
 moment. As of release time, GNU @code{binutils} 2.32 is the newest
 verified to work to build @theglibc{}.
 
+ARC architecture needs @code{binutils} 2.32 or higher for TLS related fixes.
+
 @item
 GNU @code{texinfo} 4.7 or later
 
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
