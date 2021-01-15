Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E03C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 20:04:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06133216C4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 20:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06133216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k/9eRKGgadmBSqDGXUY6Wjb+6q14YX+xHjQ/8dgwqgY=; b=Ul5ZDac/G5O8x42bwFH44yBPL
	ZQIx8Gfom3xYg5zx35uWL535mD8WnYoH4nYScOAhr5L7fQU2YTMp8vyMGJU6f57GkwEz9jIHuXbcy
	0Zzar6wO8w8YumIkgzrXqS1TpNkUcuQGmCeQs5r6yBhZu9GlfYXl7japce1jU8i3AHe40fi2ChfK5
	MpWlN6ubaJnVJ/wMgvXExF0hcCjPBIcfC4ITbK3mpajBWGBzOPlTc19krknXmGvoqvSsAQErxhkuh
	t7XivOFUPepiLS0/luwjH7OUJ3RdrdnyiEG7GizCL8lW8Jfs6qFHTWEb7SgSaMaJ6jdtS3i6yqcsc
	BPzLf81Mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0VKW-0003XH-VW; Fri, 15 Jan 2021 20:04:21 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0VJq-00037l-Md
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 20:03:46 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5FC33C0AE9;
 Fri, 15 Jan 2021 20:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610741016; bh=fix8PGo7fBjxKFmc90j9en+9zkv3+tZp8qkpCo0pXNQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ew26mBAnHp9Kty8HLo0Du/RF3FaR3sYlns+POI6rapP7TG6EewO3/dPh0Xj4JrWnj
 H401dSmjVtZ01GLYmb6okxFzNMdJ0SRhQZFySUuUDSFN7LgklwN/bjbd6N70wrkccI
 edoKvIxM6qx25RyqRN3JonMOUFtiJOenB+iVu4gvTHqGNUc9zxIoDRtWcE1X1caPvR
 E27J1+NK0xUOw276NAoheB3MccM6hmkDGt8h6r6/YfGD7RCr5qvGNumLJIhoQGkKXP
 Ig16FDPOdJV0uSzmWciljXv0u4qQEqEM0OrantomgYb0X/QCtCM3a5z8XOxw+GJQT4
 DFitOAkAvO8Mg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7F739A006F;
 Fri, 15 Jan 2021 20:03:34 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Subject: [PATCH 4/4] configs/snps_archs38_hsdk_defconfig: update for better
 out-of-box experience
Date: Fri, 15 Jan 2021 12:03:19 -0800
Message-Id: <20210115200319.4139041-5-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115200319.4139041-1-vgupta@synopsys.com>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_150338_890558_C5BC9E63 
X-CRM114-Status: UNSURE (   8.45  )
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

 - Enable C++ support
 - Don't strip executables
 - Add minimal debug symbols
 - Enable strace and openssh
 - Enable perf (and elfutils)

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 configs/snps_archs38_hsdk_defconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 69d0b1936b3a..7d406a90ed3c 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -1,8 +1,12 @@
 BR2_arcle=y
 BR2_archs38_full=y
+BR2_ENABLE_DEBUG=y
+BR2_DEBUG_1=y
+# BR2_STRIP_strip is not set
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
 BR2_PACKAGE_GLIBC_UTILS=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_TARGET_OPTIMIZATION="-mfpu=fpud_all"
 BR2_TARGET_GENERIC_HOSTNAME="hsdk"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
@@ -14,8 +18,15 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
+BR2_PACKAGE_LINUX_TOOLS_PERF=y
+BR2_PACKAGE_STRACE=y
+BR2_PACKAGE_MAKE=y
+BR2_PACKAGE_ELFUTILS=y
+BR2_PACKAGE_ELFUTILS_PROGS=y
+BR2_PACKAGE_OPENSSH=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
