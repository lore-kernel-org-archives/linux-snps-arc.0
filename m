Return-Path: <SRS0=v2Cq=E3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F28CC388F9
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 22:52:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A4162158C
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 22:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wvza523v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ebq/jKKs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="YNvrC8KA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A4162158C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zomqV9NUBCNJ6ljFxOlb+4EI5i4mIkdhGGAtO42UjYs=; b=Wvza523vQUD5Vn6JF4m16RZxG
	mqjDRtYku8/4GZQCWsXfpTIqn416vXrtHq0FR4nlNfd9hiVpbG91XPoIXBx1tqNcz+4CouzVKGWOD
	Dea0yb5ZWF7QkmCkWZQta4JEyF8eiyY++8cJe4CV3mo3Vp7h2fiV+lncjq/wxPVd5MuL+hjryQMYp
	aXieMIvmoIHStF/IXsKTP/clJNVIoeq5eLYBi5i68ouv/tTSssQP6Mgu4GlYNrWlOaNgyFFTM7ymv
	VWzbqc0Z7acYv5am5We9hLB6usFowhE9A2aBHARedkTZhwl3lJNTY70Ip4pOad8ib1ftKb3oSorBL
	z9t4Rfq/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgbjf-0005cN-Jo; Sat, 21 Nov 2020 22:52:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgbjd-0005bT-I0
 for linux-snps-arc@merlin.infradead.org; Sat, 21 Nov 2020 22:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tO3lfkM46ZiPV3HhKCVAn/mbT1jwK78kFKMFlV1doXg=; b=Ebq/jKKsTIVMNwkTa+cIEEyYpS
 iOj9rsdU+liYlr/9CEmcjV7WB6J0Mf9V99qJf4xSZ5HoLCLVB5AcUqqbIDYqoRgJVdVsynI3yTcba
 qeYOLOns4GSXwSdY/QXwx/Wj8MFRDxXn41vw+T4PWpO8NjAQ7Dz7JmzA5ULwFE+cT3H3O/sHG5pn5
 N3KVht8k42kGYyr+SwXR62RIXL0YHAlobcEOtVVDZtnukldywbWS8FWH33NEacqji/2Y3TLKWDVSr
 y/OuMNOfSFtAfLE3/SsaiZ+sFmzNuchMr3D9x1TZfcSfXxrg+KiI2B1sOY/l1CSCO6P1ZACWOTjBd
 psMBLVxQ==;
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgYho-0002Wl-23
 for linux-snps-arc@lists.infradead.org; Sat, 21 Nov 2020 19:38:03 +0000
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net
 [126.90.211.135]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 0ALJawZC029948;
 Sun, 22 Nov 2020 04:36:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0ALJawZC029948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1605987419;
 bh=tO3lfkM46ZiPV3HhKCVAn/mbT1jwK78kFKMFlV1doXg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YNvrC8KA+LKEIK7ONHxyRkxBKssZdAJTe+oKUtGqaNwoUS/em0UqjMw52eHxgGkuq
 LhaF7WBp/rdUVdt8YalBMgD7KTq5fRDFUvkSXU1Kb1IFLH2aI6/ZCRBfwzL8DbalVa
 7HqCU4xTlsfCjvhW5EkJobh6NBVxvRY/xQ+Yd553OOZ5qnZfPBogvQPybR5QRY1L7n
 mFaObU3zryeELlXFyb05UlSe+D5cNZG9Yzxvq4fNFCslF18b4LsvdcUP1Q0uLbWDTM
 etkwsclLElVKblM1XWs/85p94sGd5RuXyGgmHxzjL5sClJnl70Bfe1Ut1CfqE2yGkd
 urrm/fDRIJ9BA==
X-Nifty-SrcIP: [126.90.211.135]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org
Subject: [PATCH 1/6] ARC: build: remove non-existing bootpImage from
 KBUILD_IMAGE
Date: Sun, 22 Nov 2020 04:36:52 +0900
Message-Id: <20201121193657.51441-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201121193657.51441-1-masahiroy@kernel.org>
References: <20201121193657.51441-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_193757_061332_2570E97E 
X-CRM114-Status: UNSURE (   9.21  )
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

The deb-pkg builds for ARCH=arc fail.

  $ export CROSS_COMPILE=<your-arc-compiler-prefix>
  $ make -s ARCH=arc defconfig
  $ make ARCH=arc bindeb-pkg
  SORTTAB vmlinux
  SYSMAP  System.map
  MODPOST Module.symvers
  make KERNELRELEASE=5.10.0-rc4 ARCH=arc KBUILD_BUILD_VERSION=2 -f ./Makefile intdeb-pkg
  sh ./scripts/package/builddeb
  cp: cannot stat 'arch/arc/boot/bootpImage': No such file or directory
  make[4]: *** [scripts/Makefile.package:87: intdeb-pkg] Error 1
  make[3]: *** [Makefile:1527: intdeb-pkg] Error 2
  make[2]: *** [debian/rules:13: binary-arch] Error 2
  dpkg-buildpackage: error: debian/rules binary subprocess returned exit status 2
  make[1]: *** [scripts/Makefile.package:83: bindeb-pkg] Error 2
  make: *** [Makefile:1527: bindeb-pkg] Error 2

The reason is obvious; arch/arc/Makefile sets $(boot)/bootpImage as
the default image, but there is no rule to build it.

Remove the meaningless KBUILD_IMAGE assignment so it will fallback
to the default vmlinux. With this change, you can build the deb package.

I removed the 'bootpImage' target as well. At best, it provides
'make bootpImage' as an alias of 'make vmlinux', but I do not see
much sense in doing so.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arc/Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 0c6bf0d1df7a..acf99420e161 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -102,12 +102,6 @@ libs-y		+= arch/arc/lib/ $(LIBGCC)
 
 boot		:= arch/arc/boot
 
-#default target for make without any arguments.
-KBUILD_IMAGE	:= $(boot)/bootpImage
-
-all:	bootpImage
-bootpImage: vmlinux
-
 boot_targets += uImage uImage.bin uImage.gz
 
 $(boot_targets): vmlinux
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
