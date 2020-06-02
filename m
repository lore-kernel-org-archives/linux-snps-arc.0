Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC23C433E1
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 21:32:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F20720734
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 21:32:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EO+lA8f9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CTaB8hmy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F20720734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/X7QSeKNW8E+VNKAEGMUsXy9UmHQw8TkZW/5XmowyEM=; b=EO+lA8f99icntH
	0q4y+3h/YoxW6FVLufJr83724pK6FAm0q8nUylJFjHwWpjm/K1nb5FYILgoJVBAKONTB9tYEa69V6
	675S9BX08Dyp5+IwT5rUK/t2WIrV5RrYE75OjwO/G2IowEV7AIwUwn0Lag93UT3yRdYfnDawthyRv
	K4V2s0eiK/EUqCjO7en2UAHU+t1N01idVcQmynDwk3AIgOjV4ou/tWkB5Zq6vFASidb/c/jy3LBQ9
	q18lkJlJsGV4GQ6HEaFcnm6AeXJ67xT1UwbgwGORRdks0ixdp6zmoWFhmXWRAWC7FqrQQtd0oP0cR
	5Rxhw5Oig7OEm0Q0epsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgEWR-0005rU-D3; Tue, 02 Jun 2020 21:32:35 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgEWK-0005nx-FD
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 21:32:33 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 401E740651;
 Tue,  2 Jun 2020 21:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591133543; bh=iT48QY/YAYtFnPeHVWkg3GofocLW+etqBFSqHX7B1ds=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CTaB8hmyajeVt7L82oNibDVCW7496B2JbA9LT9TnGu6zKEjySaR9qxJxdA7cA7g2F
 dgjlBzsNWKAu9bP1p7zM4zw4fXvsKc8jtgtSxrofCJt48hJ9Eob5TFvMH0a2Mh3OoP
 Q/Uszo0kui0gHc3SDqGdcxjZCBFtsDZiDnTfDDwZTsAmPinnco57rEzMMEF7cxbFDQ
 +4kaaAJjkv1Kq5duxp3F+5TFOU22UDQCABK8aAJbO+uzPcxIXB5XM3RkjR6ibLNSCj
 /KesgrI/jGeBcYPAk4KTCyyhSBBomP+q5LWwdH2Js2mTldVpkb1c84VtrvWHlWBaOs
 YgcYLo4ctvkGg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id E153DA00A0;
 Tue,  2 Jun 2020 21:32:22 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v3 1/4] iee754: provide gcc builtins based generic sqrt
 functions
Date: Tue,  2 Jun 2020 14:32:17 -0700
Message-Id: <20200602213220.6201-2-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602213220.6201-1-vgupta@synopsys.com>
References: <20200602213220.6201-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_143228_524745_B9F5E1A5 
X-CRM114-Status: GOOD (  11.32  )
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

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
---
 sysdeps/generic/math-use-builtins.h  |  3 +++
 sysdeps/ieee754/dbl-64/e_sqrt.c      |  6 ++++++
 sysdeps/ieee754/flt-32/e_sqrtf.c     | 16 ++++++++++------
 sysdeps/s390/fpu/math-use-builtins.h |  3 +++
 4 files changed, 22 insertions(+), 6 deletions(-)

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
index b339444301aa..177bf5dbdde2 100644
--- a/sysdeps/ieee754/flt-32/e_sqrtf.c
+++ b/sysdeps/ieee754/flt-32/e_sqrtf.c
@@ -16,12 +16,15 @@
 #include <math.h>
 #include <math_private.h>
 #include <libm-alias-finite.h>
-
-static	const float	one	= 1.0, tiny=1.0e-30;
+#include <math-use-builtins.h>
 
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
@@ -70,10 +73,10 @@ __ieee754_sqrtf(float x)
 
     /* use floating add to find out rounding direction */
 	if(ix!=0) {
-	    z = one-tiny; /* trigger inexact flag */
-	    if (z>=one) {
-		z = one+tiny;
-		if (z>one)
+	    z = 0x1p0 - 0x1.4484cp-100; /* trigger inexact flag.  */
+	    if (z >= 0x1p0) {
+		z = 0x1p0 + 0x1.4484cp-100;
+		if (z > 0x1p0)
 		    q += 2;
 		else
 		    q += (q&1);
@@ -83,6 +86,7 @@ __ieee754_sqrtf(float x)
 	ix += (m <<23);
 	SET_FLOAT_WORD(z,ix);
 	return z;
+#endif /* ! USE_SQRTF_BUILTIN  */
 }
 #ifndef __ieee754_sqrtf
 libm_alias_finite (__ieee754_sqrtf, __sqrtf)
diff --git a/sysdeps/s390/fpu/math-use-builtins.h b/sysdeps/s390/fpu/math-use-builtins.h
index db00c3a69b89..eb87b6b0b16b 100644
--- a/sysdeps/s390/fpu/math-use-builtins.h
+++ b/sysdeps/s390/fpu/math-use-builtins.h
@@ -108,4 +108,7 @@
 # define USE_COPYSIGNF128_BUILTIN 0
 #endif
 
+#define USE_SQRT_BUILTIN 0
+#define USE_SQRTF_BUILTIN 0
+
 #endif /* math-use-builtins.h */
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
