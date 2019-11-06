Return-Path: <SRS0=N0Bh=Y6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6D9C5DF62
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 10:38:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A5B20869
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 10:38:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iv9HHrOB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Jj7qlQV5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45A5B20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=16sxNxOSEmq06x6ypnTgplR4TFopJykckNLSLnM3IGo=; b=Iv9
	HHrOBYRs0VAbuac/gwkyb5uaZWnU/In7cL82IekGlhwkxyPQSRelEjgfLbNjfENX338BMtF1mWBPK
	anuZGoCtJRMBKQALRUlFbhGQneGSQIvUiIt5DwPpfXBNowAWsk5kwmH0Fyi3DNotqXaIJChA9wiFp
	yYo2k1LEMTIY1m82K++G6nXCpG4IJM/SdWkewkaRAax6xUvzVAl6yijVrxZ3PFUii/vjXEk0BJc0P
	Q3rppbMuzFluC01MCKhIK8foV8Z9wqzwpxFTmQ6agpYlY7kdVtC1IsHqgB1D76IAfnpyimwgunOAu
	unZx7ML4AAjuk96Hgl/U4cfBX1qfs4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSIhn-0007pt-3M; Wed, 06 Nov 2019 10:38:27 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSIhk-0007fn-1k
 for linux-snps-arc@lists.infradead.org; Wed, 06 Nov 2019 10:38:25 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 43AEEC0F34;
 Wed,  6 Nov 2019 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573036701; bh=dr9R5HUDFEcK0T0CTPq86iG4DKgDDwdb9YPkFD1McnY=;
 h=From:To:Cc:Subject:Date:From;
 b=Jj7qlQV59SxIx1Mw6wUOiOMjQOs+nlGCk78Nl+nb7kMYrpdXqXuDAcYbhpwFG3KnK
 kCQ8B9lGUzFLI5dqiiitwefAxTkzxLoMkuyM9QzYpGputB22aoMs+ozqrx/Lsu/imv
 SB+ZhRIDzVBz1InkC2joMiCkRHeSWxBTJpcektfo9xJDcJZIBEUF7PemZXlh1JXGk/
 xOQudpppQsk26J3JZaf94qyl94cDs2tvAc1X2XEu/BJ3lpS8nL44P3/s1bZQDF4exc
 hvB+hwOBFuQJTDyMowmCeQZgzRYXNN2q6OvEk7wPZ0NaRTSFD7OZ4J9N0ifmIxg6G4
 OW56acWcn54ug==
Received: from didin-7490l.internal.synopsys.com
 (didin-7490l.internal.synopsys.com [10.121.3.58])
 by mailhost.synopsys.com (Postfix) with ESMTP id 38049A0071;
 Wed,  6 Nov 2019 10:38:09 +0000 (UTC)
From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
To: gdb-patches@sourceware.org
Subject: [PATCH] gdb/remote: Remove negative tid/pid handling in wite_ptid
Date: Wed,  6 Nov 2019 13:37:56 +0300
Message-Id: <20191106103756.1066-1-didin@synopsys.com>
X-Mailer: git-send-email 2.17.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_023824_106883_EE6FF782 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Actually thread and process ID's are positive values. Accorting to
http://man7.org/linux/man-pages/man7/pthreads.7.html
threads are creating using "clone" syscall, so the ID generation mechanism
is similar for threads and processes. According to Linux source code
there is a function call tree, which allocates  PID[TID]:
clone
 |->_do_fork
    |->copy_process
      |->alloc_pid
        |->idr_alloc_cyclic
          |->idr_alloc_u32(idr, ptr, &id, max, gfp);
And in idr_alloc_u32() "id" is u32 value, which means positiveness.
Also according to:
https://elixir.bootlin.com/linux/latest/source/kernel/pid.c#L177
PID cannot be less than 1.

In Zephyr RTOS the k_thread_create function returns
thread ID which is actually pointer to k_thread structure.
If the memory addressing starts from 0x80000000, passing such
big values to write_ptid() leads to overflow of "int tid" variable
and thread ID becomes negative.
So lets remove the code, which handles negative tid/pid values.

gdb/ChangeLog:

2019-11-06  Evgeniy Didin <didin@synopsys.com>

        * remote.c (remote_target::write_ptid):  Remove handling
         negative tid,pid. Change "int" to uint32_t for pid/tid.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Claudiu Zissulescu <claziss@synopsys.com>
Cc: Cupertino Miranda <cmiranda@synopsys.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Shahab Vahedi <shahab@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
---
 gdb/ChangeLog |  6 ++++++
 gdb/remote.c  | 12 +++---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/gdb/ChangeLog b/gdb/ChangeLog
index e886480d62..0011d064e9 100644
--- a/gdb/ChangeLog
+++ b/gdb/ChangeLog
@@ -1,3 +1,9 @@
+2019-11-06  Evgeniy Didin <didin@synopsys.com>
+
+	* remote.c (remote_target::write_ptid):  Remove handling
+	negative tid,pid. Change "int" to uint32_t for pid/tid.
+
+
 2019-11-05  Tom Tromey  <tom@tromey.com>
 
 	* tui/tui-disasm.c (struct tui_asm_line) <addr_size>: New member.
diff --git a/gdb/remote.c b/gdb/remote.c
index 8ea52d355a..2c119fad1a 100644
--- a/gdb/remote.c
+++ b/gdb/remote.c
@@ -2909,22 +2909,16 @@ static int remote_newthread_step (threadref *ref, void *context);
 char *
 remote_target::write_ptid (char *buf, const char *endbuf, ptid_t ptid)
 {
-  int pid, tid;
+  uint32_t pid, tid;
   struct remote_state *rs = get_remote_state ();
 
   if (remote_multi_process_p (rs))
     {
       pid = ptid.pid ();
-      if (pid < 0)
-	buf += xsnprintf (buf, endbuf - buf, "p-%x.", -pid);
-      else
-	buf += xsnprintf (buf, endbuf - buf, "p%x.", pid);
+      buf += xsnprintf (buf, endbuf - buf, "p%x.", pid);
     }
   tid = ptid.lwp ();
-  if (tid < 0)
-    buf += xsnprintf (buf, endbuf - buf, "-%x", -tid);
-  else
-    buf += xsnprintf (buf, endbuf - buf, "%x", tid);
+  buf += xsnprintf (buf, endbuf - buf, "%x", tid);
 
   return buf;
 }
-- 
2.17.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
