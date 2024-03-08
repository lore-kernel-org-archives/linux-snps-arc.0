Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E3AC54E49
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Mar 2024 02:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=inFqVGDXAtXrinOjZK92VYzXmBioW8YaRFBA9s1J0Ik=; b=Sg6hMwQ7QUM/dx
	UJ74PsCem0AbVM07Dec+IX795b+3qno4Jd0m4vJRpI+DiB/l85fXTGhj/n4qVu07vQZgBhuGN/USy
	21hiIT+S16F2PFYwzWxU2tMi9ThB8GUtFKvxj2zBSPJxbTA9RDFi6IexbpQjsFiLLetVdUwS9PRBz
	6ox90ljmKCsWzpk5CalAvwQUPZhYoaxU2RtMQhWMK+8x+Xarv3rH7ERWBK4WWtxcqVDhjRO8SzAoc
	E3MKO/azFVngkA7KuEv0oYU91SiqwXGQ2IKSBS5+UH4Ca9BfhTL1IJSzLtH+tVUEhk7Xl80Ib0Njy
	yquylbKdY+jipgmBQ62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riPpJ-00000007K7F-3QdR;
	Fri, 08 Mar 2024 02:19:13 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riPpG-00000007K4P-1yp4
	for linux-snps-arc@lists.infradead.org;
	Fri, 08 Mar 2024 02:19:12 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-513382f40e9so1930259e87.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 07 Mar 2024 18:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709864347; x=1710469147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pKdIzofydZLIrT/shXbNHuO868q06IvkKgIySh45aUY=;
        b=WIzZAz2/lpMCTSB27FyFPdORHmKsB5yNd+god2kvsEZQ2FfO32IcD+8K0M5MBvYuz0
         acieQn79Rt1uJ5JSBRPgheuP3FJG1ZUpd/QqFGYNZtf9O5iMWtdwAMtdg4EqaEQY9+X+
         iXgVukOR8BWwPXkJGWgvlu/4bQ4CCCU3cT1XdE4UbuXjeeEeSMDHc9ZLWLomruT8Hd7T
         u8KDepCTZPyXC5AsTpnkrxHe7oaVj4VYT42OSgo75eopi/Nf+uY0uVh2QVecqPM45Hgs
         VuJjuBGNqxIefhuQFYE4Ib5AQCq10A7q6M0h32D3RqMDBpS9Rz+h+n3UDOizhagSQ5dt
         QHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709864347; x=1710469147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKdIzofydZLIrT/shXbNHuO868q06IvkKgIySh45aUY=;
        b=MaWKVma/Zq3LpAfJ/HiCAM3IZclkQJi0ZvQX/J1z8E3oIayliu+YOy9D4XewoPCZKg
         6XRa21Ot0HJzxPJppygKQ2AQ09If06jrdakphBb+VCvKg0eChkF330RM/g17lw1rNiTt
         Sl1aAw16fZ+X36rRVv2PsyT6bbylJ5jwJ4PnVFYGA8qtSgFC1feef/Co6uZf82kN31DT
         aLoPP2XntFBV9ka/wfIz3wJupzhB34SIikabLWiSZ3CroxhA1Ia6QPS0ETXMFW+T2KY8
         Kl3pxCpJa5UdmBHdaHTOCSdBfIltBfveTeEcLppChNxhfOEnDRtoZ34S2sXXBJm/uObh
         aiMA==
X-Forwarded-Encrypted: i=1; AJvYcCUONv7VAOyAzBLPvqlwpkEsomJaBF3pRTqs6d3qpopwb72xPXT0zwi4jp7itoriqwUyKPhRp5cgMOpL2jUi4ZexILUDZaG1BK33wVK/jzxJvE77
X-Gm-Message-State: AOJu0YxRVPTIgf0D7NHi6ysqGhLOv7SGXEPK15M6HVpwATmJarGYsCOB
	1PZMDk542CJU6B3QLxDwCBP7Kg8pL7/9OScGtITUysb7Kyf6qkMJ
X-Google-Smtp-Source: AGHT+IG8Eq641iU1qUHB4Jm43fMo2Xl6AyIe3nEXifyPdafeTnOKrOzbGnvRr83GBYNDs7lxrCJ3Tw==
X-Received: by 2002:a19:2d07:0:b0:512:9e78:998c with SMTP id k7-20020a192d07000000b005129e78998cmr2725287lfj.9.1709864347229;
        Thu, 07 Mar 2024 18:19:07 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id g7-20020a170906198700b00a4503a78dd5sm6209708ejd.17.2024.03.07.18.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 18:19:06 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: vgupta@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] dt-bindings: pct: Convert to dtschema
Date: Fri,  8 Mar 2024 02:18:42 +0000
Message-Id: <20240308021842.1975-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_181910_541025_18E3194C 
X-CRM114-Status: GOOD (  11.40  )
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

convert the PCT Arc Performance Counter bindings to DT schema

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 .../devicetree/bindings/arc/pct.yaml          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arc/pct.yaml

diff --git a/Documentation/devicetree/bindings/arc/pct.yaml b/Documentation/devicetree/bindings/arc/pct.yaml
new file mode 100644
index 000000000000..1f97a7c21b77
--- /dev/null
+++ b/Documentation/devicetree/bindings/arc/pct.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pct.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARC Performance Counters
+
+maintainers:
+  - Vineet Gupta <vgupta@kernel.org>
+  - Rob Herring <robh+dt@kernel.org>
+  - Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
+
+description: |
+  The ARC700 can be configured with a pipeline performance monitor for counting
+  CPU and cache events like cache misses and hits. Like conventional PCT there
+  are 100+ hardware conditions dynamically mapped to up to 32 counters
+
+properties:
+  compatible:
+    const: "snps,arc700-pct"
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pmu {
+        compatible = "snps,arc700-pct";
+    };
--
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
