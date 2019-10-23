Return-Path: <SRS0=Jbu3=YQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86228CA9EBE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Oct 2019 12:44:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51B9921872
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Oct 2019 12:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iD6WaByp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZDueIeYi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51B9921872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=naAlqi6FpgdZiVMfozdrJPcnbG3GbnwQs5cyW55J9/4=; b=iD6WaByp7xxaEc
	3cVi+WGvG765ikmhNP7p+PqFky5nTCaIaLVlAVFPf57yI/IMVb0QPKHhJOlXVhLshHGYagU+Rq4/v
	ANrPJifnxzWzO01jclNOKyaN2ywCXFD5CRGz3jzPRW0WeZ4Is/TadTFd1LcuYCcKTtbB8dZsiWcqR
	ZrzeHz2XqTyhAoTN9jpM9pcu1+F3yCgNhpu9mmYAUX/A913PFrDFKVMiELI1d9BtVLU4gmvIWIf/D
	miaJKsAcKirKyTxUtQuvhiSXw7YVmGoDh9dhjaIJPtNn0iPeMBDTjYnG795E/e2y9LH7cBRwNsTTZ
	CGbWiD5k62rJLDnRRhUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNG05-0008K8-B4; Wed, 23 Oct 2019 12:44:29 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNG01-0008G8-8c
 for linux-snps-arc@lists.infradead.org; Wed, 23 Oct 2019 12:44:27 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F1E81C0CD6;
 Wed, 23 Oct 2019 12:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571834665; bh=AIGwTQLYhX+M2s0W3a/AMO9FziLVCQioUIaBsq9d96A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZDueIeYiCA9D1mUgjA+n2oyUXRNMrKE/UpgwhxXRiC9UjrX92exjUacYJ/tnH5Fhf
 ri04Nru8Fgc9QETZbQK/saa6tBA+zxOmsKL4LesB/K2Ztz7ySRHoBrOkA3wAQZk2Il
 UkE/nXtaWByh35kdXuybFCfu6NwKX4/MCBt0gPqzUEvPXQoDBUqb5B6pdIrw5+v5E8
 b8xNFdhk+lGbdHRmHXmLLBoyFOdTHk3KwotMbjX/UWPo0QXkQSSmPfnlOemLCaDpgR
 TCi4iZzSFZrtxLBBwXATZSr2kMiuCFJDqliDmBwq8GddKWO5DisLKj7+AkfruHBAxU
 UzId60Hcwc//g==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.73])
 by mailhost.synopsys.com (Postfix) with ESMTP id 484B3A0067;
 Wed, 23 Oct 2019 12:44:23 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 3/8] ARC: HAPS: use same UART configuration everywhere
Date: Wed, 23 Oct 2019 15:44:12 +0300
Message-Id: <20191023124417.5770-4-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023124417.5770-1-Eugeniy.Paltsev@synopsys.com>
References: <20191023124417.5770-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_054425_303330_8D3593C1 
X-CRM114-Status: UNSURE (   9.97  )
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

For some reason we use ns8250 UART compatible on UP HAPS
configuration and ns16550a (which is ns8250 with FIFO support)
on SMP HAPS configuration.
Given that we have same UART IP with same IP configuration
on both HAPS configuration use ns16550a compatible everywhere.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/boot/dts/haps_hs.dts     | 2 +-
 arch/arc/boot/dts/haps_hs_idu.dts | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arc/boot/dts/haps_hs.dts b/arch/arc/boot/dts/haps_hs.dts
index 44bc522fdec8..11fad2f79056 100644
--- a/arch/arc/boot/dts/haps_hs.dts
+++ b/arch/arc/boot/dts/haps_hs.dts
@@ -47,7 +47,7 @@
 		};
 
 		uart0: serial@f0000000 {
-			compatible = "ns8250";
+			compatible = "ns16550a";
 			reg = <0xf0000000 0x2000>;
 			interrupts = <24>;
 			clock-frequency = <50000000>;
diff --git a/arch/arc/boot/dts/haps_hs_idu.dts b/arch/arc/boot/dts/haps_hs_idu.dts
index 4d6971cf5f9f..738c76cd07b3 100644
--- a/arch/arc/boot/dts/haps_hs_idu.dts
+++ b/arch/arc/boot/dts/haps_hs_idu.dts
@@ -54,7 +54,6 @@
 		};
 
 		uart0: serial@f0000000 {
-			/* compatible = "ns8250"; Doesn't use FIFOs */
 			compatible = "ns16550a";
 			reg = <0xf0000000 0x2000>;
 			interrupt-parent = <&idu_intc>;
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
