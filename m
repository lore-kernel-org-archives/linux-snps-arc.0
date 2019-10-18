Return-Path: <SRS0=z5VF=YL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1998CA9EA4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 12:15:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A826921D7C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 12:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YhzxQWKn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jjNSEo72"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A826921D7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5kc6rdaz6+8E/6bjSGEICWcWMg247E4EMHevh/JMGBs=; b=YhzxQWKn0VsZ8l
	DCTb0OYKk52V9qCvbCbuuMEsH8MHbKmcZTtzjMswfV6wO5Flrw4XdKvsTtXy8M43bB1F9Urx0YWND
	Xrimsd/uG3cd2MHXb2nsi+u0lABia9uU40/MtOT32Zqxi/+CPkqiqp7lUlw6y+cUBysT9QIbJnhxB
	G6dnSd8RHRTeM02po909HpRn2l23z3nrqJ6OP5NEIoBvnZ7oOkoZ3vKHJmgk93GOBkfgMM7MpTCzg
	4tB2MzB7gy1ttwkAztKDD5ee5XSy8lo0EAbB1wqaZuDqs6aQKirBpQ1gGGH/MT7Ka3el3q1cCqh8I
	cYEzzRmFRlG6U6HxMkMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLRAf-0007BY-VZ; Fri, 18 Oct 2019 12:15:53 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLRAc-00079g-Kr
 for linux-snps-arc@lists.infradead.org; Fri, 18 Oct 2019 12:15:52 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5563EC0486;
 Fri, 18 Oct 2019 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571400949; bh=MLntUWtCsDMCgvrL+syluij6prsYtWtRidiu09Gql1w=;
 h=From:To:Cc:Subject:Date:From;
 b=jjNSEo72GxPyztjmnCOdK8NwMPj1HdO7+ykTHQn1WwIPE3nGVid6NEHUJg9EyDnDf
 yCXU2Oa5Ns065utjP4SczgKgbHAUauP7XuWfigj1lLWTBq5pfo2BYbOspx05GgW89d
 vYMiPwzoGmDmEsFW1+K55dNgPA2wy20YMl6G1UEL/k2MmM0NwqwbWlr0rBDb13MsRE
 knNqTEqhCcx9eDY51+LWQsiG/oOBs1E1cKnjDb4bLlxA6iLXZta8BuVX4+n28/GOw+
 rOri8CFtnV+bmtFr4wrpUGusn4x7xKokIOG0CUzXvOzIFLvlU+dKAtaX34Tcfx38s9
 x6/8QtI5Mg0fA==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.73])
 by mailhost.synopsys.com (Postfix) with ESMTP id 34EBFA005C;
 Fri, 18 Oct 2019 12:15:46 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [RFC 0/6] ARC: merge HAPS-HS with nSIM-HS configs
Date: Fri, 18 Oct 2019 15:15:39 +0300
Message-Id: <20191018121545.8907-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_051550_701604_80259007 
X-CRM114-Status: UNSURE (   7.72  )
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

Starting from nSIM 2019.06 is possible to use DW UART
instead of ARC UART. That allows us to merge
"nsim_hs" with "haps_hs" and "nsim_hs_smp" with "haps_hs_smp"
mith some minor changes.

We eliminate nsim_hs_defconfig and nsim_hs_smp_defconfig
and leave haps_hs_defconfig and haps_hs_smp_defconfig
which can be used on HAPS / nSIM / ZEBU / QEMU platforms
without additionall changes in Linux kernel.

Eugeniy Paltsev (6):
  ARC: regenerate nSIM and HAPS defconfigs
  ARC: HAPS: cleanup defconfigs from unused IO-related options
  ARC: HAPS: use same UART configuration everywhere
  ARC: HAPS: add HIGHMEM memory zone to DTS
  ARC: HAPS: cleanup defconfigs from unused ETH drivers
  ARC: merge HAPS-HS with nSIM-HS configs

 arch/arc/boot/dts/haps_hs.dts          | 15 +++---
 arch/arc/boot/dts/haps_hs_idu.dts      |  1 -
 arch/arc/boot/dts/nsim_hs.dts          | 67 --------------------------
 arch/arc/boot/dts/nsim_hs_idu.dts      | 65 -------------------------
 arch/arc/configs/haps_hs_defconfig     | 30 +++---------
 arch/arc/configs/haps_hs_smp_defconfig | 32 +++---------
 arch/arc/configs/nsim_hs_defconfig     | 60 -----------------------
 arch/arc/configs/nsim_hs_smp_defconfig | 58 ----------------------
 arch/arc/plat-sim/platform.c           |  1 -
 9 files changed, 22 insertions(+), 307 deletions(-)
 delete mode 100644 arch/arc/boot/dts/nsim_hs.dts
 delete mode 100644 arch/arc/boot/dts/nsim_hs_idu.dts
 delete mode 100644 arch/arc/configs/nsim_hs_defconfig
 delete mode 100644 arch/arc/configs/nsim_hs_smp_defconfig

-- 
2.21.0

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
