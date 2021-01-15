Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA67C4332B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 20:04:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8920323A58
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 20:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8920323A58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qhr71S0S3QXI8ICofrxsxeiSR+y15E+0/P6gGDNplxE=; b=Jz9Pz6VLGMdSuawTz2YfywIO2
	E8Xqlk1CVlMZsTZL7mOy7bKEAmBAz3Y+YA2VPWqiJYTW1/P1MCLrSKegVk+yHIXWanYI1bt52RyWI
	PMkucy41uQ2/tBqDktfrR5gJWQ2hVR3kaFoEUM5tFgi+bQwIelbich7vXU7EaGipXGJ5ax3i811mo
	ymG9IpuG1Dowom8t9N2HszZCHWJusmHD9abyr3rfYly5HeP4d9xiEadfE/feIEcTDaFPXJmHY3Hdh
	V9tHG6/gLb5g9Frbx6f8qjtSLE65Kf1gemAF7wcULgawRpHKEiNcYwBRTJmJJv2fWyhiqaKYx3+7J
	9xlUdbqnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0VKT-0003Vk-Fs; Fri, 15 Jan 2021 20:04:17 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0VJq-00036L-I0
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 20:03:45 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EB06C40762;
 Fri, 15 Jan 2021 20:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610741014; bh=DSG0GMqMUwWd9OXUPU1eHb7HvsIm8nAJc7t5fX3MUfU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yf3Nvh7fbFcJ9a03zFAtTxsNv24IJOnZxKuidJYoM63gSNZ7HnvJ+V9yRS36sh0ac
 rCR/hgE2OgGEvOZ1v6ZlnaUK4H8F9hHQV6MUx6N/S7XIDYa0YjUndn/h+TuoRWRXrJ
 0goxVaUnnfhtcJJ0CJ1qLvpMX9mCn5227dTDinonN+EKwcNMY7W2pDBXewOvUdAkru
 gHTHocxWDPHwE+4S9I5OBW8KN/8Yeq3ioXU+DrLxuBPru+jnFsAA9d3iU1nrMnvvBd
 ulEqGkQya8hEwYmrVC0MgvVVjYELGw1J6MjnWv6QZEh3hUgjr0wlyOle2hqByFFJuS
 bPIH7raeY5LGg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 66B91A0077;
 Fri, 15 Jan 2021 20:03:32 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Subject: [PATCH 1/4] ARC: Add support for generic HS48 processor
Date: Fri, 15 Jan 2021 12:03:16 -0800
Message-Id: <20210115200319.4139041-2-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115200319.4139041-1-vgupta@synopsys.com>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_150338_796912_75352B5E 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: Evgeniy.Didin@synopsys.com, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

For the HS48 processor, BR currently builds with -mcpu=hs4x_rel31 which
generates suboptimal code as it inhibits delay slot and back-back ST and so on.

Enable a new variant to build with -mcpu=hs4x for normal codegen.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/Config.in.arc | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index fdfafda31c72..259d6f3ab8b9 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -39,9 +39,14 @@ config BR2_archs38_full
 
 config BR2_archs4x_rel31
 	bool "ARC HS48 rel 31"
+	help
+	   Build for HS48 release 3.1
+
+config BR2_archs4x
+	bool "ARC HS48"
 	help
 	   Latest release of HS48 processor
-	   - Dual- and quad multiply and MC oprations
+	   - Dual and Quad multiply and MAC operations
 	   - Double-precision FPU
 
 endchoice
@@ -49,7 +54,7 @@ endchoice
 # Choice of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
+	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31 || BR2_archs4x
 
 config BR2_ARCH
 	default "arc"	if BR2_arcle
@@ -70,10 +75,11 @@ config BR2_GCC_TARGET_CPU
 	default "hs38"	 if BR2_archs38_64mpy
 	default "hs38_linux"	 if BR2_archs38_full
 	default "hs4x_rel31"	 if BR2_archs4x_rel31
+	default "hs4x"	 if BR2_archs4x
 
 config BR2_READELF_ARCH_NAME
 	default "ARCompact"	if BR2_arc750d || BR2_arc770d
-	default "ARCv2"		if BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
+	default "ARCv2"		if BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31 || BR2_archs4x
 
 choice
 	prompt "MMU Page Size"
@@ -93,7 +99,7 @@ choice
 
 config BR2_ARC_PAGE_SIZE_4K
 	bool "4KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
+	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31 || BR2_archs4x
 
 config BR2_ARC_PAGE_SIZE_8K
 	bool "8KB"
@@ -103,7 +109,7 @@ config BR2_ARC_PAGE_SIZE_8K
 
 config BR2_ARC_PAGE_SIZE_16K
 	bool "16KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31
+	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_64mpy || BR2_archs38_full || BR2_archs4x_rel31 || BR2_archs4x
 
 endchoice
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
