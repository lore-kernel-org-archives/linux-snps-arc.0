Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDF9C3ABB0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 May 2025 15:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TwjXV2+3xmq4CFFbBZp4uNgC+vA3SPT1l9BlxbjiRUg=; b=NLP+65qgxHNvH4
	K8q5wmPSlOA+3WJMYs6+BltGlaxwFsi/+MK2rmHc2OVQQG6bcEoq4K/NDnyLoFEFIc96Ti7z5B27A
	Ezm6qiuZDxcU+iUSTJ/t2oFOCSotfDBcI1kdrbhdPcS5BSNLmgAlI6B42jyWehvTazsVEQxeeNhUc
	CwCFV91QrmD63OpHWf6GueKMt7I8/wiBkdssO4noYBjT0Th5AN9wCRSF8QJ+PzMKq51K1NzSR3okr
	3XvDpH9vBxJj5sP5t7OaYoixMMQTbKe/wA0O6O9IvcwxMSHL7gWDmBJjz3vMyRYw5LilF7iKf6zwI
	FCTaeGrD9aNr/vnlLdNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxOi-00000007knu-0dEB;
	Mon, 05 May 2025 15:06:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBx7V-00000007gS8-11EZ
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 May 2025 14:48:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5213F44BE4;
	Mon,  5 May 2025 14:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4F1C4CEE4;
	Mon,  5 May 2025 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456516;
	bh=jwgiKD3OjmybRDzCH8qb24nrslZzM56UFE7WhCbENJU=;
	h=From:To:Cc:Subject:Date:From;
	b=r+oqEuFGgWY8szdwj9GOSBUVlBEyrXYk5IpjC5rKH28xwiSoyle1GD1fXALVc2WCZ
	 1gC6BFzQRS29UQm2b03/RoM4UQ9qm5gt68LT2aYqPHRiwV+9Y0h/0HjMFvTLcVxRva
	 VfjmVkBSHq7/DKgb2T7yH2Het3GEglaBGc2roSHtv/gltQSgUJpsCjfB7H/lK4bZ3G
	 UyanHFlZVVd3+sifol3UVKfJmdFxAlsd/vAvJv4WveKGhiNpWt0YiR+c23iCbrQO5Y
	 hwVuk8H735rAhHLHsA15d1jgqoaiQkQPg1D02bruHo8XTbWKzbzdJi0Wzi2VBMTMyD
	 ySRzzPh+nmEJA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert snps,archs-intc to DT schema
Date: Mon,  5 May 2025 09:48:33 -0500
Message-ID: <20250505144834.1292666-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_074837_327788_80FFE212 
X-CRM114-Status: GOOD (  13.82  )
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

Convert the ARC-HS incore interrupt controller binding to schema format.
It's a straight-forward conversion of the typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/snps,archs-intc.txt  | 22 ---------
 .../interrupt-controller/snps,archs-intc.yaml | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
deleted file mode 100644
index 69f326d6a5ad..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* ARC-HS incore Interrupt Controller (Provided by cores implementing ARCv2 ISA)
-
-Properties:
-
-- compatible: "snps,archs-intc"
-- interrupt-controller: This is an interrupt controller.
-- #interrupt-cells: Must be <1>.
-
-  Single Cell "interrupts" property of a device specifies the IRQ number
-  between 16 to 256
-
-  intc accessed via the special ARC AUX register interface, hence "reg" property
-  is not specified.
-
-Example:
-
-	intc: interrupt-controller {
-		compatible = "snps,archs-intc";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		interrupts = <16 17 18 19 20 21 22 23 24 25>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml
new file mode 100644
index 000000000000..9d248ef7fe3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARC-HS incore Interrupt Controller
+
+maintainers:
+  - Vineet Gupta <vgupta@kernel.org>
+
+description:
+  ARC-HS incore Interrupt Controller provided by cores implementing ARCv2 ISA.
+  intc accessed via the special ARC AUX register interface, hence "reg" property
+  is not specified.
+
+properties:
+  compatible:
+    const: snps,archs-intc
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupts:
+    description: List of IRQ numbers between 16 and 256
+    items:
+      items:
+        - minimum: 16
+          maximum: 256
+
+required:
+  - compatible
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "snps,archs-intc";
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupts = <16>, <17>, <18>, <19>, <20>, <21>, <22>, <23>, <24>, <25>;
+    };
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
