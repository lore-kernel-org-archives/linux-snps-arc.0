Return-Path: <SRS0=OSUx=P7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53479C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 Nov 2021 11:20:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A05760F4F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 12 Nov 2021 11:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A05760F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e3gRz+ylI6CwSUcgwWiVDDTqHK/KSwAX47CVdL+HGV0=; b=SI4K4H2SSOpf9q
	0jDOIMVwQnQU9dRMxwpo96cMAHh4aLuZTl0hxhUpOFfTByX7HiUaWEv3m3QGMBMWPO1B/PnNIgRX5
	6SWDL28JJOd793GCxH5/PYkn/xezO5G/PcYkP90myQxg4xvN/Z58zIUXnSq22acongXOsTyYFO42N
	ZV3NkxQjCEoYvQiQzyKalJ0MFlcR3uKwLP99BCjd/VuHjgW0bYh5R1eAWZM5ZCAyls2qjltxy0Ls0
	rnMDKiKDaHk7bXVvQXQuVG0RTytD9zs7nqfziB19YGOHXTMHr8UO3m3JqJLwoo1pVfJWRQFcCctNI
	z9NTeOE6U/wa4Zr3uVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlUbq-00A8MS-1A; Fri, 12 Nov 2021 11:20:42 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlUbn-00A8Lp-Mv
 for linux-snps-arc@lists.infradead.org; Fri, 12 Nov 2021 11:20:41 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 39A1E419FD;
 Fri, 12 Nov 2021 11:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1636716038; bh=yLvu9PKlouIQ8W+/Seq0GR+naBFWJxFxOD3NTtgZtTM=;
 h=From:To:Cc:Subject:Date:From;
 b=SfAyw7NG3U3Gpk7l9R1qGpodN1s3edIg4EoDbkOOLn03Yjdbarvi4g9O12dXvW4vu
 gRnnzA4Ji9rKDRXuj6AL0n79mAzfLNnfng+exjBktvw3aZqSj/tLcRAPKRvqiT7ZSq
 jtrFQcgLMQfW628t8Cq1UWviF5Q0mXF88RueAq2dTcK2MwrzEGA1kUaL4EuXBcSfZE
 qNX3MpKhOTe89IZT38alUNTJo4a4t1SeUfqx41v6TxAXZdpmkDX97Xc7EDLKQxRkjr
 XDSfhTowwERKDyIBBi8pz4zA9+frTp1Sumjj5M4q/IefeY2rnmexqol2iW1Xv0BDKD
 yi5pqd1rzxw0w==
Received: from abrodkin-5550.internal.synopsys.com (unknown [10.121.15.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id D4283A005C;
 Fri, 12 Nov 2021 11:20:34 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Randy Dunlap <rdunlap@infradead.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2] docs: Add documentation for ARC processors
Date: Fri, 12 Nov 2021 09:50:59 +0300
Message-Id: <20211112065059.7273-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_032039_793943_2B6E9105 
X-CRM114-Status: GOOD (  24.23  )
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
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Vineet Gupta <vgupta@kernel.org>
---

Changes v1 -> v2:
 * Spello "linux" -> "Linux" (Randy Dunlap)

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
index 000000000000..249d03c6be8e
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
+are supported in Linux. Some options are transparent to software
+(i.e cache geometries, some can be detected at runtime and configured
+and used accordingly, while some need to be explicitly selected or configured
+in the kernel's configuration utility (AKA "make menuconfig").
+
+However not all configurable options are supported when an ARC processor
+is to run Linux. SoC design teams should refer to "Appendix E:
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
