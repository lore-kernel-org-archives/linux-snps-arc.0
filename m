Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EB3C433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 08:48:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73BAD61352
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 08:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73BAD61352
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GUOWljUz8BwWtce2nZ5NliDR+c7sxtUy7ogsE3rRGkc=; b=eAJTe8RJKE/lvMHpXaGZA5c2W
	0TPX8tq6meKoNuO/9b/geM3zvABHodAbSxJ3AuDYU+V4ssW8bPVsDJtbhtJ4JiUetZDUHlUs6hu4D
	nEhTtc9DfL65HTaCpwYovbIUqFq+A6AEMy1DcZ71k+iK5eSPv2RlaLI3bDujAoXIpC2QAcTZhg5qR
	cAdajkFL5HIfgz1eAKKaBwvsmxZyIXpbgr7lS7y+Kn4ecm+CmI4TDtV3Hqk5ZqoMa11/CHio3QyhZ
	KaVRs7w6kq/qMD4Wb4ZNTp7Z7pdJGualqU4z6DqNGkFS6pP/wZ5w+nDIXDae7XO70A7rWQ87/yyNt
	l6kFwOMwg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg1aD-00Dg2d-Dq; Mon, 10 May 2021 08:48:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1a5-00Dg0y-Uo
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 08:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=evXVASPNHYxBuNpGpwUb76ljx34WoISjJiXB/0dEjGk=; b=i1ME8O34P+GRTvfHCKE6ZKP4d5
 2XEhbwWwoxKggurh3Qd+X0Pw2Vwt0YXhZCB8SqWs8e3fKD0VrVXEbup7OCdiUvb8zxHyUcJK0XeBR
 1eBiruDYcNRzu+0hMndbpmbYiPGtihLN8Z/qrpoOpNmr3sotfzbkG+JZ59GEf+ZC0Pyf3YMUdG1VG
 AyQcRai5pJGeKWgoEJ93TUwAlI9W22e6R9ITTmT2EeNeUA+1K2StkXvnUxxWin+PI9L/gRj3ExmpP
 hVwCBuvX9h8rs15KNTSTfRVRSGOFnjA8vt/nONIk5LPb1pr6g1lds852Zx6p4OCDdo6o6pjg85W9U
 9ttJZ/0w==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1a2-008Qer-50
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 08:48:00 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14A8Y5Jw092729; Mon, 10 May 2021 04:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=evXVASPNHYxBuNpGpwUb76ljx34WoISjJiXB/0dEjGk=;
 b=ORnm0lLUxN1YpQA8HlyRcBFkf6KoxCic7Ncm8AuCh7Ot/rwnQeNSElhA+xQUd+KwPlOU
 tNJnPyTQhDuLvR9morTthwfn25Et6eAeYxvNhj0ePcJ1JlIkRbSFYTXsGFn8+Yf96Xn+
 Dp3yhj3Qb7MJ3SUbvPx/FfvxB/fp/sg12uTzyIi6CbAaZskbXfRhp1SrklpAUHl3kJ8b
 ovtSXGMaaABo0/lBCxZEFK7x4b+SF731rTtHCuHokrEBBud2VkU2Xw4ouIWXZSv4i0st
 EPVWd8cFv6MAczXHErRCCnyJnox644XcdG19p0FqQXj4kGEWbSSB4P5vxdxe7tmOiu4J mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38f156ru71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 04:47:49 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14A8h31t128637;
 Mon, 10 May 2021 04:47:49 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38f156ru6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 04:47:49 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14A8g7hA014602;
 Mon, 10 May 2021 08:47:47 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 38dhwh8skc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 08:47:47 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14A8ljAw29884800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 May 2021 08:47:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39B934C044;
 Mon, 10 May 2021 08:47:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAA344C04A;
 Mon, 10 May 2021 08:47:44 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 May 2021 08:47:44 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, sparclinux@vger.kernel.org
Subject: [PATCH v5--cover-letter 2/3] risc-v: Use generic io.h helpers for
 nommu
Date: Mon, 10 May 2021 10:47:42 +0200
Message-Id: <20210510084743.1850777-3-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510084743.1850777-1-schnelle@linux.ibm.com>
References: <20210510084743.1850777-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mv9os6CnoMAOgvLf5XHalhXFL_P_nZND
X-Proofpoint-ORIG-GUID: I0yuNbIY3BzKJLWW9ZbQ3sjB9fNQbOwV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-10_04:2021-05-10,
 2021-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 mlxlogscore=967 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_014758_329462_0357708A 
X-CRM114-Status: GOOD (  20.11  )
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

From: Niklas Schnelle <niklas@komani.de>

Without MMU support PCI_IOBASE is left undefined because PCI_IO_END is
VMEMMAP_START. Nevertheless the in*()/out*() helper macros are left
defined with uses of PCI_IOBASE.

At the moment this only compiles because asm-generic/io.h defines
PCI_IOBASE as 0 if it is undefined and so at macro expansion PCI_IOBASE
is defined. This leads to compilation errors when asm-generic/io.h is
changed to leave PCI_IOBASE undefined.  More importantly it is currently
broken at runtime, as accessing a fixed I/O port number of an ISA device
on NOMMU RISC-V would turn into a NULL pointer dereference.

Instead only define the in*()/out*() helper macros with MMU support and
fall back to the asm-generic/io.h helper stubs otherwise.

Signed-off-by: Niklas Schnelle <niklas@komani.de>
---
 arch/riscv/include/asm/io.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index c025a746a148..31a8b98c0f13 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -23,12 +23,12 @@
 #include <asm/mmio.h>
 
 /*
- *  I/O port access constants.
+ *  I/O port access constants. Without MMU support leave PCI_IOBASE undefined
+ *  and fall back to generic stubs for I/O access routines.
  */
 #ifdef CONFIG_MMU
 #define IO_SPACE_LIMIT		(PCI_IO_SIZE - 1)
 #define PCI_IOBASE		((void __iomem *)PCI_IO_START)
-#endif /* CONFIG_MMU */
 
 /*
  * Emulation routines for the port-mapped IO space used by some PCI drivers.
@@ -145,6 +145,7 @@ __io_writes_outs(writes, u64, q, __io_bw(), __io_aw())
 __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #define outsq(addr, buffer, count) __outsq((void __iomem *)addr, buffer, count)
 #endif
+#endif /* CONFIG_MMU */
 
 #include <asm-generic/io.h>
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
