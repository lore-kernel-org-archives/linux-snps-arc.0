Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56563C433F5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Sep 2022 10:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XH9z2yK8AvA0GouFodOv9e6egEaXrneHL64y6Tr24bo=; b=cnuyplk5sz0UiD
	vljJdkrAiSPb007tNHFL0S944eRKu/9LWdetVvz9pjBw0dL/+gp2/mzTwNyqPPIkc+Qa/qoXlVQBr
	Sd13p58RuIBKG50H13cUjEy21la2pLpegRv2QiNqDATYQwj3SxTNhJI8cuGeUoSPHzkflqmEBN95R
	nQczroSoZPFuSOBn0fcgbXhsIZHAyeegQfWKh6Gt+/TjbygR82+3xI4dp0rEJBGUZmDdrywMzk+ek
	i/IAfWY7srxiktLkIy+wcv2H8A+u1ewIMBT+lgr55IzMeLj5xTukyUxPKwJ3zKhblniqD62DzNdDS
	Q3QZ6cUGzlZbrt3dw6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odqZ5-002LqS-8m; Thu, 29 Sep 2022 10:14:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odqYs-002Lkf-4Z
	for linux-snps-arc@lists.infradead.org; Thu, 29 Sep 2022 10:14:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id m4so1410733wrr.5
        for <linux-snps-arc@lists.infradead.org>; Thu, 29 Sep 2022 03:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ykrnpuTEGllYEKTmGrNX9+HIF9vIBHuy8P5QqnXpQnk=;
        b=Y6Z9r5+4cL4qCkzJ1q45Su+Or7/MFGhUlA0RYLv4Zn7nwe2eXIkKJJ3MFxpFAFpr9X
         1SWIPATSMRTUBLicrIaN3Mt3plnsdF0T3/Wl8GXRt9JLxrQtwh1VE8WWLYOHLXxBd+Fg
         H1601aDfLCXbrTBSKRhTkndy8iStzEj3AcEylV1rYlkuMejTazWuYfKhAtKQrpTbaFpU
         UCsmqMFfMJoIGEiG8VUUJNknr/W/GMeBOhY1nXp/WutuVMP6+WBSuGoaBlaskRM6v2pa
         4SPxUpZc+wUzDV00lyvs2Kkwfq60xGEw2mWbXo6wXrl0woSF6LUnTvpbMnmosZNwplbd
         9izQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ykrnpuTEGllYEKTmGrNX9+HIF9vIBHuy8P5QqnXpQnk=;
        b=A9bMyHamKFP/pvemCCT10CTFyRQsoLvD7R9pJ+m6xzXLzuZx/rlJiLzWYL7Q7leLF5
         op2xealuOWWK5SZmKxB+37USpT7sxK2ZfBdjHqn5F48SwH+ARX8cnmUS2uLXLnBJoJWq
         rPh0r/CeFLqrrSF5gW0ugeRgI2sm2bAapAgBKQlo4YPveT3IdXqca2k34YAgxj0SBkfG
         SmQ7GHpj7RCOoPNEgXJ7t/axR7diupeZ2ohC6RK1o9Q/mr5FLyt6M3uft8rRpgdv1+dp
         OBwh8gzj9RPbfQ60WgsRDgRRKMvzU6x0tbpMlQOnOxT0aBJYCd960kwNzlykThrcAUoV
         S/2w==
X-Gm-Message-State: ACrzQf1K44n/iVTgcdCvn1sAKfgQhXapZxX/+ohxDQfMpcixLWZKjCpL
	P2f5TaWU1pDDKC6h52of8pf2Szrubqc=
X-Google-Smtp-Source: AMsMyM6dHzKBCbeL8s6QCcGUPZeeePXhY4nB6PwkRFWUcxJ3Q+aO+KI6VmZl7bmkmNYzL+BBaensUA==
X-Received: by 2002:a5d:6d4e:0:b0:22c:9dfd:4159 with SMTP id k14-20020a5d6d4e000000b0022c9dfd4159mr1564699wri.307.1664446468582;
        Thu, 29 Sep 2022 03:14:28 -0700 (PDT)
