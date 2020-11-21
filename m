Return-Path: <SRS0=v2Cq=E3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DB9C5519F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 22:52:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8265E2168B
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 22:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aqQUfhD6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AG9/iLPu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="cZPsV4qu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8265E2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pcbvt0dlh9HpRczf8H+DbO1JBXhhFhk/bc9H8NV84FU=; b=aqQUfhD66pb+Zbj6a9j/X9BPD
	MsIIwPO4zw9ThtWoIJL72KdzUgZKb2XkBy6e3nj9teZZlydRpgqgq0IGV73/lbiWg2/L02cY/sEEA
	8PED3RJVQsBI81cXtq5A4kUfAi2dDD8Jtbz7aN3gbEIfapSi02S+PtjP0dic2IEVAy2QeP4HOY/Ce
	pMNuluPzcML1H6DtwFWiw1NU51KG5o0r+6TpGM02ey5U8x/c1vcQvqx7JJT0Q3WAtfI2L+Z2uR4RR
	sYPtKzWw3UILtqQOPk93iR99TMfo795tEm+BJbBnYNx8zjWhogMJgZoWjnVsh3QK/CSFRaAWh3sVa
	NDpMevIow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgbjt-0005fl-Im; Sat, 21 Nov 2020 22:52:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgbjr-0005em-8D
 for linux-snps-arc@merlin.infradead.org; Sat, 21 Nov 2020 22:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=nAxcOdJY1mvrwExMzg4hS+b5OlfAmMuqUYSTfMiExmU=; b=AG9/iLPuIfVF5ZVcDROS5Z3Ewn
 UtLdln8gHeCLh4KGJpX1HbR+hnJPNmPpZrXp2Y9z2Bbh9qbrGh5bizL/ctk5+qoQ8Xv970HAcaOnl
 suFAqgWUl9Rt+XbCdfhlpVqQ5NA5YktMai7Xwy/RhEbaozpne513lytaYEIXVxGew38V/FRHWSpSn
 iTVRp0W+AR+sXspKRft4pOphI3ov9eGrtbbapiV/0e/8/2v6ohinPfWfDC7W9Bz0F9ztuOicgMQAD
 Ce3caI3R9k5n57WuWtn43camrNpgJil8vAwdhU2zAIi7NPQtGMwjtN85vEcU7rfJ5p2tum3Xgcyo8
 ZxND0UmA==;
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgYhm-0002Wp-0Y
 for linux-snps-arc@lists.infradead.org; Sat, 21 Nov 2020 19:38:02 +0000
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net
 [126.90.211.135]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 0ALJawZD029948;
 Sun, 22 Nov 2020 04:37:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0ALJawZD029948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1605987420;
 bh=nAxcOdJY1mvrwExMzg4hS+b5OlfAmMuqUYSTfMiExmU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cZPsV4qudX33UralNq72zbDm/DGpw8VcC9GxyU5KnUZsunhaeRFN3AnCz3Hn55Cru
 6YEfw4BWYUiluiJq2bQUcR+VPlT+wdUS7OMkoJD40LptWO3AzxihRviK+tGEBzTqCq
 nuEkRVoEKAdtBD+5oT2d31SVGGNVpLT7PSvV/ShkPaS/C5y50Vt1kep5byoBs1+oDQ
 foORTZlzcHxJeRJGJTm6s4gEfc8wq5MrFSNPdX/n4hC/DYjGarh6/CAmNBXSJnR1wD
 f6zQ3T8mN09XML5nG+q2nFP/Ps2WZ81JqfwQlCKE1KIrkgcvu3/TD1+gmRfRXSAmAK
 /BVPDUvWBbVtg==
X-Nifty-SrcIP: [126.90.211.135]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org
Subject: [PATCH 2/6] ARC: build: add uImage.lzma to the top-level target
Date: Sun, 22 Nov 2020 04:36:53 +0900
Message-Id: <20201121193657.51441-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201121193657.51441-1-masahiroy@kernel.org>
References: <20201121193657.51441-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_193755_823556_039F5C84 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

arch/arc/boot/Makefile supports uImage.lzma, but you cannot do
'make uImage.lzma' because the corresponding target is missing
in arch/arc/Makefile. Add it.

I also changed the assignment operator '+=' to ':=' since this is the
only place where we expect this variable to be set.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index acf99420e161..61a41123ad4c 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -102,7 +102,7 @@ libs-y		+= arch/arc/lib/ $(LIBGCC)
 
 boot		:= arch/arc/boot
 
-boot_targets += uImage uImage.bin uImage.gz
+boot_targets := uImage uImage.bin uImage.gz uImage.lzma
 
 $(boot_targets): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
