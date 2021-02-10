Return-Path: <SRS0=Zh1A=HM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63023C433DB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 Feb 2021 23:29:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7183964E32
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 Feb 2021 23:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7183964E32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pld+aEjrHO5lMm/tPqxGVF9mOb7S2KvamvhhrU0bZjA=; b=i8Xqe/fCinZzgxyQBc2MEB5QuT
	5+tj9CYoYIw8wRRyhwvq5QXGSdBJnjWN9d3NKfl/ywRFcufvH4fDdF/XBqcw19J8PKjYvxixr5jZp
	kNeJUqB5xdCg8ywESfdBZ9eFWWvA43D6zJ8l0VV4fHe5NSTlHpB5E989Rsff37CDgmlURN48frg2Y
	pMYvv0NPheOCNfXRhvxzZXGY9BhMR5N22+0T9Wsliibi7rfNq7mpNgcnLCCgCQ8R1R7POPE6zvxQZ
	Efs0oTA1oFB7oTmzBYXOvhCNkmEl0GCx2NjCP62NDrdt1r/bk223i/ig4XEM9X6WK3hkiSTTv8lvA
	Rx4QHNMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9yvF-0004RS-OK; Wed, 10 Feb 2021 23:29:25 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9yvD-0004Qs-UO
 for linux-snps-arc@lists.infradead.org; Wed, 10 Feb 2021 23:29:25 +0000
Received: by mail-pj1-x1031.google.com with SMTP id nm1so2071514pjb.3
 for <linux-snps-arc@lists.infradead.org>; Wed, 10 Feb 2021 15:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4S8hj3rJ53Szx3MHUGcJcRDsqdQPJWanquERrIv09dU=;
 b=nH2lxpSvtKfmW+z9GjIAhM2Z0snSrJySHKrQkv7R/Riz23/7r6XKiGD7zkC0Fo+8r8
 QryGZkDQ9WYBuRb+rUi6RT7s7FtO03mtZuVKXAmezup2ouyttU/0H3L2slDUaqGdNFUW
 rIZC48t+CkCTR894yiYF9l/wT7hQHnpajDdBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4S8hj3rJ53Szx3MHUGcJcRDsqdQPJWanquERrIv09dU=;
 b=Z0dZAUFehvQ/Ii8fhROxSb4fcf1gmru4aSuzQEA6WfnWl4vdOpKNmv8P7YO7m8lF8N
 yqBvrV9a0oTDfqO82Bbcp+haf8HyZCfHwWpisRQTEQxN7oRvakA9xoY8GG4LXo8oO1cg
 SqLXTj9sqsG5vGtkHprqE1/bUSopMQTEBIpizqe1pMNN7Cl0mjIvzqCbXLWO3OuNRiSX
 rF9u4MoCKujlwciohwpMUBlbdHKNbcl35Rw6fyijazJq6sQyV3Whtv7UkrajwFWC7330
 P3XM7/4eiu/eGLz5nvHwFHTKnKPVV0YuLgqdVRMObq0clG2tifMxtOTKBJzMBYT1CQNG
 5+Yg==
X-Gm-Message-State: AOAM530+wgjh8NDiv2ekU/p9+MYleDu8WAu6WhaNhkdLvuEblZIAbfAl
 bx6a+GNa6iVO4nNnN7nhI0dMsw==
X-Google-Smtp-Source: ABdhPJwvYyChakoqVVRsAHqASTL/7IGPt8bqhSLMmBFJc1sOFQ4rQCeZpoSwmoFhBe8sxYLmOLqZqw==
X-Received: by 2002:a17:90a:8e82:: with SMTP id
 f2mr1238309pjo.234.1612999760556; 
 Wed, 10 Feb 2021 15:29:20 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e23sm3288592pfd.145.2021.02.10.15.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 15:29:19 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@synopsys.com>