Received: from felia.fritz.box (200116b826e11200b190ebfd45660ea6.dip.versatel-1u1.de. [2001:16b8:26e1:1200:b190:ebfd:4566:ea6])
        by smtp.gmail.com with ESMTPSA id d3-20020a05600c3ac300b003a844885f88sm3856721wms.22.2022.09.29.03.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 03:14:28 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] arc: update config files
Date: Thu, 29 Sep 2022 12:14:21 +0200
Message-Id: <20220929101421.31590-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_031434_266995_0F5151A3 
X-CRM114-Status: GOOD (  12.21  )
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

Clean up config files by:
  - removing configs that were deleted in the past
  - removing configs not in tree and without recently pending patches
  - adding new configs that are replacements for old configs in the file

For some detailed information, see Link.

Link: https://lore.kernel.org/kernel-janitors/20220929090645.1389-1-lukas.bulwahn@gmail.com/

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/arc/configs/axs101_defconfig          | 4 ----
 arch/arc/configs/axs103_defconfig          | 4 ----
 arch/arc/configs/axs103_smp_defconfig      | 4 ----
 arch/arc/configs/haps_hs_defconfig         | 1 -
 arch/arc/configs/haps_hs_smp_defconfig     | 1 -
 arch/arc/configs/hsdk_defconfig            | 1 -
 arch/arc/configs/nsim_700_defconfig        | 1 -
 arch/arc/configs/nsimosci_defconfig        | 1 -
 arch/arc/configs/nsimosci_hs_defconfig     | 1 -
 arch/arc/configs/nsimosci_hs_smp_defconfig | 6 +-----
 arch/arc/configs/tb10x_defconfig           | 7 +------
 arch/arc/configs/vdk_hs38_defconfig        | 3 ---
 arch/arc/configs/vdk_hs38_smp_defconfig    | 1 -
 13 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index e31a8ebc3ecc..81764160451f 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -35,9 +35,6 @@ CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 CONFIG_DEVTMPFS=y
 # CONFIG_STANDALONE is not set
@@ -99,7 +96,6 @@ CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index e0e8567f0d75..d5181275490e 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -34,9 +34,6 @@ CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 CONFIG_DEVTMPFS=y
 # CONFIG_STANDALONE is not set
@@ -97,7 +94,6 @@ CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index fcbc952bc75b..2f336d99a8cf 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -35,9 +35,6 @@ CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 CONFIG_DEVTMPFS=y
 # CONFIG_STANDALONE is not set
@@ -100,7 +97,6 @@ CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
diff --git a/arch/arc/configs/haps_hs_defconfig b/arch/arc/configs/haps_hs_defconfig
index d87ad7e88d62..899b2fd5c71d 100644
--- a/arch/arc/configs/haps_hs_defconfig
+++ b/arch/arc/configs/haps_hs_defconfig
@@ -59,6 +59,5 @@ CONFIG_EXT2_FS_XATTR=y
 CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_NFS_FS=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_DEBUG_MEMORY_INIT=y
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arc/configs/haps_hs_smp_defconfig b/arch/arc/configs/haps_hs_smp_defconfig
index 8d82cdb7f86a..0d32aac8069f 100644
--- a/arch/arc/configs/haps_hs_smp_defconfig
+++ b/arch/arc/configs/haps_hs_smp_defconfig
@@ -59,6 +59,5 @@ CONFIG_EXT2_FS_XATTR=y
 CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_NFS_FS=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_SOFTLOCKUP_DETECTOR=y
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index f856b03e0fb5..d18378d2c2a6 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -85,7 +85,6 @@ CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=10
diff --git a/arch/arc/configs/nsim_700_defconfig b/arch/arc/configs/nsim_700_defconfig
index a1ce12bf5b16..3e9829775992 100644
--- a/arch/arc/configs/nsim_700_defconfig
+++ b/arch/arc/configs/nsim_700_defconfig
@@ -56,5 +56,4 @@ CONFIG_EXT2_FS_XATTR=y
 CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_NFS_FS=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 # CONFIG_DEBUG_PREEMPT is not set
