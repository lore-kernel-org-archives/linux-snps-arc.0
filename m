Return-Path: <SRS0=v2Cq=E3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE69C5519F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 23:42:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C67AD20B1F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 23:42:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E8qpScqS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hpxOIdqT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="a1v/i7VH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C67AD20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o0sVRm41SCWxgQmhomWSZxaxHf5AAUve5oSHMjkeoY0=; b=E8qpScqSugiQaMiC87UmGoUAS
	W1qsJK7KWuMuv2oTB0gW+WPGwzdf7UnNFxdrPmNXoawM8JeecKt/sc1IIZ+QyT4K/LqVJ2bmDhDlC
	ZTO6jv80bzQZ1dcQTvGAvXbQlxJaxO8Qo9y18QkhEn/4u49/mjZyc16bGweXXuI3eYa+SoZuAJCer
	VOGrxG2PQJOqXIJumi2ieSLE68C5A19L2s2k653E+ujEcKwSRJsvlYBqs8tgKD3Hz+GJHjKMPPLaD
	6AAoikJwZTS+3RBJRmtMOxsFdKmYsdrpmbwY9avQenc2/joGwkRbj9blJqBMFZ5d2QdFvGj3qIxoQ
	DKOK2qxLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgcW3-00066X-2C; Sat, 21 Nov 2020 23:42:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgcW0-000651-8i
 for linux-snps-arc@merlin.infradead.org; Sat, 21 Nov 2020 23:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1h+SziFamFq3LykQmarKbE8G+YUzBgaGe54/2+YrZwo=; b=hpxOIdqTGxjeMAa73C7XguI7mO
 0CEuE0CRAfITY/KIVjHUrNbMgsrDt1Mnavdb6fyZmdqFAO5Ft0RI5qUmEihkQOwRIBKiLr+Pj5uH/
 +dQg+09CbA0GOOrrqPZcwozAOOmgHLcyBY4yBZ4Mq7qFIBKmUUKr4zcdQ69WLBhMtwOcF81LGiW2w
 vyn3H2jMsyFi6TdyYjpOeBZFn898kVlFEdkqj4cJesZbTLs3OOZXgtUaH6koV9YsmnzYScIQ1c3kb
 GS46XslSCInbet4/kSYzizYtFO5lHjLkE8i8xCgpG2GubOVBXGPAMDY1PWY0/a92vyjRvcQuKxxIU
 un0VrRVg==;
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgYhl-0002Wm-VW
 for linux-snps-arc@lists.infradead.org; Sat, 21 Nov 2020 19:38:01 +0000
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net
 [126.90.211.135]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 0ALJawZE029948;
 Sun, 22 Nov 2020 04:37:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0ALJawZE029948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1605987421;
 bh=1h+SziFamFq3LykQmarKbE8G+YUzBgaGe54/2+YrZwo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a1v/i7VHRh8dM3u6c0dJ3qzOE6tsqrSvmNZZEEeq6FgNMfc5lcrbSPMofvOANEPp6
 FW7iWscKXNVfOqSESuqJXCpF3EG9wsG5LEZH7kZyv13X34Cg+jreHXM5NhgjJyjP4N
 sYrsZYPJnOUn08KuuBd1KDQ1lTVem1Ug51S+64qYo/7Xho4wYszqTYDb952AgWHvmu
 VXPTPQb1uR7qaAtNz2Q+13TFrrF8te513a1rtkBL3bDNmKv67XtlNMrP5X4wGuGgxS
 BWPtukllZyq9rpq2ceBU1XL0VbPggUPwEiTOj/Wqm4reUeGLyIWcCprLnwCN9P5aRt
 BcH+620rWnl+Q==
X-Nifty-SrcIP: [126.90.211.135]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org
Subject: [PATCH 3/6] ARC: build: add boot_targets to PHONY
Date: Sun, 22 Nov 2020 04:36:54 +0900
Message-Id: <20201121193657.51441-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201121193657.51441-1-masahiroy@kernel.org>
References: <20201121193657.51441-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_193755_822239_CB7FF5E0 
X-CRM114-Status: UNSURE (   7.85  )
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

The top-level boot_targets (uImage and uImage.*) should be phony
targets. They just let Kbuild descend into arch/arc/boot/ and create
files there.

If a file exists in the top directory with the same name, the boot
image will not be created.

You can confirm it by the following steps:

  $ export CROSS_COMPILE=<your-arc-compiler-prefix>
  $ make -s ARCH=arc defconfig all   # vmlinux will be built
  $ touch uImage.gz
  $ make ARCH=arc uImage.gz
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  # arch/arc/boot/uImage.gz is not created

Specify the targets as PHONY to fix this.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arc/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 61a41123ad4c..cf9da9aea12a 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -104,6 +104,7 @@ boot		:= arch/arc/boot
 
 boot_targets := uImage uImage.bin uImage.gz uImage.lzma
 
+PHONY += $(boot_targets)
 $(boot_targets): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
