Return-Path: <SRS0=oiN1=56=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FB6C38A2B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Apr 2020 23:29:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA8762064A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Apr 2020 23:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EzOggkD5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ld35b5F/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA8762064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxFv7AkKXtJSTBhTzVmhnDhlON1E5Fv8icIT0JOwnQg=; b=EzOggkD57TWKSA
	ouz/ux/QP1XENopPSAvM7vCTa3F6fANSFz6XDVQhGxRd0s8e5rHGhLMhwuPh+Ja4WPrhLt7RR+MU/
	I7sYiJSK52VWPRcLqAskQZrOnig+PbDWhEoSzh9wQo7VjTUvmcOpJGvjCu60EMuLYHAABunS+6NH8
	TlJs4z8Wz3XYatp5hRPh2dM3j275xE/YGRpkyr6I3m/ByaWtx69F+rl2EY12u3j0lJPhv8LdgyW10
	y9xHjmok6AHJeNnez2ZgllU3hVVeaOmVbxV01ZJl+VmjFPiiGm1HTCPBb7cWr6WcbRKqC5QtrevtB
	8Zm7V/WAx0qigApfPSRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOV02-0003hv-Ae; Tue, 14 Apr 2020 23:29:50 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOUzv-0003fH-Md
 for linux-snps-arc@lists.infradead.org; Tue, 14 Apr 2020 23:29:49 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A98DFC00DE;
 Tue, 14 Apr 2020 23:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586906982; bh=tNu4Scr083t5TpR/FgPDRPLMswuTZmLX+MVL6F246l8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ld35b5F/22iSy4ujhnk9XA69Db+XLvF8r5GbDNw98Ky+EapwNFKzH6fWXathYC/sd
 rpPjVxISeXcG5TnQTtGdyV9gzCDHkmjgz34PUtX4FlLQ4OKUSGFSHGWB1Sg4iy2sbl
 ujG33FON9BrY8B1ZFAEMrwsIDnDw8XfxYjezBSyha4WU1fPyI9SCuOm6V4y0HAh61b
 2s0D13KGqKpwCM50sAH96yO0+psKlMkUW4r6s90y8cXWyhat2yCn7Ar/qs5SKn9jXx
 z2kTa9LlODtCZQZjDFgk3B6iWP8ZzFmRNP5AkQWLLGuv5RUqvhtKVyMk7l8I4lAS6L
 vVd3Cu7zPminw==
Received: from paltsev-e7480.internal.synopsys.com
 (ru20-e7250.internal.synopsys.com [10.225.48.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id E28A5A0063;
 Tue, 14 Apr 2020 23:29:38 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v3 2/2] dt-bindings: Document the Synopsys ARC HDMI TX bindings
Date: Wed, 15 Apr 2020 02:29:29 +0300
Message-Id: <20200414232929.22788-3-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414232929.22788-1-Eugeniy.Paltsev@synopsys.com>
References: <20200414232929.22788-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_162943_797224_03192F28 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-snps-arc@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This patch adds documentation of device tree bindings for the Synopsys
HDMI 2.0 TX encoder driver for ARC SoCs.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 .../display/bridge/snps,arc-dw-hdmi.yaml      | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
new file mode 100644
index 000000000000..9b2fdfecd5b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/snps,arc-dw-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare HDMI 2.0 TX encoder driver
+
+maintainers:
+  - Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+
+description: |
+  The HDMI transmitter is a Synopsys DesignWare HDMI 2.0 TX controller IP
+  with a companion of Synopsys DesignWare HDMI 2.0 TX PHY IP.
+
+  These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
+  Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
+  with the following device-specific properties.
+
+properties:
+  compatible:
+    const: snps,arc-dw-hdmi-hsdk
+
+  reg:
+    maxItems: 1
+    description: |
+      Memory mapped base address and length of the DWC HDMI TX registers.
+
+  clocks:
+    items:
+      - description: The bus clock for AHB / APB
+      - description: The internal register configuration clock
+
+  clock-names:
+    items:
+      - const: iahb
+      - const: isfr
+
+  interrupts:
+    maxItems: 1
+    description: Reference to the DWC HDMI TX interrupt
+
+  reg-io-width:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [1, 4]
+        description: |
+          Width of the registers specified by the reg property. The
+          value is expressed in bytes and must be equal to 1 or 4 if specified.
+          The register width defaults to 1 if the property is not present.
+
+  ports:
+    type: object
+    description: |
+      A ports node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        description: |
+          Video input endpoints of the controller.
+          Usually it is associated with ARC PGU.
+
+      port@1:
+        type: object
+        description: |
+          Output endpoints of the controller. HDMI connector.
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi@10000 {
+        compatible = "snps,arc-dw-hdmi-hsdk";
+        reg = <0x10000 0x10000>;
+        reg-io-width = <4>;
+        interrupts = <14>;
+        clocks = <&apbclk>, <&hdmi_pix_clk>;
+        clock-names = "iahb", "isfr";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                hdmi_enc_input: endpoint {
+                    remote-endpoint = <&pgu_output>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                hdmi_enc_out: endpoint {
+                    remote-endpoint = <&hdmi_con>;
+                };
+            };
+        };
+    };
+
+    hdmi-out {
+        port {
+            hdmi_con: endpoint {
+                remote-endpoint = <&hdmi_enc_out>;
+            };
+        };
+    };
+
+    pgu {
+        port_o: port {
+            pgu_output: endpoint {
+                remote-endpoint = <&hdmi_enc_input>;
+            };
+        };
+    };
-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
