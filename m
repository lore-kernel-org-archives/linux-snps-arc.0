Return-Path: <SRS0=KuJb=7M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10DEC433E1
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 May 2020 02:01:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D80C208E4
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 May 2020 02:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R3qK9pBG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EKGyaA1F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D80C208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j28b/fpnl6/AEnDF9UPJdvxoCI7JPJSiX3tZ6lOCZpg=; b=R3qK9pBGwZD/ye
	iF6X25IUeqbG56KDZKFRY1E2cxdP0Br67ZoZVzkiXrS/Psj5EUY5y+ujnQtRA7C4fYn9Uz+dZWD3S
	A+3mrFyv6437K8zBZ+HF8exRSKvA+8ALWGGzlf99Y5rzxT9XCCLg2S0VjeINM4e5Kdlkr4tpZGKKX
	5UragH3whxb6+AfpPU+2s6HhwVHa+4BE8JF6s3umx0pGu9Y/1s279XHPUft4nAg+2SkiTWL2k330j
	QV5EE1IQg7GSDoTXbyU/W+sUvLs8ljxdJEZdwQFlkLt/w+pv05Ndrc/ouT0/jWcl5BYF48dl3WluP
	o+KhGXq4f/HLPmbhwxYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeqnv-0004sv-Vj; Sat, 30 May 2020 02:00:55 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeqnt-0004rC-Lt
 for linux-snps-arc@lists.infradead.org; Sat, 30 May 2020 02:00:55 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7BC0940957;
 Sat, 30 May 2020 02:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590804051; bh=ejoswXvqzrn/FStLxH2M/g4Vi95JksptsydAdrNlVfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EKGyaA1FRfnXSCYmapLxzMfYPVPcyUzg6d0Zos0yQw4ZJGh50YUjlBlC23uLmyjMm
 N3uWNgS/fLLhY9917It3nwzrzzrtl35NNH9V5VgBEf3hyneUPEW8HJFfIEqnYBA2T+
 DISvVSA10s84ix7TSoCv8VZ0J1R4pfudIxMIMatvrIcs6X9pQb4LACT9WEOL8sL+sa
 Kshowu8Chf2mnU9AoJhLaC6isTViQwyahEgK7M/dxVMr788cRk+w/5mqTs80U1Mw4W
 CXWKBbZ/zVpZUguR0jMAtYpanDZEVOvJtHYgy2CEv/iCcaGiu4ZmnhduL1vYXxKrAH
 jQp0rp0raFdng==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 442C4A023B;
 Sat, 30 May 2020 02:00:51 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH 2/5] iee754: prvoide gcc builtins based generic sqrt functions
Date: Fri, 29 May 2020 19:00:44 -0700
Message-Id: <20200530020047.5490-3-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200530020047.5490-1-vgupta@synopsys.com>
References: <20200530020047.5490-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_190053_744921_26C9D6B6 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

---
 sysdeps/generic/math-use-builtins.h | 3 +++
 sysdeps/ieee754/dbl-64/e_sqrt.c     | 6 ++++++
 sysdeps/ieee754/flt-32/e_sqrtf.c    | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/sysdeps/generic/math-use-builtins.h b/sysdeps/generic/math-use-builtins.h
index 8a39ef58bc95..fc724c824a17 100644
--- a/sysdeps/generic/math-use-builtins.h
+++ b/sysdeps/generic/math-use-builtins.h
@@ -60,4 +60,7 @@
 # define USE_COPYSIGNF128_BUILTIN 0
 #endif
 
+#define USE_SQRT_BUILTIN 0
+#define USE_SQRTF_BUILTIN 0
+
 #endif /* math-use-builtins.h */
diff --git a/sysdeps/ieee754/dbl-64/e_sqrt.c b/sysdeps/ieee754/dbl-64/e_sqrt.c
index d42a1a4eb6e9..518a8ae5cdaf 100644
--- a/sysdeps/ieee754/dbl-64/e_sqrt.c
+++ b/sysdeps/ieee754/dbl-64/e_sqrt.c
@@ -41,6 +41,7 @@
 #include <math_private.h>
 #include <fenv_private.h>
 #include <libm-alias-finite.h>
+#include <math-use-builtins.h>
 
 /*********************************************************************/
 /* An ultimate sqrt routine. Given an IEEE double machine number x   */
@@ -50,6 +51,10 @@
 double
 __ieee754_sqrt (double x)
 {
+#if USE_SQRT_BUILTIN
+  return __builtin_sqrt (x);
+#else
+  /* Use generic implementation.  */
   static const double
     rt0 = 9.99999999859990725855365213134618E-01,
     rt1 = 4.99999999495955425917856814202739E-01,
@@ -138,6 +143,7 @@ __ieee754_sqrt (double x)
 	return (x - x) / (x - x); /* sqrt(-ve)=sNaN */
       return 0x1p-256 * __ieee754_sqrt (x * 0x1p512);
     }
+#endif /* ! USE_SQRT_BUILTIN  */
 }
 #ifndef __ieee754_sqrt
 libm_alias_finite (__ieee754_sqrt, __sqrt)
diff --git a/sysdeps/ieee754/flt-32/e_sqrtf.c b/sysdeps/ieee754/flt-32/e_sqrtf.c
index b339444301aa..68fc80e1e1ee 100644
--- a/sysdeps/ieee754/flt-32/e_sqrtf.c
+++ b/sysdeps/ieee754/flt-32/e_sqrtf.c
@@ -16,12 +16,17 @@
 #include <math.h>
 #include <math_private.h>
 #include <libm-alias-finite.h>
+#include <math-use-builtins.h>
 
 static	const float	one	= 1.0, tiny=1.0e-30;
 
 float
 __ieee754_sqrtf(float x)
 {
+#if USE_SQRTF_BUILTIN
+	return __builtin_sqrtf (x);
+#else
+	/* Use generic implementation.  */
 	float z;
 	int32_t sign = (int)0x80000000;
 	int32_t ix,s,q,m,t,i;
@@ -83,6 +88,7 @@ __ieee754_sqrtf(float x)
 	ix += (m <<23);
 	SET_FLOAT_WORD(z,ix);
 	return z;
+#endif /* ! USE_SQRTF_BUILTIN  */
 }
 #ifndef __ieee754_sqrtf
 libm_alias_finite (__ieee754_sqrtf, __sqrtf)
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