Subject: [PATCH] arc: Replace lkml.org links with lore
Date: Wed, 10 Feb 2021 15:28:49 -0800
Message-Id: <20210210232849.1358703-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=62ea86fcf95c26acaffb8d4f65a2a3ab984343c1;
 i=9LF/zUeDcs00Mwnr51UoClfwbmHzImPNgodF6PK4+cU=;
 m=kc8NgBcNkR1FdAUFoBcecPqIFWVDlhJwDI99K+gzg58=;
 p=fwSUZEPS2PRAQw1xpYPbJJWYmUPZHe4oenX/nvvkJoQ=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmAkbDAACgkQiXL039xtwCbLiA/+PF2
 Qzh2Afv4KUvrC7lqCxNXnPl+qzndKkD0JKtMcytzITO508GyprBWMwn0PyrvjeZaWwV3YLvJXLrTf
 txu9o3oRjBS65NhCpNSgmIdKIQrqvAi75H92MbR2L2IoFqHiH2Su2lMQlgSnqD5nx3Nqck0bXSf6k
 gRszIuF6Kn4P/ljRVj1ANzjLKnDpUoF/oPTxNX/8EFoCi2oCH+QItizLc3VAQvAnQyxboGJdKlcie
 0sVEcUFqU46KdfHdr+h2bbbot4DVVIjnaCxq4uCc217ruGoySA9oBMNfB297wImcfv2NxUpitQlZG
 QucbRliVdtZOXAUl5/5JoyAmlt3Nu4Ksqa9kcS4LLX/q85PkIqj7dflQ7pPqIUWGGRjjkdUbrP1mH
 4PhmbuGRcUduo+eaj9Pb60UK2Odgr84Idp2J9rOdjRA+QbXkPr3Jy9nUFnBcXpnG1fVbP0GiEYG8w
 hvBl1PVsE+A2MkjeVqh0+shg9ilaqv8a8Ec5qeTXKClY8hOcEMRU2TX0n3zvTv0Ee0nubV3tIioJj
 0YHwpt6velN7wuJODIVLhumAVFKhW3+ANUfn49Wp6yUXdlVvgnIzd3+9urZsGB9fW3A/w5/s7SKIx
 Mo+TutkQZzv3c8AdL2z+kLmLcbTClNj6c50neYJSe88Z7xOhmk3Ne9F+0/7wIK6Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_182924_029517_7CFA2340 
X-CRM114-Status: GOOD (  11.76  )
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
Cc: Joe Perches <joe@perches.com>, linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <abrodkin@synopsys.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

As started by commit 05a5f51ca566 ("Documentation: Replace lkml.org
links with lore"), replace lkml.org links with lore to better use a
single source that's more likely to stay available long-term.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/arc/include/asm/irqflags-compact.h | 8 ++++++--
 arch/arc/mm/dma.c                       | 2 +-
 arch/arc/plat-axs10x/axs10x.c           | 2 +-
 arch/arc/plat-hsdk/platform.c           | 2 +-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arc/include/asm/irqflags-compact.h b/arch/arc/include/asm/irqflags-compact.h
index 863d63ad18d6..0d63e568d64c 100644
--- a/arch/arc/include/asm/irqflags-compact.h
+++ b/arch/arc/include/asm/irqflags-compact.h
@@ -50,8 +50,12 @@
  * are redone after IRQs are re-enabled (and gcc doesn't reuse stale register)
  *
  * Noted at the time of Abilis Timer List corruption
- *	Orig Bug + Rejected solution	: https://lkml.org/lkml/2013/3/29/67
- *	Reasoning			: https://lkml.org/lkml/2013/4/8/15
+ *
+ * Orig Bug + Rejected solution:
+ * https://lore.kernel.org/lkml/1364553218-31255-1-git-send-email-vgupta@synopsys.com
+ *
+ * Reasoning:
+ * https://lore.kernel.org/lkml/CA+55aFyFWjpSVQM6M266tKrG_ZXJzZ-nYejpmXYQXbrr42mGPQ@mail.gmail.com
  *
  ******************************************************************/
 
diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 517988e60cfc..2a7fbbb83b70 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -32,7 +32,7 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 
 /*
  * Cache operations depending on function and direction argument, inspired by
- * https://lkml.org/lkml/2018/5/18/979
+ * https://lore.kernel.org/lkml/20180518175004.GF17671@n2100.armlinux.org.uk
  * "dma_sync_*_for_cpu and direction=TO_DEVICE (was Re: [PATCH 02/20]
  * dma-mapping: provide a generic dma-noncoherent implementation)"
  *
diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
index 63ea5a606ecd..b821df7b0089 100644
--- a/arch/arc/plat-axs10x/axs10x.c
+++ b/arch/arc/plat-axs10x/axs10x.c
@@ -50,7 +50,7 @@ static void __init axs10x_enable_gpio_intc_wire(void)
 	 * Current implementation of "irq-dw-apb-ictl" driver doesn't work well
 	 * with stacked INTCs. In particular problem happens if its master INTC
 	 * not yet instantiated. See discussion here -
-	 * https://lkml.org/lkml/2015/3/4/755
+	 * https://lore.kernel.org/lkml/54F6FE2C.7020309@synopsys.com
 	 *
 	 * So setup the first gpio block as a passive pass thru and hide it from
 	 * DT hardware topology - connect MB intc directly to cpu intc
diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
index b3ea1fa11f87..c4a875b22352 100644
--- a/arch/arc/plat-hsdk/platform.c
+++ b/arch/arc/plat-hsdk/platform.c
@@ -52,7 +52,7 @@ static void __init hsdk_enable_gpio_intc_wire(void)
 	 * Current implementation of "irq-dw-apb-ictl" driver doesn't work well
 	 * with stacked INTCs. In particular problem happens if its master INTC
 	 * not yet instantiated. See discussion here -
-	 * https://lkml.org/lkml/2015/3/4/755
+	 * https://lore.kernel.org/lkml/54F6FE2C.7020309@synopsys.com
 	 *
 	 * So setup the first gpio block as a passive pass thru and hide it from
 	 * DT hardware topology - connect intc directly to cpu intc
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
