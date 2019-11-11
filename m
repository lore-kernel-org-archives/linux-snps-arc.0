Return-Path: <SRS0=N5rj=ZD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78731C43331
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 19:43:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EA7120659
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 19:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="npAl2ESn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hIQZIw1N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EA7120659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CZn7C3doMIO7OsqOmHSSnBpUe8K7ImXwpqJ7gXVddEg=; b=npAl2ESnWUVlHt
	e4rHX7d5rBTniYQ/lFlS6PRDtPNyd1izQNb0C3cH6PYJ/uhtOoUyMJkFSmM2HHMioVq8sjfKr0CmC
	8oQsk/H2PI5AP92OZo8kY+uRe41qwj7IJEshPEvPo5XDW0PIudj+0L6VtNt6R4loDauwW5hur4Rwo
	PpV6a7MVcMBKef1+fMR443d6rpxPmzgjmwD1l+U9yov0xmcZENJT7Ku1l30wjktz+/ag39OkxR4HW
	QxF53l8dsZEe01eg8D2yHIkiB+ivQzcAoH9bQ04LDYpriVOt4wYsFOaJmeq0PauNEtdObB0SpJfVc
	u8+fryk6yQnJ3/pvbM1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUFbR-0006TT-46; Mon, 11 Nov 2019 19:43:57 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUFbM-0006SX-AN
 for linux-snps-arc@lists.infradead.org; Mon, 11 Nov 2019 19:43:56 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 37CDCC03C8;
 Mon, 11 Nov 2019 19:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573501432; bh=6jmhpiZ3i0tuqduZX5zX1a/8fm428F4/ZtJFNzf4GE0=;
 h=From:To:Cc:Subject:Date:From;
 b=hIQZIw1Npa6nJYl+AWxPwPSfCglFGec1cbaGvOd+pz9cUzbXEEWZkK3ISFfIWjNL2
 r4225HgCYBTE9hZgu+ppsaBk02MYGqYOQ5v4BPcfw72h+acKF7SqjTwYFuY3Hq//xK
 HQ8yNwCj810jkwznQkCdXnVMpVsTaWPJ9rSa1a1Rdwa4Ti5ndum74hu02YMl02mn3v
 dWdbBaJ7B6nveqbBUVZouuN1YUxXfeWRptTrxlWYT4fKCtlPaQhpYVYa1MmpV3caUV
 400rZ46yFTo43x7qteRMZIeqvejzKs1HgQhcbC/G03QkX2QLKIyCh64b/iLl5XZ4WT
 QN/km2Moj0bZg==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.52])
 by mailhost.synopsys.com (Postfix) with ESMTP id 00A34A005E;
 Mon, 11 Nov 2019 19:43:49 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
Date: Mon, 11 Nov 2019 11:43:49 -0800
Message-Id: <20191111194349.21813-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_114352_390086_2BD65CD3 
X-CRM114-Status: GOOD (  14.44  )
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
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This came to light when adding hard-flaot support to ARC glibc port
without hardware sqrt support causing glibc build to fail:

| ../sysdeps/ieee754/dbl-64/e_sqrt.c: In function '__ieee754_sqrt':
| ../sysdeps/ieee754/dbl-64/e_sqrt.c:58:54: error: unused variable 'ty' [-Werror=unused-variable]
|   double y, t, del, res, res1, hy, z, zz, p, hx, tx, ty, s;

The reason being EMULV() macro uses the hardware provided
__builtin_fma() variant, leaving temporary variables 'p, hx, tx, hy, ty'
unused hence compiler warning and ensuing error.

The intent of the patch was to fix that error, but EMULV is pervasive
and used fair bit indirectly via othe rmacros, hence this patch.
Functionally it should not result in code gen changes and if at all
those would be better since the scope of those temporaries is greatly
reduced now

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/ieee754/dbl-64/dla.h      |  30 +++---
 sysdeps/ieee754/dbl-64/doasin.c   |  15 ++-
 sysdeps/ieee754/dbl-64/dosincos.c |  67 +++++++------
 sysdeps/ieee754/dbl-64/e_atan2.c  |  89 +++++++++---------
 sysdeps/ieee754/dbl-64/e_sqrt.c   |   4 +-
 sysdeps/ieee754/dbl-64/s_atan.c   |  56 +++++------
 sysdeps/ieee754/dbl-64/s_tan.c    | 150 ++++++++++++++----------------
 7 files changed, 193 insertions(+), 218 deletions(-)

diff --git a/sysdeps/ieee754/dbl-64/dla.h b/sysdeps/ieee754/dbl-64/dla.h
index 07b18258aaf2..daf08c111820 100644
--- a/sysdeps/ieee754/dbl-64/dla.h
+++ b/sysdeps/ieee754/dbl-64/dla.h
@@ -67,13 +67,15 @@
 /* storage variables of type double.                                   */
 
 #ifdef DLA_FMS
-# define  EMULV(x, y, z, zz, p, hx, tx, hy, ty)          \
+# define  EMULV(x, y, z, zz)          \
   z = x * y; zz = DLA_FMS (x, y, z);
 #else
-# define  EMULV(x, y, z, zz, p, hx, tx, hy, ty)          \
-  p = CN * (x);  hx = ((x) - p) + p;  tx = (x) - hx; \
-  p = CN * (y);  hy = ((y) - p) + p;  ty = (y) - hy; \
-  z = (x) * (y); zz = (((hx * hy - z) + hx * ty) + tx * hy) + tx * ty;
+# define  EMULV(x, y, z, zz)          \
+    ({  __typeof__ (x) p, hx, tx, hy, ty;          \
+        p = CN * (x);  hx = ((x) - p) + p;  tx = (x) - hx; \
+        p = CN * (y);  hy = ((y) - p) + p;  ty = (y) - hy; \
+        z = (x) * (y); zz = (((hx * hy - z) + hx * ty) + tx * hy) + tx * ty; \
+    })
 #endif
 
 
@@ -83,13 +85,15 @@
 /* storage variables of type double.                                         */
 
 #ifdef DLA_FMS
-# define  MUL12(x,y,z,zz,p,hx,tx,hy,ty,q)        \
-	   EMULV(x,y,z,zz,p,hx,tx,hy,ty)
+# define  MUL12(x, y, z, zz)        \
+	   EMULV(x, y, z, zz)
 #else
-# define  MUL12(x,y,z,zz,p,hx,tx,hy,ty,q)        \
+# define  MUL12(x, y, z, zz)        \
+    ({  __typeof__ (x) p, hx, tx, hy, ty, q;          \
 	   p=CN*(x);  hx=((x)-p)+p;  tx=(x)-hx; \
 	   p=CN*(y);  hy=((y)-p)+p;  ty=(y)-hy; \
-	   p=hx*hy;  q=hx*ty+tx*hy; z=p+q;  zz=((p-z)+q)+tx*ty;
+	   p=hx*hy;  q=hx*ty+tx*hy; z=p+q;  zz=((p-z)+q)+tx*ty; \
+    })
 #endif
 
 
