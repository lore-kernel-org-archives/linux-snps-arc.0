Return-Path: <SRS0=wWAH=LS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3210EC49EA6
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Jun 2021 14:03:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCBC9613F6
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Jun 2021 14:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCBC9613F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TYV79K6j0DzhZLEzw95voFSc1xo6IZLizaWgYeuuB3k=; b=vdfjOJvRAWgN5f
	Nys2htTdFBNl84fpt8+VACw7llqP7gU24uX2K6uHcZqsGU3PsdX5RfUQl/3YEz1aT9skDOSfh48TG
	OYWBLe0Sdjyt32bpllwhooNbFv6JZ1nHVTwouNCapGP2dk55DwkPABZ2V4zjEiRoIcaGzKEQd5R8i
	tkAYymxJ4mXsJB8yyP9qQrJG1ijr3NqtyxlMR6I5A9h7gCXT4rnS1mEOc8TfaySX/97128cvIVRr2
	DYVlG0RCK2tMy2fspsfu4rgaw4/vRAvF1UdmIWJPwW9bQ+KqECRuwux3gz3X4ot6GrMYJFL22WtgG
	XqCi2FQv6IeKgQOCCNeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwPx7-00Ey0r-9l; Thu, 24 Jun 2021 14:03:33 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwPx3-00Exyj-PM
 for linux-snps-arc@lists.infradead.org; Thu, 24 Jun 2021 14:03:31 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2651C41016;
 Thu, 24 Jun 2021 14:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1624543407; bh=JtFCR7lanTBQEQT4vTukme4nAtUIUHbkh64et6oQtyE=;
 h=From:To:Cc:Subject:Date:From;
 b=mUGFVGl7k9dH3Yr0hu9SsDg1eRhl+q8ApvDx4gcsanyFSG+qqgQBdf7eo9Ofcysgd
 sBnmuCBbGt8PzfJ3Nii/1ebtfXtJbzvDXV7n/pryyAJKcMk+W8szbyYaFQnTWY8c8w
 ebUq7Hh/h1x4q4JEEigzmIbvhd+Uq/ApDywP8IBrQ4OLaK7tq/Y95rF6Ryfysvn6j6
 ocs8xbJH3IawsmIMENDTedaAtobyhmTGiwnZw+d7oq9SPjq0H3aPRUkdh2L/YHgh6Q
 1DoQ1+tUxL2C+waW/XYU7FFkH2Jx/wIz463r9mFP8/wTi/F9uU0Eq6KXB91qY9waGz
 RMlY/lgKu6lHg==
Received: from us01odcres-abrodkin-0009.internal.synopsys.com
 (us01odcres-abrodkin-0009.sg.us01-p01.synopsys.com [10.195.24.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 46759A006D;
 Thu, 24 Jun 2021 14:03:24 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] default-distrovars.inc: Remove seccomp for ARC
Date: Thu, 24 Jun 2021 07:03:09 -0700
Message-Id: <20210624140309.819-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_070329_867678_EEC5DA6C 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

libseccomp needs too be ported to ARC first

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index ac10245767..e0726fa3bb 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -13,6 +13,9 @@ LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
 # seccomp is not yet ported to rv32
 DISTRO_FEATURES_DEFAULT_remove_riscv32 = "seccomp"
 
+# seccomp is not yet ported to ARC
+DISTRO_FEATURES_DEFAULT_remove_arc = "seccomp"
+
 DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
