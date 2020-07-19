Return-Path: <SRS0=nPkL=A6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBA6C433E0
	for <linux-snps-arc@archiver.kernel.org>; Sun, 19 Jul 2020 21:03:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3389E20B1F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 19 Jul 2020 21:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2qro8H8R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XlPf0On3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3389E20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8kOm7IjhJwHUPAwwCMMbJr6wsJRINlZD4XjOMGzn05c=; b=2qro8H8ROkagNYZzCQflrdUVTH
	nNqgI1ganRgjl+i/W4ZUuWcWfxKroUU/qS41hYVAWqvo28gKTzN6cNETH1QsNTKI487yr48BEBeWp
	8Btw8d6hGRphfAnpQIHqCSJobo3uaqEA5RTMED4ZJYp2PyhuEdUTxETBRYetcPvunCAIO/B4OIIFd
	DfSp01i2aarocoy6+6uc0gquDMLDbXCmMKgZbXBPy9Uy2etnIshE0By2eJZJKZY66z+WFqCQOI3bJ
	lB2GVlRQWPfqspaaINMjhVPJKkLCi9MUUys309Pg9rXOWGAq0tB5pYw2kwTowOUjGgCRt/HrVk7uP
	QzeG3eTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxGSw-0006yS-6j; Sun, 19 Jul 2020 21:03:22 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxGSu-0006y0-AN
 for linux-snps-arc@lists.infradead.org; Sun, 19 Jul 2020 21:03:21 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A7B8D400BF;
 Sun, 19 Jul 2020 21:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1595192596; bh=gKXVshNdqU++k7HaLnrv7KMSPHBjY4gNupti0GCp6B8=;
 h=From:To:Cc:Subject:Date:From;
 b=XlPf0On3cBOqk4XmFgOvBECvm6oXnWKMpE6kD7T+lnIs9C2YvYRscZjq9nbKuixNQ
 c2eqZUswXGswTQWNukvSjZ+EAhkZBsU+EHamTh9qXvck/0te8JaAiZWhJPOZxMuLHU
 Jwp85mBVCX9zH0+e/29jV3EFbzph0Nm75Dp3bpL/kX2C///CT90qlI4a5/CmO/eE5L
 AU+Ugq/krhxJoW4NpSeiZ7HbDfl45noHVzVW90hRgXM/YOw+Oz9z99FXsbnKn/8FeA
 6UoEtKBGOgzlr1hkMtLKu5GNcjD2xW8Vc7TBVjm/ND8qiEnln/iMZQRuthWfAimXbz
 KJl6NgHvjERww==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 64BB6A009C;
 Sun, 19 Jul 2020 21:02:49 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org,
	Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH] Fix tst-libc_dlvsym{, -static} on ARC: don't check _sys_{err,
 sig}list
Date: Sun, 19 Jul 2020 14:02:35 -0700
Message-Id: <20200719210235.21767-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_170320_532645_646A0880 
X-CRM114-Status: UNSURE (   8.40  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

These symbols were recently deprecated but the test still checks for
them which fails for ARC.

Tested with arc-linux-gnuhf

-FAIL: elf/tst-libc_dlvsym
+PASS: elf/tst-libc_dlvsym
-FAIL: elf/tst-libc_dlvsym-static
+PASS: elf/tst-libc_dlvsym-static

|
| $ cat elf/tst-libc_dlvsym-static.out
| error: tst-libc_dlvsym.h:103: symbol _sys_errlist not found at any version
|

caveats:
  1. This does reduce test-coverage for existing ports with older
     versions of glibc where these symbols are valid, but reckon
     it is not an issue since the symbol is being deprecated anyways

  2. IMHO, despite the ABI freeze it should be fine for 2.32 too since
     it doesn't modify glibc ABI/API in any way, only a test-header is.
---
 elf/tst-libc_dlvsym.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/elf/tst-libc_dlvsym.h b/elf/tst-libc_dlvsym.h
index 6b132dd7c3e4..7eda47207824 100644
--- a/elf/tst-libc_dlvsym.h
+++ b/elf/tst-libc_dlvsym.h
@@ -117,8 +117,6 @@ compare_vsyms (void)
      obtain an explicit handle for libc.so.  */
   void *libc_handle = xdlopen (LIBC_SO, RTLD_LAZY | RTLD_NOLOAD);
 
-  compare_vsyms_1 (libc_handle, "_sys_errlist");
-  compare_vsyms_1 (libc_handle, "_sys_siglist");
   compare_vsyms_1 (libc_handle, "quick_exit");
 
   xdlclose (libc_handle);
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