diff --git a/arch/arc/configs/nsimosci_defconfig b/arch/arc/configs/nsimosci_defconfig
index ca10f4a2c823..502c87f351c8 100644
--- a/arch/arc/configs/nsimosci_defconfig
+++ b/arch/arc/configs/nsimosci_defconfig
@@ -65,4 +65,3 @@ CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
-# CONFIG_ENABLE_MUST_CHECK is not set
diff --git a/arch/arc/configs/nsimosci_hs_defconfig b/arch/arc/configs/nsimosci_hs_defconfig
index 31b6ec3683c6..f721cc3997d0 100644
--- a/arch/arc/configs/nsimosci_hs_defconfig
+++ b/arch/arc/configs/nsimosci_hs_defconfig
@@ -63,4 +63,3 @@ CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
-# CONFIG_ENABLE_MUST_CHECK is not set
diff --git a/arch/arc/configs/nsimosci_hs_smp_defconfig b/arch/arc/configs/nsimosci_hs_smp_defconfig
index 41a0037f48a5..1419fc946a08 100644
--- a/arch/arc/configs/nsimosci_hs_smp_defconfig
+++ b/arch/arc/configs/nsimosci_hs_smp_defconfig
@@ -26,9 +26,6 @@ CONFIG_UNIX=y
 CONFIG_UNIX_DIAG=y
 CONFIG_NET_KEY=y
 CONFIG_INET=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
 CONFIG_DEVTMPFS=y
@@ -37,7 +34,6 @@ CONFIG_DEVTMPFS=y
 # CONFIG_BLK_DEV is not set
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_ARC is not set
-# CONFIG_NET_CADENCE is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 CONFIG_EZCHIP_NPS_MANAGEMENT_ENET=y
 # CONFIG_NET_VENDOR_INTEL is not set
@@ -74,5 +70,5 @@ CONFIG_TMPFS=y
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_FTRACE=y
+# CONFIG_NET_VENDOR_CADENCE is not set
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 4a94d1684ed6..6f0d2be9d926 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -35,15 +35,11 @@ CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
 CONFIG_DEVTMPFS=y
 CONFIG_NETDEVICES=y
-# CONFIG_NET_CADENCE is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_INTEL is not set
 # CONFIG_NET_VENDOR_MARVELL is not set
@@ -94,12 +90,11 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_FS=y
 CONFIG_HEADERS_INSTALL=y
-CONFIG_HEADERS_CHECK=y
 CONFIG_DEBUG_SECTION_MISMATCH=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_MEMORY_INIT=y
 CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_SCHEDSTATS=y
-CONFIG_TIMER_STATS=y
 # CONFIG_CRYPTO_HW is not set
+# CONFIG_NET_VENDOR_CADENCE is not set
diff --git a/arch/arc/configs/vdk_hs38_defconfig b/arch/arc/configs/vdk_hs38_defconfig
index 0c3b21416819..d3ef189c75f8 100644
--- a/arch/arc/configs/vdk_hs38_defconfig
+++ b/arch/arc/configs/vdk_hs38_defconfig
@@ -58,8 +58,6 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-CONFIG_ARCPGU_RGB888=y
-CONFIG_ARCPGU_DISPTYPE=0
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
@@ -87,7 +85,6 @@ CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_SHIRQ=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
index f9ad9d3ee702..944b347025fd 100644
--- a/arch/arc/configs/vdk_hs38_smp_defconfig
+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
@@ -91,7 +91,6 @@ CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-# CONFIG_ENABLE_MUST_CHECK is not set
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_DEBUG_SHIRQ=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
-- 
2.17.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
