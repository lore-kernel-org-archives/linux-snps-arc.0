Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E70FC433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 08:54:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E864B61106
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 08:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E864B61106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L1pIpk+DRK6YC9E6jcmFjKELkztsRIOBqG2+3N1uSzc=; b=cPefR88OiIjkx0/7mcQ/X+SRR
	1NQiRMqO0Mb7AWuvFPyojrABnh9BV77UiuEOUTA66KuEx7MsGfYMfzkzz44qRW+Ocsin1dyAkjoO3
	TPJ4QjUVVJQ/LVjp4uR04zW4hlU3AN4N+aVjF6Ellhd7wdNXKTA/CLAQjnNZTB2OZzia0MMOwhfil
	rB0ynp+TMUnFc46bEgWWstmV1dHFvio0a3PEz6b49sDXAYBSh6sLkAY69j+3hwbg9U7Ss2k3FGG1o
	p/mzz/V/Z8iRBGkWjK5pPlvYv57YwWIGBvtzjfqzysGIoUrn/QR7IcqyRRb/BxptscGvTzXvs/qKa
	l9bHeO2QQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg1gE-00Dgmq-WC; Mon, 10 May 2021 08:54:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1fm-00DgkI-3g
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 08:53:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description;
 bh=KTQxO0IWEBnipVyxp6Fd/H0bA828QsZiHmmsIJMhYdA=; b=UpY+ArAcYh2gBJdqveTNlbIqEM
 aNhdI2yua4Z/O4KZr4JW99coql/lzzdKSrPNi/5kTv4JsOgEnGn4OAgz5kFWIe7ZNxsKSB5SYRvv4
 tzrEjNzPCvrxnxYpg640k63LYIerh0HIM3qpD+zsYGF5p15EI5Sd651oUegdeW/MiXKYjIwPABgfb
 6mgEnqJjRSbr9usm/t3y8MTzoXic/5WKjMCbRGsPEs3HJoSwQ5soL0/hEmK6B3mR0TriBVxMDRhAD
 xPIQ6R9MufoiO3VS5rYfJPoo2JnEStnrYeaujg3/Q4KqXeXeskvRSDlBAi064jKwVE8kG4kphu9xR
 fEvCXifA==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1fi-008Qsm-Gs
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 08:53:52 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14A8Xs20191813; Mon, 10 May 2021 04:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=KTQxO0IWEBnipVyxp6Fd/H0bA828QsZiHmmsIJMhYdA=;
 b=O33KM7of0JHQENW2TVEGZGb4cTYIzCgkcDC+SB179gc5aHsO0Hk7SxCwFaHqdIOT7YJ/
 UHI6zc8LGng90xKLXW+SwOCAn/qCueGaEfRDswErp6PuSYu10dgxgRAdI5X7tY/Alfw1
 f7kf/mbYdYJnNnmmtY2Q9Sb1+54z8HNeRBQNB490q9vVcapuKN6M8Gh5qIY+N/jGl9F9
 99atDA0lAjBS6m2vHsDV7aPkhoqt7PRzN0pa1LxrE5hQ2LiUSjkOu5KNL1xP93kNcMFz
 WYJUnlw/f5NOKuKNcb4DLKv6W/6ckfRRl6pUKs6yaO/r+JyWr1QYyTQlzHLotzo8pyMH 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38f19a0qr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 04:53:45 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14A8YEa9195724;
 Mon, 10 May 2021 04:53:45 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38f19a0qqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 04:53:45 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14A8puT1032599;
 Mon, 10 May 2021 08:53:43 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 38dj988sma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 08:53:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14A8rel642664428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 May 2021 08:53:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5BB352051;
 Mon, 10 May 2021 08:53:40 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 86EC852054;
 Mon, 10 May 2021 08:53:40 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, sparclinux@vger.kernel.org
Subject: [PATCH v5 3/3] asm-generic/io.h: warn in inb() and friends with
 undefined PCI_IOBASE
Date: Mon, 10 May 2021 10:53:39 +0200
Message-Id: <20210510085339.1857696-4-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510085339.1857696-1-schnelle@linux.ibm.com>
References: <20210510085339.1857696-1-schnelle@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lt4WvBzPqWcPuaEn9ddQ7T59OQnmIB_w
X-Proofpoint-ORIG-GUID: FfQlznQpHXOlcYIz5WcgABTNATqREt0K
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-10_04:2021-05-10,
 2021-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105100061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_015350_686516_A37D3816 
X-CRM114-Status: GOOD (  20.50  )
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

When PCI_IOBASE is not defined, it is set to 0 such that it is ignored
in calls to the readX/writeX primitives. This triggers clang's
-Wnull-pointer-arithmetic warning and will result in illegal accesses on
platforms that do not support I/O ports.

Make things explicit and silence the warning by letting inb() and
friends fail with WARN_ONCE() and a 0xff... return in case PCI_IOBASE is
not defined.

Link: https://lore.kernel.org/lkml/20210421111759.2059976-1-schnelle@linux.ibm.com/
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 include/asm-generic/io.h | 65 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index e93375c710b9..7b523683c241 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -8,6 +8,7 @@
 #define __ASM_GENERIC_IO_H
 
 #include <asm/page.h> /* I/O is all done through memory accesses */
+#include <linux/bug.h>
 #include <linux/string.h> /* for memset() and memcpy() */
 #include <linux/types.h>
 
