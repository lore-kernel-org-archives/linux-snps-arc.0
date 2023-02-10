Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2163C636CD
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Feb 2023 15:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4FcqCVdMTQGVtNYTNEgTBlxPPb0nICcr0PCMRgtMZNo=; b=by5gC+bPlnrigt
	5mmkWAf4bHOcsijT37x583jk6alNhB5tfCIFz6IgbHqzdggKfE11//C/hxoUTcqwcXVdJFQL7Rqr5
	su34v5k/OlXEfgksnyHORHKHPt1ihkFocYlF+3zLctbt7Y8YvJHFVb15i+tVL/U55SmbmONPD30ab
	N+vzpOW3f87vhdIv+Rc/kAIChKdhiWQh0mjddny4EshrxbmwW8IKGZ9DYGm1U0Y1gcWl9sZaEN0XZ
	cQxOaqs2ufC1Bi0f01ggVG6qHslNRHtdgwLKA6TR599zXEIatOPDIQ/DPnxXNMeVR4bB/rTk/rQAf
	heWgOkYGUFqEkghQteQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQV7t-006GXb-Q0; Fri, 10 Feb 2023 15:15:49 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQV7W-006GMR-TY
	for linux-snps-arc@lists.infradead.org; Fri, 10 Feb 2023 15:15:29 +0000
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31ABwMxj024791
	for <linux-snps-arc@lists.infradead.org>; Fri, 10 Feb 2023 07:15:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding;
 s=pfptdkimsnps; bh=hbr4GastQ8sOKtdoASOHl+M7e/u7dhYwp4defkTtkn8=;
 b=MLH/iL9uj84g4JHHC2gYIHg7L5BfeN70Brd2S2kzAnYq6nxIpfyICtMc2zMT00QPgSnd
 dcsoCXP67/qjPi7Im89ThtX+3Ys/nzB4cGGxPvR1f1+8MHTdBhIUoLCSCUDe4niUFU1T
 xByCQGKvgTkTb9xkEt06xin7j+IarJ0SMCNEL3SdaZjqSYFjcYp8Ac1wl0ids8q54PCi
 HFlMvj1oBjhy3gtPKGffaKFBNX0mXY86uI1xDpbjcby3HEgbAjtl5CQLcnE8aFP8Fsr1
 6yMRd7051cLFV5hADp4hg88YpEOJ4R1jYLAEQX94rW5lQiCTQUDgOHCKe0sqh6A/UgXF 9Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3nhqgcn09h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Fri, 10 Feb 2023 07:15:21 -0800
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 25C8040088
	for <linux-snps-arc@lists.infradead.org>; Fri, 10 Feb 2023 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1676042121; bh=MTzBjfibEMJjN7nnd11M0LIAApO+iP0gbOFLJBlxeqs=;
	h=From:To:Subject:Date:From;
	b=IBoP30adfMcVvjQ0cbonvx6nRGIBHK/KqF94tvgbqzr3+S5EkIKy+1suM2KMr3TQZ
	 t06S2ZpYKiSIWbEZj2b2nY0IoeZqjxKoVOkv2UKlEpECrPuvLbmRDcv/8OyQxvJAXr
	 L1f8/jT+DvRA4eXWExJVF9d4mCytJLbr1Nr754Wn4aJZs/LVLqh7cc0UaS2KvqWFP4
	 UYT8GbaZkYneZEnWDuqqDdVNz8d0FKkz0OEbuMqGevV0DdVM+0hoLlsjh67lxAHObQ
	 RxPU7WP9dihv9BZ8d1NTb5HfJRqy1ISHKWwxce322VWTMtgqftRJYEzZLwwa930EMW
	 OZh3hh8l9HACw==
Received: from SNPS-o0WHuHJU73.internal.synopsys.com (snps-o0whuhju73.internal.synopsys.com [10.116.108.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id D76D9A005D
	for <linux-snps-arc@lists.infradead.org>; Fri, 10 Feb 2023 15:15:18 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Pavel.Kozlov@synopsys.com
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: fix compile time assert fail for the config with PAE40 and 4K pages
Date: Fri, 10 Feb 2023 19:15:12 +0400
Message-Id: <20230210151512.4712-1-kozlov@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: dWuAJe3FvdST09v50mgKpqPDjcRpKv6Q
X-Proofpoint-GUID: dWuAJe3FvdST09v50mgKpqPDjcRpKv6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_09,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 impostorscore=0 mlxlogscore=940 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302100127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_071527_075634_5F5D3512 
X-CRM114-Status: GOOD (  18.27  )
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

Add support for the configuration with 4K Page Size and enabled ARC_PAE40.
Set two-level Page Table to 10:9:12, as with PAE40 a 4k page can settle
only 512 entries (with PAE40 size of PTE entry increases from 4 to 8
bytes).

In this configuration the Page Table can describe only 31-bit (2Gb) virtual
space, but it is not a problem as the ARC MMUv4 supports only 2Gb of
virtual address.
This patch doesn't affect other configurations.

Patch fixes compile time assert fail:

  include/linux/compiler_types.h:328:45: error:
  call to '__compiletime_assert_288' declared with attribute error:
  BUILD_BUG_ON failed: (PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Pavel Kozlov <pavel.kozlov@synopsys.com>
---
Added the same ARC_VADDR_BITS macro name as used in ARCv3 port.
The 4K Page Size and enabled PAE configuration was tested on nSIM:
load, allocation/free of all memory (low and high), user space
tests from glibc test suite (malloc, string).

 arch/arc/include/asm/pgtable-levels.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
index ef68758b69f7..3b6afee9c272 100644
--- a/arch/arc/include/asm/pgtable-levels.h
+++ b/arch/arc/include/asm/pgtable-levels.h
@@ -42,12 +42,22 @@
  * (so 4K page can only have 1K entries: or 10 bits)
  */
 #ifdef CONFIG_ARC_PAGE_SIZE_4K
+#ifdef CONFIG_ARC_HAS_PAE40
+/*
+ * For PAE40 and 4K page size set 10:9:12 Page Table
+ * (as with PAE40 4k page can only have 512 entries)
+ * Page Table can describe only 31-bit (2Gb) virtual space
+ */
+#define PGDIR_SHIFT		21
+#define ARC_VADDR_BITS		31
+#else
 #define PGDIR_SHIFT		22
+#endif /* CONFIG_ARC_HAS_PAE40 */
 #else
 #define PGDIR_SHIFT		21
-#endif
+#endif /* CONFIG_ARC_PAGE_SIZE_4K */
 
-#endif
+#endif /* CONFIG_ARC_HUGEPAGE_16M */
 
 #else /* CONFIG_PGTABLE_LEVELS != 2 */
 
@@ -67,9 +77,13 @@
 
 #endif /* CONFIG_PGTABLE_LEVELS */
 
+#ifndef ARC_VADDR_BITS
+#define ARC_VADDR_BITS	32
+#endif
+
 #define PGDIR_SIZE		BIT(PGDIR_SHIFT)
 #define PGDIR_MASK		(~(PGDIR_SIZE - 1))
-#define PTRS_PER_PGD		BIT(32 - PGDIR_SHIFT)
+#define PTRS_PER_PGD		BIT(ARC_VADDR_BITS - PGDIR_SHIFT)
 
 #if CONFIG_PGTABLE_LEVELS > 3
 #define PUD_SIZE		BIT(PUD_SHIFT)
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
