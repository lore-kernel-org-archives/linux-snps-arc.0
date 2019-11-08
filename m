Return-Path: <SRS0=7pOa=ZA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185FDFA372C
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Nov 2019 17:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B33214DA
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Nov 2019 17:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XLHPYck7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="efnIjGF7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3B33214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUmyjfvxKTFrPNT6Ok6zyCQHjrZUtGvDqxbTCEsjF14=; b=XLHPYck7mVXAOe
	/Ww88N0nIdObq9VZF+BfU0u9GCt7tQy+ezdHXFsWlaLbYXvpPJn34G9qfSRSe+PNJ2RHQXNCbmKge
	yyaZ2EUgEv2iQ+cndPdoVpR9AM1d8TtFlDegsYjMZapkD+tZTLDcpTUZYAdEJw20Ju8UL4h0TFDeg
	3yBZ16T8E2V8CWa5/3GkilxLFsuSeuosOJgOq2qmeCbTyACe4MLuWl1/QiS7KyzMOjWQ+c+lzOnlZ
	VrWYknp5RnyOcQJcI4gqvfmk8SEe1/ON3D8Ptkj7PDWmE1nm0PItAlC+Jy6vjjZ48cVvS2hsh8+09
	4Yhl9qkJ4xUvORIsT/9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iT8GD-0007j6-7d; Fri, 08 Nov 2019 17:41:25 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT8G7-0007gw-Ma
 for linux-snps-arc@lists.infradead.org; Fri, 08 Nov 2019 17:41:22 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 12D0CC0DF2;
 Fri,  8 Nov 2019 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573234879; bh=pC3vLfL4VerDEcx4ATObsC9JdhA3xafoq4erMonlmQQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=efnIjGF76fxj6Ke1VZDVo3BRA2Xme452gLDUBs4uuRyv6RgTGk6XUTLyqxzwdKMIV
 NQ4j5sYA1mQEfjEj1mZyZpI1uhWMFbJAbfMJ4f7IONuZ67kt9/6aqgFDxlgyd+x73n
 US3Xe1CC8MOSYhFJ287z0R80CRz4TjkwB4mR++6G1gU4/yXQ5rPVXi8cYRaWAi3P9f
 /PwHyD3o5GdlLqVfIQrGmQP5ng2EBtjeSuZTRFC99YG7ueQVosEIlGEtybaMm4ednw
 /PIlmlxeHi/D2OyB1251JuU87yVEStYtX9hCP+yCy0lfRzOGU1xVKJ6LAqT21GuuUX
 t3MWdYuia+EPA==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.28])
 by mailhost.synopsys.com (Postfix) with ESMTP id DDE9AA00B1;
 Fri,  8 Nov 2019 17:41:18 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Subject: [PATCH 3/3] package/ffmpeg: Enable ARC glibc builds
Date: Fri,  8 Nov 2019 09:41:12 -0800
Message-Id: <20191108174112.28183-4-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108174112.28183-1-vgupta@synopsys.com>
References: <20191108174112.28183-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191108_094119_759902_922FA533 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: Evgeniy.Didin@synopsys.com, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

ARC glibc fenv.h has the needed macros for quite some time now so allow
ffmpeg builds

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 package/ffmpeg/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index a5c05d9c1c8e..47a1c510db01 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	bool
 	default y
-	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
-	depends on !(BR2_archs38 && BR2_TOOLCHAIN_USES_GLIBC)
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
 	depends on !BR2_nios2
 	# No support for ARMv7-M in the ARM assembly logic
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
