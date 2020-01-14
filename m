Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581FDC33CB2
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 16:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DF5E2187F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 16:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EcsMZA70";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kThH+XYf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DF5E2187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PWfR5vzK2NTcFPCk9cdj0Lp9tqYY3UK3SuBa8YlJ5L4=; b=EcsMZA70VxHBwes871nX4G3pVN
	hKMeC/my9r3Hp2s0pFDJTPXTHi1EEOSrUwbqu4gqyHpohEnBjEE5O3xX2PfH9WZD90Qc6/1F3MTzb
	Xaf1hE3XQkw3Kb6AXUvaa4ho4xVmtrLPE4lV+FOtfAWpE/YLLMwtngeMBsXWZiQ2km+/hqyN7i52+
	038V/8xDp0TIL5mCezv0jI/LH0dqjtrwfyg1sNhx+h0M7q5HS//AQUr7ViC6LvfvXp3hQLuvbLgdj
	3YWdLrFWyBEPiDFZ1WxK6/w+icw+XHBauKBYwlnYIwnwBcZPb2uKZsBsMhn+l3PindDa6Xaa6LrCr
	fhTyU6gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irOmS-0008Hd-M2; Tue, 14 Jan 2020 16:11:00 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irOlC-0005vK-Gd; Tue, 14 Jan 2020 16:09:48 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A9A60C0625;
 Tue, 14 Jan 2020 16:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579018182; bh=IpgC8gwCLfuMhlz/18scusRLH4OpcFzXcL5IZQwNnHQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=kThH+XYfPaJRH4DPNarOkI+XphSw/f6G6Ld25d7xlQ7r/qhsDgyU3gPBfAAmk2hue
 r4x8azQ3rkTEppHVrggSEFU0hz3f9SCJmMVARO9NxY/F1nhTPYS1LB/mI2oh90uDNB
 Cm3udueCSmYBnpC9pZCdXSwfqhFkevW2isarqK4erxL8fA02uJ6mcfNaJEb2YfFz9B
 Eu9Yc2t1nxqvr0i/d4AUopRG2Yz37eiEqNrN4E7feik5iwQTSqZtxYep8IErQE89j/
 EZmn3qNVIR8gMDt4WDwu46jS2MXw9EJuqulIRnqBvn1ikQyJSVRUmzHd6P0KBe7zlo
 19cSyJMmQViwQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 136EAA0061;
 Tue, 14 Jan 2020 16:09:35 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 1/4] net: stmmac: selftests: Make it work in Synopsys
 AXS101 boards
Date: Tue, 14 Jan 2020 17:09:21 +0100
Message-Id: <73b03cd37079ed3e2a5bc8568bcaa21dffe6198a.1579017787.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1579017787.git.Jose.Abreu@synopsys.com>
References: <cover.1579017787.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1579017787.git.Jose.Abreu@synopsys.com>
References: <cover.1579017787.git.Jose.Abreu@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_080942_656133_E239CDBB 
X-CRM114-Status: GOOD (  12.63  )
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-snps-arc@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Synopsys AXS101 boards do not support unaligned memory loads or stores.
Change the selftests mechanism to explicity:
- Not add extra alignment in TX SKB
- Use the unaligned version of ether_addr_equal()

Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
---
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c   | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 36a4c43a799a..6516d65e84b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -80,7 +80,7 @@ static struct sk_buff *stmmac_test_get_udp_skb(struct stmmac_priv *priv,
 	if (attr->max_size && (attr->max_size > size))
 		size = attr->max_size;
 
-	skb = netdev_alloc_skb_ip_align(priv->dev, size);
+	skb = netdev_alloc_skb(priv->dev, size);
 	if (!skb)
 		return NULL;
 
@@ -244,6 +244,8 @@ static int stmmac_test_loopback_validate(struct sk_buff *skb,
 					 struct net_device *orig_ndev)
 {
 	struct stmmac_test_priv *tpriv = pt->af_packet_priv;
+	unsigned char *src = tpriv->packet->src;
+	unsigned char *dst = tpriv->packet->dst;
 	struct stmmachdr *shdr;
 	struct ethhdr *ehdr;
 	struct udphdr *uhdr;
@@ -260,15 +262,15 @@ static int stmmac_test_loopback_validate(struct sk_buff *skb,
 		goto out;
 
 	ehdr = (struct ethhdr *)skb_mac_header(skb);
-	if (tpriv->packet->dst) {
-		if (!ether_addr_equal(ehdr->h_dest, tpriv->packet->dst))
+	if (dst) {
+		if (!ether_addr_equal_unaligned(ehdr->h_dest, dst))
 			goto out;
 	}
 	if (tpriv->packet->sarc) {
-		if (!ether_addr_equal(ehdr->h_source, ehdr->h_dest))
+		if (!ether_addr_equal_unaligned(ehdr->h_source, ehdr->h_dest))
 			goto out;
-	} else if (tpriv->packet->src) {
-		if (!ether_addr_equal(ehdr->h_source, tpriv->packet->src))
+	} else if (src) {
+		if (!ether_addr_equal_unaligned(ehdr->h_source, src))
 			goto out;
 	}
 
@@ -714,7 +716,7 @@ static int stmmac_test_flowctrl_validate(struct sk_buff *skb,
 	struct ethhdr *ehdr;
 
 	ehdr = (struct ethhdr *)skb_mac_header(skb);
-	if (!ether_addr_equal(ehdr->h_source, orig_ndev->dev_addr))
+	if (!ether_addr_equal_unaligned(ehdr->h_source, orig_ndev->dev_addr))
 		goto out;
 	if (ehdr->h_proto != htons(ETH_P_PAUSE))
 		goto out;
@@ -856,7 +858,7 @@ static int stmmac_test_vlan_validate(struct sk_buff *skb,
 	}
 
 	ehdr = (struct ethhdr *)skb_mac_header(skb);
-	if (!ether_addr_equal(ehdr->h_dest, tpriv->packet->dst))
+	if (!ether_addr_equal_unaligned(ehdr->h_dest, tpriv->packet->dst))
 		goto out;
 
 	ihdr = ip_hdr(skb);
@@ -1586,7 +1588,7 @@ static int stmmac_test_arp_validate(struct sk_buff *skb,
 	struct arphdr *ahdr;
 
 	ehdr = (struct ethhdr *)skb_mac_header(skb);
-	if (!ether_addr_equal(ehdr->h_dest, tpriv->packet->src))
+	if (!ether_addr_equal_unaligned(ehdr->h_dest, tpriv->packet->src))
 		goto out;
 
 	ahdr = arp_hdr(skb);
-- 
2.7.4


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
