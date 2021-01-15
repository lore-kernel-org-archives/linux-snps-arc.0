Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E05C433DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 20:04:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 651B823A58
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 20:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 651B823A58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1oxRV3sTVfW1Nbr7KiljRYcUmPOPkA+BV7vCCgWKgiA=; b=xw5qPTviLs6FwVz6ue8IXvXJa
	pJ7r1/5/SPjP5bbEHIeFCRKIB/n4/WvpzoPED9ZnF1R9lLibnmrwD4z97PiziFhO1vA7mJBqv2LY6
	TqWHKhPqNtiP112gGHydORCW9n35su8lN2T0U9v7Vn1jTi6sJVMUe+GpPzKU1Tk9Po4Bp3dd30r54
	58jzz+rWfUYiqqdlyOCpHYgiINQZfZh5Z3Vs5SfmaPUvey0PFerCYV4idAtssSgPqX8Wr59UISFAp
	N/8P2BbTWWaqaCm71QnbbI1cbjZdzhQu4m346H+LDC1zi3wgyzweNDknpLkGSILiCeDxioZ1lJ2CI
	92qW7j0QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0VKR-0003US-JU; Fri, 15 Jan 2021 20:04:15 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0VJq-00036D-EM
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 20:03:44 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4FA2140775;
 Fri, 15 Jan 2021 20:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610741014; bh=3ysVizw3IC2bXW+vSTREy4t5/FyiH/+/cOHhm6EYb3g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YCQmK1wL0sE3AAVYLLBiouMXfPMXlVgOM8w4XqzSdr0fcCxhODGsc7JUaYCxEhC9l
 IaW5MzdkwJRYAZaKHUZPtPzy9BLPviYNGHvIXrj+hOC9mxiB0ikSCJMrtVuQLD/5IS
 qIjMFlrQcYKIhbmeTBJI4YDkXaAFMBCY5HWLFYoRLR+OucRADmSRCAL1MTxmhMVZ3m
 yya1EcbmOyuugMP/1TfRi2znlsYEjRD/YDJ+o5LCOGmcX19n6Y35iYZdWYQmOE0YFG
 qIvFoo6FeeQj/L9Ao2ltDC+CwJJz2XzRtlF64AW8FKuX1/mZd2EDl2gVuqu3Eg7giR
 hn95vgzPRMMXg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 9F127A006F;
 Fri, 15 Jan 2021 20:03:33 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Subject: [PATCH 3/4] configs/snps_archs38_hsdk_defconfig: switch to glibc
 hard-float
Date: Fri, 15 Jan 2021 12:03:18 -0800
Message-Id: <20210115200319.4139041-4-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115200319.4139041-1-vgupta@synopsys.com>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_150338_589842_2C2F3521 
X-CRM114-Status: UNSURE (   8.95  )
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

We are no longer actively working on uClibc and hard-float support is
pretty stable, so make that default for HSDK boards

The hard-float setting is a bit convulated since current ARC gcc lacks
--with-fpu - so this is done with BR2_TARGET_OPTIMIZATION

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 configs/snps_archs38_hsdk_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index b8fd35636000..69d0b1936b3a 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -1,6 +1,9 @@
 BR2_arcle=y
 BR2_archs38_full=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_GLIBC_UTILS=y
+BR2_TARGET_OPTIMIZATION="-mfpu=fpud_all"
 BR2_TARGET_GENERIC_HOSTNAME="hsdk"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
 BR2_SYSTEM_DHCP="eth0"
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
