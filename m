Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DADC001DC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Jul 2023 17:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rwkGbFBXtrT6kQqnbAKbB2uyTsM7MsOwkbyMtlrFfMk=; b=p9H8+cM8qNGNuu
	NFJ+Vx1TD05ZwXgjYstC9/UGY0re80ancH9Q7kQWC/NUk6BPK4ns08ffJi5/D9Yh+0wYrt/J/dO5r
	/mF9Z3XnTElY2IKaDrYrIAf/Nlr8b5HUNCpr84CVdqdUv2WVC+LTvZ+Bax7A/ihwkKgs+McMFvmxx
	jzIHY+UlBxU1JZ0kcQ03BPJogq8SKTU7s+8Tp4y4U8lwJPcdhn8twFcEcZ7g0qJee9Wj6qHqwoCo0
	vYkx4uNKf33peLc/EcgqgOzjGEQkudJV8YMXCPus3jUuEaIDqQ3EMK7Ho2Y8dEM/hu4KgHML0rYvi
	byNFePkrOo3ZFQEgHQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMmC-006m84-2y;
	Fri, 14 Jul 2023 17:40:20 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMmA-006m7W-27
	for linux-snps-arc@lists.infradead.org;
	Fri, 14 Jul 2023 17:40:19 +0000
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3465bd756afso10302605ab.3
        for <linux-snps-arc@lists.infradead.org>; Fri, 14 Jul 2023 10:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356415; x=1691948415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wG/8q5xFWyXnYo87cfTZCB7vaY55UNr931bp9kogVs=;
        b=jZMdGgpmc+FZuhb+DEbHBJ4YWLWSR0t2iuSCtAY9OICnyYweD4INFkt25Ll+iXsf5f
         brpreHh4WVi8INwb9vRdfnOLmMKV09QHqhC0cDz5Qs1363MBE9lfxY+o4M7CU1K3E65v
         +xunCsQwpPOdzYFGRPlEa48vX7ZTzIfI2J4/wMDVrxCkplpcpTOJTEyFX2IWEh8kRdlY
         yCi52IMpx0U9vCTzQFRedwErumMWgblBeD4blch/nSTh7Zzm8OgME8FT7bmMKFv9saSX
         KA75o0KhdfCjq+sEj4j/6+57Un0MzgadmtAXTu27vPUHVf/olcVb5Ik7LpUIawXg93Ku
         tnrQ==
X-Gm-Message-State: ABy/qLYDq+GuRffjmdz/zcHcei0hVogyIQUvFe8EDorZ+Pn3jwu24u/s
	ItmY7nX25GK1Nrky87ptbBfDOS+ryw==
X-Google-Smtp-Source: APBJJlH1ABKviOQ3klyYs/5okEJaPdSwOXPl2VLR63HMBrNOvjmqi4zLogp8x+sOD3uU5HMEnSlIHQ==
X-Received: by 2002:a05:6e02:148:b0:33b:c0d8:26af with SMTP id j8-20020a056e02014800b0033bc0d826afmr4984504ilr.7.1689356415616;
        Fri, 14 Jul 2023 10:40:15 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id s7-20020a92d907000000b00345950d7e94sm2888274iln.20.2023.07.14.10.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:40:14 -0700 (PDT)
Received: (nullmailer pid 4039516 invoked by uid 1000);
	Fri, 14 Jul 2023 17:40:13 -0000
From: Rob Herring <robh@kernel.org>
To: Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@kernel.org>
Cc: devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arc: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:39:49 -0600
Message-Id: <20230714173949.4038981-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_104018_712315_016D5C3E 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arc/plat-axs10x/axs10x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
index b821df7b0089..1feb990a56bc 100644
--- a/arch/arc/plat-axs10x/axs10x.c
+++ b/arch/arc/plat-axs10x/axs10x.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/of_fdt.h>
-#include <linux/of_platform.h>
 #include <linux/libfdt.h>
 
 #include <asm/asm-offsets.h>
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
