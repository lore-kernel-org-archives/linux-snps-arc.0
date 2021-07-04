Return-Path: <SRS0=w0ag=L4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F3BC07E95
	for <linux-snps-arc@archiver.kernel.org>; Sun,  4 Jul 2021 20:02:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93F76613E9
	for <linux-snps-arc@archiver.kernel.org>; Sun,  4 Jul 2021 20:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93F76613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BlIFLp8Uy+9TJ2Ff3P1yhwex3p20HamZpA3qErUq+tg=; b=aCzSxmSEDB2aBf
	xm9kcMYg+5M71rMpNZFkiBsfR+51plqlKJX81T7oT2z9u6GYs0OnUOXScCTI1Q23iuClHEDj0mdKs
	uCBigLUUP5faHQaDcyFKYjNoSC6TFO8zFMtbLEKB1lKbrbSpfTuuu+H+IxV9iWlv53cO8Cxnor6yy
	EefdxD1GontUt5MXCQnjj98rE7/TYXBRGJhSgSk//UxvM/11iCwcajTbOXYdiU8B+hhnvV1c3lFD0
	iaYnfURuRXpKJqVNU1OLD/7C/u1FpVPS4cBNkyvCCEEVgc0LvDd+pPO8eIyEl1x9hUprvHQd1P4/a
	eA5fRkByrO1VQwRCghQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m08Jo-006hn2-49; Sun, 04 Jul 2021 20:02:20 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m08Jl-006hmi-CA
 for linux-snps-arc@lists.infradead.org; Sun, 04 Jul 2021 20:02:19 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1479A40F5C;
 Sun,  4 Jul 2021 20:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1625428936; bh=hsLg79LH2Y3VF5RrcEV293NOkkG1c+1iUuIJaHxmy28=;
 h=From:To:Cc:Subject:Date:From;
 b=mEsxyzoRKEAoVCRcmdSwgNO2Ck79RiqbnGnXf1g9bLimQwdZCqgjYP3i8kR6JGRHS
 FYuR4jvAw/PWhYd3VX7XJQGovp/PGYbYYBx+emyrU+r9o+4lv1vb5Jk7fyauoiYi+C
 eB0nh+nIHmCuW+FT36blhgAyy81Mv1eHsDgTMNow2LFsSpryki60/zg7B01r/AuO/b
 N7JtyLONceVkKN8hRLuY6w36s6KB9IOGWhG8GlOlpeCLwPLCrn6i2oiJm3jy14Cy1h
 02pgrMZKsLZ4Iwjst5VPGopVu37rmWQa1SSVm6MCWxucbrl4fHQg79D+lpMrtjd059
 6A+uYzp7IMmjQ==
Received: from us01odcres-abrodkin-0009.internal.synopsys.com
 (us01odcres-abrodkin-0009.sg.us01-p01.synopsys.com [10.195.24.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 10028A0079;
 Sun,  4 Jul 2021 20:02:12 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] dhcpcd: add ARC support
Date: Sun,  4 Jul 2021 13:02:02 -0700
Message-Id: <20210704200202.5144-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_130217_447225_453A165E 
X-CRM114-Status: GOOD (  16.65  )
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

This retrofits ARC support from upstream [1].
Should be a part of the next release of "dhcpcd".

https://github.com/NetworkConfiguration/dhcpcd/commit/82386110e67cf75c224e9817fce55e6b0f143266

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
---

Changes in v2:

 * Added "Upstream-Status" tag in the patch
 * Added my SoB in the patch

 meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb   |  1 +
 ...rc-privsep-linux.c-add-support-for-arc-28.patch | 63 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
index 56fcf5cc0b..5be480eb03 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
@@ -13,6 +13,7 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 
 SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
+           file://0002-src-privsep-linux.c-add-support-for-arc-28.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            "
diff --git a/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch b/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
new file mode 100644
index 0000000000..045f06a9aa
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
@@ -0,0 +1,63 @@
+From 82386110e67cf75c224e9817fce55e6b0f143266 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 8 Feb 2021 07:23:54 +0100
+Subject: [PATCH] src/privsep-linux.c: add support for arc (#28)
+
+Fix the following build failure:
+
+privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
+ #  error "Platform does not support seccomp filter yet"
+    ^~~~~
+In file included from privsep-linux.c:36:
+privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
+  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
+                                      ^~~~~~~~~~~~~~~~~~
+
+It should be noted that AUDIT_ARCH_{ARCOMPACT,ARCV2} is only defined
+since kernel 5.2 and
+https://github.com/torvalds/linux/commit/67f2a8a29311841ba6ab9b0e2d1b8f1e9978cd84
+
+Detection of arc compact and arc v2 have been "copy/pasted" from
+https://github.com/wbx-github/uclibc-ng/commit/afab56958f1cbb47b831ee3ebff231dfbae74af2
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d29083700a80dd647621eed06faeeae03f0587d3
+
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/82386110e67cf75c224e9817fce55e6b0f143266]
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ src/privsep-linux.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 402667af..21d41a9a 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -149,6 +149,22 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_I386
+ #elif defined(__x86_64__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_X86_64
++#elif defined(__arc__)
++#  if defined(__A7__)
++#    if (BYTE_ORDER == LITTLE_ENDIAN)
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACT
++#    else
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACTBE
++#    endif
++#  elif defined(__HS__)
++#    if (BYTE_ORDER == LITTLE_ENDIAN)
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2
++#    else
++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2BE
++#    endif
++#  else
++#    error "Platform does not support seccomp filter yet"
++#  endif
+ #elif defined(__arm__)
+ #  ifndef EM_ARM
+ #    define EM_ARM 40
+-- 
+2.16.2
+
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
