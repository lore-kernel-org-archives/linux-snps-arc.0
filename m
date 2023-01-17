Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C67C63797
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Jan 2023 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crtuElf20PB0xgwD2Ne8se7nwX8W/iZTcd8zxOWeAnI=; b=wfEDYOq6Yhpl0D
	X4QLHdEE6jHXNyxm/vXGd1xZIHZpjTS9aXG405brUKJ9JqdQTHzXOcqu4yv3r+m3NzTS2xtfurJNp
	rfkRtywPw42rE2al84Q8xGtVroPgmbb7ch9LUVcqp/vI/sHZHFcJuuKGm/5ihI7ZBel5aZIh9Y4cg
	kh84IareA5FJSzq+Vcc63dWfC0s1F5/KLcWk62S5YY5sG7En1Tt3QQXQv24yd1aKpsquSfIwouu9e
	bCQpWZQ9PQ2fU6zDULWwmGx+NCIp7ezGTAjobSMv7rbvPSbtta17w+sHuxDrZvUnuKtvC7/HzR3nt
	Y6wRygcrdNneNXo/MxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHkpk-00E9Nv-KD; Tue, 17 Jan 2023 12:12:56 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHkpf-00E9L3-9E
	for linux-snps-arc@lists.infradead.org; Tue, 17 Jan 2023 12:12:55 +0000
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HC3CLn018233;
	Tue, 17 Jan 2023 04:12:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pfptdkimsnps;
 bh=sxQZjLChGNlOqM5V0vjAUah7pyIvaGaoWUN4Z6I4DF0=;
 b=glcrAMVnNvlIIPD6qx4aKzaJhEr0GNHRzLpw2IHYwWSBHdkm1wkbGMOrip1zEw1pLXn6
 LXWQy68WnKvGHj2DF2CM7DSViw2Q/ok2nl8cEos2YsMnU0sBGFHHKyrzLcFQHbG84gxl
 0BTtxUF9EnuP8MWpNF6tUG06lrA/skmjuQv6WDfLP8p1Z8kbyfSMRs8MefC96m/0rU+c
 3r3BQ/SN3Zu5RPJHMR4aMHcFp8+9CfVW5RPpW4S1iwrHaSxytqJZ9riRl3YcVPVW+jpz
 Kgm8RMV94fW98d1jWhvyy2uOKLYLShIer+SqodfEnpPrCW4BILjDi2lI0wFOqOq2mrgc bQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3n3v71ehc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jan 2023 04:12:40 -0800
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5BBBBC2339;
	Tue, 17 Jan 2023 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1673957559; bh=MWlVv2bNaMqgQxDPJxSKxlmTWOLR6TjQntQIh4cnyqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hkZazC6kBh5aR4ZiSA4+DDkBofdhu+/pPa01n3s+Fxgf3qxvZqWJp4QexEVeFkd9q
	 9o/u8NNnTMwmhC6oZlmLjm/HjVerIhQR81CxnJmoXKx63p3TMlZL6QQFkM/u+Z6RNZ
	 bDr7OrcNgE/DydprGWn2J6wWsKYwZSNS61DOof/LBmKR5LJErOIQRPvx1Dq4ppm8So
	 Lokdrz6cPtPvD+mtCUZbf+d2alg6lalivMyo471HXh3DuW1y0r+7FxBkfu8YwdUAQ1
	 wRuWt4YVHJL+LTihoXtpGaHV7BKaOb8UTUb1l9rDdz/hKBCxVFhXNjdOGkIolrroT0
	 3soqln4jlXIhg==
