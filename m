Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E45C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Dec 2022 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZXHwgwun4ukhxGHOGRDM83tWDiN5vGhdDtwjTMFngqA=; b=u5vPd6nTc8aAXr
	341NX29wE7ke0+QIQHPPQc5AhZdZuLYzmE++kis1Vgbto8R0Pl+6lM5VBlZwUZ6K6+dI/GPgB07oY
	QhEvtgBeDfc4VIc+/Hj7aDwKX7fBvFuX4zyPCmD5paPqwseAiya71uuawsSEcg4aaQ6b1sbScLVRS
	eZLNAKn+n1QkX5IgkbvbDCW3nFAhF32EK/jHZZLgt6syuVWeZuTBcCjaE1D21vK+eP/xBBgx2J13z
	XfJ9MG3JRYG12jgEAEuMuC1yZYaPVw2LUvymUIMX+YhnfKZOh5p01L/k8kFcXVRrZ84eZ0stbrqx8
	vj8xLHb6ethIAbGVPwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81pW-00GzJp-3a; Wed, 21 Dec 2022 16:20:30 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81pM-00GzFq-Ra
	for linux-snps-arc@lists.infradead.org; Wed, 21 Dec 2022 16:20:22 +0000
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLGDVuC010350;
	Wed, 21 Dec 2022 08:20:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=pfptdkimsnps; bh=OM6KIBz5Y3WYwlTVp+9CZ6lvBSr8wKgXRS9cqsvd6d8=;
 b=a3CpL/45vSnyu3mMdvlreSIK0XDgneSNESGDY3jmyP7pSUj0e0dDMIPBJW9ikE3JTkE+
 MH/CFHOcFKdyB0UboZyNFL53yR0qzpGQ7nKqORrfnQXBSCETK7GWQLeyb6dEI1MTaI00
 c6KGw5qZXlxnh4Rx+6U+MCYe3cOygFLiOmJNa7v4xGkuAX+Dj7Ewm9CLeMC2YNbZb6Bw
 rbmeNbtfHB1xo7af9JG52SVJ/v8CEqGYVec+po2J+h66YVoMOUYHU+QYpKhNgr1vRw8g
 Ts4ZD5/BoIRfWQ9ld+8QI4upocKk4TNdiHPIjMS0yKxuby6Jhcb23wEoPaR6VUWCoMJu jg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3mkvu49hkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 08:20:17 -0800
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1E580400F0;
	Wed, 21 Dec 2022 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1671639617; bh=MO27H751XXxjWiA5cBeJ7whNpuPSrPN2EQy5kZtURt8=;
	h=From:To:Cc:Subject:Date:From;
	b=mUBtzWnwEimL2pCMwkNdPx44pAjtPypXNbuIn3vYUob+kKc/Kd2EhzUDR5qDWM1Sd
	 HAzQAIBLx7ak4locDmqevPn5X0sXi2N3HT5VINvIDw+IR3iZXHrBQA+S2WPhFX82EV
	 Uzub3xnSWxpvaMk2bt2DCDjABZUHkwQqIFuXyl786K5kkb3YHYXcw3XAdLrn9FV0ME
	 ccZcK0i7VZS1w7d3kU6l39vMEUAEuNQdAhxJa94OMmuXF39OaBvH8dyIONv9AyLyBb
	 /Rn1QiJ480U+NrF1XFK4OSLcjoEUhef6GoGAxJKYH+CC5GhdwPvjAYPpsnwQ4cpF6i
	 xjmijrJ0e4BQQ==
Received: from SNPS-o0WHuHJU73.internal.synopsys.com (snps-o0whuhju73.internal.synopsys.com [10.116.111.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 298FAA005D;
	Wed, 21 Dec 2022 16:20:13 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Pavel.Kozlov@synopsys.com
To: libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org,
        Pavel Kozlov <Pavel.Kozlov@synopsys.com>
Subject: [PATCH] ARC: align child stack in clone
Date: Wed, 21 Dec 2022 20:19:46 +0400
Message-Id: <20221221161946.12090-1-kozlov@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: Pg9dTaTxD0yqJ5ezIeuOySkbwBIZwZXe
X-Proofpoint-GUID: Pg9dTaTxD0yqJ5ezIeuOySkbwBIZwZXe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_08,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=785 adultscore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212210136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_082021_024414_30BE9533 
X-CRM114-Status: GOOD (  12.83  )
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

The ARCv2 ABI requires 4 byte stack pointer alignment. Don't allow to
use unaligned child stack in clone. As the stack grows down,
align it down.

This was pointed by misc/tst-misalign-clone-internal and
misc/tst-misalign-clone tests. Stack alignmet fixes these tests
fails.
---
 sysdeps/unix/sysv/linux/arc/clone.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sysdeps/unix/sysv/linux/arc/clone.S b/sysdeps/unix/sysv/linux/arc/clone.S
index bd924890844a..f32c83f17a65 100644
--- a/sysdeps/unix/sysv/linux/arc/clone.S
+++ b/sysdeps/unix/sysv/linux/arc/clone.S
@@ -41,6 +41,7 @@
 
 ENTRY (__clone)
 	cmp	r0, 0		/* @fn can't be NULL.  */
+	and	r1,r1,-4	/* @child_stack be 4 bytes aligned per ABI.  */
 	cmp.ne	r1, 0		/* @child_stack can't be NULL.  */
 	bz	L (__sys_err)
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
