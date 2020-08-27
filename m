Return-Path: <SRS0=SwnV=CF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DB0C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Aug 2020 08:07:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2728320786
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Aug 2020 08:07:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AFDD5p+Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PM/SbGvy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2728320786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J2qNYvbUvctAhMv0mEVYBRPueKFNSbdToPd65B2fFkU=; b=AFDD5p+Z/kkcD0rONSV7WTkBb
	hkNx5slYy5EMuU0ZLNas2+6bR6CCjXWvepNRUQaDhbCfH/xErHkt+tFDImzwToiTVf+wXOmGjUW1w
	pJSXoQg3Rt1D1GsHycVKqgIHOO4e8BbbMQZlD5cxSdqHLBabQmEDvk+i4oPr0kUOrabqlvCTPoJDh
	Z8RvX9y6IM15PZ0ebNowRsp7Fa467DBzZC6wYsiLXDiBc0PmEN5A8FKP3o8z+vbNVTkDaVOuNs4SE
	V0u/7FnJzSTK5m7K17J0XDEmIGR5xlsReeFaKaUGHAymzr2RE29Yot4FNUy4BkpDGLMJfzlbFAXG4
	ZMhEzF+sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBCwM-0005LD-Ti; Thu, 27 Aug 2020 08:07:23 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBCv5-0004mJ-Nk; Thu, 27 Aug 2020 08:06:17 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R8483e148327; Thu, 27 Aug 2020 04:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/JPUnQuffv7jn54LjXMBo+lRYnWeulAZBuZ/TKve1Lc=;
 b=PM/SbGvybmAYz0Y5hDxqZQJ+pVF8Ogi/NK51/JXIVK5/4ycwkO4a90fV6X3/iQ/vbdsj
 vtVuG0LjZNaNGNvpheujE8SZV3TZXUvJqaTTZ43gsYR+sgj0UeISeGrHC9GS6jd1ZMp6
 llGxB3Uqu8BjB+hqkIOFWcnhiL0XE24nEaR9D/N7RzTQ4S1MwEd8oFBsh5YO21AdsxUJ
 6iMVFzuo6Xx8uQQC1K+WlPyRl+KW/cz6uhPZAkUzWP1Doe/J4yIhAoxWdspo6Bm+0e/n
 bj5/M/lEunaNvdS0+xgH2aQWXwl6BLU1gywcyjiBoPpvJYMr1kWlm4Km7z8PmmmfcGcS iQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3367sy24qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:05:51 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R82tWs024563;
 Thu, 27 Aug 2020 08:05:49 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 332uw7r7au-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 08:05:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R85m6G131782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 08:05:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A9807805E;
 Thu, 27 Aug 2020 08:05:48 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25DC378063;
 Thu, 27 Aug 2020 08:05:43 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.17.9])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 08:05:42 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v3 11/13] mm/debug_vm_pgtable/pmd_clear: Don't use
 pmd/pud_clear on pte entries
Date: Thu, 27 Aug 2020 13:34:36 +0530
Message-Id: <20200827080438.315345-12-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_02:2020-08-27,
 2020-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=980
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008270060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_040603_970582_D843FB2E 
X-CRM114-Status: GOOD (  20.06  )
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, mpe@ellerman.id.au,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

pmd_clear() should not be used to clear pmd level pte entries.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 0a6e771ebd13..a188b6e4e37e 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -196,6 +196,8 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(pmd_young(pmd));
 
+	/*  Clear the pte entries  */
+	pmdp_huge_get_and_clear(mm, vaddr, pmdp);
 	pgtable = pgtable_trans_huge_withdraw(mm, pmdp);
 }
 
@@ -321,6 +323,8 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
 	pudp_test_and_clear_young(vma, vaddr, pudp);
 	pud = READ_ONCE(*pudp);
 	WARN_ON(pud_young(pud));
+
+	pudp_huge_get_and_clear(mm, vaddr, pudp);
 }
 
 static void __init pud_leaf_tests(unsigned long pfn, pgprot_t prot)
@@ -444,8 +448,6 @@ static void __init pud_populate_tests(struct mm_struct *mm, pud_t *pudp,
 	 * This entry points to next level page table page.
 	 * Hence this must not qualify as pud_bad().
 	 */
-	pmd_clear(pmdp);
-	pud_clear(pudp);
 	pud_populate(mm, pudp, pmdp);
 	pud = READ_ONCE(*pudp);
 	WARN_ON(pud_bad(pud));
@@ -577,7 +579,6 @@ static void __init pmd_populate_tests(struct mm_struct *mm, pmd_t *pmdp,
 	 * This entry points to next level page table page.
 	 * Hence this must not qualify as pmd_bad().
 	 */
-	pmd_clear(pmdp);
 	pmd_populate(mm, pmdp, pgtable);
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(pmd_bad(pmd));
-- 
2.26.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
