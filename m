Return-Path: <SRS0=X5Oj=3J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92456C2D0DB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jan 2020 10:46:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59EFF20674
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jan 2020 10:46:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NprDUrku";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="b2Qd+RYV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59EFF20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=51xq4bgHI14s9QM8XC37c5XzSugmqyG2tszgms3POc0=; b=NprDUrkuRKnT+1asIPALLbE388
	nm0YywH0d18CVY0L4uRUmNqYRkz1Bks7+5Tfy9LrVOL4FANDDJRpKgFmphu74KFyc3uVyhYw91lHt
	df9ysgvHAYSJ3/PfcFmVJokVfES7cyURCvSEtH9bT5Ve3qHWCwv0fS2CejJuHpZN6OvFhxU38jOJF
	gP5NKUP6UhzsKWvIn9lTYBo2UhNDE9wlaRcL3DfcRi9VY6XJCX9kGjBfWS51AVEE7VD+3oVOMEDfN
	SR7UCUV9Hv/usYirFXQNEAor2pi+VN5h0uQVWpqKVIBrVtiQkX7mmJJcr/6ZDumMBnO6gyo0PcVir
	I1oh3NsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itUa0-0004Hc-C8; Mon, 20 Jan 2020 10:46:48 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itUZy-0004GG-99
 for linux-snps-arc@lists.infradead.org; Mon, 20 Jan 2020 10:46:47 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 32392C04F5;
 Mon, 20 Jan 2020 10:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579517201; bh=q8VjuuCK95PHz68NYZhkjHEIrxv1ORP0AB/mKEGgQds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b2Qd+RYV/hvstxDf3mR78l8MewG3oIylvEZ2ZLyJzTWphoVX57SmmX7QIjxcQ3g3r
 OEsI4ft7HXMDe7dNP2DCBzg0vNtIIutea6/xr4qJn+jOuZ4XKTj5YiIbyf7frwZDIx
 kYEfCqUdO94CK//EyRjWEd/9KuOIIBwERgY9YtmI54X5tNULvUA5pwy6TN/rT8mFpa
 N8CgGE31LIplBmqY5U9UvzcF5f/IJmNN0HHNkZhNhLgN5oGp0jHoeQN0igjbt7pUMH
 ALPOIc+S7gk2CQe60j8auzjb9v78oj1K/OahbMjpoLNFPZdsWb/lK+UcpM8lzwmR03
 WnGBi7POMarog==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id 9538DA0068;
 Mon, 20 Jan 2020 10:46:39 +0000 (UTC)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: u-boot@lists.denx.de
Subject: [PATCH 2/3] ARC: nsim_{700|700be|hs38be}_defconfigs: Disable
 networking
Date: Mon, 20 Jan 2020 13:46:34 +0300
Message-Id: <20200120104635.33290-3-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20200120104635.33290-1-abrodkin@synopsys.com>
References: <20200120104635.33290-1-abrodkin@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_024646_382134_281EBD00 
X-CRM114-Status: UNSURE (   9.80  )
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
Cc: linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, uboot-snps-arc@synopsys.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

We don't have yet any brc700 or big-enadian platforms with networking
support to run this particular configuration.

Whenever QEMU for ARC supports arc700 or big-endian targets we may revisit
this one.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 configs/nsim_700_defconfig    | 1 +
 configs/nsim_700be_defconfig  | 1 +
 configs/nsim_hs38be_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/nsim_700_defconfig b/configs/nsim_700_defconfig
index 2d4a58b178..6a38e2c246 100644
--- a/configs/nsim_700_defconfig
+++ b/configs/nsim_700_defconfig
@@ -14,6 +14,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="nsim"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+# CONFIG_NET is not set
 CONFIG_DM=y
 CONFIG_DM_SERIAL=y
 CONFIG_DEBUG_UART_SHIFT=2
diff --git a/configs/nsim_700be_defconfig b/configs/nsim_700be_defconfig
index 61eea91449..d3ed84a415 100644
--- a/configs/nsim_700be_defconfig
+++ b/configs/nsim_700be_defconfig
@@ -15,6 +15,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="nsim"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+# CONFIG_NET is not set
 CONFIG_DM=y
 CONFIG_DM_SERIAL=y
 CONFIG_DEBUG_UART_SHIFT=2
diff --git a/configs/nsim_hs38be_defconfig b/configs/nsim_hs38be_defconfig
index 5d2ea59d52..b074b4ca98 100644
--- a/configs/nsim_hs38be_defconfig
+++ b/configs/nsim_hs38be_defconfig
@@ -16,6 +16,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="nsim"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+# CONFIG_NET is not set
 CONFIG_DM=y
 CONFIG_DM_SERIAL=y
 CONFIG_DEBUG_UART_SHIFT=2
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
