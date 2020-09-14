Return-Path: <SRS0=fDo5=CX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC0EC433E2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Sep 2020 21:37:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E8520759
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Sep 2020 21:37:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XNa5cImH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="T9n+Z1Gc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42E8520759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GzTkpZogB0ApMWtDFpyfoCjeo4hJXXc3YxfNtX3Cg7Y=; b=XNa5cImHOJvpQXMdUgFsbn9duD
	Vrn2CSrWOWC2Z3ENKCCIRaAeDe1e9RY4SyAVi6iySqTz/4OWxSRK9By2PtfBVfEHiGo3rNi++wKJF
	KrfiY9FqQ9/L5jJs4W7PpMt0ewI9zBTxNAo4GUOvt9J4AMquOlbJhINE56aLCT9taPGtlvCVg0Az0
	XbQjaqwdRk1OWUWsuJMlj3jAcvpp28E/MV4tsmpDE7Xv+STTBBpEBuZ0lppizm+COEhg1yBd9M8Gk
	879ZaJnb33kPh8h1M/jc2M1StNBOz+lruzugoTxS3ddIBQoxLlQ+jFrhgsWhW0w5WoXJ4k7E4TM3o
	OCdftkZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHwAe-0001lT-SB; Mon, 14 Sep 2020 21:37:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHwAc-0001kw-Qj
 for linux-snps-arc@lists.infradead.org; Mon, 14 Sep 2020 21:37:56 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1CD48C00AD;
 Mon, 14 Sep 2020 21:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1600119473; bh=4rtbPKgY+mf3lU2z4sWMU/3hVmkHOiH3LFG2dtUci3g=;
 h=From:To:Cc:Subject:Date:From;
 b=T9n+Z1GcG9CobZZRriYiM5drEfCMleUcpvVcP7rJlyW2YaHRAP/7h+xO9jt244+IS
 wCEMJ9oTLo4qdGKescz/ip1t6weeAktLRW1ivhdJcOBqxmjJY6gxgOwnDJQCAqAUu8
 CRo/3mN9kY0sOjiLS/w1pcwAthpErhlbkj3TecjLbb4+NTWjnDPNsl2eAdGJW2Lwx8
 YIX5zFGnJtpQAYQOI1BdbgTAg8B4bV9Wo1MMgtefSD61rjfMmiF19XrbnEjFfoJQbz
 bb3J3Vz75uOKrQeMM+SJdtEG4fIac/6EFIe0VpUGXWYQQY4qIRfi624I9WVaS0aCuT
 KBENxapQH7sLw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7BD1CA0096;
 Mon, 14 Sep 2020 21:37:50 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Subject: [PATCH] package/glibc: ARC: use upstream 2.32
Date: Mon, 14 Sep 2020 14:37:48 -0700
Message-Id: <20200914213748.3953423-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_173755_118126_537D739D 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

ARC glibc port was merged upstream in 2.32
There's no need to refer to github as it has the exact same version and
can be retired in future.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 .../glibc.hash                                |  2 ++
 package/glibc/glibc.mk                        | 20 ++++++++++---------
 2 files changed, 13 insertions(+), 9 deletions(-)
 create mode 100644 package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash

diff --git a/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash b/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
new file mode 100644
index 000000000000..7fb36ad2ba7e
--- /dev/null
+++ b/package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash
@@ -0,0 +1,2 @@
+# Locally calculated (fetched from Github)
+sha256  07f3804abbc6a23315f09568686c0e5bb81d714251cf537d25a36f826cae540b  glibc-2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f2b5b4caf6ac..29f2f5fd3555 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -4,22 +4,24 @@
 #
 ################################################################################
 
-ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2020.03-release
-GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
-else ifeq ($(BR2_RISCV_32),y)
-# RISC-V 32-bit (RV32) requires glibc 2.33 or newer
-# Until 2.33 is released, just use master
-GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
-GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
-else ifeq ($(BR2_csky),y)
+ifeq ($(BR2_csky),y)
 GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
 GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
+ifeq ($(BR2_arc),y)
+# ARC support in upstream was merged in 2.32 release
+# This can be removed once BR upgrades upto 2.32 or later
+GLIBC_VERSION = 2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5
+else ifeq ($(BR2_RISCV_32),y)
+# RISC-V 32-bit (RV32) requires glibc 2.33 or newer
+# Until 2.33 is released, just use master
+GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
+else
 GLIBC_VERSION = 2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d
+endif
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
