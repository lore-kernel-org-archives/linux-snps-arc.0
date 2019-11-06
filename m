Return-Path: <SRS0=N0Bh=Y6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE75C5DF62
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 13:27:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DD2B20663
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 13:27:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r68DadNv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aR+bBpd0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DD2B20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1vbTXpfLw5S8+BUwa/A7Mu0f6wm06j6u93WKbE9JHDQ=; b=r68
	DadNvmRY9+Mv+xZJO9uRL18nSGQ3OZ4nKr1vRVpDzgJs0JM1+11z774AjMYpHMczSxMwqoq7wMfwo
	H8iFyX9CmLj94/k7Dxh+hI1ZKsFB/AfNM3Lk6y3hs/CTzWkqle5iShVSQF8fSiw369aizUVZpSVVy
	FB7hQv4gq8fYkbGa/Z87b9ofcGmbKP7Ie2G6IyjxefI5U84tfdG0/SI/htYSDyJi9MJ2LLDC9LK4T
	RvRXG6Eqz90yWIdQ3ur/9/n1Zve3D9FIsqP4kAw2V7ygi761x7HuR+gcxLnubvZYl/sM+n/+KDbhh
	HDanRiguw+qZUFiMVG7cH7Ky+AHNUng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSLLn-0003Ai-GP; Wed, 06 Nov 2019 13:27:55 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSLLk-0003AM-AZ
 for linux-snps-arc@lists.infradead.org; Wed, 06 Nov 2019 13:27:53 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4FFE7C0928;
 Wed,  6 Nov 2019 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573046871; bh=rsYsDkRmnQV4MxnoW1lZw3wCF0TV/A+VjJ2Rtcj6aIY=;
 h=From:To:Cc:Subject:Date:From;
 b=aR+bBpd0iqzIfMJPb5A8/HcD4Z0WQ9zqGnxWSqOXGqm7rEBEA2A9pGTNhzCC71p7T
 tLf6dpTyvV/lzwzeu9f36x5/x8+B/oND8AaWN0JeNHxeY0/X5sIQt2W6T8N2XMJGTr
 yv3TpaOIAqvjdfisKbQSL5r3fwJfL/qf7BtHxFS0msaJrcW9TjhQJBIyo6nx87XI1h
 +daR0k0xDpxE43m4hhH8KyTO1oQK1Aqg9fVluLn32nJod+kINDhEjlBYNG4LyrBzdb
 9aaq7mKikkHrL9QOzvJiRSccXEivBQ65yDIFPZMEveQfznrhi631Cgeh1JdYGBhw7R
 H+47KwH/p4RWA==
Received: from didin-7490l.internal.synopsys.com
 (didin-7490l.internal.synopsys.com [10.121.3.58])
 by mailhost.synopsys.com (Postfix) with ESMTP id 232DBA0057;
 Wed,  6 Nov 2019 13:27:42 +0000 (UTC)
From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
To: gdb-patches@sourceware.org
Subject: [PATCH v2] gdb/remote: Remove negative tid/pid handling in wite_ptid
Date: Wed,  6 Nov 2019 16:27:32 +0300
Message-Id: <20191106132732.11034-1-didin@synopsys.com>
X-Mailer: git-send-email 2.17.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_052752_435702_16F43ED0 
X-CRM114-Status: GOOD (  14.50  )
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
         negative tid,pid. Change "int" to "unsigned int" for pid/tid.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Claudiu Zissulescu <claziss@synopsys.com>
Cc: Cupertino Miranda <cmiranda@synopsys.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Shahab Vahedi <shahab@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
---
Changes v1-v2:
-make no change of tid/pid bitness, 
 use generic "unsigned int" instead of "uint32_t"	

 gdb/ChangeLog |  6 ++++++
 gdb/remote.c  | 12 +++---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/gdb/ChangeLog b/gdb/ChangeLog
index e886480d62..cd55d65ced 100644
--- a/gdb/ChangeLog
+++ b/gdb/ChangeLog
@@ -1,3 +1,9 @@
+2019-11-06  Evgeniy Didin <didin@synopsys.com>
+
+	* remote.c (remote_target::write_ptid):  Remove handling
+	negative tid,pid. Change "int" to "unsigned int" for pid/tid.
+
+
 2019-11-05  Tom Tromey  <tom@tromey.com>
 
 	* tui/tui-disasm.c (struct tui_asm_line) <addr_size>: New member.
diff --git a/gdb/remote.c b/gdb/remote.c
index 8ea52d355a..ea12d738c8 100644
--- a/gdb/remote.c
+++ b/gdb/remote.c
@@ -2909,22 +2909,16 @@ static int remote_newthread_step (threadref *ref, void *context);
 char *
 remote_target::write_ptid (char *buf, const char *endbuf, ptid_t ptid)
 {
-  int pid, tid;
+  unsigned int pid, tid;
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
