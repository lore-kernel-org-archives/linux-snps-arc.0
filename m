Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CA4C00140
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Aug 2022 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EpbabCwfTVOco0BxWkD7UEUwkUsnJL+TwCUSnjKttA=; b=cT2XGZfUNC9/HG
	prtAQ6WRJzla7YWz4g7m1WFsdeWNJar8LfiGWZFNeXfjy23ZZyShQGOXXLSEbLziYY1r29Vi8BDAW
	csFZSzG/rJAok83SzN9u/ISlg4oqGnpOgX6nkgCcgM2iUXsMygphZNPBfy05CzlfErrUhG082Bmdm
	WPf5eel72K/ktE54NcTbadOPy/cDZGvVwGv3WseVZLat+meIz+tu3pCS9Hh4KojRPvBFAd5Xgy7Na
	8UVqq/oPpCErFpAD/zblD5IxySZmIEQEMSXjzkxMTwFcUJRsNjYferR8YGcwwmxDzqePzHtEIIkxW
	mNkC5YzbJCfwd13PmN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL2Wf-00DyHI-AK; Mon, 08 Aug 2022 13:10:33 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL2Ve-00DxZD-33; Mon, 08 Aug 2022 13:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1659964158;
	bh=og2ZdLLtR22r7awQb48gxxRxQ5UEYe2MvvpX6puOyYg=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=e5TFBsOqdDo6sAO8ndmxdlbIX3HdCrNNsbgl74qJNkqlYPORLf4+kb4WTPHUgQGVY
	 wGSBWGgzPcvDyCWAtQXBcdr5FUkOLYcp2fjPNWs1qEH19tKUKyQqs1ZhQdZv6F4fGO
	 Gdj+f6sm8oHv+raOhdWfhiN7ubzcT9WvzSZaRfT4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.169.184]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N95e9-1nIg8H1vCp-016AhS; Mon, 08
 Aug 2022 15:09:18 +0200
From: Helge Deller <deller@gmx.de>
To: linux-s390@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	x86@kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/4] proc: Add get_task_cmdline_kernel() function
Date: Mon,  8 Aug 2022 15:09:14 +0200
Message-Id: <20220808130917.30760-2-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808130917.30760-1-deller@gmx.de>
References: <20220808130917.30760-1-deller@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BUhyAXuWPafeJuzDm8mq7jSWYmyxtYv8WO0ZCcQgBQNw8t55U3c
 GYOoqStr+xKHFwhHmRsSa+6pVg0jyVC9IIjlX2TpRgh5wPuGFRN6AAXC1ubYkpk52CNvt4S
 9CifaVKo+flwBSitpkkJWBv9PJDHEAUGWgt6oNAiuQf7zRWlr3+QOu4W4noco5xxU1FlRZq
 Gr+bZSao1nerycI6oObQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W6pVbxkhYHE=:5HAS2Z/J5tPWiFF1HYbnNC
 kYyVd2x4ivnpjqDK1wm/+XtQtHETHBaeG6a88u9VjFo10m9vuD/o8qp2AeNe6kiF2WC4kZYal
 5+eaYV8LMqZ+4T01Mxd9ab/5nRl6UyaDdUiOVmj3NIM76U09/GBqilVAbfscbup+7/Zei6iPy
 SX8aLOUt7bxZNdI/48/vLv1zmL2Sa7KykpgMVnVoDB94xbtpW0iDKqhGic8Nz5l45INROq6og
 /lM0ZjX/bl+rum+lc7gtfTIprO6+WVlnweqRwPgPkty9Vr3pSmWBbXBxOxm9iiieuJ9gw02mm
 COBYiDkyHMV9uwhwESOJ+vXmMeoo9Hgmoa/eihwA3EWmkl8Gi1LY3J4lK4XrPCSo/eE6/3cX3
 mwKGQAaYTAKfxk0Jas55UWpzQg2ttSQjqQ8j5xBt8q1pVMNieumoXhvIj1G3/7kIf/3byNdsd
 9lP64NsjTn68EnKveimZFT2k0+tcNl1KrR3d3lgyJLt4UsDBQc/qpooHBoUBKYkrhh6FI8eC8
 sJWHWJ+jx2JYdCCIvMud7vOGbwDDzCax5lSFSAK67HzQmr/GuGQDzymyNDsoFxOpZ9kQL7+2F
 c65RVe0UadqJMtO2gpKvIQ3ac6MLM8ootrtBDknpU+Dyra0hBqEHqq+rVLk1oftd6QYdUPfuL
 ZJZj31xIs9WOsiDkyoGQZHTm9mIF82+NgRo4Kv/Mb3UBDpBeIROl9pBgaJgJhDia2xjNFIIh8
 McL5H3QRAvyrJ855qZr8XlGzN9Q7U/NwQVh6NfInq4OAna2UJvGTk4iiDtuAvuzYOg/35tgwr
 +sRaFEpSkuyesjr6yb/4OMyscqcngLKl5dPthE7ouLCybxqNdedi+uIdSMl7XaSO7idkourJJ
 gKAZqYAYT5vTexy639dfwrthHd+8QQLyieIm6khESxgXrVFAXwPXCj5GNhlp2/nRkpc463tpi
 QS7T9wUP5P701eKJopzufgtWwHJHQjnTqwZj8XPspRZ8JixDAZxw7di58Qq/BIc5HDtNuCNQs
 19kRq87IgG/aL6GhgdPzONdvFd00WLm/5GpMUYHqObnIFjA6UiXqOhP9P1IZVmf2dKOzRcKhq
 vjBvgxsHrbl6y7qW4sgdTlMVf7aPQRSZeQpFt1fVaBaQDgC2maCDmlgug==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_060930_465093_48482738 
