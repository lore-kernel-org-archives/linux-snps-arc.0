Return-Path: <SRS0=YnoV=EL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B611C4742C
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Nov 2020 23:11:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D481C20684
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Nov 2020 23:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KwNq6p3M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="V4cEfPHH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D481C20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GV9rUga36JN55ak6yovXOOhuPHUvdQPZZlDSOvQ9eIw=; b=KwNq6p3M20UF+BTrpmc6kqP5qB
	1xR/xWCZ00lujPRTOGuKiEaaOb7d9D2VAqfv8+kQu0Ck9fcZ51Ef3TjmOXkYC99Ko9IKvoZAO15Mw
	QSIlRT+URJ8kD6k8IbNiQW94SOK3kXLiHFmu6sqieziOwI3RU4dazl93DhDeXF9vhwyFm/Pk7SvNQ
	UuOvNUDAwxdpI0df6sq+4KuUaxhGflFdcGB460G6qvIaDxiib/d2OvuridfBaYlyjOt1IT9gAjKeg
	mSwGTWZBd+sCU/j2q4ZfMb1GPTbHfGAHXblj/uqMhbDE1f0tk9/X9qGSeBFOuEXb76QgRB+CtbDNO
	NspZJkYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaoPz-0007mQ-4H; Thu, 05 Nov 2020 23:11:47 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaoPw-0007l8-BV
 for linux-snps-arc@lists.infradead.org; Thu, 05 Nov 2020 23:11:45 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CA14A402A1;
 Thu,  5 Nov 2020 23:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1604617902; bh=mjfzQlgSUryYIi0w+/VNAw26FTSsKPnANnJpopYIHFM=;
 h=From:To:Cc:Subject:Date:From;
 b=V4cEfPHHohGc3T4AMKXaIT6sexWMwj4S7OJVxAZGNDJeisko3y+HcN6VFfXB3zLaz
 h8F10SDqv6iS4g57H5Ijq4iMEGKFSpC0dbghVQnAgpegJHBN4IEZcJ2QQnsIYXTVqc
 RyPLsSOJxcQ143ISet8YgbdZWDE4pIMTBOau4Emq6+y4kdxQe82JA/cuh1ehI7LKdD
 fUMVTF1Vkwekq+Y/9Z5rL/0KR0iLwHH94Eh6HEHYDjZABpVfArk8tU7CtrTU5ormsn
 qsPdFMgky+RWC7V6yMsk77UNQCTDd3M3LZzwiNnq3WoxslhfLAHJ4ttWaYwDowNpDc
 Flyx0BinY3NmQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 5DD60A005E;
 Thu,  5 Nov 2020 23:11:36 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alexey Dobriyan <adobriyan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Vlastimil Babka <vbabka@suse.cz>, Michel Lespinasse <walken@google.com>,
 Andrei Vagin <avagin@gmail.com>,
 Bernd Edlinger <bernd.edlinger@hotmail.de>,
 John Johansen <john.johansen@canonical.com>,
 Oleg Nesterov <oleg@redhat.com>
Subject: [RFC] proc: get_wchan() stack unwind only makes sense for
 sleeping/non-self tasks
Date: Thu,  5 Nov 2020 15:11:32 -0800
Message-Id: <20201105231132.2130132-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_181144_517911_9CC684F0 
X-CRM114-Status: GOOD (  12.42  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Most architectures currently check this in their get_wchan() implementation
(ARC doesn't hence this patch). However doing this in core code shows
the semantics better so move the check one level up (eventually remove
the boiler-plate code from arches)

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

 #	tools/perf/arch/arc/util/
---
 fs/proc/array.c | 4 +++-
 fs/proc/base.c  | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/proc/array.c b/fs/proc/array.c
index 65ec2029fa80..081fade5a361 100644
--- a/fs/proc/array.c
+++ b/fs/proc/array.c
@@ -519,8 +519,10 @@ static int do_task_stat(struct seq_file *m, struct pid_namespace *ns,
 		unlock_task_sighand(task, &flags);
 	}
 
-	if (permitted && (!whole || num_threads < 2))
+	if (task != current && task->state != TASK_RUNNING &&
+	    permitted && (!whole || num_threads < 2))
 		wchan = get_wchan(task);
+
 	if (!whole) {
 		min_flt = task->min_flt;
 		maj_flt = task->maj_flt;
diff --git a/fs/proc/base.c b/fs/proc/base.c
index 0f707003dda5..abd7ec6324c5 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -385,13 +385,15 @@ static const struct file_operations proc_pid_cmdline_ops = {
 static int proc_pid_wchan(struct seq_file *m, struct pid_namespace *ns,
 			  struct pid *pid, struct task_struct *task)
 {
-	unsigned long wchan;
+	unsigned long wchan = 0;
 	char symname[KSYM_NAME_LEN];
 
 	if (!ptrace_may_access(task, PTRACE_MODE_READ_FSCREDS))
 		goto print0;
 
-	wchan = get_wchan(task);
+	if (task != current && task->state != TASK_RUNNING)
+		wchan = get_wchan(task);
+
 	if (wchan && !lookup_symbol_name(wchan, symname)) {
 		seq_puts(m, symname);
 		return 0;
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
