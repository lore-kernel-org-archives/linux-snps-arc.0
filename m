Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6036CC33CB3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 16:11:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3140D2187F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 16:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dDBPyfL1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iffSGqxx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3140D2187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7HRP4CLu3oeJm5FZoSIoB8Lw8O5zwG2NVAiRfFQGH+s=; b=dDB
	PyfL1FMjbngxy0kn2wNBw+B/+QjTSb1+R5bqAkTTgZIzFSk7ZGm0cltSfHTMfO0zwCEXLAWEsBuMR
	Nm55MTxWKEvo4h6gWt81zS6ENJCGyqp1u2wJ3jAaxZrAiWOZ4y7UKOB0NvujC6dwtSaAHl60hmU9n
	MhZB8GO0FDOxHUikwrQZDqqzcZlTY4LizN6Ye6CTGPZSx+xTqIMMHWBajw+I6ZfEejHY9HzFoZ5q1
	wfjNARRHono2XFSruYRgUIViU3lz4wshCM79zRgKov2qXksFUq36YxsXnJQLSjwAmfpIErfME1kXV
	+ENgjaaavZgNw1xOTHfS1O5EvtU46eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irOmR-0008GU-GS; Tue, 14 Jan 2020 16:10:59 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irOlA-0005ub-Ir; Tue, 14 Jan 2020 16:09:48 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8B4D0C0620;
 Tue, 14 Jan 2020 16:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579018177; bh=lMsPxq+6nqsKDOeBMq7JTDZwDRAvL67CUWdXLkXkMqk=;
 h=From:To:Cc:Subject:Date:From;
 b=iffSGqxx8OFb+Pmq5zvInZjDB2S3nvyAmHaayuDazU2IvKr/ANqsV+5cZMMo8mEA7
 D/qW49WaOk4HilFsZS4A6AtLQpWaLJHDroppQP33m0JNSFWe0yPFn0Anbbg8bTjS9+
 NC5VtqbX5LZ3aE5VqaUl+HbTu18GVXyBoUFKuDW4bBBFWCjHssPmMRURjNyldKlSTd
 jOZVxY2F2e5aMUW8ntYKkUK21GyFdSAxBUD4StzGG/z/L8ThH3c4OIuxFdChJUTV0J
 /CyV16jzSwo0YukQ+a8zJk4cwoeD+HK9N3ktwFJPa3+MsS7cwCl8d4h6SGO0uaqTgz
 J/sl3s3Q7dV3A==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 221CDA005B;
 Tue, 14 Jan 2020 16:09:34 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 0/4] net: stmmac: Fix selftests in Synopsys AXS101 board
Date: Tue, 14 Jan 2020 17:09:20 +0100
Message-Id: <cover.1579017787.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_080940_753407_078E127C 
X-CRM114-Status: UNSURE (   8.98  )
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

Set of fixes for sefltests so that they work in Synopsys AXS101 board.

Final output:

$ ethtool -t eth0
The test result is PASS
The test extra info:
 1. MAC Loopback                 0
 2. PHY Loopback                 -95
 3. MMC Counters                 0
 4. EEE                          -95
 5. Hash Filter MC               0
 6. Perfect Filter UC            0
 7. MC Filter                    0
 8. UC Filter                    0
 9. Flow Control                 -95
10. RSS                          -95
11. VLAN Filtering               -95
12. VLAN Filtering (perf)        -95
13. Double VLAN Filter           -95
14. Double VLAN Filter (perf)    -95
15. Flexible RX Parser           -95
16. SA Insertion (desc)          -95
17. SA Replacement (desc)        -95
18. SA Insertion (reg)           -95
19. SA Replacement (reg)         -95
20. VLAN TX Insertion            -95
21. SVLAN TX Insertion           -95
22. L3 DA Filtering              -95
23. L3 SA Filtering              -95
24. L4 DA TCP Filtering          -95
25. L4 SA TCP Filtering          -95
26. L4 DA UDP Filtering          -95
27. L4 SA UDP Filtering          -95
28. ARP Offload                  -95
29. Jumbo Frame                  0
30. Multichannel Jumbo           -95
31. Split Header                 -95

Description:

1) Fixes the unaligned accesses that caused CPU halt in Synopsys AXS101
boards.

2) Fixes the VLAN tests when filtering failed to work.

3) Fixes the VLAN Perfect tests when filtering is not available in HW.

4) Fixes the Ethernet DT bindings for AXS101 board.

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

Jose Abreu (4):
  net: stmmac: selftests: Make it work in Synopsys AXS101 boards
  net: stmmac: selftests: Mark as fail when received VLAN ID != expected
  net: stmmac: selftests: Guard VLAN Perfect test against non supported
    HW
  ARC: [plat-axs10x]: Add missing multicast filter number to GMAC node

 arch/arc/boot/dts/axs10x_mb.dtsi                   |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c | 32 +++++++++++++++-------
 2 files changed, 23 insertions(+), 10 deletions(-)

-- 
2.7.4


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