X-CRM114-Status: GOOD (  24.32  )
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

Add a new function get_task_cmdline_kernel() which reads the command
line of a process into a kernel buffer. This command line can then be
dumped by arch code to give additional debug info via the parameters
with which a faulting process was started.

The new function re-uses the existing code which provides the cmdline
for the procfs. For that the existing functions were modified so that
the buffer page is allocated outside of get_mm_proctitle() and
get_mm_cmdline() and instead provided as parameter.

Signed-off-by: Helge Deller <deller@gmx.de>

--
Changes in v3:
- add parameter names in header files, noticed by: kernel test robot
- require task to be locked by caller
---
 fs/proc/base.c          | 74 ++++++++++++++++++++++++++++-------------
 include/linux/proc_fs.h |  5 +++
 2 files changed, 56 insertions(+), 23 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 8dfa36a99c74..e2d4152aed34 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -217,20 +217,17 @@ static int proc_root_link(struct dentry *dentry, struct path *path)
  */
 static ssize_t get_mm_proctitle(struct mm_struct *mm, char __user *buf,
 				size_t count, unsigned long pos,
-				unsigned long arg_start)
+				unsigned long arg_start, char *page)
 {
-	char *page;
 	int ret, got;
+	size_t size;

-	if (pos >= PAGE_SIZE)
+	size = min_t(size_t, PAGE_SIZE, count);
+	if (pos >= size)
 		return 0;

-	page = (char *)__get_free_page(GFP_KERNEL);
-	if (!page)
-		return -ENOMEM;
-
 	ret = 0;
-	got = access_remote_vm(mm, arg_start, page, PAGE_SIZE, FOLL_ANON);
+	got = access_remote_vm(mm, arg_start, page, size, FOLL_ANON);
 	if (got > 0) {
 		int len = strnlen(page, got);

@@ -238,7 +235,9 @@ static ssize_t get_mm_proctitle(struct mm_struct *mm, char __user *buf,
 		if (len < got)
 			len++;

-		if (len > pos) {
+		if (!buf)
+			ret = len;
+		else if (len > pos) {
 			len -= pos;
 			if (len > count)
 				len = count;
@@ -248,16 +247,15 @@ static ssize_t get_mm_proctitle(struct mm_struct *mm, char __user *buf,
 			ret = len;
 		}
 	}
-	free_page((unsigned long)page);
 	return ret;
 }

 static ssize_t get_mm_cmdline(struct mm_struct *mm, char __user *buf,
-			      size_t count, loff_t *ppos)
+			      size_t count, loff_t *ppos, char *page)
 {
 	unsigned long arg_start, arg_end, env_start, env_end;
 	unsigned long pos, len;
-	char *page, c;
+	char c;

 	/* Check if process spawned far enough to have cmdline. */
 	if (!mm->env_end)
@@ -283,7 +281,7 @@ static ssize_t get_mm_cmdline(struct mm_struct *mm, char __user *buf,
 	len = env_end - arg_start;

 	/* We're not going to care if "*ppos" has high bits set */
-	pos = *ppos;
+	pos = ppos ? *ppos : 0;
 	if (pos >= len)
 		return 0;
 	if (count > len - pos)
@@ -299,7 +297,7 @@ static ssize_t get_mm_cmdline(struct mm_struct *mm, char __user *buf,
 	 * pos is 0, and set a flag in the 'struct file'.
 	 */
 	if (access_remote_vm(mm, arg_end-1, &c, 1, FOLL_ANON) == 1 && c)
-		return get_mm_proctitle(mm, buf, count, pos, arg_start);
+		return get_mm_proctitle(mm, buf, count, pos, arg_start, page);

 	/*
 	 * For the non-setproctitle() case we limit things strictly
@@ -311,10 +309,6 @@ static ssize_t get_mm_cmdline(struct mm_struct *mm, char __user *buf,
 	if (count > arg_end - pos)
 		count = arg_end - pos;

-	page = (char *)__get_free_page(GFP_KERNEL);
-	if (!page)
-		return -ENOMEM;
-
 	len = 0;
 	while (count) {
 		int got;
@@ -323,7 +317,8 @@ static ssize_t get_mm_cmdline(struct mm_struct *mm, char __user *buf,
 		got = access_remote_vm(mm, pos, page, size, FOLL_ANON);
 		if (got <= 0)
 			break;
-		got -= copy_to_user(buf, page, got);
+		if (buf)
+			got -= copy_to_user(buf, page, got);
 		if (unlikely(!got)) {
 			if (!len)
 				len = -EFAULT;
@@ -335,12 +330,11 @@ static ssize_t get_mm_cmdline(struct mm_struct *mm, char __user *buf,
 		count -= got;
 	}

-	free_page((unsigned long)page);
 	return len;
 }

 static ssize_t get_task_cmdline(struct task_struct *tsk, char __user *buf,
-				size_t count, loff_t *pos)
+				size_t count, loff_t *pos, char *page)
 {
 	struct mm_struct *mm;
 	ssize_t ret;
@@ -349,23 +343,57 @@ static ssize_t get_task_cmdline(struct task_struct *tsk, char __user *buf,
 	if (!mm)
 		return 0;

-	ret = get_mm_cmdline(mm, buf, count, pos);
+	ret = get_mm_cmdline(mm, buf, count, pos, page);
 	mmput(mm);
 	return ret;
 }

+/*
+ * Place up to maxcount chars of the command line of the process into the
+ * cmdline buffer.
+ * NOTE: Requires that the task was locked with task_lock(task) by the caller.
+ */
+void get_task_cmdline_kernel(struct task_struct *task,
+			char *cmdline, size_t maxcount)
+{
+	struct mm_struct *mm;
+	int i;
+
+	mm = task->mm;
+	if (!mm || (task->flags & PF_KTHREAD))
+		return;
+
+	memset(cmdline, 0, maxcount);
+	get_mm_cmdline(mm, NULL, maxcount - 1, NULL, cmdline);
+
+	/* remove NULs between parameters */
+	for (i = 0; i < maxcount - 2; i++) {
+		if (cmdline[i])
+			continue;
+		if (cmdline[i+1] == 0)
+			break;
+		cmdline[i] = ' ';
+	}
+}
+
 static ssize_t proc_pid_cmdline_read(struct file *file, char __user *buf,
 				     size_t count, loff_t *pos)
 {
 	struct task_struct *tsk;
 	ssize_t ret;
+	char *page;

 	BUG_ON(*pos < 0);

 	tsk = get_proc_task(file_inode(file));
 	if (!tsk)
 		return -ESRCH;
-	ret = get_task_cmdline(tsk, buf, count, pos);
+	page = (char *)__get_free_page(GFP_KERNEL);
+	if (page) {
+		ret = get_task_cmdline(tsk, buf, count, pos, page);
+		free_page((unsigned long)page);
+	} else
+		ret = -ENOMEM;
 	put_task_struct(tsk);
 	if (ret > 0)
 		*pos += ret;
diff --git a/include/linux/proc_fs.h b/include/linux/proc_fs.h
index 81d6e4ec2294..c802bc668656 100644
--- a/include/linux/proc_fs.h
+++ b/include/linux/proc_fs.h
@@ -158,6 +158,9 @@ int proc_pid_arch_status(struct seq_file *m, struct pid_namespace *ns,
 			struct pid *pid, struct task_struct *task);
 #endif /* CONFIG_PROC_PID_ARCH_STATUS */

+void get_task_cmdline_kernel(struct task_struct *task,
+			char *cmdline, size_t maxcount);
+
 #else /* CONFIG_PROC_FS */

 static inline void proc_root_init(void)
@@ -216,6 +219,8 @@ static inline struct pid *tgid_pidfd_to_pid(const struct file *file)
 	return ERR_PTR(-EBADF);
 }

+static inline void get_task_cmdline_kernel(struct task_struct *task, char *cmdl, size_t m) { }
+
 #endif /* CONFIG_PROC_FS */

 struct net;
--
2.37.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