@@ -125,8 +129,8 @@
 /* are assumed to be double-length numbers. p,hx,tx,hy,ty,q,c,cc are         */
 /* temporary storage variables of type double.                               */
 
-#define  MUL2(x, xx, y, yy, z, zz, p, hx, tx, hy, ty, q, c, cc)  \
-  MUL12 (x, y, c, cc, p, hx, tx, hy, ty, q)                      \
+#define  MUL2(x, xx, y, yy, z, zz, c, cc)  \
+  MUL12 (x, y, c, cc)                      \
   cc = ((x) * (yy) + (xx) * (y)) + cc;   z = c + cc;   zz = (c - z) + cc;
 
 
@@ -136,8 +140,8 @@
 /* are assumed to be double-length numbers. p,hx,tx,hy,ty,q,c,cc,u,uu        */
 /* are temporary storage variables of type double.                           */
 
-#define  DIV2(x,xx,y,yy,z,zz,p,hx,tx,hy,ty,q,c,cc,u,uu)  \
-	   c=(x)/(y);   MUL12(c,y,u,uu,p,hx,tx,hy,ty,q)  \
+#define  DIV2(x, xx, y, yy, z, zz, c, cc, u, uu)  \
+	   c=(x)/(y);   MUL12(c,y,u,uu)  \
 	   cc=(((((x)-u)-uu)+(xx))-c*(yy))/(y);   z=c+cc;   zz=(c-z)+cc;
 
 
