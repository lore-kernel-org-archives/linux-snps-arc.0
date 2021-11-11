Return-Path: <SRS0=FKsm=P6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D15C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 Nov 2021 20:13:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A32D61264
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 Nov 2021 20:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A32D61264
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1UnI7rMGZsh0/g4t6eJvFVIinlqQBFZJpeBni3/v6uM=; b=KYdhV34IAk+/kM
	OT4tEw9SOTr+k8FQzVaEts1QrWoGctfulAgssw9g3B4XWG6ndcVHx/AFu6Zqg1Oa4LfgwApjF+Nd/
	Qd49SZgjdn7nYvz2GxHAriFSIngFYqmfkg2sQf1BUoE0lJDc1Z8Q8KrRmH9kjGCpDAt58KeP1bikX
	v0mGlws7M5FhOfUM5xrdRO5W1qgGdKbx+KaMEEGPKZypUH0PmxW2NXO2fX5Ijgk3cLmfaa8ZT4qw8
	YimLDXetIFB6nPWZoNR2FqbYKOqEyesTyViO5QBYxVS0m/muzZiKjixWAkwBOJEtlI9Vvt+EgNpVD
	O48NM/ZYbfte+gC8JQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlGSA-008gKZ-1X; Thu, 11 Nov 2021 20:13:46 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlGS6-008gIU-4M
 for linux-snps-arc@lists.infradead.org; Thu, 11 Nov 2021 20:13:44 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 463F141987;
 Thu, 11 Nov 2021 20:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1636661617; bh=XseVvft9x1sew+i2e/LlGESkBdhICaqgzD46XMuqwcU=;
 h=From:To:Cc:Subject:Date:From;
 b=QnQkSxonWGxZTeJEVUfug68jJ155ENOFCctPOHQHawMCEm5rv/Xq75n78ipQykCeJ
 AVQgHE8JXRO4DnEi6yLaYJlsDPjxZJkU6avzcuXPLGvbwHknxABYIL3fBLT2LrAz+P
 /s7xWj6k2zZo7vRJPP69yrgSM67GO/x1HZRvtxsuc9/dQ5E5eU7ogCHhN3GfPTQ3Z2
 dVKn/D/O6A/prq5wNvak5WpPUiD1yTyNdV5TYOE1WTLsBENJZBw5iiUhyV2MS0K1d6
 lvcaLY7FXXvggMxdxkPxm3DU8e5KWJ1khzA0drHom1n7gpWa75wjbOHUa3hkqzN01h
 ZvwZ/RPyilvWQ==
