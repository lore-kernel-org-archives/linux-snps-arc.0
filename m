Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B85FC4167B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Dec 2022 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+d7PstRhn30keRLExNaP3RV51wToIx30DMhYJ4FjFOs=; b=nEwrznN4nNnhbl
	c19l0Cgg6LNj38XnUX6eJdBNt4VYZmuUmLpQi5OqPz6hlU5yHA8jzEI1RC2s0iAMBXPN07yOci2+N
	pwMdQQFZNZip1vDrHDq6SBA6I19t9QBFchnYFye2FHvn/WDm/1MYx4ezhZmKiTYnF6Gj3N/Vw0s47
	F0jbeRRq6r/mkC4tuslD7tIC/v3E30dN4ZypzjpNpjWh9Qg0KDeQEW0lLim6mEdONjWN/re+7lJMV
	ySYwwzN/MTgN+kBRa+dCJnDQp6DIEBhogNsXr/uI8yauIRIX7pp9lVwFEceJBSsZPj26qq9UgeFoo
	xiAKxKdSv1Co+ciDvWxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81yb-00H2z4-BV; Wed, 21 Dec 2022 16:29:53 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p81xu-00H2ap-4x
	for linux-snps-arc@lists.infradead.org; Wed, 21 Dec 2022 16:29:11 +0000
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLGBYTm015647;
	Wed, 21 Dec 2022 08:29:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=pfptdkimsnps; bh=1svWAEFXggcY4zz+A6W68SKUb/UVyZ1bDUN+5DhgUQA=;
 b=abeKpbj16Pl+OyVzRegSZctQDo4+CVJMovlmF5G8xobWB9dvYoxWvlMtr2S0K5L9p6bu
 S0UTLbGg6eULNbPr3XJbNVYmJnl5m4G3N00TwuOQezYov1r0TsMTRx6mDifrFYkNUIeS
 Sy4mJwFNfXZg1NMjdv63ZqPYPe29Y1xN9pbqfaPdYYz/1/PwM5hZStODZS5H3ZFBHB8E
 bFispWF1Fb6yPAW1JoR+jAxddcvWAz40z/lip113l8DscKYg+Q2b5Q9H09wXRxlf7/0e
 vm+MK89XohC/ufn7fjjsDgYTilLJbm0pzqvciyv/NlPuQ5L6XT2+51T0CRQs6/si/IQp jg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3mhdk0q3n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 08:29:06 -0800
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DE4DDC00AF;
	Wed, 21 Dec 2022 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1671640145; bh=5xVKRVReL5vAFC/UaYZGejBuv/3FhyeS7D3S/At4/Dk=;
	h=From:To:Cc:Subject:Date:From;
	b=TH9d5yQX9l8BK6MPMgPOzOtRVeE9Klg/kmKa+lPMXzmiS72Bje23hUfs7MWtduyZy
	 RPecoWL91/toTBbkB0Wq0lx+A4rIkJB4ejm4NjoL0yLwxIxaNMWawdZLWWdy4DLN9q
	 jnZmboaBoz+pbQTGhDmNDWaSRTzQKdY6ZBLKXzBwvbBbBgqJ/jWkAjWnnVHQHlTQgA
	 LUWkAQDZxJEsVSQ9ZJV4hNMq5i8C0Qoe6bmIVik9QsD6F5+TDNRvv1Jy2jprWWxUP0
	 N8Ta0cgsTdypkXyfMAc88trtiax5CkyxdxjG0MT8l8IDwAydyHDK2lWhY3EVkkRtk5
	 z10H8N8d0SJfg==
Received: from SNPS-o0WHuHJU73.internal.synopsys.com (snps-o0whuhju73.internal.synopsys.com [10.116.111.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 42FB7A005D;
	Wed, 21 Dec 2022 16:29:02 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Pavel.Kozlov@synopsys.com
To: libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org,
        Pavel Kozlov <Pavel.Kozlov@synopsys.com>
Subject: [PATCH] ARC:fpu: add extra capability check before use of sqrt and fma builtins
Date: Wed, 21 Dec 2022 20:28:49 +0400
Message-Id: <20221221162849.12301-1-kozlov@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: YKI_0HSOgBxR14oTwEnbNuOtl0zQMUak
X-Proofpoint-GUID: YKI_0HSOgBxR14oTwEnbNuOtl0zQMUak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_08,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 mlxlogscore=673 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212210136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_082910_391105_A969DDFC 
X-CRM114-Status: GOOD (  17.50  )
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
 sysdeps/arc/fpu/math-use-builtins-fma.h  | 14 ++++++++++++--
 sysdeps/arc/fpu/math-use-builtins-sqrt.h | 14 ++++++++++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/sysdeps/arc/fpu/math-use-builtins-fma.h b/sysdeps/arc/fpu/math-use-builtins-fma.h
index eede75aa41be..082badf48201 100644
--- a/sysdeps/arc/fpu/math-use-builtins-fma.h
+++ b/sysdeps/arc/fpu/math-use-builtins-fma.h
@@ -1,4 +1,14 @@
-#define USE_FMA_BUILTIN 1
-#define USE_FMAF_BUILTIN 1
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
