Return-Path: <SRS0=2M3J=J3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3368CC433ED
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Apr 2021 11:17:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6964461107
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Apr 2021 11:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6964461107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MOTg9sj/OfJf1EATijDF072OMUh1bR1csvaA0HYdblI=; b=ExFPwgqTS3PZEAuLla7Aq86HO3
	kJiIQM971ZSmqKMQZMCjNA62y8Apq8UtS+lKZvvM3CsMcxQDKTp5R8idw9bHepWjrqbTDErJ9Xa5K
	ez9lPZQSO9hCs7/izrLhz/FmzuA+QAWEcf1Sm96BBlp0fJFG16i5C4ZtH01dK6Qqj7A0ps/mDsxTZ
	Unz4wY5PMLS6KgLAQs1NnUJ4n6LQ+w9jklBsXSYE0dd3MMvBmjeglOL7r609FO2lPml3MTn9Rtq7S
	QViXDiImXX4ELDiPMpihcZy9Dvfe/P1XIUdNP6Lhh9n42trSKwVcACT26N4LSfWzPUS9wy0MOMG3d
	4ccj4vjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcR8l-007jP2-Os; Fri, 30 Apr 2021 11:16:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcR8j-007jOg-CL
 for linux-snps-arc@desiato.infradead.org; Fri, 30 Apr 2021 11:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=X7H6Thm5vVvEdOzIMF99WmtzE3yIxl5XgPZmIRQQpSM=; b=jDaFwtKejiSvqx5+dJyPdrcMZO
 yoY7GsOFu9wtQyhAQLDgvCvvWxf3PxD0ljnvneCqJ0D3fLPJrxt+C7cGjVMx4nTd7wsUMyQpPiSiZ
 tgfhWjxSEMH7cAVQk3o89EoUQPyHzsYLEfTuIwSZWFTZl0gQMGz1fVuYCAZUiPDCXD57lcumcXi2A
 q8NBcsSG2R30zXq4jy6tz7qdGH0USgyg0foQYnXNP3gQC/CvF4PV+7ut46zBMln6ajZqEniMNekzR
 I+0yR3CrMXD7WvvO+BPpjaDyzPJ6Kzq3+y2pMW/GtzR1yKb+wD1y4mdHGXNolPqa5swCafayonKDP
 SoUVZDLg==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcR8g-001K2X-Tr
 for linux-snps-arc@lists.infradead.org; Fri, 30 Apr 2021 11:16:56 +0000
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UB3H4M016527; Fri, 30 Apr 2021 07:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=X7H6Thm5vVvEdOzIMF99WmtzE3yIxl5XgPZmIRQQpSM=;
 b=BNfwknSmGRvxLT33wsoOPyxeWMipoQHfo4/O8XDyHNyLU3gvh8qbW034jnOI7FEaMKx8
 w/E94NrQRqe3rrMpZldpxGgH/oq3dFrBlmhhvWULuXv5BAEUnkJumCPxyzLdeY5ed9Qy
 dkxAY+ckatHVlhtbFO+Bzr9l7DjrmzSRgWP3TeHcum2SAMJ9K/Acv1oFwc+KT0OPTfZ3
 TeDUYe7FcNbOzkZHs4jW7WR/LcqXLfIcKCUD90/+sep4DpRYIZ3nmZ6TxW6E6txtyaAy
 zrXh7kCoawUz7cjYZss189Gkqxa4tx5iDpAgngnWmpito7it3tKJRzPC0BeTaKeNUFBA 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388drswy1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 07:16:47 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13UBDd8B052160;
 Fri, 30 Apr 2021 07:16:46 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388drswy0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 07:16:46 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UBCsJJ010967;
 Fri, 30 Apr 2021 11:16:44 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 384ay81q8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 11:16:44 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UBGf4C45809994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 11:16:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2843A4057;
 Fri, 30 Apr 2021 11:16:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DF82A4040;
 Fri, 30 Apr 2021 11:16:41 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 30 Apr 2021 11:16:41 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, sparclinux@vger.kernel.org
Subject: [PATCH v4 0/3] asm-generic/io.h: Silence -Wnull-pointer-arithmetic
 warning on PCI_IOBASE
Date: Fri, 30 Apr 2021 13:16:38 +0200
Message-Id: <20210430111641.1911207-1-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xRR3TU8l-97YDHOxFoi3RsZeyFN6kn-G
X-Proofpoint-GUID: RZlDyf6cM3uzqma3gwaEolsaHKGd2vpX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_06:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=729 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104300080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_041654_993831_BA7F233C 
X-CRM114-Status: GOOD (  19.37  )
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

Hi,

This is version 4 of my attempt to get rid of a clang
-Wnull-pointer-arithmetic warning for the use of PCI_IOBASE in
asm-generic/io.h. This was originally found on s390 but should apply to
all platforms leaving PCI_IOBASE undefined while making use of the inb()
and friends helpers from asm-generic/io.h.

This applies cleanly and was compile tested on top of v5.12 for the
previously broken ARC, nds32, h8300 and risc-v architecture

I did boot test this only on x86_64 and s390x the former implements
inb() itself while the latter would emit a WARN_ONCE() but no drivers
use inb().

Thanks,
Niklas

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
 include/asm-generic/io.h    | 65 ++++++++++++++++++++++++++++++++++---
 3 files changed, 72 insertions(+), 6 deletions(-)

-- 
2.31.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
