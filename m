Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4104FC433DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 20:04:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AE5523A58
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 20:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AE5523A58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4N5nAA0DB+w6UdIJTO3wDx93Ohi3/mjLyRDSbUcKiuo=; b=xy22W6uwZ9qra3AJWO7up4u3e
	ejyHgp8/BVwk+4fs1H5+/3Rho/w7s02MFYwA/5zLA7CIIP3q15RsFo8d7g2wSEN7qFzJYhaxnpko3
	Q2SYBB3n7vj9Kf6eIdIfEcq4spuSXOmamwkb4wz3f1rgGT2iRl6x1tZQbWsrUf+dhgbpIa4LBnltt
	ArLDLwf01k4Zq9ueAL+8XKqpO3kO6VQmoFOPCZcux5j209BGDCCDKv74dddX2Khzg/vj5SAKsTapf
	Ra4ANitjPB/Wgsg7pI4UzrIdtcL/thJptzuxVFpspzQ6iMc9dGYsRRcHPKfXMKU2D0W1OcBDHpR52
	gA17p97bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0VKU-0003WQ-Mh; Fri, 15 Jan 2021 20:04:18 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0VJp-00035t-ND
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 20:03:45 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A79C14076D;
 Fri, 15 Jan 2021 20:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610741013; bh=3Z8d7pmlCcuWGu48sRaP53yXhRS4cDaOiuLi2wsBumI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GxDVdF83zjdhhNW8coFcIVHUIdN0BskI49e49fP2JPhbWy4oMTxpHcdMyEI9UU/Ei
 VocOZWqP6WDBnTxq1+evi37RRNF0+z6XZq7qLhLg8jIN7VT/5wz05zRDHG2a0PZ1dL
 W4MRngk6lRNMJ+3Wo3ZLuAC3yEFG6RzVMo1TPnov3Vaww3ZNQpAFN8plOuSa7iAWLh
 RtA3ubpclSt/oDNIsYs//D3y4Dt++BOeHaSFRpvyw9XU5cISAtbjOlYO0wS6by54Qo
 SDX5uwUbYKzATZfntV18L6tKuCgBr1Xno9bueof1zwNJymouOiLf8b1wwSILrImDDa
 SEVSLwGsCBniw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id EE3B7A022B;
 Fri, 15 Jan 2021 20:03:32 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Subject: [PATCH 2/4] configs/snps_archs38_hsdk_defconfig: refresh defconfig
Date: Fri, 15 Jan 2021 12:03:17 -0800
Message-Id: <20210115200319.4139041-3-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115200319.4139041-1-vgupta@synopsys.com>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_150337_936092_313786D6 
X-CRM114-Status: UNSURE (   8.16  )
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

No config changes done

| make snps_archs38_hsdk_defconfig
| make savedefconfig

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 configs/snps_archs38_hsdk_defconfig | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 9a9d57b32589..b8fd35636000 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -1,33 +1,19 @@
-# Architecture
 BR2_arcle=y
 BR2_archs38_full=y
-
-# Linux headers same as kernel, a 5.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
-
-# System
 BR2_TARGET_GENERIC_HOSTNAME="hsdk"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HSDK Platform"
 BR2_SYSTEM_DHCP="eth0"
-
-# Kernel
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/synopsys/hsdk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
-
-# Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/synopsys/hsdk/genimage.cfg"
-
-# Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
@@ -35,7 +21,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="hsdk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_ELF=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/synopsys/hsdk/uboot.env.txt"
 BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x4000"
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
