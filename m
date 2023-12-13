Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF96C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Dec 2023 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e5MVuJLyqSD+PZQJK1gnIQSub5XnxPzViSvIzSMlNmo=; b=o+m9qqHqBa+Hut
	sIh5UN9rFGilbiCX/fANS2thCqnYgOBrWlB0hOiZeF5oQHI0YhLtElNVNw2XjHPVr/dSujdCvankg
	oDzKN/jHWs0fbKaCXEYqpckK1C69h/YOzHEf7zAkbQweeYE0ozKTTG6B9hvGIqHX89o4Ow40RPwX+
	35Sy4107r9ywkRKn5viKZC2v7SKP5t5yeBDK9nBY68b5AMueD5FiRSfdt+ixgb7N5KQvxmMMGU8Ah
	c4Cdt8Gp+vfyx+rqziBkeGcox5+VQjf2sdtLzz07n+jTl9legsk32K5vfatYrkOgQ9sw39JjapeAn
	HKE22JkthRBJ6CAt9AHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQpx-00FAFs-2j;
	Wed, 13 Dec 2023 15:07:49 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQpv-00FAFV-2k
	for linux-snps-arc@lists.infradead.org;
	Wed, 13 Dec 2023 15:07:49 +0000
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDETVOQ002775;
	Wed, 13 Dec 2023 07:07:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pfptdkimsnps; bh=Tr7IYPITuxAPWl4EK
	zGwdZNRtItdCX54g+L6fr6UUJQ=; b=vGu3Yx/yzm/mY6SOHOT/o42XwXl1I5Uo+
	hfS52RQiNOfK+Vxyp0znaDAm2WjaZyGU16y639I5rDIFhr6JQEFKPlZarFNjJIn5
	nRY451Wh6pXjiuzG4kMinH4qpznkPC4ow99keg3xIfeCL5uveVcyHYexW8pryjKn
	ootwCGgWXRRxrSj9PtJ7pMYbcB8gcDx6FxVwjefNMBKfCrLhsNQHijUCdoBhZ72H
	VhrwWyOak+hzPk758l96tQMVcJQWgVOA6aVy36050UarQR+lOS+By/ArfQfK5I/B
	NJaIXAAPf7TALcOAtWm7BPxJ00WoQxRvej2X3dzvTKKO9iairVz6A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3uxnyx0dqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 07:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1702480052; bh=7RvO1yPLoi3+j1sn4inWAZ+9901WN8LfuW7qtiFW94E=;
	h=From:To:Cc:Subject:Date:From;
	b=bUaHVxQodscb9VOuNT/T1ioZ3/filOfVm154k30A8sKlqgvITySxh2hfIL/e+xATf
	 aGEKBcew/jelR4p8pt6Oeag8PSZF+G1Bg7679cAgcvaF8oZldCS7y7Lzczmu+7BO8/
	 2kL1ApMIJhW8ToeGdLcr+xzOdfwN/dmKKKlpoLH6H/9pDk+RN1+Q1XrSk4MVB8VGs3
	 g0ZvM9P7hkUePVWue+OZ1PkCQkaM9TAovtzCIwJVhPsLbw2/XV+UvUlBLkkndSoolG
	 Gt/HqDu5fAzlyG53nVD7SrprFmByZBjDY+pfMfnYUq5kgqpoj1BhyqBqNqTFjI619R
	 lQnvWaNOxW5bQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6357A4048E;
	Wed, 13 Dec 2023 15:07:31 +0000 (UTC)
Received: from SNPS-o0WHuHJU73.internal.synopsys.com (snps-o0whuhju73.internal.synopsys.com [10.116.105.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 79F02A0073;
	Wed, 13 Dec 2023 15:07:29 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Pavel Kozlov <Pavel.Kozlov@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
        Pavel Kozlov <Pavel.Kozlov@synopsys.com>
Subject: [PATCH] ARC: add hugetlb definitions
Date: Wed, 13 Dec 2023 19:07:10 +0400
Message-Id: <20231213150710.13574-1-kozlov@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-GUID: 8TCG7J6bXDDtw1NvaVsrMf5Zc-vH120n
X-Proofpoint-ORIG-GUID: 8TCG7J6bXDDtw1NvaVsrMf5Zc-vH120n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 phishscore=0 spamscore=0 mlxlogscore=539 mlxscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312130107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_070747_924427_5E40E3D6 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

From: Pavel Kozlov <pavel.kozlov@synopsys.com>

Add hugetlb definitions if THP enabled. ARC doesn't support
HugeTLB FS but it supports THP. Some kernel code such as pagemap
uses hugetlb definitions with THP.

This patch fixes ARC build issue (HPAGE_SIZE undeclared error) with
TRANSPARENT_HUGEPAGE enabled.

Signed-off-by: Pavel Kozlov <pavel.kozlov@synopsys.com>
---
 arch/arc/include/asm/hugepage.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arc/include/asm/hugepage.h b/arch/arc/include/asm/hugepage.h
index ef8d4166370c..8a2441670a8f 100644
--- a/arch/arc/include/asm/hugepage.h
+++ b/arch/arc/include/asm/hugepage.h
@@ -10,6 +10,13 @@
 #include <linux/types.h>
 #include <asm-generic/pgtable-nopmd.h>
 
+/*
+ * Hugetlb definitions.
+ */
+#define HPAGE_SHIFT		PMD_SHIFT
+#define HPAGE_SIZE		(_AC(1, UL) << HPAGE_SHIFT)
+#define HPAGE_MASK		(~(HPAGE_SIZE - 1))
+
 static inline pte_t pmd_pte(pmd_t pmd)
 {
 	return __pte(pmd_val(pmd));
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