Received: from SNPS-o0WHuHJU73.internal.synopsys.com (snps-o0whuhju73.internal.synopsys.com [10.116.104.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 57631A0073;
	Tue, 17 Jan 2023 12:12:35 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Pavel.Kozlov@synopsys.com
To: libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org,
        Pavel Kozlov <Pavel.Kozlov@synopsys.com>
Subject: [PATCH v2] ARC:fpu: add extra capability check before use of sqrt and fma builtins
Date: Tue, 17 Jan 2023 16:12:23 +0400
Message-Id: <20230117121223.2635-1-kozlov@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221221162849.12301-1-kozlov@synopsys.com>
References: <20221221162849.12301-1-kozlov@synopsys.com>
MIME-Version: 1.0
X-Proofpoint-GUID: NLPQKlDXwnQjWmR5hTSlyyFUvzYPIw_I
X-Proofpoint-ORIG-GUID: NLPQKlDXwnQjWmR5hTSlyyFUvzYPIw_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_05,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=630 phishscore=0 mlxscore=0 adultscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301170101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_041251_514789_EB0052CE 
X-CRM114-Status: GOOD (  18.85  )
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

Add extra check for compiler definitions to ensure that compiler provides
sqrt and fma hw fpu instructions else use software implementation.

As divide/sqrt and FMA hw support from CPU side is optional,
the compiler can be configured by options to generate hw FPU instructions,
but without use of FDDIV, FDSQRT, FSDIV, FSSQRT, FDMADD and FSMADD
instructions. In this case __builtin_sqrt and __builtin_sqrtf provided by
compiler can't be used inside the glibc code, as these builtins are used
in implementations of sqrt() and sqrtf() functions but at the same time
these builtins unfold to sqrt() and sqrtf(). So it is possible to receive
code like that:

0001c4b4 <__ieee754_sqrtf>:
   1c4b4:    0001 0000      b     0         ;1c4b4 <__ieee754_sqrtf>

The same is also true for __builtin_fma and __builtin_fmaf.

---
Changes in v2:
 - Fixed macros definitions for FMA

 sysdeps/arc/fpu/math-use-builtins-fma.h  | 14 ++++++++++++--
 sysdeps/arc/fpu/math-use-builtins-sqrt.h | 14 ++++++++++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/sysdeps/arc/fpu/math-use-builtins-fma.h b/sysdeps/arc/fpu/math-use-builtins-fma.h
index eede75aa41be..2acd8113ce2c 100644
--- a/sysdeps/arc/fpu/math-use-builtins-fma.h
+++ b/sysdeps/arc/fpu/math-use-builtins-fma.h
@@ -1,4 +1,14 @@
-#define USE_FMA_BUILTIN 1
-#define USE_FMAF_BUILTIN 1
+#if defined __ARC_FPU_DP_FMA__
+# define USE_FMA_BUILTIN 1
+#else
+# define USE_FMA_BUILTIN 0
+#endif
+
+#if defined __ARC_FPU_SP_FMA__
+# define USE_FMAF_BUILTIN 1
+#else
+# define USE_FMAF_BUILTIN 0
+#endif
+
 #define USE_FMAL_BUILTIN 0
 #define USE_FMAF128_BUILTIN 0
diff --git a/sysdeps/arc/fpu/math-use-builtins-sqrt.h b/sysdeps/arc/fpu/math-use-builtins-sqrt.h
index e94c915ba66a..a449bc609295 100644
--- a/sysdeps/arc/fpu/math-use-builtins-sqrt.h
+++ b/sysdeps/arc/fpu/math-use-builtins-sqrt.h
@@ -1,4 +1,14 @@
-#define USE_SQRT_BUILTIN 1
-#define USE_SQRTF_BUILTIN 1
+#if defined __ARC_FPU_DP_DIV__
+# define USE_SQRT_BUILTIN 1
+#else
+# define USE_SQRT_BUILTIN 0
+#endif
+
+#if defined __ARC_FPU_SP_DIV__
+# define USE_SQRTF_BUILTIN 1
+#else
+# define USE_SQRTF_BUILTIN 0
+#endif
+
 #define USE_SQRTL_BUILTIN 0
 #define USE_SQRTF128_BUILTIN 0
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
