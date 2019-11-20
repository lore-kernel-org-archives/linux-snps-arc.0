Return-Path: <SRS0=TWh9=ZM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F3AC43141
	for <linux-snps-arc@archiver.kernel.org>; Wed, 20 Nov 2019 11:29:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A3F522311
	for <linux-snps-arc@archiver.kernel.org>; Wed, 20 Nov 2019 11:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QEB37lXz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VRTVeIQZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A3F522311
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppPFUZXqv0W4wb0JAOONKkqvcgv1b2N3buV6pDlipOg=; b=QEB37lXzFAr6Bo
	JGXxE2/zqMxT+abaY92AAZnC4mUQJI+htgvDJZrxFMYRURHO6+sBuGGLY+FY3YKLZRe7QxoZjx0lb
	7J+lKdY9pJEYdax1ubz+HCPNwOCtDknEJD97oGYBUPgI/Y6BtwPzsx93qQDjaAXr3JqoIZ/puFmLF
	fm2rYap48Hc/qSpjVXiAaNiSwnTD9xdkaxbRu+yTSmZS77xFcrKUM7ig6Se9rAJLnoL0Ts1Hvs1HN
	r4c6UoBvY0K2dxliyA/TOrIS8bkkNRadbQEvSnKGpmDPoXSSiGe38RwvxxGTzLMl3qgI3gpZa4IY1
	gxMm68Qv3hbjRFRcC4Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXOAu-0006Oh-9z; Wed, 20 Nov 2019 11:29:32 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXOAr-0006N3-8m
 for linux-snps-arc@lists.infradead.org; Wed, 20 Nov 2019 11:29:30 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E1464C2EDC;
 Wed, 20 Nov 2019 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574249367; bh=lFwY4rXDWlnRNRI1YBEWXe6HkH2a1VgO8bBpeCWzBjk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VRTVeIQZeJ7N10a+6JLAJq+gKUFNeU7quiJcv0SzR4VvNEsp3cUlfZTytKWZ3hc8w
 z00WAWzSdjMoCgNWD3cC2ZR5HU/0RYIzvx5rIeNGj5cNMzlFS5+TX0ys7eoyxAONln
 A889JzWrZIEgxmkRnGDdF/L7Xuhwcddph1rKvRq93AeDCbdEZqOAe26j5uQ48M2C9M
 wObCbSoz2Qt7UGyiOj8jIiEoU7HkCWfcFy5gWKEtN1S47KRIdFje/8Ar4Oh9BmCo6O
 f/ct5zEizO8por2ix9QxGEJuvwxJtvQasJeBcDIZeCFr6afjAVUu62lCTNEG+3jMOz
 qwxxFj9HoHXRw==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4C644A005E;
 Wed, 20 Nov 2019 11:29:25 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v2 2/2] ARC: [plat-axs10x]: remove hardcoded video mode from
 bootargs
Date: Wed, 20 Nov 2019 14:29:23 +0300
Message-Id: <20191120112923.431-2-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120112923.431-1-Eugeniy.Paltsev@synopsys.com>
References: <20191120112923.431-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_032929_350644_73E01295 
X-CRM114-Status: UNSURE (   9.61  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Now have pixel clock PLL driver and we can change pixel clock rate
so we don't need to enforce one exact video mode. Moreover enforcing
video mode is harmful in case of we enforce mode which isn't
supported by the monitor we are using.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Changes v1->v2:
 * None.

 arch/arc/boot/dts/axs101.dts     | 2 +-
 arch/arc/boot/dts/axs103_idu.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/boot/dts/axs101.dts b/arch/arc/boot/dts/axs101.dts
index 305a7f9658e0..c4cfc5f4f427 100644
--- a/arch/arc/boot/dts/axs101.dts
+++ b/arch/arc/boot/dts/axs101.dts
@@ -14,6 +14,6 @@
 	compatible = "snps,axs101", "snps,arc-sdp";
 
 	chosen {
-		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 consoleblank=0 video=1280x720@60 print-fatal-signals=1";
+		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 consoleblank=0 print-fatal-signals=1";
 	};
 };
diff --git a/arch/arc/boot/dts/axs103_idu.dts b/arch/arc/boot/dts/axs103_idu.dts
index 46c9136cbf2b..a934b92a8c30 100644
--- a/arch/arc/boot/dts/axs103_idu.dts
+++ b/arch/arc/boot/dts/axs103_idu.dts
@@ -17,6 +17,6 @@
 	compatible = "snps,axs103", "snps,arc-sdp";
 
 	chosen {
-		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 print-fatal-signals=1 consoleblank=0 video=1280x720@60";
+		bootargs = "earlycon=uart8250,mmio32,0xe0022000,115200n8 console=tty0 console=ttyS3,115200n8 print-fatal-signals=1 consoleblank=0";
 	};
 };
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
