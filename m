Return-Path: <SRS0=Jbu3=YQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67CACA9EB9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Oct 2019 12:44:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9184921872
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Oct 2019 12:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iq+3ChfU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="csQhuSQa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9184921872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eH+2Wqi+7y+Nkui6uU2viyjfmY1Iq5MyoNZfsSwi4dY=; b=Iq+3ChfUtQWM5J
	Fs7XyMNPk4pndz+crtq9hd4JdwqlUvfFjzirKRoGtARmLswX4c86FH/igVoZKNuy+Xs/wclSTdcR6
	pBVgw2ka6aQ96TSR9+wo5hXB3JW6zyEWyWud2EwfqexDwrWe39rTlxrkviLwGJsXcbamOpStRUALE
	rga4voxBeNPCe8A12xoyW4AKvvn87KinoEczeCoTl+hwpOjrw708BR85FOW9qr5fLSdt1y2kVIJfk
	LQVbZbFLg1Q3Q/lwYR2tJ4oU9Dzl/8cSc6LddhUwCaTHwDnerLprbg/g+dHky0eaf+5bHiYAdML/I
	/xcUgiJ/7dmjehGgN7DQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNG06-0008Kq-3p; Wed, 23 Oct 2019 12:44:30 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNG01-0008GO-NM
 for linux-snps-arc@lists.infradead.org; Wed, 23 Oct 2019 12:44:27 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6A202C0DE0;
 Wed, 23 Oct 2019 12:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571834665; bh=oQQShnjm5R0MR/xjv312sQ6gQ7J+z4O6hvMy/a53QQ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=csQhuSQaZbUGLS/Neq9lNc9aM1zzt3cKR2BLe2IrahOS6+K6OlIM3JRDG5aO2vnv1
 97fXqckNqp0XIWWax/pbYTEvxneDTmGapFY54SjaVuBH26MMYuE9p5Rp+FuZKZyrCD
 PMTFpFD/UvsN6ESgb/g53xHlcsft6rA0PSKer6AiSgara37mcNV7EsnNMkJU1pdoah
 lEEYxuponQvdIz5oJwZHVjJK1X+dPmc0eQ817xjuiABBYvjat7zDmQELEu+1wZBk4c
 W/eqzG61FdwP1nuLBbn4s9RgaZUbjxWM8Pc99RvFs+uX0Rbp56Ltdruf0clzbxhyZX
 NHZN4WDWXQZzw==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.73])
 by mailhost.synopsys.com (Postfix) with ESMTP id C45E6A0057;
 Wed, 23 Oct 2019 12:44:23 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 4/8] ARC: HAPS: add HIGHMEM memory zone to DTS
Date: Wed, 23 Oct 2019 15:44:13 +0300
Message-Id: <20191023124417.5770-5-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023124417.5770-1-Eugeniy.Paltsev@synopsys.com>
References: <20191023124417.5770-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_054425_760454_40D9056C 
X-CRM114-Status: GOOD (  10.73  )
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

This is required as a preparation of merging nSIM and HASP
defonfig and device tree.

As we have HIGHMEM disabled in both HAPS and nSIM defconfigs
this doesn't lead to any functional change.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/boot/dts/haps_hs.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arc/boot/dts/haps_hs.dts b/arch/arc/boot/dts/haps_hs.dts
index 11fad2f79056..60d578e2781f 100644
--- a/arch/arc/boot/dts/haps_hs.dts
+++ b/arch/arc/boot/dts/haps_hs.dts
@@ -9,13 +9,15 @@
 / {
 	model = "snps,zebu_hs";
 	compatible = "snps,zebu_hs";
-	#address-cells = <1>;
-	#size-cells = <1>;
+	#address-cells = <2>;
+	#size-cells = <2>;
 	interrupt-parent = <&core_intc>;
 
 	memory {
 		device_type = "memory";
-		reg = <0x80000000 0x20000000>;	/* 512 */
+		/* CONFIG_LINUX_RAM_BASE needs to match low mem start */
+		reg = <0x0 0x80000000 0x0 0x20000000	/* 512 MB low mem */
+		       0x1 0x00000000 0x0 0x40000000>;	/* 1 GB highmem */
 	};
 
 	chosen {
@@ -31,8 +33,9 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		/* child and parent address space 1:1 mapped */
-		ranges;
+		/* only perip space at end of low mem accessible
+			  bus addr,  parent bus addr, size    */
+		ranges = <0x80000000 0x0 0x80000000 0x80000000>;
 
 		core_clk: core_clk {
 			#clock-cells = <0>;
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
