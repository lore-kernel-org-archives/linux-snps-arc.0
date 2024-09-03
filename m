Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897A7CD343A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Sep 2024 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wScVoYZ3E3QTwz/f5chvJyaTQ87PaJT5tqm0xxVYTZs=; b=2lWyMmj3XkDkrh
	CJ50QDi2ShequOnJyjqWzR7auS48az5wiiv9p/tYTYvk44gR5dbeB8Ca3lqby8a6wO6C+NixshNnQ
	bkb8m14SJ7w0rvkJn87Nz3Rq/S83tn4dBIX4ksgE4KC7KT2QY9ooSd8kqwJYtun+Zw/RweGQtrwWJ
	FnKOz/9aTc3fgEcZHHS+AyLC0VFstp0s0hBQiFhvS58bTxGLnGcaphbXeYPXKMwrkg6mlRq5mDPGE
	+UoQ4NaEMposrTHQ08zZyXREXhVt+gjPz936PVXA2OA713hOI52VFcuu0moAwRKxSFB9Hdhgp6L0o
	BcQc2UNylAOY7wCXcbpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUU7-00000000Yws-0vDT;
	Tue, 03 Sep 2024 14:26:19 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUT8-00000000YY0-0ZcY
	for linux-snps-arc@lists.infradead.org;
	Tue, 03 Sep 2024 14:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725373518; x=1756909518;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/NH32SjYt0sPBumAG45T8HQXhATIwv180H+ycCI81Ok=;
  b=Smy6V53j3MRbnr7Nc75G/NWmvJJ/SeGMnlGf8kxazzsxw2W/HaQm9j0u
   4YVejkxzCPYby2hfa+kkGKxakGMSb9tGs5zrsTJrb+1MbF8LoUqRrOX6g
   BEXyjGqSco3LN1+qG/zNyw/LYG/tFbUxvhJ+kQx95kxZNI6JaJ8vNBtcf
   WelZHX7H7L9ZpLX5pMBc3+U3cnoDqmI9fMqRQ/n3Y/p/2+NKzJjmUWA6q
   mgdiQiA/ucF7Qm0eSPrGr7Umu+JIVe18QeQF9AsCE+iJ+D8GrEh1GQnpc
   lPJwRqIu5o42n6ghrV5/63Eawicq8egMBR6U59CAtGkC3aSufP+UxTjLD
   A==;
X-CSE-ConnectionGUID: aA4v9kwUS+GdV9n92BmOmg==
X-CSE-MsgGUID: ZCdaRz3nTLmD/Z5R5bqj/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23541271"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23541271"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:25:17 -0700
X-CSE-ConnectionGUID: edDhvotLQcuRWt0gndB0oA==
X-CSE-MsgGUID: XnjOQGn9QLSWQ7JPMnCOLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65658816"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 07:25:14 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH v2 1/7] ARC: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
Date: Tue,  3 Sep 2024 17:25:00 +0300
Message-ID: <20240903142506.3444628-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_072518_260120_4B46C92A 
X-CRM114-Status: UNSURE (   8.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The dependency handling of the Synopsys DesignWare I2C
adapter drivers is going to be changed so that the glue
drivers for the PCI and platform buses depend on
I2C_DESIGNWARE_CORE.

Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 arch/arc/configs/axs101_defconfig     | 1 +
 arch/arc/configs/axs103_defconfig     | 1 +
 arch/arc/configs/axs103_smp_defconfig | 1 +
 arch/arc/configs/tb10x_defconfig      | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arc/configs/axs101_defconfig b/arch/arc/configs/axs101_defconfig
index 89720d6d7e0d..319bbe270322 100644
--- a/arch/arc/configs/axs101_defconfig
+++ b/arch/arc/configs/axs101_defconfig
@@ -66,6 +66,7 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_DRM=m
diff --git a/arch/arc/configs/axs103_defconfig b/arch/arc/configs/axs103_defconfig
index 73ec01ed0492..8c1f1a111a17 100644
--- a/arch/arc/configs/axs103_defconfig
+++ b/arch/arc/configs/axs103_defconfig
@@ -66,6 +66,7 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_FB=y
diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index 4da0f626fa9d..75cab9f25b5b 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -66,6 +66,7 @@ CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 # CONFIG_HWMON is not set
 CONFIG_DRM=m
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 1a68e4beebca..5aba3d850fa2 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -60,6 +60,7 @@ CONFIG_SERIAL_8250_DW=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
 # CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
-- 
2.45.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
