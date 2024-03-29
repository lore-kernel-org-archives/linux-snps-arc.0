Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFCCCD11DD
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 Mar 2024 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2AxEp+8S15/ICjtKw0Ui7Tj/nnrxS4LMT31cvJko+ns=; b=DEoMDuos2IaNDm
	RGvgpBF2vDHHYNa8EPeyMx7244cv5qXEi3LOpF8TaNPDyF4ft3kWYJn77g9dUTLi/Mi+Jnjgmt+GC
	ubiB6a3sp2wbybPCU9Fx6G9XjxP6jHmm3IicKlfR+kGkyT5foTgt803HytIDOiF8t7RWdmbngUIH9
	Sxpk707PVr83LDgunsVlshlcaYCqpZ+oeVlqEZfBShoOfPKH7uefXAoZmqtNMfluWOxEKoigXeFjv
	LMXMsZaVt9zVA9jPnSkT47Fz8z9EFgfhBCjpFy4y72AgezU7wBoia5fLWNNQVdQG8cg5KWX4JL1k7
	mgAaAf55cU1vBH4YM1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9bh-000000004XN-1eK2;
	Fri, 29 Mar 2024 10:37:09 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9be-000000004Vv-1xpl
	for linux-snps-arc@lists.infradead.org;
	Fri, 29 Mar 2024 10:37:08 +0000
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42T7cUVw026635;
	Fri, 29 Mar 2024 03:37:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pfptdkimsnps; bh=ck3AKWtmb8BkchUat
	wnqphcyscPApPYAvh/k+eBDtro=; b=XC3SY9S3FdDWU93S+eTp/qaa6kIAFpbpu
	FeYpwwuIpfxEDJDc5YKQvLVCO383deF4gOVcChK6b3B13PZskRlUbgo0ELao4Xgr
	ASzQDQPs1NJJCqRdO0IaiD47NG4DW4e2vZPPzDW+w/c6t8egSf/R6FUXrdn3qnqR
	nrpFAHxxWArgGzrw8qu7rXz4HuBWm0YYUc/ijrsGNjB7uiNJMdWue6lwEdYfXgsm
	6MxkoCy/0UTteqMmk0oYEgZCkmhJ88fQk44cshzIORmYJFoRS1JKZr4ngjYEZRDk
	DqxYlHVxv/WRQ4UZTREBiEAjMDWlddcBx7h3hIE++MoSjF75Ak1ag==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3x4v8tgx2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 03:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1711708619; bh=Y9WrlbeWJXZ++u4Y5rsGhH2D2ksT9BB9qbTnle6XfDc=;
	h=From:To:Cc:Subject:Date:From;
	b=fE0Ip0buOzZyxOwsX+8VIT3wZm5MVBtsdjPyYzTrinVf/c2uK+qXR3sPxxeYO+V28
	 5OJZLgtaOWS29MGNJPP9k/5LWBefm8VlyfIa07bUd2iga/3Et5pedgPAa5anCU9WuA
	 iGx65xwd1PCH/AkR+d7Uv2jWjWga0vu5u2qAQaqcP6GRsTN/vBiWuFWlZhNpvp0mGL
	 16VTXBU+ctSPUWozIVzW5X0jBbZCAi7jtVfLNezEqQvH8K0ONpuR/8LMoGMHfo6kHZ
	 DxD3XgzPsZ7bacujaVGfvTRKxmb+qPjDo5DHemGXmAOWCDnTcNuqOVqDDXo6gYXcHJ
	 cx1y2AUaMd0FQ==
Received: from mailhost.synopsys.com (eudc-mailhost1.synopsys.com [10.213.161.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BDE7040211;
	Fri, 29 Mar 2024 10:36:58 +0000 (UTC)
Received: from SNPS-Ecl1TeCeXg.internal.synopsys.com (snps-ecl1tecexg.internal.synopsys.com [10.213.50.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 8BC67C0118;
	Fri, 29 Mar 2024 10:36:56 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: Pavel Kozlov <Pavel.Kozlov@synopsys.com>,
        Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH] ARC: [plat-hsdk]: Remove misplaced interrupt-cells property
Date: Fri, 29 Mar 2024 10:36:50 +0000
Message-Id: <20240329103650.1420091-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-GUID: IJQASx-RvMwQip-fsF8dCf14zjyXPd7b
X-Proofpoint-ORIG-GUID: IJQASx-RvMwQip-fsF8dCf14zjyXPd7b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_09,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 mlxlogscore=672 lowpriorityscore=0 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2403290093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_033706_763119_497F8855 
X-CRM114-Status: GOOD (  10.07  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

"gmac" node stands for just an ordinary Ethernet controller,
which is by no means a provider of interrupts, i.e. it doesn't serve
as an interrupt controller, thus "#interrupt-cells" property doesn't
belong to it and so we remove it.

Fixes:
------------>8------------
  DTC     arch/arc/boot/dts/hsdk.dtb
arch/arc/boot/dts/hsdk.dts:207.23-235.5: Warning (interrupt_provider): /soc/ethernet@8000: '#interrupt-cells' found, but node is not an interrupt provider
arch/arc/boot/dts/hsdk.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
------------>8------------

Reported-by: Vineet Gupta <vgupta@kernel.org>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 arch/arc/boot/dts/hsdk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 6691f4255077..41b980df862b 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -205,7 +205,6 @@ dmac_cfg_clk: dmac-gpu-cfg-clk {
 		};
 
 		gmac: ethernet@8000 {
-			#interrupt-cells = <1>;
 			compatible = "snps,dwmac";
 			reg = <0x8000 0x2000>;
 			interrupts = <10>;
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
