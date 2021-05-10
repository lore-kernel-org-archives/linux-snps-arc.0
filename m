Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3E5C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 14:52:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C987E613DE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 14:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C987E613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=deLy9X5XXJtTJjyDN4fWYPQKxCY67tTE0M+qSZSvkCU=; b=LbUKkure4TLk0k9WYV02cQX5tk
	HwAr7IXzGzO9/KIrPCBlh+JPv0tIbYNcSW1WXjKiBfUF2ilZzRgmlk+CANSNU3uo7/5XpUiGDQ4vV
	wGg2hd3LTrntUheBvwuNdh1sxKcYkHenYoD6sFenIWhd0emJR+uv/2NRlyqMl78MLhK46Glyukudp
	cz2KMVt2k5Okuhzf7QrLrDoeSce15rlRGuyBf1AkzT049fyGTDOXjkeW5LcZO41S/SQVnxFCfe+JM
	k/FH6wOWyk1Q2WBQtNEV5UhqOQWGecz7ThGUte6r0FdKHRCvOQXIxz0CArt5lddpqU9uQpdk5zDVk
	sjjLOJVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg7H9-00EhMl-TN; Mon, 10 May 2021 14:52:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7H6-00EhKb-Je
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 14:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=dY5rHenPOQ56zgTRtVvd0ws/b24uJv2FPl1M84JdB3I=; b=fUr5IpSYC000iPwY4rtVboCU/B
 ZsB66LojtkpWbRKt5GVLw8SgsN5oOfShoUXLzXOlcJtl/2DxxGAUSd35yCWaTgwGCpoDiJiwnWO2n
 TSb0XnQbbQ1C+nVBvra+hg5giDcfw6iXEY6rKEPnKwFAqsLYEQ4/kKRvGuK3loqjJ2PAGV3PWN9TW
 Kp4pEQN1RcxTZvs3FZKjN0ATY8IzBULKNmT52+CY24/HCYoEZ6MyYzrNvC7s0WejPnMutI8yuX0mC
 2gs0WeiAen0wnz5DuOtTqgV7Th7fVdQ1+lzgatSNpSxQNy1VWA3AJGV8+7wgU+v4g7w3TsMCKBSBw
 cytXhjeg==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7H3-008pif-Gk
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 14:52:47 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14AEXqH2030941; Mon, 10 May 2021 10:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=dY5rHenPOQ56zgTRtVvd0ws/b24uJv2FPl1M84JdB3I=;
 b=NjMws1Y9wayuZd9DTfgR2rh/8pCf9KMeN77b+aqen0ZuvTeC5aNiabqf2BWg6XcoqItd
 6257X77B3ONwv/Lf6l8iI/2wb9NX539x8B85OtqkBxXG3dl8nVt/rw5bU6tNTFrGEXCx
 UfU+pJqv1sw9Ky0iphO1JxfFH3InHAkln6dK38uKNxfWr8Y20T9mIOMkTsyWwIMp3efZ
 PZwM2GCDSSQRRrPuqiLcJFTAISucKikWYAUIyCkbIXIzcQ4yhdie934d3zy4Fg1Mut4N
 6Iyxp3c4jQhlyc/MGHdLnkF6lCoZHSCM4Nl2nhqDLRrSvdVPoletl2/m7tWD06QOr8cn Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38f5ytjbph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 10:52:40 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14AEXpIJ030871;
 Mon, 10 May 2021 10:52:39 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38f5ytjbnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 10:52:39 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14AElnun002962;
 Mon, 10 May 2021 14:52:37 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 38dj9891r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 14:52:37 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14AEqYeK65274364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 May 2021 14:52:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A88B85204F;
 Mon, 10 May 2021 14:52:34 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4E88652050;
 Mon, 10 May 2021 14:52:34 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, sparclinux@vger.kernel.org
Subject: [PATCH v6 0/3] asm-generic/io.h: Silence -Wnull-pointer-arithmetic
 warning on PCI_IOBASE
Date: Mon, 10 May 2021 16:52:31 +0200
Message-Id: <20210510145234.594814-1-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mjhb6J1DiHtD0UWPGo4ogLSab9rjyQv4
X-Proofpoint-GUID: 2Nm1GNL2tf4tx1Rr4qUiX2WRhPVnoUcl
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-10_09:2021-05-10,
 2021-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1015 malwarescore=0 mlxlogscore=748
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105100105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_075245_692633_50976D2D 
X-CRM114-Status: GOOD (  21.11  )
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

Hi,

This is version 6 of my attempt to get rid of a clang
-Wnull-pointer-arithmetic warning for the use of PCI_IOBASE in
asm-generic/io.h and fix the NULL pointer access it points out.

This was originally found on s390 but should apply to all platforms
leaving PCI_IOBASE undefined while making use of the inb() and friends
helpers from asm-generic/io.h.

This applies cleanly and was compile tested on top of v5.12 for the
previously broken ARC, nds32, h8300 and risc-v architecture. It also
applies cleanly on v5.13-rc1 for which I boot tested it on s390.

I did boot test this only on x86_64 and s390x the former implements
inb() et al itself while the latter would emit a WARN_ONCE() but no
drivers use inb().

Thanks,
Niklas

Changes sinve v5:
- memset() the buffer in insb()/insw()/insl() in the WARN_ONCE() case
  to prevent use of uninitialized data (Arnd)

Changes since v4:
- Added Link to patch 4 (Arnd)
- Improved comment on RISC-V patch mentioning current brokeness (Arnd)

Changes since v3:
- Changed the subject of the last patch to better reflect the actual
  change i.e. the addition of WARN_ONCE() to the helpers not the
  silencing of the clang warning
- Added asm/bug.h to asm-generic/io.h so it doesn't have to be included
  previously by all arches to be available for the WARN_ONCE()
- Added patch for risc-v which defines PCI_IOBASE except when compiled
  for nommu

Changes since v2:
- Improved comment for SPARC PCI_IOBASE definition as suggested
  by David Laight
- Added a patch for ARC which is missing the asm/bug.h include for
  WARN_ONCE() (kernel test robot)
- Added ifdefs to ioport_map() and __pci_ioport_map() since apparently
  at least test configs enable CONFIG_HAS_IOPORT_MAP even on
  architectures which leave PCI_IOBASE unset (kernel test robot for
  nds32 and ARC).

Changes since v1:
- Added patch to explicitly set PCI_IOBASE to 0 on sparc as suggested by
  Arnd Bergmann
- Instead of working around the warning with a uintptr_t PCI_IOBASE make
  inb() and friends explicitly WARN_ONCE() and return 0xff... (Arnd
  Bergmann)

Niklas Schnelle (3):
  sparc: explicitly set PCI_IOBASE to 0
  risc-v: Use generic io.h helpers for nommu
  asm-generic/io.h: warn in inb() and friends with undefined PCI_IOBASE

 arch/riscv/include/asm/io.h |  5 +--
 arch/sparc/include/asm/io.h |  8 +++++
 include/asm-generic/io.h    | 68 ++++++++++++++++++++++++++++++++++---
 3 files changed, 75 insertions(+), 6 deletions(-)

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
