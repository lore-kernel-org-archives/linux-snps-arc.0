Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A147C3DA4A
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Aug 2024 03:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mK1ppUZKBuTljou6tmDR2PFcTVT7tlFcTu+egql4WrI=; b=dhbVbIEkwC+5U5
	9vH3HzeWl+vyO+3/MdT2QECGN5NlhcTMyL/HnV/sanzyO/EjXfChdI9D2O+ZCr5+SsefkJwk32aJv
	lgM0o2J53OAK2UXKZfAOUOwn4zUUPH8NA35oYur5sfZagJ6v0/unqnU9inFWMjfR3mR7bi9t7DxWq
	U58fyue1ucYaAOf02f7va4N3j1nINbNzqDiPytV2BSfVJuWt011ZRX/kJlojGpSIMLUQA6l5rP2Oy
	hGLTt+Q3+jvYflorencR/ET2rsENWr6kO62oFnB0WgZoh49s08wnU62/XXhcQw5KUcaI87ZOYZ4L5
	AWO7ZrHL2KhK/+jOYIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfA8a-0000000EZb7-2jIT;
	Sat, 17 Aug 2024 03:29:56 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfA8W-0000000EZaf-2oAN
	for linux-snps-arc@lists.infradead.org;
	Sat, 17 Aug 2024 03:29:55 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5d5c2ac3410so1599550eaf.2
        for <linux-snps-arc@lists.infradead.org>; Fri, 16 Aug 2024 20:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723865389; x=1724470189; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTyY/x86OeA5fpS9gzyMRtV3l6VUfvYcD6M+6PxGGRI=;
        b=RddUOM9QHtkQhW8YI8Ni7S1fZaukv0m9h+lgaody+oNW4WOqrtccM/6ZLDWO0HQ+M6
         sXouigOHpYpcblgUP0oFF++N0VbAjrh7FgpQOlVca07JvbBh7ICs/KBcBmzeEyKfoXKx
         3u1n0apTKVzZ16vOSrwmfqp56sYWYpnVzk2U+pFqyebGu/Lf5UZ60c7iVXPM4GIP5X+Q
         oQLT5N7ZIoAaprFwYHB0svkambVyCLS3FR/jL/4gbgQZo4Fp2UT2i4OqM047S47/9zzf
         ChdeqBtF6019FqFXf3C2Z12WAINrGAOwyGt2hr4CFetehUGZL9GWVtGTPZKTy9IT2pE3
         OrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723865389; x=1724470189;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTyY/x86OeA5fpS9gzyMRtV3l6VUfvYcD6M+6PxGGRI=;
        b=lRi19AkxZx9bJrf34liSvv3o6JmyQoYwnxgY3XsA9EuwQfwixNojPvRo8Nwx5ajNZX
         GMdsj63SSsERHf5MODRwrV++HoGISj23qLu3M2GtieDyhz55vkLYh1EiEatkQyJp0qR1
         dEcI2cmQJY2oxxCHmYOYRqshYk5jWRXrrzWYSk2BoGe/VtzWbA18kWPU7FVPrOxnXuRq
         N/zguLXLYJ3hYKLjwdwKvQEpl81bRuh71CW7hgDC4K8VVtxvFBseiT3rBoV5XX/6k24i
         wxKdbf9fnMPTzyfQROH9/HU+1BQ/eVSoYMBmgB6HLquuCJJUy4gGSx4X50BENVt9O8QP
         ZEsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVSmTMDotGezyKonB2WTyNNY4Szu34Vhk6Fn4dC7/mbyKNbrAHg9oshT6xa+lOqEimt7fZjuD2NyrkixOLRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9ff7bUeZCadRqyGSXNXKabnypWrEYXyHeGjaECqRaV2MyVcbZ
	t07ppsyxgfqcsvn+Ui97pZVaYJNLmsey6YxkFeHtxczJk2wl+1Vv
X-Google-Smtp-Source: AGHT+IFbQqY6/TbfsHuYrRYQAbOuk75Xx6EmcoYD90bPnzfw1nlcCRAyX/OfCL4jlkdAGR7fWttDwA==
X-Received: by 2002:a05:6358:7202:b0:1b1:a961:7977 with SMTP id e5c5f4694b2df-1b3932d79f7mr605156955d.29.1723865388634;
        Fri, 16 Aug 2024 20:29:48 -0700 (PDT)
Received: from localhost ([115.96.207.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac842f83sm6472300a91.37.2024.08.16.20.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 20:29:48 -0700 (PDT)
Date: Sat, 17 Aug 2024 08:56:29 +0530
From: Aryabhatta Dey <aryabhattadey35@gmail.com>
To: vgupta@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] dt-bindings: arc: convert archs-pct.txt to yaml
Message-ID: <emosjjbdwimwevrf2ew2dpn5sdx254el5fanhhquouu4bz6nbe@zqyp5ra7bmhh>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_202953_883618_37F0F581 
X-CRM114-Status: GOOD (  11.31  )
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

Convert dt-binding archs-pct from txt to yaml format.

Signed-off-by: Aryabhatta Dey <aryabhattadey35@gmail.com>
---
 .../devicetree/bindings/arc/archs-pct.txt     | 17 ----------
 .../bindings/arc/snps,archs-pct.yaml          | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arc/archs-pct.txt
 create mode 100644 Documentation/devicetree/bindings/arc/snps,archs-pct.yaml

diff --git a/Documentation/devicetree/bindings/arc/archs-pct.txt b/Documentation/devicetree/bindings/arc/archs-pct.txt
deleted file mode 100644
index e4b9dcee6d41..000000000000
--- a/Documentation/devicetree/bindings/arc/archs-pct.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* ARC HS Performance Counters
-
-The ARC HS can be configured with a pipeline performance monitor for counting
-CPU and cache events like cache misses and hits. Like conventional PCT there
-are 100+ hardware conditions dynamically mapped to up to 32 counters.
-It also supports overflow interrupts.
-
-Required properties:
-
-- compatible : should contain
-	"snps,archs-pct"
-
-Example:
-
-pmu {
-        compatible = "snps,archs-pct";
-};
diff --git a/Documentation/devicetree/bindings/arc/snps,archs-pct.yaml b/Documentation/devicetree/bindings/arc/snps,archs-pct.yaml
new file mode 100644
index 000000000000..532f7584f59f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arc/snps,archs-pct.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARC HS Performance Counters
+
+maintainers:
+  - Aryabhatta Dey <aryabhattadey35@gmail.com>
+
+description:
+  The ARC HS can be configured with a pipeline performance monitor for counting
+  CPU and cache events like cache misses and hits. Like conventional PCT there
+  are 100+ hardware conditions dynamically mapped to up to 32 counters.
+  It also supports overflow interrupts.
+
+properties:
+  compatible:
+    const: snps,archs-pct
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
-- 
2.46.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
