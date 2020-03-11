Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB426C10F29
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 10:22:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D82208E4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 10:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nPESXEoY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UBnXq874"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81D82208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+l+yvJO8s7lXWNuF+gf97KNXP4nvvjGb/s6MsH+JV/U=; b=nPESXEoYeGTasc
	lWaYCkuFpt+7RFHLDaaeMGM60vbB2yxH5esEpDFVe+G6+IpEE/RlSY8ztIVHMQj6QMqUbsVTHK463
	dqi7BcZcYRP2SG8dtf+v3EctXUMO2OcG3KgBaYS9RQMObJVpYua/AOCgUMrAryxSZmgTp1wQfOkw0
	9XMNJrIIJ8m8gQMi1GNbkHiqOSwhp4WmfP+Ln60ULQoDdXmdW8KG+eHP/qv4wQYpa9g/cLpGHVnrJ
	0cTqwTSFhVFUZ45Wx7822VXGskF2uB3PXEJdUvtGZ/dAS7blHuqmI82Zj6rbPea09jgzvZ8ZpKEPA
	rPxD9mzUsm+bXAoGbkaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jByVW-0003tq-9N; Wed, 11 Mar 2020 10:22:34 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jByVT-0003t4-DG
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 10:22:32 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 31C1BC0F5E;
 Wed, 11 Mar 2020 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583922149; bh=B0LXRtnUY0xELU3mx53c6L8Wx4Nfptiv5Yp8NrUU6DY=;
 h=From:To:Cc:Subject:Date:From;
 b=UBnXq874oIsln5Amvel0BR0LjABeaesLXcas6MKMh44VGKD9YBtRyNW7u/C/dP72p
 ulwxGZyEn4chRN4S/A7Tiea10r2EK5h5GBJUy/I0GruTqXgPY+EMJki7vCdBQnywHz
 9WNpkGDwTytopwbselofdngzn7OPGcuE0+Xj+7VQmwMG2sL0h53jVX6RsRFwR8c7Dk
 J4KWcvHomJ4qovvKeiB6wmxx6rnkEzoLtWMvbp0xdXXO3TtVWqAi2Z2DlCiMYXe7V9
 USBm7oThR1eEeKmn7/qftRJ2vLw2ndCGlqhBOGB/SJR4kxt+6miQj/2f1rF2vAqBgI
 56RaKM5RyqPxQ==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.8.79])
 by mailhost.synopsys.com (Postfix) with ESMTP id 12B66A005B;
 Wed, 11 Mar 2020 10:22:26 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] initramfs: restore default compression behaviour
Date: Wed, 11 Mar 2020 13:22:17 +0300
Message-Id: <20200311102217.25170-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_032231_487786_06AD95AE 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Even though INITRAMFS_SOURCE kconfig option isn't set in most of
defconfigs it is used (set) extensively by various build systems.
Commit f26661e12765 ("initramfs: make initramfs compression choice
non-optional") has changed default compression mode. Previously we
compress initramfs using available compression algorithm. Now
we don't use any compression at all by default.
It significantly increases the image size in case of build system
chooses embedded initramfs. Initially I faced with this issue while
using buildroot.

As of today it's not possible to set preferred compression mode
in target defconfig as this option depends on INITRAMFS_SOURCE
being set.
Modification of build systems doesn't look like good option in this
case as it requires to check against kernel version when setting
compression mode. The reason for this is that kconfig options
describing compression mode was renamed (in same patch series) so
we are not able to simply enable one option for old and new kernels.

Given that I propose to use GZIP as default here instead of NO
compression. It should be used only when available but given that
gzip is enabled by default it looks like good enough choice.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 usr/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/usr/Kconfig b/usr/Kconfig
index bdf5bbd40727..690ef9020819 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -102,6 +102,7 @@ config RD_LZ4
 
 choice
 	prompt "Built-in initramfs compression mode"
+	default INITRAMFS_COMPRESSION_GZIP if RD_GZIP
 	depends on INITRAMFS_SOURCE != ""
 	help
 	  This option allows you to decide by which algorithm the builtin
-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