@@ -440,10 +441,6 @@ static inline void writesq(volatile void __iomem *addr, const void *buffer,
 #endif
 #endif /* CONFIG_64BIT */
 
-#ifndef PCI_IOBASE
-#define PCI_IOBASE ((void __iomem *)0)
-#endif
-
 #ifndef IO_SPACE_LIMIT
 #define IO_SPACE_LIMIT 0xffff
 #endif
@@ -458,12 +455,17 @@ static inline void writesq(volatile void __iomem *addr, const void *buffer,
 #define _inb _inb
 static inline u8 _inb(unsigned long addr)
 {
+#ifdef PCI_IOBASE
 	u8 val;
 
 	__io_pbr();
 	val = __raw_readb(PCI_IOBASE + addr);
 	__io_par(val);
 	return val;
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+	return ~0;
+#endif
 }
 #endif
 
@@ -471,12 +473,17 @@ static inline u8 _inb(unsigned long addr)
 #define _inw _inw
 static inline u16 _inw(unsigned long addr)
 {
+#ifdef PCI_IOBASE
 	u16 val;
 
 	__io_pbr();
 	val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
 	__io_par(val);
 	return val;
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+	return ~0;
+#endif
 }
 #endif
 
@@ -484,12 +491,17 @@ static inline u16 _inw(unsigned long addr)
 #define _inl _inl
 static inline u32 _inl(unsigned long addr)
 {
+#ifdef PCI_IOBASE
 	u32 val;
 
 	__io_pbr();
 	val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
 	__io_par(val);
 	return val;
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+	return ~0;
+#endif
 }
 #endif
 
@@ -497,9 +509,13 @@ static inline u32 _inl(unsigned long addr)
 #define _outb _outb
 static inline void _outb(u8 value, unsigned long addr)
 {
+#ifdef PCI_IOBASE
 	__io_pbw();
 	__raw_writeb(value, PCI_IOBASE + addr);
 	__io_paw();
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+#endif
 }
 #endif
 
@@ -507,9 +523,13 @@ static inline void _outb(u8 value, unsigned long addr)
 #define _outw _outw
 static inline void _outw(u16 value, unsigned long addr)
 {
+#ifdef PCI_IOBASE
 	__io_pbw();
 	__raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
 	__io_paw();
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+#endif
 }
 #endif
 
@@ -517,9 +537,13 @@ static inline void _outw(u16 value, unsigned long addr)
 #define _outl _outl
 static inline void _outl(u32 value, unsigned long addr)
 {
+#ifdef PCI_IOBASE
 	__io_pbw();
 	__raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
 	__io_paw();
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+#endif
 }
 #endif
 
@@ -606,7 +630,11 @@ static inline void outl_p(u32 value, unsigned long addr)
 #define insb insb
 static inline void insb(unsigned long addr, void *buffer, unsigned int count)
 {
+#ifdef PCI_IOBASE
 	readsb(PCI_IOBASE + addr, buffer, count);
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+#endif
 }
 #endif
 
@@ -614,7 +642,11 @@ static inline void insb(unsigned long addr, void *buffer, unsigned int count)
 #define insw insw
 static inline void insw(unsigned long addr, void *buffer, unsigned int count)
 {
+#ifdef PCI_IOBASE
 	readsw(PCI_IOBASE + addr, buffer, count);
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+#endif
 }
 #endif
 
@@ -622,7 +654,11 @@ static inline void insw(unsigned long addr, void *buffer, unsigned int count)
 #define insl insl
 static inline void insl(unsigned long addr, void *buffer, unsigned int count)
 {
+#ifdef PCI_IOBASE
 	readsl(PCI_IOBASE + addr, buffer, count);
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+#endif
 }
 #endif
 
@@ -631,7 +667,11 @@ static inline void insl(unsigned long addr, void *buffer, unsigned int count)
 static inline void outsb(unsigned long addr, const void *buffer,
 			 unsigned int count)
 {
+#ifdef PCI_IOBASE
 	writesb(PCI_IOBASE + addr, buffer, count);
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+#endif
 }
 #endif
 
@@ -640,7 +680,11 @@ static inline void outsb(unsigned long addr, const void *buffer,
 static inline void outsw(unsigned long addr, const void *buffer,
 			 unsigned int count)
 {
+#ifdef PCI_IOBASE
 	writesw(PCI_IOBASE + addr, buffer, count);
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+#endif
 }
 #endif
 
@@ -649,7 +693,11 @@ static inline void outsw(unsigned long addr, const void *buffer,
 static inline void outsl(unsigned long addr, const void *buffer,
 			 unsigned int count)
 {
+#ifdef PCI_IOBASE
 	writesl(PCI_IOBASE + addr, buffer, count);
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+#endif
 }
 #endif
 
@@ -1020,18 +1068,27 @@ static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
 #define ioport_map ioport_map
 static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
 {
+#ifdef PCI_IOBASE
 	port &= IO_SPACE_LIMIT;
 	return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+	return NULL;
+#endif
 }
 #define __pci_ioport_unmap __pci_ioport_unmap
 static inline void __pci_ioport_unmap(void __iomem *p)
 {
+#ifdef PCI_IOBASE
 	uintptr_t start = (uintptr_t) PCI_IOBASE;
 	uintptr_t addr = (uintptr_t) p;
 
 	if (addr >= start && addr < start + IO_SPACE_LIMIT)
 		return;
 	iounmap(p);
+#else
+	WARN_ONCE(1, "No I/O port support\n");
+#endif
 }
 #endif
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
