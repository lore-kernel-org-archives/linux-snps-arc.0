Return-Path: <SRS0=Ntev=CS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F63C433E2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 03:32:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 372BA20EDD
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 03:32:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/WW9N+u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Z7tsJS+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 372BA20EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ciklx1+PzFDpHd94xmQBDyhqR7iy7a8oqH0KzUBmnI8=; b=R/WW9N+uqe3zvc5+QDes8L7jRR
	qCqH9FZuzWzV699I4M23nctAlwDfOBXwarUrB+29u4tr9Gp4slicFRzgkxRLOpIOIkT3lfpRrSFfW
	D+BWplla2MBix2Fhk0Q98cTeu8SbDvGdnljOYSoxNWrKoXR7Oy48GGAxPdwHC0/UExlD0wsZ4r090
	PdKoTfeQalQN2NNxXWbENUAnS4j39WQiE2XqIkO26nQ4TUn0OrywKKZ+3Qa6fzemJco4htxYzQyYB
	mmF+Jj5UAM1rQRwwh6yt/o4sW61YpSeXoPJE8mptyWHcxXJYC49sqlyoxAj/Xaqubqbm2ewA1vUef
	Wuu0X7ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFqqQ-00040X-JK; Wed, 09 Sep 2020 03:32:26 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFqqO-000407-9S
 for linux-snps-arc@lists.infradead.org; Wed, 09 Sep 2020 03:32:25 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EE7B940194;
 Wed,  9 Sep 2020 03:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1599622343; bh=pY9pJjWL9a50maoWNrVjfTwURhusUfH/NsLeFHDVXdk=;
 h=From:To:Cc:Subject:Date:From;
 b=Z7tsJS+IMov6jvuWwTXjUXOYXKFTMNtjI8HAHI0mCuPevO8ZFY6eRk/bzEHQzhaoT
 47E6bUCzhuY0Gz4CWN9/lBaPJe7SQAPu0mq81m6obksieAYGF6kVEa2fZzXLG60eJ7
 Qe2hy8Vi8hXbQ2yPGDtEoh6kg4o+0cx98wA3VIkHTeWBOaGSENdjJ0ePR8uSGHgLOt
 zznavXn8T3WuodwAs3T2Q6OSwTDnIGimSYuCcQlG6vERT9Cg8NG539xXOz/0xa/9nM
 Kwm9gmE8oCeiUQ0kWcFJugngvYA+iPMJKUysGZkJ4T66MCa0O+iFQH5ivBAhy5Otcu
 L0hbBLCHPDa5A==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id ACBB9A0096;
 Wed,  9 Sep 2020 03:32:22 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH] support: user more portable atomic wrappers
Date: Tue,  8 Sep 2020 20:32:21 -0700
Message-Id: <20200909033221.3549140-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_233224_468672_90512270 
X-CRM114-Status: GOOD (  12.01  )
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

This came up in a nascent arc64 port, lacking gcc atomics for now
---
 support/support_record_failure.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/support/support_record_failure.c b/support/support_record_failure.c
index f766c0623683..65e576c6e901 100644
--- a/support/support_record_failure.c
+++ b/support/support_record_failure.c
@@ -25,6 +25,7 @@
 #include <stdlib.h>
 #include <sys/mman.h>
 #include <unistd.h>
+#include <atomic.h>
 
 /* This structure keeps track of test failures.  The counter is
    incremented on each failure.  The failed member is set to true if a
@@ -66,8 +67,8 @@ support_record_failure (void)
     }
   /* Relaxed MO is sufficient because we are only interested in the
      values themselves, in isolation.  */
-  __atomic_store_n (&state->failed, 1, __ATOMIC_RELEASE);
-  __atomic_add_fetch (&state->counter, 1, __ATOMIC_RELEASE);
+  atomic_store_release (&state->failed, 1);
+  atomic_fetch_add_release (&state->counter, 1);
 }
 
 int
@@ -84,10 +85,10 @@ support_report_failure (int status)
      assumes that exiting from the main thread happens before the
      error reporting via support_record_failure, which requires some
      form of external synchronization.  */
-  bool failed = __atomic_load_n (&state->failed, __ATOMIC_RELAXED);
+  bool failed = atomic_load_relaxed (&state->failed);
   if (failed)
     printf ("error: %u test failures\n",
-            __atomic_load_n (&state->counter, __ATOMIC_RELAXED));
+            atomic_load_relaxed (&state->counter));
 
   if ((status == 0 || status == EXIT_UNSUPPORTED) && failed)
     /* If we have a recorded failure, it overrides a non-failure
@@ -101,8 +102,8 @@ support_record_failure_reset (void)
 {
   /* Only used for testing the test framework, with external
      synchronization, but use release MO for consistency.  */
-  __atomic_store_n (&state->failed, 0, __ATOMIC_RELAXED);
-  __atomic_add_fetch (&state->counter, 0, __ATOMIC_RELAXED);
+  atomic_store_relaxed (&state->failed, 0);
+  atomic_fetch_add_release (&state->counter, 0);
 }
 
 int
@@ -110,5 +111,5 @@ support_record_failure_is_failed (void)
 {
   /* Relaxed MO is sufficient because we need (blocking) external
      synchronization for reliable test error reporting anyway.  */
-  return __atomic_load_n (&state->failed, __ATOMIC_RELAXED);
+  return atomic_load_relaxed (&state->failed);
 }
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
