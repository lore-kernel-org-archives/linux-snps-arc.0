Return-Path: <SRS0=keuX=K2=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDBBC47080
	for <linux-snps-arc@archiver.kernel.org>; Mon, 31 May 2021 20:12:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 167F160E0B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 31 May 2021 20:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 167F160E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rfTiPgvdthDd/LpAIeFOVXG00EAR9xbh60NhyStDCCQ=; b=gwXQefxg2wQ+I+
	ZIybSh/ncxT39fXyLi9d/wOHjRUq113CYQcPmsyFozTKo9wNwGOPVJ+6wQViHVPBckUM6+hejbE2Y
	SG2zukNDr+d0/BvZOI7rDjk+CHR/yRSWSJ9SjPJcuwHVzrhZX3+2uRCCCsnQcc6ZCRXzMJcQ2cdGt
	7yoHaoLDKXlpQw6HPolvOfzaUByM9+E2/R8Gm94qm48HDmyjXKC2mNW9+NGyN4VQOhYvXFxDXPFO7
	FfKjIs5E5DCvmcbzWMb3OmXekpA9kUTBOU+1ys5cFuPoZicIdQIzNk6XH3WcFs/OeV6Bhq+6AkVva
	gJj8DEcwB2jkR0IO3WnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnoGw-00DLxV-9z; Mon, 31 May 2021 20:12:26 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnoGt-00DLwn-8K
 for linux-snps-arc@lists.infradead.org; Mon, 31 May 2021 20:12:24 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7F4BCC0091;
 Mon, 31 May 2021 20:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622491940; bh=2ctEcYErY/rylyQEvFLBnkHXpg6xMjlEVX7nl8MdoCY=;
 h=From:To:Cc:Subject:Date:From;
 b=RLwSUQGFVHat3qRKYeWs2k+PsKGnE8y4oJ076mpWL0p9KXQDwpwbDCUCsXd8Mo8AU
 rYawG9yVQ8KT7z5QVy/xgWvnXS2UziUx50aEqcNbGri8ghGGjfzQ8EqGOgB0URqzp8
 5bsCNUXhpP01yUwftpj5MXwpFbdSdCA887y7A+bwcevaMuIcJ1Yl7qOMFB6gtdlCzZ
 nS05AotU4XaOSOjnR+mQWVO+vqHkH9K9Dsn8XiWmIermqzv6XO9qdqLaK+k4NBam1P
 pOEnLdWRZ03klT92yezD7zcmEC7QGko0YCU1qUDk3ZHOx0+iJjmwIQgW44bswgqpwG
 FBtWFbaBzdynQ==
Received: from us01odcres-abrodkin-0009.internal.synopsys.com
 (us01odcres-abrodkin-0009.sg.us01-p01.synopsys.com [10.195.24.123])
 by mailhost.synopsys.com (Postfix) with ESMTP id 14A12A0060;
 Mon, 31 May 2021 20:12:16 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: linux-yocto@lists.yoctoproject.org
Cc: linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] ARC: Rename nSIM HS to HAPS HS
Date: Mon, 31 May 2021 13:12:10 -0700
Message-Id: <20210531201210.32006-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_131223_362032_E2651D5A 
X-CRM114-Status: GOOD (  11.92  )
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

In v5.5 kernel we merged "nsim_hs" config into "haps_hs", see [1],
and from then on we use the same one "haps_hs" for everything simulated:
nSIM/QEMU/FPGA.

Of important notes:
 * We switched from legacy ARC UART to a standard DW UART

 * QEMU port for ARC is under review upstream, see [2].
   But even today with WIP version from our GitHub fork [3] its possible
   to run this image for "hapshs" machine as simple as:
   ----------------------------->8------------------------------
   $ qemu-system-arc -cpu archs -M virt -nographic -no-reboot -monitor none \
     -kernel build/tmp-glibc/deploy/images/hapshs/vmlinux-initramfs-hapshs.bin
   ----------------------------->8------------------------------

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1681baa713aa138d3f0f77f05c3de1cd6416c7d6
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg00458.html
[3] https://github.com/foss-for-synopsys-dwc-arc-processors/qemu

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 .../nsimhs-standard.scc => hapshs/hapshs-standard.scc}       |  4 ++--
 bsp/hapshs/hapshs.cfg                                        | 12 ++++++++++++
 bsp/{nsimhs/nsimhs.scc => hapshs/hapshs.scc}                 |  2 +-
 bsp/nsimhs/nsimhs.cfg                                        | 10 ----------
 4 files changed, 15 insertions(+), 13 deletions(-)
 rename bsp/{nsimhs/nsimhs-standard.scc => hapshs/hapshs-standard.scc} (72%)
 create mode 100644 bsp/hapshs/hapshs.cfg
 rename bsp/{nsimhs/nsimhs.scc => hapshs/hapshs.scc} (54%)
 delete mode 100644 bsp/nsimhs/nsimhs.cfg

diff --git a/bsp/nsimhs/nsimhs-standard.scc b/bsp/hapshs/hapshs-standard.scc
similarity index 72%
rename from bsp/nsimhs/nsimhs-standard.scc
rename to bsp/hapshs/hapshs-standard.scc
index 3201ca52..1842b00c 100644
--- a/bsp/nsimhs/nsimhs-standard.scc
+++ b/bsp/hapshs/hapshs-standard.scc
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: MIT
-define KMACHINE nsimhs
+define KMACHINE hapshs
 define KTYPE standard
 define KARCH arc
 
 include ktypes/standard/standard.scc
 
-include nsimhs.scc
+include hapshs.scc
diff --git a/bsp/hapshs/hapshs.cfg b/bsp/hapshs/hapshs.cfg
new file mode 100644
index 00000000..adcc0531
--- /dev/null
+++ b/bsp/hapshs/hapshs.cfg
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: MIT
+# ARCv2 ISA
+CONFIG_ISA_ARCV2=y
+
+# Serial port
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_OF_PLATFORM=y
+
+# Built-in .dtb
+CONFIG_ARC_BUILTIN_DTB_NAME="haps_hs"
diff --git a/bsp/nsimhs/nsimhs.scc b/bsp/hapshs/hapshs.scc
similarity index 54%
rename from bsp/nsimhs/nsimhs.scc
rename to bsp/hapshs/hapshs.scc
index 3c1613a6..ea2b8b6c 100644
--- a/bsp/nsimhs/nsimhs.scc
+++ b/bsp/hapshs/hapshs.scc
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: MIT
-kconf hardware nsimhs.cfg
+kconf hardware hapshs.cfg
diff --git a/bsp/nsimhs/nsimhs.cfg b/bsp/nsimhs/nsimhs.cfg
deleted file mode 100644
index 34580a39..00000000
--- a/bsp/nsimhs/nsimhs.cfg
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: MIT
-# ARCv2 ISA
-CONFIG_ISA_ARCV2=y
-
-# Legacy ARC UART
-CONFIG_SERIAL_ARC=y
-CONFIG_SERIAL_ARC_CONSOLE=y
-
-# Built-in .dtb
-CONFIG_ARC_BUILTIN_DTB_NAME="nsim_hs"
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
