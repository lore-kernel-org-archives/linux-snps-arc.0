Return-Path: <SRS0=v2Cq=E3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118D2C5519F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 22:52:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194362158C
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 22:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D5sabHs2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KN/O1HC6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="0PoWRkch"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 194362158C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DKZlN0n8aPHxbhWllftJP634OxXRUq8QkZWweCGryf8=; b=D5sabHs2zD6CeuGlpbNk8/2HH
	up5/WxdLdQ/rUzvNwjF2eC5p0IwWjV7t935UlfJ3QCvCM5S6Xh+0to/EM2ApF9fMe8OWGsWEGCSvD
	bR2XaNKlfpbF5Nk3ewIwlidOX26Dsnl8YxQ3CML19TJMnW7+qFRU/RO2p7pXFbqd89roq3BxeWvu4
	gxoLKgUToFbhj/N8XFDC2Ygam6wv32iopfuwXorBF9eg9DC2zD2LdwI32VjKJRWz8qpyW1F6BVTvR
	FcxVFkO8d08IsgbX7bI/2wMWSI3WvVdMfC6PiQBz1x/eUd6JjwdCGMvbChmoqxlpTWKhVHtldEMnY
	P+g0pEa9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgbjp-0005ee-L3; Sat, 21 Nov 2020 22:52:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgbjn-0005eA-UU
 for linux-snps-arc@merlin.infradead.org; Sat, 21 Nov 2020 22:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=alXBlMLWLCUCyTEUF8p/qc+ms20133bsRLbmR1w39mU=; b=KN/O1HC6PRj1cAwj938qnFb/c4
 Fmi3gwCKkP3fpJqqu1uFjSU1Y8riur6kLn9PDFobUMglu4FBy6JcZ176eNPc1f64TKSPZcvcJrvUo
 7YF3s8gJFlbuKZcHN54EPeu1NK+/x9m2dr+EdVKvPBSECLu+flI7UI5lmv4WLJEVCA+ilqPvtt8Fa
 qf8mAptYTrfXwUDLQycelH45zPlI+8ClcA7Bmv2vxUhlsThqWLQoIRd8EX5lNPJoFpizzPQ2wqBjn
 +k0vfojSJ5UM68QkdbAezDFExXsYuHoDlxZ0hiAcFSLjuTWAR/hU1bEjHXNQp7pujYlYGyiNYjoLp
 /kTP/TRw==;
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgYhl-0002Wn-V0
 for linux-snps-arc@lists.infradead.org; Sat, 21 Nov 2020 19:37:58 +0000
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net
 [126.90.211.135]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 0ALJawZG029948;
 Sun, 22 Nov 2020 04:37:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0ALJawZG029948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1605987422;
 bh=alXBlMLWLCUCyTEUF8p/qc+ms20133bsRLbmR1w39mU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0PoWRkch++wYopNCK7hJOVS2Ub0iw9gbr9sysU0966vxs2mQehozeuQqq3DpqhDBp
 GxDg1vPVFUP3THPlWMlPrOO7BkbW95ljIecZQ5S0Nec2Glc5es3kD8RR3LZ/YRm2BX
 K2lzf3dNt3zvLzI3Upje2h1f+wPZcIN6f+3CkMCkQgGrgIhSlTHrqRUim/MZiDRN5M
 zGqpegfpBbN1KFqn/6a+YqZlFVNMioihaBEAOwTuyDEEzn9jaRP0AFvQ+6vot4GnSh
 U0ETIv59V7nImQ1pwT4g9pVGeswRsJs85iUq0Svk8Z9wkVxEhpYLntv4UXb1S0Ej8r
 XJJMFOmvdNfBQ==
X-Nifty-SrcIP: [126.90.211.135]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org
Subject: [PATCH 5/6] ARC: build: remove unneeded extra-y
Date: Sun, 22 Nov 2020 04:36:56 +0900
Message-Id: <20201121193657.51441-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201121193657.51441-1-masahiroy@kernel.org>
References: <20201121193657.51441-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_193755_560439_C5847F82 
X-CRM114-Status: UNSURE (   8.57  )
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

Adding vmlinux.* to extra-y has no point because we expect they are
built on demand while building uImage.*

Add them to 'targets' is enough to include the corresponding .cmd file.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arc/boot/Makefile | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arc/boot/Makefile b/arch/arc/boot/Makefile
index 3b1f8a69a89e..b3870cc100bf 100644
--- a/arch/arc/boot/Makefile
+++ b/arch/arc/boot/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-targets := vmlinux.bin vmlinux.bin.gz
 
 # uImage build relies on mkimage being availble on your host for ARC target
 # You will need to build u-boot for ARC, rename mkimage to arc-elf32-mkimage
@@ -13,12 +12,12 @@ LINUX_START_TEXT = $$(readelf -h vmlinux | \
 UIMAGE_LOADADDR    = $(CONFIG_LINUX_LINK_BASE)
 UIMAGE_ENTRYADDR   = $(LINUX_START_TEXT)
 
+targets += vmlinux.bin
+targets += vmlinux.bin.gz
+targets += vmlinux.bin.lzma
 targets += uImage.bin
 targets += uImage.gz
 targets += uImage.lzma
-extra-y += vmlinux.bin
-extra-y += vmlinux.bin.gz
-extra-y += vmlinux.bin.lzma
 
 $(obj)/vmlinux.bin: vmlinux FORCE
 	$(call if_changed,objcopy)
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
