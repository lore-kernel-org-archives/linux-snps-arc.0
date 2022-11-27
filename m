Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F28C43217
	for <linux-snps-arc@archiver.kernel.org>; Sun, 27 Nov 2022 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=biiiuYxXVHGOwlCNt9yKdaI4zACCkhOgXRXOplWiwww=; b=scrhVwPFtyO3JU
	JHJSXKOvvpEZM3ZHGVqch5qzwQVkGDvQZhlgveBZ09o8r6Ds+Bp60KZUKvnzQt7rqXLl2ycmouWS8
	11tmtmWQe557P63K5gmMAmTs9OM9+dN6CSiaagR3IvZScSIlUJh1KHi6ydWdmU7aLn0IyAB2LZtfh
	/mftFakub4NKyaJq3TrwG7c6Wc0Cn0Ms6C9GNgUO7TwWajuvZjSen8OsPspBM+SLCS4z4RxnwUphV
	N/mBY7HHrjAEXFZJh/Gqx0w1n8gWmC7phtK7dEaX8GaSZ/p+bjdXEG5ngul2M+cTVdxt/KRUY0Tcc
	fqaZx12JGPs5eNtE1x/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLdI-00CjTp-CZ; Sun, 27 Nov 2022 17:40:00 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLdF-00CjRF-Ba
	for linux-snps-arc@lists.infradead.org; Sun, 27 Nov 2022 17:39:59 +0000
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AQJLHOt004334;
	Sun, 27 Nov 2022 09:39:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pfptdkimsnps;
 bh=bbuqamdTfsq9xrAtk/0fQQ3S7mQojOwo4UyHBHRL57I=;
 b=uVjsz+dBKGShw/0qJ2+HWiahOGq2k/DJvbvvedsc9k4RYJ3r28sF9CBwgXZBwRpFruOx
 WtTBe2ms9PXajdcC/cKftehZYYJJNsmeW3yF47WyQ3XOK+k4qZChiRrWlVopKdYnTGwf
 bdtEr1qS9Ly2xa8klZQH/t6AwDzVxHlVjYEFwOviVYGqcUL/Hq2DwLTYZfKGvOtsGYQR
 zfx5kXmZw7xUOPA2V/D+GWh4AWImbc+1AnKJecDxuKfn8AGdjCE3kQZusSjVZ9d9HDHN
 AmF7ZrjnNkPuZOM3lq3G2ZuPhEIp+f+c29dzgfxeINvfTDe92DpJWI3+KQKttV9dyjr2 kw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3m3jm0uc7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Nov 2022 09:39:52 -0800
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E8D4540094;
	Sun, 27 Nov 2022 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1669570791; bh=SMnhf8CRlNsoWzggAnkBhEr3PklNiWQu4d22FKPEuvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TJXb5qMA5ba4ejr+wWhvBGiSfiv0WlLAFxUODf0IGKDDmnUt2Om9XzXhGYgc6gghJ
	 g1HwTIuOkuQNmmzLrbJO+oN6GCdBMcULU5G1ttSVWoP3RHfeyoQYuy9z8IEc/AyqGD
	 zqapmrw9++4QRD+rxAZbSM5dUQPTI9yAbBh2wDftZFB9hkGVAC2eKqiRykNrkz52/9
	 pkiukPVo6qqpDeCIiarkQSB+4oX8a2tzV4O8WK1TRkPLfgNYDNvrOwm3l5yYVTRaKb
	 9LRmp2uHB3I+D4PZh0mD6VxXuKM6MN0Q3GOZKN/cvhPh/qJ9Da+FekH1CtN+FJaBce
	 d4BZYFjrVbRUQ==
Received: from atlantis.internal.synopsys.com (unknown [10.225.29.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 3CE97A005E;
	Sun, 27 Nov 2022 17:39:46 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
To: libc-alpha@sourceware.org
Cc: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
        Vineet Gupta <vineet.gupta@linux.dev>,
        Florian Weimer <fweimer@redhat.com>,
        Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
        arcml <linux-snps-arc@lists.infradead.org>
Subject: [PATCH v3 0/2] Update ARC definitions in elf/elf.h
Date: Sun, 27 Nov 2022 18:38:23 +0100
Message-Id: <20221127173825.3106-1-shahab@synopsys.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118131542.23188-1-shahab@synopsys.com>
References: <20221118131542.23188-1-shahab@synopsys.com>
MIME-Version: 1.0
X-Proofpoint-GUID: E1NbiSIMup97Ef_GJ_v3eeW1oNNPCzch
X-Proofpoint-ORIG-GUID: E1NbiSIMup97Ef_GJ_v3eeW1oNNPCzch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-27_08,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 phishscore=0 clxscore=1011 impostorscore=0 mlxlogscore=670
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211270147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_093957_552549_AAC5B749 
X-CRM114-Status: GOOD (  15.72  )
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

After updating the ARC definitions in elf/elf.h (the second patch of
this series), I noticed a lack of parsing support for it in glibcpp.py.
Please read the description of the first patch for more details.  To
have the tests pass all the time, the first patch fixes the potential
issue and the second one is related to the actual update of definitions
in elf.h header.

Rationale for the CCs:

Florian Weimer -- Changes related to glibcpp and glibcelf
Vineet  Gupta  -- Changes related to elf.h (ARC section)

Shahab Vahedi (2):
  scripts: Add "|" operator support to glibcpp's parsing
  ARC: update definitions in elf/elf.h

 elf/elf.h                | 29 ++++++++++++++++++++++++-----
 scripts/glibcelf.py      |  3 +++
 scripts/glibcpp.py       |  1 +
 support/tst-glibcpp.py   |  1 +
 sysdeps/arc/dl-machine.h |  8 ++++----
 5 files changed, 33 insertions(+), 9 deletions(-)

-- 
2.38.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
