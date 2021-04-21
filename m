Return-Path: <SRS0=2K9J=JS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FA6C43460
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 11:18:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E512661439
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 11:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E512661439
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RJrvI4s208gyyIYWZP/dMl4t+wqwIyT4enEntRiaOgw=; b=UaK7ZMoD2oRkaGc6ifPiqzYDI
	is3YFDBqit7ooAGfqFCdHKKdG1m5nfYw9dRPr/NV4ADgr+Ggdvfs0n8TRkxjSCBC4HGjkP3BUj9v3
	bD8gu+93awB78688hHK9kBHWJfvvek1w2htdV+22oN9Hiesw9jfp+2jyYCxHt80k2bvSb2Fpylff0
	X4Gq0sSSKuGZ4kGlhMuDSGROZTuK1j4LfmSEoF4WerkpTx49CJIzF0Y0B2Es/yW0iKDfQjUIHWZmB
	+aw+X23UHvOL6kl0DH7VFHY1slgMFXDcNhCuAgaSfW1NCXC40cpfmS3xGHVzUhIs3j0o/ZY2NABhD
	ujCs6kFWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZAsC-00EILN-IT; Wed, 21 Apr 2021 11:18:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZAs7-00EIKE-RV
 for linux-snps-arc@desiato.infradead.org; Wed, 21 Apr 2021 11:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=kgfH4z2JHqS2DaO3sLfnOI+7cKnPhbV7F7l0BF2KKFk=; b=F/i8hjFxXHDrICLmzMbdCpfzgE
 K8u+p9lAIK2VaRZX1FmIvKrokEaf9tofGK5J3KUwm3jFG92/GXa+U+S4fck7IUL0DFs8J4vfbxLMb
 NWSM3d7yKfRFSCfOF2cALP1EOaCWDGf9ms3dJq/aIHxo/F04L1d8cAF1Vt8u2/pPte9a0dC2UdAMe
 EXW2LLfIiCW8jsuRzqhlVla0J6w6x037n3fSMtDbf3eEtuIBItG9CQrXkWZDRUjI8D/cS69bhH8GK
 /ss6dQnEeuPw9WnOJdN4+Ewrsyr3djvn67PLjVo/f3pdtyW/Da4hNenVMOkCKG5lMVnXicE8eoIzE
 MQMzbmWA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZAs2-00Cpgl-3v
 for linux-snps-arc@lists.infradead.org; Wed, 21 Apr 2021 11:18:18 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LB4trE007856; Wed, 21 Apr 2021 07:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kgfH4z2JHqS2DaO3sLfnOI+7cKnPhbV7F7l0BF2KKFk=;
 b=pWt3kfNL2uuuMl8IsHFpxahlmRZ6ldDWmWppNHiPdzpNYgiNG5NTbQuqWalC+38E+Vli
 mN5K+RfPFPhXb+1RmcSfGFcb2URAaoFtbuveRPae+z/lmlGwJXOFrbZBmV8TuT8F6Zzz
 gq/rJpskrI2ndDpbpLP2pC4P9R9XKeq5UtB6MXBLjxAGsOAtB6PmHFx/9YOBLZ3KTWVh
 lE20D16q4y264VduJSbDdplD6YNHKqwbcerbBR6zoSyPykE8foWt2JtDUPyCa+gtK+Jy
 fQZWRbgOxP8Rx2jU5x/+8h1EPKwHsgJIsMqJxZihzJaZSWBEZ8iTEkkFVCT31W2P2w9v nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382j8k9dd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 07:18:06 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13LBFJZI049804;
 Wed, 21 Apr 2021 07:18:06 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382j8k9dcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 07:18:06 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13LBH9HD018940;
 Wed, 21 Apr 2021 11:18:04 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 37yqa89835-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 11:18:03 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13LBHcr327721992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 11:17:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5970942047;
 Wed, 21 Apr 2021 11:18:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E767F4204B;
 Wed, 21 Apr 2021 11:18:00 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Apr 2021 11:18:00 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, sparclinux@vger.kernel.org
Subject: [PATCH v3 2/3] ARC: io.h: Include asm/bug.h
Date: Wed, 21 Apr 2021 13:17:58 +0200
Message-Id: <20210421111759.2059976-3-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210421111759.2059976-1-schnelle@linux.ibm.com>
References: <20210421111759.2059976-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hS4nK5RrHPaMhtTFVGxKNRGcuhOcM0fN
X-Proofpoint-ORIG-GUID: _uoe5l87U2dj3NiYbzSDiVZEH1Ow0-ua
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-21_04:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=671 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_041814_182981_B57AD23A 
X-CRM114-Status: GOOD (  15.44  )
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

In a future change asm-generic/io.h will make inb() and friends
WARN_ONCE() on systems without I/O port support. This requires
WARN_ONCE() from asm/bug.h to be included so include it in the
arch specific io.h as done by other architectures.

Signed-off-by: Niklas Schnelle <niklas@komani.de>
---
 arch/arc/include/asm/io.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
index 8f777d6441a5..62ce2e486e29 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 #include <asm/byteorder.h>
+#include <asm/bug.h>
 #include <asm/page.h>
 #include <asm/unaligned.h>
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
