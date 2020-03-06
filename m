Return-Path: <SRS0=e3HE=4X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EFEC10F26
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 18:24:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 679B120684
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 18:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eIop1TsV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fRDMzQ5V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 679B120684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yR4UsFzYcXRwUP6u6SvC+Tmh4Tk0BCo9ahbRQtdeXpM=; b=eIop1TsVh8z0O9
	WiJg5lrV3SQqD7MTS4owsnFInsEW31BzBElNOkRqW5MJz2NvE29qdi6Q/tuRVVtPUPhUWW8MQRHT+
	VyhufRDvHFQIV5ZfjqxlT+PMTeX9Dr1O+SZoHQ5y8KG7rnIsr9CgdYgJY+2oscU6UpVRWMB30WujH
	y9TsZvu6zs54leH+YVgZWfpQsSBfPvJBhySougHCqWcykK34SEpW/43N6j5vKU1QKQ2PnfD+YX+Rw
	yA89RN9Hh4zg9zE6ggWnHt6ciwKuuTEkCqC5jqldKNon9ggWnJ8wrSpqyEA1Q3+o/q+FBiVlvLFXj
	b4GcI9zCwrs52C8TqUaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAHeC-0001SC-Ew; Fri, 06 Mar 2020 18:24:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAHeA-0001Ox-3V
 for linux-snps-arc@lists.infradead.org; Fri, 06 Mar 2020 18:24:31 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 01EB7C00C7;
 Fri,  6 Mar 2020 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583519068; bh=Pb/epUPlJqEEBZOQ82k8aY5UgqWbgBxI3MOnpVBjbg8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fRDMzQ5Vhe/PZDFtXSiJtNFNItknnpeSwxMh1ccvdGCLtja0A1UnSM0C7PUdt/fvp
 ocZS5W5WpsnRm8vF0nmwQpzo8wY7aZKZQOq6Y6vmuc88bU9NS4XuzXs0M+n3ValB7S
 OYWw/ewx+9F6li4Dw+p7EmG81r5Sf2hr5T3fcIBVq+Lpb+8ahEWKDCCLEjbFmlY7Rj
 TuXWMcS6dcbj1pXXPnm7X5+7Nk1vhEvoOE/Lvtg7oQkOnKfngUGBGarqzwqz7JxaLp
 4CYv8r5CgWnE7ACy4divsE003f/QuAvcqayLyTlpz4vOgWs2ChfR3bFGO13IbqPWzw
 Glkw9CyiU8mJw==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.28])
 by mailhost.synopsys.com (Postfix) with ESMTP id 86DEFA006E;
 Fri,  6 Mar 2020 18:24:27 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v3 01/17] gcc PR 88409: miscompilation due to missing cc
 clobber in longlong.h macros
Date: Fri,  6 Mar 2020 10:24:03 -0800
Message-Id: <20200306182419.13945-2-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200306182419.13945-1-vgupta@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_102430_183828_B1390B0E 
X-CRM114-Status: UNSURE (   9.06  )
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
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

simple test such as below was failing.

| void main(int argc, char *argv[])
| {
|    size_t total_time = 115424;                       // expected 115.424
|    double secs = (double)total_time/(double)1000;
|    printf("%s %d %lf\n", "secs", total_time, secs);  // prints 113.504
|    printf("%d\n", (size_t)secs);
| }

The printf eventually called into glibc stdlib/divrem.c:__mpn_divrem()
which uses the __arc__ specific inline asm macros from longlong.h which
were causing miscompilation.

include/
2019-03-28  Vineet Gupta <vgupta@synopsys.com>

	PR 89877

	* longlong.h [__arc__] (add_ssaaaa): Add cc clobber
	(sub_ddmmss): Likewise.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 stdlib/longlong.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/stdlib/longlong.h b/stdlib/longlong.h
index ee4aac1bb5a0..638b7894d48c 100644
--- a/stdlib/longlong.h
+++ b/stdlib/longlong.h
@@ -199,7 +199,8 @@ extern UDItype __udiv_qrnnd (UDItype *, UDItype, UDItype, UDItype);
 	   : "%r" ((USItype) (ah)),					\
 	     "rICal" ((USItype) (bh)),					\
 	     "%r" ((USItype) (al)),					\
-	     "rICal" ((USItype) (bl)))
+	     "rICal" ((USItype) (bl))					\
+	   : "cc")
 #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
   __asm__ ("sub.f	%1, %4, %5\n\tsbc	%0, %2, %3"		\
 	   : "=r" ((USItype) (sh)),					\
@@ -207,7 +208,8 @@ extern UDItype __udiv_qrnnd (UDItype *, UDItype, UDItype, UDItype);
 	   : "r" ((USItype) (ah)),					\
 	     "rICal" ((USItype) (bh)),					\
 	     "r" ((USItype) (al)),					\
-	     "rICal" ((USItype) (bl)))
+	     "rICal" ((USItype) (bl))					\
+	   : "cc")
 
 #define __umulsidi3(u,v) ((UDItype)(USItype)u*(USItype)v)
 #ifdef __ARC_NORM__
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