Received: from abrodkin-5550.internal.synopsys.com (unknown [10.121.15.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 47A69A005D;
 Thu, 11 Nov 2021 20:13:33 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH] docs: Add documentation for ARC processors
Date: Thu, 11 Nov 2021 23:10:36 +0300
Message-Id: <20211111201036.5692-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_121342_209943_EEEA8259 
X-CRM114-Status: GOOD (  24.32  )
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

ARC processors are supported in upstream kernel since v3.9
and so far there was no documentation about them except some
Device Tree bindings.

Fixing it with the simples set of docs now:
1. Overview with pointers to other informational resources
2. Autogenerated feature table

Note though it's just the very beginning, there will be more
for sure given time as there're many things worth documenting
and in fact even contents itself is avaialble but just spread
in some other places. Now we'll try to keep all here and
then maintain it looking forward to match the state of development.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Vineet Gupta <vgupta@kernel.org>
---
 Documentation/arc/arc.rst      | 81 ++++++++++++++++++++++++++++++++++
 Documentation/arc/features.rst |  3 ++
 Documentation/arc/index.rst    | 17 +++++++
 Documentation/arch.rst         |  1 +
 MAINTAINERS                    |  1 +
 5 files changed, 103 insertions(+)
 create mode 100644 Documentation/arc/arc.rst
 create mode 100644 Documentation/arc/features.rst
 create mode 100644 Documentation/arc/index.rst

diff --git a/Documentation/arc/arc.rst b/Documentation/arc/arc.rst
new file mode 100644
index 000000000000..ab85c022cea1
--- /dev/null
+++ b/Documentation/arc/arc.rst
@@ -0,0 +1,81 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Linux kernel for ARC processors
+*******************************
+
+Other sources of information
+############################
+
+Below are some resources where more information can be found on
+ARC processors and relevant open source projects.
+
+1. `<https://embarc.org/>`_ - Community portal for open source on ARC.
+Good place to start to find relevant FOSS projects, toolchain releases,
+news items and more.
+
+2. `<https://github.com/foss-for-synopsys-dwc-arc-processors>`_ -
+Home for all development activities regarding open source projects for
+ARC processors. Some of the projects are forks of various upstream projects,
+where "work in progress" is hosted prior to submission to upstream projects.
+Other projects are developed by Synopsys and made available to community
+as open source for use on ARC Processors.
+
+3. `<https://www.synopsys.com/designware-ip/processor-solutions.html>`_ -
+Official Synopsys ARC Processors website location, with access to some IP
+documentation (Programmer's Reference Manuals, AKA "PRM's", see
+`<https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf>`_)
+and commercial tools (Free nSIM,
+`<https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi>`_ and
+MetaWare Light Edition, `<https://www.synopsys.com/cgi-bin/arcmwtk_lite/reg1.cgi>`_)
+
+Important note on ARC processors configurability
+################################################
+
+ARC processors are highly configurable and several configurable options
+are supported in linux. Some options are transparent to software
+(i.e cache geometries, some can be detected at runtime and configured
+and used accordingly, while some need to be explicitly selected or configured
+in the kernel's configuration utility (AKA "make menuconfig").
+
+However not all configurable options are supported when an ARC processor
+is to run linux. SoC design teams should refer to "Appendix E:
+Configuration for ARC Linux" in the ARC HS Databook for configurability
+guidelines.
+
+Following these guidelines and selecting valid configuration options
+up front is critical to help prevent any unwanted issues during
+SoC bringup and software development in general.
+
+Building the Linux kernel for ARC processors
+############################################
+
+The process of kernel building for ARC processors is the same as for any other
+architecture and could be done in 2 ways:
+
+1. cross-compilation: process of compiling for ARC targets on a development
+host with a different processor architecture (generally x86_64/amd64).
+
+2. native compilation: process of compiling for ARC on a ARC platform
+(hardware board or a simulator like QEMU) with complete development environment
+(GNU toolchain, dtc, make etc) installed on the platform.
+
+In both cases, up-to-date GNU toolchain for ARC for the host is needed.
+Synopsys offers prebuilt toolchain releases which can be used for this purpose,
+available from:
+
+1. Synopsys GNU toolchain releases:
+`<https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases>`_
+2. Linux kernel compilers collection:
+`<https://mirrors.edge.kernel.org/pub/tools/crosstool/>`_
+3. Bootlin's toolchain collection: `<https://toolchains.bootlin.com/>`_
+
+Once the toolchain is installed in the system, make sure its "bin" folder
+is added in your ``PATH`` environment variable. Then set ``ARCH=arc`` &
+``CROSS_COMPILE=arc-linux`` (or whatever matches installed ARC toolchain prefix)
+and then as usual ``make defconfig && make``.
+
+This will produce "vmlinux" file in the root of the kernel source tree
+usable for loading on the target system via JTAG.
+If you need to get an image usable with U-Boot bootloader,
+type ``make uImage`` and ``uImage`` will be produced in ``arch/arc/boot``
+folder.
diff --git a/Documentation/arc/features.rst b/Documentation/arc/features.rst
new file mode 100644
index 000000000000..b793583d688a
--- /dev/null
+++ b/Documentation/arc/features.rst
@@ -0,0 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. kernel-feat:: $srctree/Documentation/features arc
diff --git a/Documentation/arc/index.rst b/Documentation/arc/index.rst
new file mode 100644
index 000000000000..7b098d4a5e3e
--- /dev/null
+++ b/Documentation/arc/index.rst
@@ -0,0 +1,17 @@
+===================
+ARC architecture
+===================
+
+.. toctree::
+    :maxdepth: 1
+
+    arc
+
+    features
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/arch.rst b/Documentation/arch.rst
index f10bd32a5972..14bcd8294b93 100644
--- a/Documentation/arch.rst
+++ b/Documentation/arch.rst
@@ -9,6 +9,7 @@ implementation.
 .. toctree::
    :maxdepth: 2
 
+   arc/index
    arm/index
    arm64/index
    ia64/index
diff --git a/MAINTAINERS b/MAINTAINERS
index 3b79fd441dde..286a5e896be4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18020,6 +18020,7 @@ M:	Vineet Gupta <vgupta@kernel.org>
 L:	linux-snps-arc@lists.infradead.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git
+F:	Documentation/arc/
 F:	Documentation/devicetree/bindings/arc/*
 F:	Documentation/devicetree/bindings/interrupt-controller/snps,arc*
 F:	arch/arc/
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