diff --git a/sysdeps/ieee754/dbl-64/doasin.c b/sysdeps/ieee754/dbl-64/doasin.c
index ccb89ed1630c..049751bc502e 100644
--- a/sysdeps/ieee754/dbl-64/doasin.c
+++ b/sysdeps/ieee754/dbl-64/doasin.c
@@ -58,9 +58,6 @@ __doasin(double x, double dx, double v[]) {
 
   double xx,p,pp,u,uu,r,s;
   double tc,tcc;
-#ifndef DLA_FMS
-  double hx,tx,hy,ty,tp,tq;
-#endif
 
 
 /* Taylor series for arcsin for Double-Length numbers         */
@@ -68,16 +65,16 @@ __doasin(double x, double dx, double v[]) {
   p = ((((((d11*xx+d10)*xx+d9)*xx+d8)*xx+d7)*xx+d6)*xx+d5)*xx;
   pp = 0;
 
-  MUL2(x,dx,x,dx,u,uu,tp,hx,tx,hy,ty,tq,tc,tcc);
+  MUL2(x,dx,x,dx,u,uu,tc,tcc);
   ADD2(p,pp,c4.x,cc4.x,p,pp,r,s);
-  MUL2(p,pp,u,uu,p,pp,tp,hx,tx,hy,ty,tq,tc,tcc);
+  MUL2(p,pp,u,uu,p,pp,tc,tcc);
   ADD2(p,pp,c3.x,cc3.x,p,pp,r,s);
-  MUL2(p,pp,u,uu,p,pp,tp,hx,tx,hy,ty,tq,tc,tcc);
+  MUL2(p,pp,u,uu,p,pp,tc,tcc);
   ADD2(p,pp,c2.x,cc2.x,p,pp,r,s);
-  MUL2(p,pp,u,uu,p,pp,tp,hx,tx,hy,ty,tq,tc,tcc);
+  MUL2(p,pp,u,uu,p,pp,tc,tcc);
   ADD2(p,pp,c1.x,cc1.x,p,pp,r,s);
-  MUL2(p,pp,u,uu,p,pp,tp,hx,tx,hy,ty,tq,tc,tcc);
-  MUL2(p,pp,x,dx,p,pp,tp,hx,tx,hy,ty,tq,tc,tcc);
+  MUL2(p,pp,u,uu,p,pp,tc,tcc);
+  MUL2(p,pp,x,dx,p,pp,tc,tcc);
   ADD2(p,pp,x,dx,p,pp,r,s);
   v[0]=p;
   v[1]=pp; /* arcsin(x+dx)=v[0]+v[1] */
diff --git a/sysdeps/ieee754/dbl-64/dosincos.c b/sysdeps/ieee754/dbl-64/dosincos.c
index dcb1e925c67c..7deeb319fdb4 100644
--- a/sysdeps/ieee754/dbl-64/dosincos.c
+++ b/sysdeps/ieee754/dbl-64/dosincos.c
@@ -61,9 +61,6 @@ __dubsin (double x, double dx, double v[])
 {
   double r, s, c, cc, d, dd, d2, dd2, e, ee,
 	 sn, ssn, cs, ccs, ds, dss, dc, dcc;
-#ifndef DLA_FMS
-  double p, hx, tx, hy, ty, q;
-#endif
   mynumber u;
   int4 k;
 
@@ -73,31 +70,31 @@ __dubsin (double x, double dx, double v[])
   d = x + dx;
   dd = (x - d) + dx;
   /* sin(x+dx)=sin(Xi+t)=sin(Xi)*cos(t) + cos(Xi)sin(t) where t ->0 */
-  MUL2 (d, dd, d, dd, d2, dd2, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d, dd, d, dd, d2, dd2, c, cc);
   sn = __sincostab.x[k];       /*                                  */
   ssn = __sincostab.x[k + 1];  /*      sin(Xi) and cos(Xi)         */
   cs = __sincostab.x[k + 2];   /*                                  */
   ccs = __sincostab.x[k + 3];  /*                                  */
   /* Taylor series for sin ds=sin(t) */
-  MUL2 (d2, dd2, s7.x, ss7.x, ds, dss, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, s7.x, ss7.x, ds, dss, c, cc);
   ADD2 (ds, dss, s5.x, ss5.x, ds, dss, r, s);
-  MUL2 (d2, dd2, ds, dss, ds, dss, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, ds, dss, ds, dss, c, cc);
   ADD2 (ds, dss, s3.x, ss3.x, ds, dss, r, s);
-  MUL2 (d2, dd2, ds, dss, ds, dss, p, hx, tx, hy, ty, q, c, cc);
-  MUL2 (d, dd, ds, dss, ds, dss, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, ds, dss, ds, dss, c, cc);
+  MUL2 (d, dd, ds, dss, ds, dss, c, cc);
   ADD2 (ds, dss, d, dd, ds, dss, r, s);
 
   /* Taylor series for cos dc=cos(t) */
-  MUL2 (d2, dd2, c8.x, cc8.x, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, c8.x, cc8.x, dc, dcc, c, cc);
   ADD2 (dc, dcc, c6.x, cc6.x, dc, dcc, r, s);
-  MUL2 (d2, dd2, dc, dcc, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, dc, dcc, dc, dcc, c, cc);
   ADD2 (dc, dcc, c4.x, cc4.x, dc, dcc, r, s);
-  MUL2 (d2, dd2, dc, dcc, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, dc, dcc, dc, dcc, c, cc);
   ADD2 (dc, dcc, c2.x, cc2.x, dc, dcc, r, s);
-  MUL2 (d2, dd2, dc, dcc, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, dc, dcc, dc, dcc, c, cc);
 
-  MUL2 (cs, ccs, ds, dss, e, ee, p, hx, tx, hy, ty, q, c, cc);
-  MUL2 (dc, dcc, sn, ssn, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (cs, ccs, ds, dss, e, ee, c, cc);
+  MUL2 (dc, dcc, sn, ssn, dc, dcc, c, cc);
   SUB2 (e, ee, dc, dcc, e, ee, r, s);
   ADD2 (e, ee, sn, ssn, e, ee, r, s);                    /* e+ee=sin(x+dx) */
 
@@ -127,46 +124,46 @@ __dubcos (double x, double dx, double v[])
   x = x - (u.x - big.x);
   d = x + dx;
   dd = (x - d) + dx;  /* cos(x+dx)=cos(Xi+t)=cos(Xi)cos(t) - sin(Xi)sin(t) */
-  MUL2 (d, dd, d, dd, d2, dd2, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d, dd, d, dd, d2, dd2, c, cc);
   sn = __sincostab.x[k];     /*                                  */
   ssn = __sincostab.x[k + 1];  /*      sin(Xi) and cos(Xi)         */
   cs = __sincostab.x[k + 2];   /*                                  */
   ccs = __sincostab.x[k + 3];  /*                                  */
-  MUL2 (d2, dd2, s7.x, ss7.x, ds, dss, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, s7.x, ss7.x, ds, dss, c, cc);
   ADD2 (ds, dss, s5.x, ss5.x, ds, dss, r, s);
-  MUL2 (d2, dd2, ds, dss, ds, dss, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, ds, dss, ds, dss, c, cc);
   ADD2 (ds, dss, s3.x, ss3.x, ds, dss, r, s);
-  MUL2 (d2, dd2, ds, dss, ds, dss, p, hx, tx, hy, ty, q, c, cc);
-  MUL2 (d, dd, ds, dss, ds, dss, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, ds, dss, ds, dss, c, cc);
+  MUL2 (d, dd, ds, dss, ds, dss, c, cc);
   ADD2 (ds, dss, d, dd, ds, dss, r, s);
 
-  MUL2 (d2, dd2, c8.x, cc8.x, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, c8.x, cc8.x, dc, dcc, c, cc);
   ADD2 (dc, dcc, c6.x, cc6.x, dc, dcc, r, s);
-  MUL2 (d2, dd2, dc, dcc, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, dc, dcc, dc, dcc, c, cc);
   ADD2 (dc, dcc, c4.x, cc4.x, dc, dcc, r, s);
-  MUL2 (d2, dd2, dc, dcc, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, dc, dcc, dc, dcc, c, cc);
   ADD2 (dc, dcc, c2.x, cc2.x, dc, dcc, r, s);
-  MUL2 (d2, dd2, dc, dcc, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, dc, dcc, dc, dcc, c, cc);
 
-  MUL2 (cs, ccs, ds, dss, e, ee, p, hx, tx, hy, ty, q, c, cc);
-  MUL2 (dc, dcc, sn, ssn, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (cs, ccs, ds, dss, e, ee, c, cc);
+  MUL2 (dc, dcc, sn, ssn, dc, dcc, c, cc);
 
-  MUL2 (d2, dd2, s7.x, ss7.x, ds, dss, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, s7.x, ss7.x, ds, dss, c, cc);
   ADD2 (ds, dss, s5.x, ss5.x, ds, dss, r, s);
-  MUL2 (d2, dd2, ds, dss, ds, dss, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, ds, dss, ds, dss, c, cc);
   ADD2 (ds, dss, s3.x, ss3.x, ds, dss, r, s);
-  MUL2 (d2, dd2, ds, dss, ds, dss, p, hx, tx, hy, ty, q, c, cc);
-  MUL2 (d, dd, ds, dss, ds, dss, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, ds, dss, ds, dss, c, cc);
+  MUL2 (d, dd, ds, dss, ds, dss, c, cc);
   ADD2 (ds, dss, d, dd, ds, dss, r, s);
-  MUL2 (d2, dd2, c8.x, cc8.x, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, c8.x, cc8.x, dc, dcc, c, cc);
   ADD2 (dc, dcc, c6.x, cc6.x, dc, dcc, r, s);
-  MUL2 (d2, dd2, dc, dcc, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, dc, dcc, dc, dcc, c, cc);
   ADD2 (dc, dcc, c4.x, cc4.x, dc, dcc, r, s);
-  MUL2 (d2, dd2, dc, dcc, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, dc, dcc, dc, dcc, c, cc);
   ADD2 (dc, dcc, c2.x, cc2.x, dc, dcc, r, s);
-  MUL2 (d2, dd2, dc, dcc, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
-  MUL2 (sn, ssn, ds, dss, e, ee, p, hx, tx, hy, ty, q, c, cc);
-  MUL2 (dc, dcc, cs, ccs, dc, dcc, p, hx, tx, hy, ty, q, c, cc);
+  MUL2 (d2, dd2, dc, dcc, dc, dcc, c, cc);
+  MUL2 (sn, ssn, ds, dss, e, ee, c, cc);
+  MUL2 (dc, dcc, cs, ccs, dc, dcc, c, cc);
   ADD2 (e, ee, dc, dcc, e, ee, r, s);
   SUB2 (cs, ccs, e, ee, e, ee, r, s);
 
diff --git a/sysdeps/ieee754/dbl-64/e_atan2.c b/sysdeps/ieee754/dbl-64/e_atan2.c
index 099a76ea5682..0e4c1243ab2c 100644
--- a/sysdeps/ieee754/dbl-64/e_atan2.c
+++ b/sysdeps/ieee754/dbl-64/e_atan2.c
@@ -76,11 +76,8 @@ __ieee754_atan2 (double y, double x)
 {
   int i, de, ux, dx, uy, dy;
   static const int pr[MM] = { 6, 8, 10, 20, 32 };
-  double ax, ay, u, du, u9, ua, v, vv, dv, t1, t2, t3, t7, t8,
+  double ax, ay, u, du, u9, ua, v, vv, dv, t1, t2, t3,
 	 z, zz, cor, s1, ss1, s2, ss2;
-#ifndef DLA_FMS
-  double t4, t5, t6;
-#endif
   number num;
 
   static const int ep = 59768832,      /*  57*16**5   */
@@ -245,13 +242,13 @@ __ieee754_atan2 (double y, double x)
   if (ay < ax)
     {
       u = ay / ax;
-      EMULV (ax, u, v, vv, t1, t2, t3, t4, t5);
+      EMULV (ax, u, v, vv);
       du = ((ay - v) - vv) / ax;
     }
   else
     {
       u = ax / ay;
-      EMULV (ay, u, v, vv, t1, t2, t3, t4, t5);
+      EMULV (ay, u, v, vv);
       du = ((ax - v) - vv) / ay;
     }
 
@@ -274,18 +271,18 @@ __ieee754_atan2 (double y, double x)
 	      if ((z = u + (zz - u1.d * u)) == u + (zz + u1.d * u))
 		return signArctan2 (y, z);
 
-	      MUL2 (u, du, u, du, v, vv, t1, t2, t3, t4, t5, t6, t7, t8);
+	      MUL2 (u, du, u, du, v, vv, t1, t2);
 	      s1 = v * (f11.d + v * (f13.d
 				     + v * (f15.d + v * (f17.d + v * f19.d))));
 	      ADD2 (f9.d, ff9.d, s1, 0, s2, ss2, t1, t2);
-	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	      ADD2 (f7.d, ff7.d, s1, ss1, s2, ss2, t1, t2);
-	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	      ADD2 (f5.d, ff5.d, s1, ss1, s2, ss2, t1, t2);
-	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	      ADD2 (f3.d, ff3.d, s1, ss1, s2, ss2, t1, t2);
-	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
-	      MUL2 (u, du, s1, ss1, s2, ss2, t1, t2, t3, t4, t5, t6, t7, t8);
+	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
+	      MUL2 (u, du, s1, ss1, s2, ss2, t1, t2);
 	      ADD2 (u, du, s2, ss2, s1, ss1, t1, t2);
 
 	      if ((z = s1 + (ss1 - u5.d * s1)) == s1 + (ss1 + u5.d * s1))
@@ -330,13 +327,13 @@ __ieee754_atan2 (double y, double x)
 				  + v * (hij[i][14].d
 					 + v * hij[i][15].d))));
 	  ADD2 (hij[i][9].d, hij[i][10].d, s1, 0, s2, ss2, t1, t2);
-	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hij[i][7].d, hij[i][8].d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hij[i][5].d, hij[i][6].d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hij[i][3].d, hij[i][4].d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hij[i][1].d, hij[i][2].d, s1, ss1, s2, ss2, t1, t2);
 
 	  if ((z = s2 + (ss2 - ub.d * s2)) == s2 + (ss2 + ub.d * s2))
@@ -359,19 +356,19 @@ __ieee754_atan2 (double y, double x)
 	  if ((z = t2 + (t3 - u2.d)) == t2 + (t3 + u2.d))
 	    return signArctan2 (y, z);
 
-	  MUL2 (u, du, u, du, v, vv, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (u, du, u, du, v, vv, t1, t2);
 	  s1 = v * (f11.d
 		    + v * (f13.d
 			   + v * (f15.d + v * (f17.d + v * f19.d))));
 	  ADD2 (f9.d, ff9.d, s1, 0, s2, ss2, t1, t2);
-	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (f7.d, ff7.d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (f5.d, ff5.d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (f3.d, ff3.d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
-	  MUL2 (u, du, s1, ss1, s2, ss2, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
+	  MUL2 (u, du, s1, ss1, s2, ss2, t1, t2);
 	  ADD2 (u, du, s2, ss2, s1, ss1, t1, t2);
 	  SUB2 (hpi.d, hpi1.d, s1, ss1, s2, ss2, t1, t2);
 
@@ -407,13 +404,13 @@ __ieee754_atan2 (double y, double x)
 				     + v * hij[i][15].d))));
 
       ADD2 (hij[i][9].d, hij[i][10].d, s1, 0, s2, ss2, t1, t2);
-      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
       ADD2 (hij[i][7].d, hij[i][8].d, s1, ss1, s2, ss2, t1, t2);
-      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
       ADD2 (hij[i][5].d, hij[i][6].d, s1, ss1, s2, ss2, t1, t2);
-      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
       ADD2 (hij[i][3].d, hij[i][4].d, s1, ss1, s2, ss2, t1, t2);
-      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
       ADD2 (hij[i][1].d, hij[i][2].d, s1, ss1, s2, ss2, t1, t2);
       SUB2 (hpi.d, hpi1.d, s2, ss2, s1, ss1, t1, t2);
 
@@ -438,18 +435,18 @@ __ieee754_atan2 (double y, double x)
 	  if ((z = t2 + (t3 - u3.d)) == t2 + (t3 + u3.d))
 	    return signArctan2 (y, z);
 
-	  MUL2 (u, du, u, du, v, vv, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (u, du, u, du, v, vv, t1, t2);
 	  s1 = v * (f11.d
 		    + v * (f13.d + v * (f15.d + v * (f17.d + v * f19.d))));
 	  ADD2 (f9.d, ff9.d, s1, 0, s2, ss2, t1, t2);
-	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (f7.d, ff7.d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (f5.d, ff5.d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (f3.d, ff3.d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
-	  MUL2 (u, du, s1, ss1, s2, ss2, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
+	  MUL2 (u, du, s1, ss1, s2, ss2, t1, t2);
 	  ADD2 (u, du, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hpi.d, hpi1.d, s1, ss1, s2, ss2, t1, t2);
 
@@ -482,13 +479,13 @@ __ieee754_atan2 (double y, double x)
 			      + v * (hij[i][14].d
 				     + v * hij[i][15].d))));
       ADD2 (hij[i][9].d, hij[i][10].d, s1, 0, s2, ss2, t1, t2);
-      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
       ADD2 (hij[i][7].d, hij[i][8].d, s1, ss1, s2, ss2, t1, t2);
-      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
       ADD2 (hij[i][5].d, hij[i][6].d, s1, ss1, s2, ss2, t1, t2);
-      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
       ADD2 (hij[i][3].d, hij[i][4].d, s1, ss1, s2, ss2, t1, t2);
-      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
       ADD2 (hij[i][1].d, hij[i][2].d, s1, ss1, s2, ss2, t1, t2);
       ADD2 (hpi.d, hpi1.d, s2, ss2, s1, ss1, t1, t2);
 
@@ -510,17 +507,17 @@ __ieee754_atan2 (double y, double x)
       if ((z = t2 + (t3 - u4.d)) == t2 + (t3 + u4.d))
 	return signArctan2 (y, z);
 
-      MUL2 (u, du, u, du, v, vv, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (u, du, u, du, v, vv, t1, t2);
       s1 = v * (f11.d + v * (f13.d + v * (f15.d + v * (f17.d + v * f19.d))));
       ADD2 (f9.d, ff9.d, s1, 0, s2, ss2, t1, t2);
-      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
       ADD2 (f7.d, ff7.d, s1, ss1, s2, ss2, t1, t2);
-      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
       ADD2 (f5.d, ff5.d, s1, ss1, s2, ss2, t1, t2);
-      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
       ADD2 (f3.d, ff3.d, s1, ss1, s2, ss2, t1, t2);
-      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
-      MUL2 (u, du, s1, ss1, s2, ss2, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
+      MUL2 (u, du, s1, ss1, s2, ss2, t1, t2);
       ADD2 (u, du, s2, ss2, s1, ss1, t1, t2);
       SUB2 (opi.d, opi1.d, s1, ss1, s2, ss2, t1, t2);
 
@@ -554,13 +551,13 @@ __ieee754_atan2 (double y, double x)
 			  + v * (hij[i][14].d + v * hij[i][15].d))));
 
   ADD2 (hij[i][9].d, hij[i][10].d, s1, 0, s2, ss2, t1, t2);
-  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
   ADD2 (hij[i][7].d, hij[i][8].d, s1, ss1, s2, ss2, t1, t2);
-  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
   ADD2 (hij[i][5].d, hij[i][6].d, s1, ss1, s2, ss2, t1, t2);
-  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
   ADD2 (hij[i][3].d, hij[i][4].d, s1, ss1, s2, ss2, t1, t2);
-  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+  MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
   ADD2 (hij[i][1].d, hij[i][2].d, s1, ss1, s2, ss2, t1, t2);
   SUB2 (opi.d, opi1.d, s2, ss2, s1, ss1, t1, t2);
 
diff --git a/sysdeps/ieee754/dbl-64/e_sqrt.c b/sysdeps/ieee754/dbl-64/e_sqrt.c
index 20c72d58482c..1a6b2bc88ca1 100644
--- a/sysdeps/ieee754/dbl-64/e_sqrt.c
+++ b/sysdeps/ieee754/dbl-64/e_sqrt.c
@@ -55,7 +55,7 @@ __ieee754_sqrt (double x)
     rt2 = 3.75017500867345182581453026130850E-01,
     rt3 = 3.12523626554518656309172508769531E-01;
   static const double big = 134217728.0;
-  double y, t, del, res, res1, hy, z, zz, p, hx, tx, ty, s;
+  double y, t, del, res, res1, hy, z, zz, s;
   mynumber a, c = { { 0, 0 } };
   int4 k;
 
@@ -83,7 +83,7 @@ __ieee754_sqrt (double x)
       else
 	{
 	  res1 = res + 1.5 * ((y - res) + del);
-	  EMULV (res, res1, z, zz, p, hx, tx, hy, ty); /* (z+zz)=res*res1 */
+	  EMULV (res, res1, z, zz); /* (z+zz)=res*res1 */
 	  res = ((((z - s) + zz) < 0) ? max (res, res1) :
 					min (res, res1));
 	  ret = res * c.x;
diff --git a/sysdeps/ieee754/dbl-64/s_atan.c b/sysdeps/ieee754/dbl-64/s_atan.c
index da6a1cb0e59b..d211bf458f28 100644
--- a/sysdeps/ieee754/dbl-64/s_atan.c
+++ b/sysdeps/ieee754/dbl-64/s_atan.c
@@ -65,11 +65,8 @@ __signArctan (double x, double y)
 double
 __atan (double x)
 {
-  double cor, s1, ss1, s2, ss2, t1, t2, t3, t7, t8, t9, t10, u, u2, u3,
+  double cor, s1, ss1, s2, ss2, t1, t2, t3, t4, u, u2, u3,
 	 v, vv, w, ww, y, yy, z, zz;
-#ifndef DLA_FMS
-  double t4, t5, t6;
-#endif
   int i, ux, dx;
   static const int pr[M] = { 6, 8, 10, 32 };
   number num;
@@ -108,7 +105,7 @@ __atan (double x)
 	      if ((y = x + (yy - U1 * x)) == x + (yy + U1 * x))
 		return y;
 
-	      EMULV (x, x, v, vv, t1, t2, t3, t4, t5);	/* v+vv=x^2 */
+	      EMULV (x, x, v, vv);	/* v+vv=x^2 */
 
 	      s1 = f17.d + v * f19.d;
 	      s1 = f15.d + v * s1;
@@ -117,15 +114,14 @@ __atan (double x)
 	      s1 *= v;
 
 	      ADD2 (f9.d, ff9.d, s1, 0, s2, ss2, t1, t2);
-	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	      ADD2 (f7.d, ff7.d, s1, ss1, s2, ss2, t1, t2);
-	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	      ADD2 (f5.d, ff5.d, s1, ss1, s2, ss2, t1, t2);
-	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	      ADD2 (f3.d, ff3.d, s1, ss1, s2, ss2, t1, t2);
-	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
-	      MUL2 (x, 0, s1, ss1, s2, ss2, t1, t2, t3, t4, t5, t6, t7,
-		    t8);
+	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
+	      MUL2 (x, 0, s1, ss1, s2, ss2, t1, t2);
 	      ADD2 (x, 0, s2, ss2, s1, ss1, t1, t2);
 	      if ((y = s1 + (ss1 - U5 * s1)) == s1 + (ss1 + U5 * s1))
 		return y;
@@ -171,13 +167,13 @@ __atan (double x)
 	  s1 *= z;
 
 	  ADD2 (hij[i][9].d, hij[i][10].d, s1, 0, s2, ss2, t1, t2);
-	  MUL2 (z, 0, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (z, 0, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hij[i][7].d, hij[i][8].d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (z, 0, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (z, 0, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hij[i][5].d, hij[i][6].d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (z, 0, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (z, 0, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hij[i][3].d, hij[i][4].d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (z, 0, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (z, 0, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hij[i][1].d, hij[i][2].d, s1, ss1, s2, ss2, t1, t2);
 	  if ((y = s2 + (ss2 - U6 * s2)) == s2 + (ss2 + U6 * s2))
 	    return __signArctan (x, y);
@@ -190,7 +186,7 @@ __atan (double x)
       if (u < D)
 	{			/* C <= u < D */
 	  w = 1 / u;
-	  EMULV (w, u, t1, t2, t3, t4, t5, t6, t7);
+	  EMULV (w, u, t1, t2);
 	  ww = w * ((1 - t1) - t2);
 	  i = (TWO52 + TWO8 * w) - TWO52;
 	  i -= 16;
@@ -210,8 +206,7 @@ __atan (double x)
 	  if ((y = t1 + (yy - u3)) == t1 + (yy + u3))
 	    return __signArctan (x, y);
 
-	  DIV2 (1, 0, u, 0, w, ww, t1, t2, t3, t4, t5, t6, t7, t8, t9,
-		t10);
+	  DIV2 (1, 0, u, 0, w, ww, t1, t2, t3, t4);
 	  t1 = w - hij[i][0].d;
 	  EADD (t1, ww, z, zz);
 
@@ -222,13 +217,13 @@ __atan (double x)
 	  s1 *= z;
 
 	  ADD2 (hij[i][9].d, hij[i][10].d, s1, 0, s2, ss2, t1, t2);
-	  MUL2 (z, zz, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (z, zz, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hij[i][7].d, hij[i][8].d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (z, zz, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (z, zz, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hij[i][5].d, hij[i][6].d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (z, zz, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (z, zz, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hij[i][3].d, hij[i][4].d, s1, ss1, s2, ss2, t1, t2);
-	  MUL2 (z, zz, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (z, zz, s2, ss2, s1, ss1, t1, t2);
 	  ADD2 (hij[i][1].d, hij[i][2].d, s1, ss1, s2, ss2, t1, t2);
 	  SUB2 (HPI, HPI1, s2, ss2, s1, ss1, t1, t2);
 	  if ((y = s1 + (ss1 - U7)) == s1 + (ss1 + U7))
@@ -242,7 +237,7 @@ __atan (double x)
 	    {                   /* D <= u < E */
 	      w = 1 / u;
 	      v = w * w;
-	      EMULV (w, u, t1, t2, t3, t4, t5, t6, t7);
+	      EMULV (w, u, t1, t2);
 
 	      yy = d11.d + v * d13.d;
 	      yy = d9.d + v * yy;
@@ -257,9 +252,8 @@ __atan (double x)
 	      if ((y = t3 + (yy - U4)) == t3 + (yy + U4))
 		return __signArctan (x, y);
 
-	      DIV2 (1, 0, u, 0, w, ww, t1, t2, t3, t4, t5, t6, t7, t8,
-		    t9, t10);
-	      MUL2 (w, ww, w, ww, v, vv, t1, t2, t3, t4, t5, t6, t7, t8);
+	      DIV2 (1, 0, u, 0, w, ww, t1, t2, t3, t4);
+	      MUL2 (w, ww, w, ww, v, vv, t1, t2);
 
 	      s1 = f17.d + v * f19.d;
 	      s1 = f15.d + v * s1;
@@ -268,14 +262,14 @@ __atan (double x)
 	      s1 *= v;
 
 	      ADD2 (f9.d, ff9.d, s1, 0, s2, ss2, t1, t2);
-	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	      ADD2 (f7.d, ff7.d, s1, ss1, s2, ss2, t1, t2);
-	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	      ADD2 (f5.d, ff5.d, s1, ss1, s2, ss2, t1, t2);
-	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
+	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
 	      ADD2 (f3.d, ff3.d, s1, ss1, s2, ss2, t1, t2);
-	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2, t3, t4, t5, t6, t7, t8);
-	      MUL2 (w, ww, s1, ss1, s2, ss2, t1, t2, t3, t4, t5, t6, t7, t8);
+	      MUL2 (v, vv, s2, ss2, s1, ss1, t1, t2);
+	      MUL2 (w, ww, s1, ss1, s2, ss2, t1, t2);
 	      ADD2 (w, ww, s2, ss2, s1, ss1, t1, t2);
 	      SUB2 (HPI, HPI1, s1, ss1, s2, ss2, t1, t2);
 
diff --git a/sysdeps/ieee754/dbl-64/s_tan.c b/sysdeps/ieee754/dbl-64/s_tan.c
index 1103ed2896dc..dc6c3f4f74ba 100644
--- a/sysdeps/ieee754/dbl-64/s_tan.c
+++ b/sysdeps/ieee754/dbl-64/s_tan.c
@@ -1,4 +1,6 @@
 /*
+      EMULV (z, z, z2, zz2);
+      EMULV (x, x, x2, xx2);
  * IBM Accurate Mathematical Library
  * written by International Business Machines Corp.
  * Copyright (C) 2001-2019 Free Software Foundation, Inc.
@@ -63,11 +65,8 @@ __tan (double x)
 
   int ux, i, n;
   double a, da, a2, b, db, c, dc, c1, cc1, c2, cc2, c3, cc3, fi, ffi, gi, pz,
-	 s, sy, t, t1, t2, t3, t4, t7, t8, t9, t10, w, x2, xn, xx2, y, ya,
+	 s, sy, t, t1, t2, t3, t4, w, x2, xn, xx2, y, ya,
          yya, z0, z, zz, z2, zz2;
-#ifndef DLA_FMS
-  double t5, t6;
-#endif
   int p;
   number num, v;
   mp_no mpa, mpt1, mpt2;
@@ -127,20 +126,20 @@ __tan (double x)
       c1 = a15.d + x2 * c1;
       c1 *= x2;
 
-      EMULV (x, x, x2, xx2, t1, t2, t3, t4, t5);
+      EMULV (x, x, x2, xx2);
       ADD2 (a13.d, aa13.d, c1, 0.0, c2, cc2, t1, t2);
-      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a11.d, aa11.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a9.d, aa9.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a7.d, aa7.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a5.d, aa5.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a3.d, aa3.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
-      MUL2 (x, 0.0, c1, cc1, c2, cc2, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
+      MUL2 (x, 0.0, c1, cc1, c2, cc2, t1, t2);
       ADD2 (x, 0.0, c2, cc2, c1, cc1, t1, t2);
       if ((y = c1 + (cc1 - u2.d * c1)) == c1 + (cc1 + u2.d * c1))
 	{
@@ -179,19 +178,18 @@ __tan (double x)
       /* Second stage */
       ffi = xfg[i][3].d;
       c1 = z2 * (a7.d + z2 * (a9.d + z2 * a11.d));
-      EMULV (z, z, z2, zz2, t1, t2, t3, t4, t5);
+      EMULV (z, z, z2, zz2);
       ADD2 (a5.d, aa5.d, c1, 0.0, c2, cc2, t1, t2);
-      MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a3.d, aa3.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
-      MUL2 (z, 0.0, c1, cc1, c2, cc2, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2);
+      MUL2 (z, 0.0, c1, cc1, c2, cc2, t1, t2);
       ADD2 (z, 0.0, c2, cc2, c1, cc1, t1, t2);
 
       ADD2 (fi, ffi, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (fi, ffi, c1, cc1, c3, cc3, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (fi, ffi, c1, cc1, c3, cc3, t1, t2);
       SUB2 (1.0, 0.0, c3, cc3, c1, cc1, t1, t2);
-      DIV2 (c2, cc2, c1, cc1, c3, cc3, t1, t2, t3, t4, t5, t6, t7, t8, t9,
-	    t10);
+      DIV2 (c2, cc2, c1, cc1, c3, cc3, t1, t2, t3, t4);
 
       if ((y = c3 + (cc3 - u4.d * c3)) == c3 + (cc3 + u4.d * c3))
 	{
@@ -248,8 +246,7 @@ __tan (double x)
 	    {
 	      /* First stage -cot */
 	      EADD (a, t2, b, db);
-	      DIV2 (1.0, 0.0, b, db, c, dc, t1, t2, t3, t4, t5, t6, t7, t8,
-		    t9, t10);
+	      DIV2 (1.0, 0.0, b, db, c, dc, t1, t2, t3, t4);
 	      if ((y = c + (dc - u6.d * c)) == c + (dc + u6.d * c))
 		{
 		  retval = (-y);
@@ -283,7 +280,7 @@ __tan (double x)
 	  EADD (a, da, t1, t2);
 	  a = t1;
 	  da = t2;
-	  MUL2 (a, da, a, da, x2, xx2, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (a, da, a, da, x2, xx2, t1, t2);
 
 	  c1 = a25.d + x2 * a27.d;
 	  c1 = a23.d + x2 * c1;
@@ -294,25 +291,24 @@ __tan (double x)
 	  c1 *= x2;
 
 	  ADD2 (a13.d, aa13.d, c1, 0.0, c2, cc2, t1, t2);
-	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
 	  ADD2 (a11.d, aa11.d, c1, cc1, c2, cc2, t1, t2);
-	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
 	  ADD2 (a9.d, aa9.d, c1, cc1, c2, cc2, t1, t2);
-	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
 	  ADD2 (a7.d, aa7.d, c1, cc1, c2, cc2, t1, t2);
-	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
 	  ADD2 (a5.d, aa5.d, c1, cc1, c2, cc2, t1, t2);
-	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
 	  ADD2 (a3.d, aa3.d, c1, cc1, c2, cc2, t1, t2);
-	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
-	  MUL2 (a, da, c1, cc1, c2, cc2, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
+	  MUL2 (a, da, c1, cc1, c2, cc2, t1, t2);
 	  ADD2 (a, da, c2, cc2, c1, cc1, t1, t2);
 
 	  if (n)
 	    {
 	      /* Second stage -cot */
-	      DIV2 (1.0, 0.0, c1, cc1, c2, cc2, t1, t2, t3, t4, t5, t6, t7,
-		    t8, t9, t10);
+	      DIV2 (1.0, 0.0, c1, cc1, c2, cc2, t1, t2, t3, t4);
 	      if ((y = c2 + (cc2 - u8.d * c2)) == c2 + (cc2 + u8.d * c2))
 		{
 		  retval = (-y);
@@ -380,24 +376,23 @@ __tan (double x)
       /* Second stage */
       ffi = xfg[i][3].d;
       EADD (z0, yya, z, zz)
-      MUL2 (z, zz, z, zz, z2, zz2, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (z, zz, z, zz, z2, zz2, t1, t2);
       c1 = z2 * (a7.d + z2 * (a9.d + z2 * a11.d));
       ADD2 (a5.d, aa5.d, c1, 0.0, c2, cc2, t1, t2);
-      MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a3.d, aa3.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
-      MUL2 (z, zz, c1, cc1, c2, cc2, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2);
+      MUL2 (z, zz, c1, cc1, c2, cc2, t1, t2);
       ADD2 (z, zz, c2, cc2, c1, cc1, t1, t2);
 
       ADD2 (fi, ffi, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (fi, ffi, c1, cc1, c3, cc3, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (fi, ffi, c1, cc1, c3, cc3, t1, t2);
       SUB2 (1.0, 0.0, c3, cc3, c1, cc1, t1, t2);
 
       if (n)
 	{
 	  /* -cot */
-	  DIV2 (c1, cc1, c2, cc2, c3, cc3, t1, t2, t3, t4, t5, t6, t7, t8, t9,
-		t10);
+	  DIV2 (c1, cc1, c2, cc2, c3, cc3, t1, t2, t3, t4);
 	  if ((y = c3 + (cc3 - u12.d * c3)) == c3 + (cc3 + u12.d * c3))
 	    {
 	      retval = (-sy * y);
@@ -407,8 +402,7 @@ __tan (double x)
       else
 	{
 	  /* tan */
-	  DIV2 (c2, cc2, c1, cc1, c3, cc3, t1, t2, t3, t4, t5, t6, t7, t8, t9,
-		t10);
+	  DIV2 (c2, cc2, c1, cc1, c3, cc3, t1, t2, t3, t4);
 	  if ((y = c3 + (cc3 - u11.d * c3)) == c3 + (cc3 + u11.d * c3))
 	    {
 	      retval = (sy * y);
@@ -472,8 +466,7 @@ __tan (double x)
 	    {
 	      /* First stage -cot */
 	      EADD (a, t2, b, db);
-	      DIV2 (1.0, 0.0, b, db, c, dc, t1, t2, t3, t4, t5, t6, t7, t8,
-		    t9, t10);
+	      DIV2 (1.0, 0.0, b, db, c, dc, t1, t2, t3, t4);
 	      if ((y = c + (dc - u14.d * c)) == c + (dc + u14.d * c))
 		{
 		  retval = (-y);
@@ -491,7 +484,7 @@ __tan (double x)
 	    }
 
 	  /* Second stage */
-	  MUL2 (a, da, a, da, x2, xx2, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (a, da, a, da, x2, xx2, t1, t2);
 	  c1 = a25.d + x2 * a27.d;
 	  c1 = a23.d + x2 * c1;
 	  c1 = a21.d + x2 * c1;
@@ -501,25 +494,24 @@ __tan (double x)
 	  c1 *= x2;
 
 	  ADD2 (a13.d, aa13.d, c1, 0.0, c2, cc2, t1, t2);
-	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
 	  ADD2 (a11.d, aa11.d, c1, cc1, c2, cc2, t1, t2);
-	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
 	  ADD2 (a9.d, aa9.d, c1, cc1, c2, cc2, t1, t2);
-	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
 	  ADD2 (a7.d, aa7.d, c1, cc1, c2, cc2, t1, t2);
-	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
 	  ADD2 (a5.d, aa5.d, c1, cc1, c2, cc2, t1, t2);
-	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
 	  ADD2 (a3.d, aa3.d, c1, cc1, c2, cc2, t1, t2);
-	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
-	  MUL2 (a, da, c1, cc1, c2, cc2, t1, t2, t3, t4, t5, t6, t7, t8);
+	  MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
+	  MUL2 (a, da, c1, cc1, c2, cc2, t1, t2);
 	  ADD2 (a, da, c2, cc2, c1, cc1, t1, t2);
 
 	  if (n)
 	    {
 	      /* Second stage -cot */
-	      DIV2 (1.0, 0.0, c1, cc1, c2, cc2, t1, t2, t3, t4, t5, t6, t7,
-		    t8, t9, t10);
+	      DIV2 (1.0, 0.0, c1, cc1, c2, cc2, t1, t2, t3, t4);
 	      if ((y = c2 + (cc2 - u16.d * c2)) == c2 + (cc2 + u16.d * c2))
 		{
 		  retval = (-y);
@@ -586,24 +578,23 @@ __tan (double x)
       /* Second stage */
       ffi = xfg[i][3].d;
       EADD (z0, yya, z, zz);
-      MUL2 (z, zz, z, zz, z2, zz2, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (z, zz, z, zz, z2, zz2, t1, t2);
       c1 = z2 * (a7.d + z2 * (a9.d + z2 * a11.d));
       ADD2 (a5.d, aa5.d, c1, 0.0, c2, cc2, t1, t2);
-      MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a3.d, aa3.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
-      MUL2 (z, zz, c1, cc1, c2, cc2, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2);
+      MUL2 (z, zz, c1, cc1, c2, cc2, t1, t2);
       ADD2 (z, zz, c2, cc2, c1, cc1, t1, t2);
 
       ADD2 (fi, ffi, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (fi, ffi, c1, cc1, c3, cc3, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (fi, ffi, c1, cc1, c3, cc3, t1, t2);
       SUB2 (1.0, 0.0, c3, cc3, c1, cc1, t1, t2);
 
       if (n)
 	{
 	  /* -cot */
-	  DIV2 (c1, cc1, c2, cc2, c3, cc3, t1, t2, t3, t4, t5, t6, t7, t8, t9,
-		t10);
+	  DIV2 (c1, cc1, c2, cc2, c3, cc3, t1, t2, t3, t4);
 	  if ((y = c3 + (cc3 - u20.d * c3)) == c3 + (cc3 + u20.d * c3))
 	    {
 	      retval = (-sy * y);
@@ -613,8 +604,7 @@ __tan (double x)
       else
 	{
 	  /* tan */
-	  DIV2 (c2, cc2, c1, cc1, c3, cc3, t1, t2, t3, t4, t5, t6, t7, t8, t9,
-		t10);
+	  DIV2 (c2, cc2, c1, cc1, c3, cc3, t1, t2, t3, t4);
 	  if ((y = c3 + (cc3 - u19.d * c3)) == c3 + (cc3 + u19.d * c3))
 	    {
 	      retval = (sy * y);
@@ -664,8 +654,7 @@ __tan (double x)
 	{
 	  /* First stage -cot */
 	  EADD (a, t2, b, db);
-	  DIV2 (1.0, 0.0, b, db, c, dc, t1, t2, t3, t4, t5, t6, t7, t8, t9,
-		t10);
+	  DIV2 (1.0, 0.0, b, db, c, dc, t1, t2, t3, t4);
 	  if ((y = c + (dc - u22.d * c)) == c + (dc + u22.d * c))
 	    {
 	      retval = (-y);
@@ -691,7 +680,7 @@ __tan (double x)
       __sub (&mpa, &mpt1, &mpt2, p);
       __mp_dbl (&mpt2, &da, p);
 
-      MUL2 (a, da, a, da, x2, xx2, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (a, da, a, da, x2, xx2, t1, t2);
 
       c1 = a25.d + x2 * a27.d;
       c1 = a23.d + x2 * c1;
@@ -702,25 +691,24 @@ __tan (double x)
       c1 *= x2;
 
       ADD2 (a13.d, aa13.d, c1, 0.0, c2, cc2, t1, t2);
-      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a11.d, aa11.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a9.d, aa9.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a7.d, aa7.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a5.d, aa5.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
       ADD2 (a3.d, aa3.d, c1, cc1, c2, cc2, t1, t2);
-      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
-      MUL2 (a, da, c1, cc1, c2, cc2, t1, t2, t3, t4, t5, t6, t7, t8);
+      MUL2 (x2, xx2, c2, cc2, c1, cc1, t1, t2);
+      MUL2 (a, da, c1, cc1, c2, cc2, t1, t2);
       ADD2 (a, da, c2, cc2, c1, cc1, t1, t2);
 
       if (n)
 	{
 	  /* Second stage -cot */
-	  DIV2 (1.0, 0.0, c1, cc1, c2, cc2, t1, t2, t3, t4, t5, t6, t7, t8,
-		t9, t10);
+	  DIV2 (1.0, 0.0, c1, cc1, c2, cc2, t1, t2, t3, t4);
 	  if ((y = c2 + (cc2 - u24.d * c2)) == c2 + (cc2 + u24.d * c2))
 	    {
 	      retval = (-y);
@@ -787,24 +775,23 @@ __tan (double x)
   /* Second stage */
   ffi = xfg[i][3].d;
   EADD (z0, yya, z, zz);
-  MUL2 (z, zz, z, zz, z2, zz2, t1, t2, t3, t4, t5, t6, t7, t8);
+  MUL2 (z, zz, z, zz, z2, zz2, t1, t2);
   c1 = z2 * (a7.d + z2 * (a9.d + z2 * a11.d));
   ADD2 (a5.d, aa5.d, c1, 0.0, c2, cc2, t1, t2);
-  MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
+  MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2);
   ADD2 (a3.d, aa3.d, c1, cc1, c2, cc2, t1, t2);
-  MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2, t3, t4, t5, t6, t7, t8);
-  MUL2 (z, zz, c1, cc1, c2, cc2, t1, t2, t3, t4, t5, t6, t7, t8);
+  MUL2 (z2, zz2, c2, cc2, c1, cc1, t1, t2);
+  MUL2 (z, zz, c1, cc1, c2, cc2, t1, t2);
   ADD2 (z, zz, c2, cc2, c1, cc1, t1, t2);
 
   ADD2 (fi, ffi, c1, cc1, c2, cc2, t1, t2);
-  MUL2 (fi, ffi, c1, cc1, c3, cc3, t1, t2, t3, t4, t5, t6, t7, t8);
+  MUL2 (fi, ffi, c1, cc1, c3, cc3, t1, t2);
   SUB2 (1.0, 0.0, c3, cc3, c1, cc1, t1, t2);
 
   if (n)
     {
       /* -cot */
-      DIV2 (c1, cc1, c2, cc2, c3, cc3, t1, t2, t3, t4, t5, t6, t7, t8, t9,
-	    t10);
+      DIV2 (c1, cc1, c2, cc2, c3, cc3, t1, t2, t3, t4);
       if ((y = c3 + (cc3 - u28.d * c3)) == c3 + (cc3 + u28.d * c3))
 	{
 	  retval = (-sy * y);
@@ -814,8 +801,7 @@ __tan (double x)
   else
     {
       /* tan */
-      DIV2 (c2, cc2, c1, cc1, c3, cc3, t1, t2, t3, t4, t5, t6, t7, t8, t9,
-	    t10);
+      DIV2 (c2, cc2, c1, cc1, c3, cc3, t1, t2, t3, t4);
       if ((y = c3 + (cc3 - u27.d * c3)) == c3 + (cc3 + u27.d * c3))
 	{
 	  retval = (sy * y);
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
