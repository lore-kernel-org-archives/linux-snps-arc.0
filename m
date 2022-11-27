Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D734C46467
	for <linux-snps-arc@archiver.kernel.org>; Sun, 27 Nov 2022 17:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8FKEYajdifLf5MnUnHBke0ECEFXMT0ppjs6zbWhE2Q=; b=AmwOAy8wKLlT3D
	4ryzhvwupBPYUGJBI3eclPMHYrCjZdSMtroFtoBmAvxLxJ8W45uPSIDNIjnN3TP8K2gQTry1LlNJm
	tS3b7AduhmorUGBP9yKx8fZZr1Fbwp8htz6itID/j6GRBjNE4P682Etu3zTQbER9AbCF8o6C7nx+E
	0bvwjKaK9SXeXx8rxkW1TltkirwLCICM64+QPucsaNisgI9xI8cu7n+QLhBTn2kUfC35gLt0O/MFd
	1LRh3EsOIQmT0DmmgH+4jNEo03ZDCdb/BqjLXjc9aj60PLw8IPIYVFxMPzzzchq/L7VKLEXwdOwoR
	X3Tuu3QAac3sp746PwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLdK-00CjVj-LW; Sun, 27 Nov 2022 17:40:02 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLdH-00CjTL-VX
	for linux-snps-arc@lists.infradead.org; Sun, 27 Nov 2022 17:40:01 +0000
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AR3HE4k000524;
	Sun, 27 Nov 2022 09:39:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pfptdkimsnps;
 bh=twkXLuXpGi9lPSb69jVVJQor4U+M89o04NzMdTQ13L4=;
 b=tvokcS29hIXsaMeBqYE26lSIq/2AzYyFUFpT1hGN67OR7W8lJSvmPInprZ4BuqKjWGHS
 UPEreGlLdH8W0BLJkjAhhDdgbfs/D89i3MjRT1jj3/g2RsVr6qPRDO+fMXcikMILPIHT
 +LZmFer+JOXwQlDCk9MXciViY7RTFF6M0LMY6G7xwcAIwqTeEpsJVGHau4oyz3XjOdyl
 maY/uqFkFXumg88At/W/edXfiDM74PY01V1EYKbg9u4jMtgAaS690Cw2o4+CA1fC1nne
 0o9GwU8NIB7WxiB/yivbaHpejUPb7xCmWTdQxRgjMNR7bzClsq12Ui5wxyAzr/7U9Oz2 4w== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3m3jpt3f6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Nov 2022 09:39:59 -0800
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D6AD5C00FD;
	Sun, 27 Nov 2022 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1669570798; bh=doUGINLdcxLksfDMcXWIBRhwtHnFZgBtIOeZ4aMORBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DIoDaLSSZCxldvM0gNIFbQ08d+QUXGcmhnQx2f6DBKjULYIG62kjuo5qW3xJn5smy
	 wxqVJMYC+jsfdkWmmmaUDUf5lB/g/MeGsactOAckBM9DuXUGDaVJII6ffi1sTiB2p+
	 cIseUJC4ikVNPV/FJ9WfwFKyrARDmp1nVJJXBfuL1QHR6DrtXO2vOS2OxuwG9U7Gkq
	 MhqL03RipB2dEMPlqNWzlapLO7jP0+cY314FXFS9B+J27NyEb1Kdlodt00NaWoFB4M
	 gig2I8xha3+zBkkh1zUaBhnFt3oDlYnv4IV46tFKk7c4R5DpOv2CT8qoPz3r4/fbkS
	 8sQFbFMSQK9eQ==
Received: from atlantis.internal.synopsys.com (unknown [10.225.29.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id B2280A005E;
	Sun, 27 Nov 2022 17:39:54 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: libc-alpha@sourceware.org
Cc: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
        Florian Weimer <fweimer@redhat.com>,
        Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
        arcml <linux-snps-arc@lists.infradead.org>
Subject: [PATCH v3 1/2] scripts: Add "|" operator support to glibcpp's parsing
Date: Sun, 27 Nov 2022 18:38:24 +0100
Message-Id: <20221127173825.3106-2-shahab@synopsys.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221127173825.3106-1-shahab@synopsys.com>
References: <20221118131542.23188-1-shahab@synopsys.com>
 <20221127173825.3106-1-shahab@synopsys.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: Rb-JVnB1tyM7jcOck2Umr2G_CPqWknQT
X-Proofpoint-GUID: Rb-JVnB1tyM7jcOck2Umr2G_CPqWknQT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-27_08,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211270147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_094000_037895_37CC268E 
X-CRM114-Status: GOOD (  15.92  )
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

From the tests point of view, this is a necessary step for another
patch [1] and allows parsing macros such as "#define A | B".  Without
it, a few tests [2] choke when the other patch [1] is applied:

/src/glibc/scripts/../elf/elf.h:4167: error: uninterpretable macro
token sequence: ( EF_ARC_MACH_MSK | EF_ARC_OSABI_MSK )
Traceback (most recent call last):
    File "/src/glibc/elf/tst-glibcelf.py", line 23, in <module>
      import glibcelf
    File "/src/glibc/scripts/glibcelf.py", line 226, in <module>
      _elf_h = _parse_elf_h()
               ^^^^^^^^^^^^^^
    File "/src/glibc/scripts/glibcelf.py", line 223, in _parse_elf_h
      raise IOError('parse error in elf.h')
  OSError: parse error in elf.h

[1] ARC: update definitions in elf/elf.h
https://sourceware.org/pipermail/libc-alpha/2022-November/143503.html

[2]
tst-glibcelf, tst-relro-ldso, and tst-relro-libc

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
---
 scripts/glibcpp.py     | 1 +
 support/tst-glibcpp.py | 1 +
 2 files changed, 2 insertions(+)

diff --git a/scripts/glibcpp.py b/scripts/glibcpp.py
index 455459a609..2f39979894 100644
--- a/scripts/glibcpp.py
+++ b/scripts/glibcpp.py
@@ -346,6 +346,7 @@ RE_SPLIT_INTEGER_SUFFIX = re.compile(r'([^ullULL]+)([ullULL]*)')
 BINARY_OPERATORS = {
     '+': operator.add,
     '<<': operator.lshift,
+    '|': operator.or_,
 }
 
 # Use the general-purpose dict type if it is order-preserving.
diff --git a/support/tst-glibcpp.py b/support/tst-glibcpp.py
index a2db1916cc..cca8bd6c44 100644
--- a/support/tst-glibcpp.py
+++ b/support/tst-glibcpp.py
@@ -131,6 +131,7 @@ check_macro_eval('#define A 1', {'A': 1})
 check_macro_eval('#define A (1)', {'A': 1})
 check_macro_eval('#define A (1 + 1)', {'A': 2})
 check_macro_eval('#define A (1U << 31)', {'A': 1 << 31})
+check_macro_eval('#define A (1 | 2)', {'A': 1 | 2})
 check_macro_eval('''\
 #define A (B + 1)
 #define B 10
-- 
2.38.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
