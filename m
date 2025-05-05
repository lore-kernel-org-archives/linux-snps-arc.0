Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F344CC3ABAA
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 May 2025 15:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jM6O8Dmd59sQNZjwbBY24UswU348yl0A/+87uDtcMsI=; b=fZWK/cyMJ1TXzD
	qMY4vEQdgqzvzOD2n7M45fkaaig1ZPxbSBglfUvXo9pBfyimu4ZlVTKOssyRbeD01VZy0LK9DoKgj
	7TPllsM55ZmBqoD3MGUXFCwPB+umthx2L/moqiJMw2npJuFo7nYQvjAWv/6wctfsMo281vrtscibH
	yyRFWIsmZ7KViYdhRnsqyjQsyNQDhv6CQMGzJOjt5vvWvX6bKmQyNbOEMHhtb55AxJECPP0bayqwP
	93FWMSk/0BU8mPENdMEul8JLL0YjS4zykH8K0pv6zRF70bJXl5qhCHWbtSqWDWDrYCv/ByiNM5WUO
	zPmHob23CHxkEUa7jENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxOh-00000007knQ-2W35;
	Mon, 05 May 2025 15:06:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBx7N-00000007gPO-3nyq
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 May 2025 14:48:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C606261155;
	Mon,  5 May 2025 14:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F79C4CEE4;
	Mon,  5 May 2025 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456509;
	bh=iJBGHt/npzUxaGLYucbYNrOJhubSXQWs8CMQPcDC/gI=;
	h=From:To:Cc:Subject:Date:From;
	b=o+xZogyr/LVx9m9JH7TLopjZetPVbrgnx3apooVzO0krXivZBYTaRxpvMEXQBBlpn
	 oDWH0hu4+uzUqZdNn2guVbHE6ByQwJAbQxA2bLZkCgv+8V/GCh/Uq72MDWbna+8LXE
	 h3QVio3/OaEppAZp5KRFSQz23lHpW7XgkQx+QA+m9kjBJ9oCGOgbWM9Sw3MuCPhjoF
	 TAEgSIZZfepWcXoMh/YyfSTX7AUQ3hWn8KQ5CYvkqgWHNyQgQtgugkLkz3/JoL9+bS
	 SeQ3MlGLbWuBraJjYICBR1tcsUeTuNMLnXXyZDVJcGchDpjLfx99/UXLJ7T4xYcXnn
	 UIMvMpjO5YMWQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Convert snps,arc700-intc to DT schema
Date: Mon,  5 May 2025 09:48:25 -0500
Message-ID: <20250505144826.1292329-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
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

Convert the Arc Core interrupt controller binding to schema format. It's
a straight-forward conversion of the typical interrupt controller.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../interrupt-controller/snps,arc700-intc.txt | 24 -----------
 .../snps,arc700-intc.yaml                     | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,arc700-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,arc700-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,arc700-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,arc700-intc.txt
deleted file mode 100644
index 9a5d562435ea..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/snps,arc700-intc.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* ARC700 incore Interrupt Controller
-
-  The core interrupt controller provides 32 prioritised interrupts (2 levels)
-  to ARC700 core.
-
-Properties:
-
-- compatible: "snps,arc700-intc"
-- interrupt-controller: This is an interrupt controller.
-- #interrupt-cells: Must be <1>.
-
-  Single Cell "interrupts" property of a device specifies the IRQ number
-  between 0 to 31
-
-  intc accessed via the special ARC AUX register interface, hence "reg" property
-  is not specified.
-
-Example:
-
-	intc: interrupt-controller {
-		compatible = "snps,arc700-intc";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,arc700-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/snps,arc700-intc.yaml
new file mode 100644
index 000000000000..000a734d997c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/snps,arc700-intc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/snps,arc700-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARC700 incore Interrupt Controller
+
+maintainers:
+  - Vineet Gupta <vgupta@kernel.org>
+
+description: >
+  The core interrupt controller provides 32 prioritized interrupts (2 levels)
+  to ARC700 core.
+
+  intc accessed via the special ARC AUX register interface, hence "reg" property
+  is not specified.
+
+properties:
+  compatible:
+    const: snps,arc700-intc
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    description: An interrupt number 0-31
+    const: 1
+
+required:
+  - compatible
+  - interrupt-controller
+  - '#interrupt-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "snps,arc700-intc";
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
-- 
2.47.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
