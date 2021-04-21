Return-Path: <SRS0=2K9J=JS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168BCC43460
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 11:18:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B256143C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 11:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50B256143C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sa5f0/YVTbwZfKZXTbyfr7AefRi8ac8b+T9pGR6sWIA=; b=GCJ8RV1oL4c/fStzhzSohxHBEd
	GxUYRs1r0AUzu7IQNGiE5dkN9JC64xZt2PbdXJPyoDbcMF7UugoOG+NCY5cjoktF2+UX9c43/KVB8
	UFwfH7D1E7VxFLPeGXt/cC2bO6FWRLBewUhkMoPQOpMgoG+XiByNIhf8m5Z0mTBrKmlVTjJDRLcdV
	YILSYycFx55HpsJOxdFK2XF2t2AS/DCTwwlssADZsnO+wpaJ16+vcM9AueXPenv628dn7Zm15T1oa
	sZXxnO/MSu93zNkOMA/63jMNIJkbdAhWLOaenc5VcAUGS0jXbrRmh/3RNYbZXrnVbUVxBau+r9MO+
	G4kT8zfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZAsA-00EIKn-7U; Wed, 21 Apr 2021 11:18:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZAs6-00EIK7-V1
 for linux-snps-arc@desiato.infradead.org; Wed, 21 Apr 2021 11:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=jAiMiw2e6+1XZZGZXBMG035KEyr8tjtVKWXIdCM0biQ=; b=EhyMhzcBWVP/Y3MfUavXdeRdYs
 miZhe/nUSVQtCXEHHTnl+L3xTClerEG6PTQAvvZY3VpVRcuuqMym3PB5RxfB+s56rBP73kQDojNNL
 NHD6Lw8fqDptB6kTi6nxQVKqqY+2Rd+Vl2u57KziAGzZ2UzU++YMZ16COTVjf5ZMsPTvesy7TC+OF
 bJg4RWOY+fSSataKB9dVFYhTsXDk2o0BxMcP1MZvpSU0WSqIL3a4fneJF4/R+Y0Zi+PgqPRZqL+ki
 V4319XjlXk70BdnRc3bycUOraXa2B/UcqEBtc6jS9QmTcbczMJjE7p10ER6MJawe/MkHU0dKS2P6l
 9fHg+h1w==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZAs1-00Cpgk-Am
 for linux-snps-arc@lists.infradead.org; Wed, 21 Apr 2021 11:18:17 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LBEZRO050148; Wed, 21 Apr 2021 07:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jAiMiw2e6+1XZZGZXBMG035KEyr8tjtVKWXIdCM0biQ=;
 b=YUKvfRbx7B0r3vJ1PH4TaPyxW+vonDkI3EH/cT+Kl96BFtDb0qi5CCzhG2EzoN9q13b4
 RZQ5EFbbvlKiTLtup2ArpoKVH+HNnFlX2+Y/MNQnm5sU4po2M4cE5z33TC65gfCtI1/I
 NZgha6NdX5OU9ta49/njYdMqjYM4nXcp5hIIkSneElvN3PTWHRlBhXyzcPlXpyeTOKxQ
 SF+RwcRnWW+ZXqiOtZLz8uK69ymgWTyhw5RArZo5nyv2A3+B+i8mo5iFt7DvPGcLoTVK
 m8/Xae0conpE77bb00py3JCuuICLQt7hO4JHJl1gPSsbAGkvHda7sjp9WYJgGGwbYB8i jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 382jds14pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 07:18:05 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13LBG88B056012;
 Wed, 21 Apr 2021 07:18:04 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 382jds14p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 07:18:04 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13LBH3ZK018782;
 Wed, 21 Apr 2021 11:18:02 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 37yqa8j91u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 11:18:02 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13LBI0tE24445332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 11:18:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67DC94203F;
 Wed, 21 Apr 2021 11:18:00 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0988142045;
 Wed, 21 Apr 2021 11:18:00 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Apr 2021 11:17:59 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, sparclinux@vger.kernel.org
Subject: [PATCH v3 0/3] asm-generic/io.h: Silence -Wnull-pointer-arithmetic
 warning on PCI_IOBASE
Date: Wed, 21 Apr 2021 13:17:56 +0200
Message-Id: <20210421111759.2059976-1-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EAQBMOlkNhLPmhmROBdDkmWEOEqTImRJ
X-Proofpoint-ORIG-GUID: M-rChegDgNZIrGrKaOcdNqLCeP0dzNQa
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-21_04:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=647
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_041813_535500_DC2A5BF5 
X-CRM114-Status: GOOD (  17.33  )
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

This is version 3 of my attempt to get rid of a clang -Wnull-pointer-arithmetic
warning for the use of PCI_IOBASE in asm-generic/io.h. This was originally
found on s390 but should apply to all platforms leaving PCI_IOBASE undefined
while making use of the inb() and friends helpers from asm-generic/io.h.

This applies cleanly and was compile tested on top of v5.12-rc8 for the
previously broken ARC and nds32 architectures.

I did boot test this only on x86_64 and s390x the former implements inb()
itself while the latter would emit a WARN_ONCE() but no drivers using inb().

Thanks,
Niklas

Changes since v2:
- Improved comment for SPARC PCI_IOBASE definition as suggested by David Laight
- Added a patch for ARC which is missing the asm/bug.h include for WARN_ONCE()
  (kernel test robot)
- Added ifdefs to ioport_map() and __pci_ioport_map() since apparently at least
  test configs enable CONFIG_HAS_IOPORT_MAP even on architectures which leave
  PCI_IOBASE unset (kernel test robot for nds32 and ARC).

Changes since v1:
- Added patch to explicitly set PCI_IOBASE to 0 on sparc as suggested by Arnd
  Bergmann
- Instead of working around the warning with a uintptr_t PCI_IOBASE make inb()
  and friends explicitly WARN_ONCE() and return 0xff... (Arnd Bergmann)

Niklas Schnelle (3):
  sparc: explicitly set PCI_IOBASE to 0
  ARC: io.h: Include asm/bug.h
  asm-generic/io.h: Silence -Wnull-pointer-arithmetic warning on
    PCI_IOBASE

 arch/arc/include/asm/io.h   |  1 +
 arch/sparc/include/asm/io.h |  8 +++++
 include/asm-generic/io.h    | 64 ++++++++++++++++++++++++++++++++++---
 3 files changed, 69 insertions(+), 4 deletions(-)

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
