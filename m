Return-Path: <SRS0=v2Cq=E3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55362C5519F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 22:52:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E22C12158C
	for <linux-snps-arc@archiver.kernel.org>; Sat, 21 Nov 2020 22:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hFWZjmft";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nERJYY6V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="Uq4W7h5v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E22C12158C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fGy9c5+OTY/4HQwilFRXKSij00+SQxEjahCGGlIYxm4=; b=hFWZjmft6vdZWb5/ByPLpxeeR
	chZi+Wl6rrqciGPaFDQs19xft6Ewv7sqV9z7Wz54fM3NqQw0143RHA51vk4SiI1Y5hdJoLZTNnsns
	KJ5A2ELWsq95SC8yed0Jx+ATniHZSlFDn1yiGmjlUmlQnfchTEvbtXL67k5FwxeGr1yKwNTAwGhAn
	Z0qrk4V1Pat+AyLMUIN+2cdD2aY4rzdC9zkaXvOUd/un0pautV1Op+WI5vWnUHnejjuScT27HZ20M
	CY2YRjA5nJ4TReGyMI5OA/01RbPSksrckPn8BGgGzIfmvY5xWbtwGBezbxivoThR1A0IQsWLfBfrX
	0rVCvIWmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgbjw-0005gi-8W; Sat, 21 Nov 2020 22:52:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgbjs-0005fK-Uk
 for linux-snps-arc@merlin.infradead.org; Sat, 21 Nov 2020 22:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=99oE6i2R2oSYJfOZeL3BoDQJFFm9KeclhptfXWwG3fI=; b=nERJYY6VYk+3yuMv66TDexDIpg
 uQ6dmd7rc+VQcqNHZ1KE5/Oysl/lIRcTfPgZwb9AM+BDUBLCgCzu5sZUcFAwKGkFy8NWjUKTuWqFi
 NounKcHt/YTJcQy2t/gAj1cdS/F6EOj6WzCqt+1GQ9vTinKKU4omX7kutU0k+6dTrzuHMaRUZtEvN
 +jOkqbX4Vc+kdqRIWtb8KkHmueR7Volcb+2uE3J53jmPCatS13zAHVA3CBrW+ps0Y+8Ll3RkBLN+h
 WM+xQ7ll+AkXwnaaV71fwJ+zP4QyfYzPXQY6TUhof128/1uMf7QARJ9y1ZX4HZFrejqn3jsgYjPNI
 dbrJPhQQ==;
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgYhm-0002Wr-16
 for linux-snps-arc@lists.infradead.org; Sat, 21 Nov 2020 19:38:02 +0000
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net
 [126.90.211.135]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 0ALJawZH029948;
 Sun, 22 Nov 2020 04:37:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0ALJawZH029948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1605987423;
 bh=99oE6i2R2oSYJfOZeL3BoDQJFFm9KeclhptfXWwG3fI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Uq4W7h5v8AWv3KkI0SgoqrLmL45db2IR3BrNlQsFjnJcfJ3fssIuvgFBPJl322xEB
 YpOlqKV8M/Ux3XYMDKnwyCCRHqDd+0keCXj6sdt660f8YqXGGLNyXmS4Ojovbbl3r3
 jpcVWmMPH1fTx+/TSvJ+mk+nf8JkgX7zJwMmelVPI4DfRBsA0xSCblo4QZjXrNYvBS
 vhftL4QcM+RYdAFwcV56bxYdry9l8K0kRGXCPeRkxUo0rldbDhNVTh8bXxTu6Ii+Bp
 9ECj6MyFeGcqCd7BebNWkiBo+iy7Acrzb4lz/WK4KOXjkSfHg2+aOFKtPjnGsqzfM9
 LvPJvJyJ8KE3A==
X-Nifty-SrcIP: [126.90.211.135]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org
Subject: [PATCH 6/6] ARC: build: use $(READELF) instead of hard-coded readelf
Date: Sun, 22 Nov 2020 04:36:57 +0900
Message-Id: <20201121193657.51441-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201121193657.51441-1-masahiroy@kernel.org>
References: <20201121193657.51441-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_193755_912313_55114E94 
X-CRM114-Status: UNSURE (   8.21  )
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

The top Makefile defines READELF as the readelf in the cross-toolchains.
Use it rather than the host readelf.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arc/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/boot/Makefile b/arch/arc/boot/Makefile
index b3870cc100bf..5648748c285f 100644
--- a/arch/arc/boot/Makefile
+++ b/arch/arc/boot/Makefile
@@ -6,7 +6,7 @@
 
 OBJCOPYFLAGS= -O binary -R .note -R .note.gnu.build-id -R .comment -S
 
-LINUX_START_TEXT = $$(readelf -h vmlinux | \
+LINUX_START_TEXT = $$($(READELF) -h vmlinux | \
 			grep "Entry point address" | grep -o 0x.*)
 
 UIMAGE_LOADADDR    = $(CONFIG_LINUX_LINK_BASE)
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
