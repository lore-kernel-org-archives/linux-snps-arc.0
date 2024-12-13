Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68916E77180
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 05:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZPTahvjfZmRC5CoI07P7Xe285ta9dka/fqzceM8qL8=; b=oYK35dJLFIbqk0
	Jpgx8d5aWxviRRp+HquRBGLiZyNAZmAAVNYg0Zr1F+kVaIflsVfLkA9tD9JLCfYwJ5VKCIO6mf9ta
	YQhv+8caGaSrbhiJbd9RkDg2zvd/LjVNgmgpOfnGvRZzSxjTxUuMDbPy907SyqDZmhLcqHu+b8KB5
	fd1OT+wBP3cMhZdD6swgoF8/ln+xCIFNfsLXSLfHuhHuv0lo58PMEbrzdCmxXIK3cgYCfXHAbOy7c
	5qiVJhueahj0Q6TaFeeKRrWzmP4G3EIJwwJXaQ1TA/0NgoulluhK5sJ7Fqm0aLM7w1e9X0FxaCx2q
	ydMTZCmcNWn4EVs6E8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyWT-00000002nmY-0jtO;
	Fri, 13 Dec 2024 05:47:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyWR-00000002nkt-0BSV
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 05:47:32 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-216401de828so12439765ad.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Dec 2024 21:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734068850; x=1734673650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WABVozVaGAUeC6WVv6dNDEWCXVmF+XIaxOqP2xXRnSs=;
        b=LHmbIq6lN9Cm/0Yrvh8kavo/2YM0dp7KUiFgQNLkeyBPjGJk53Ur6KtpWzbaFtOk/k
         bc3FhNmszv9ju6XrTz1GnnfhmQ5PXA5weS5AszfLtxtrSWc8Db15SFPiHUBf135y/44d
         BNG5Y8aDnysFflt0xxwyD+1qT5apto644xK9yfkIFyXlSh2ATUYRNLhliTbEfsWsoNqk
         5zyCqwGFNF1/G56JJMQ+ZgD8VYiKJL+S4me+nzYlWcHVOg10GjQLT3ks6CNkK+BmCI+j
         XihpsHHxUoQFhm7bEpjmzbMrXj8/D06FFsFrh2e8I26u4Q/qLbqYmx1nuQWUkv80W2XA
         ZsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734068850; x=1734673650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WABVozVaGAUeC6WVv6dNDEWCXVmF+XIaxOqP2xXRnSs=;
        b=tJLS14Z+SkLZNmoD3kOeXuZ4Caf22BzNCNKmvgLtQq3jinqtyYilsvjqltqbper1FN
         8/tAfuNSpxQWCxTD/IneP5DwPUe2UPE9Fv5sYXtYqbDgWeN8wFsCwf6jpWYRTrpz1L04
         NRXo8RRRfrb+4uiTPnmMdxmp1Ckn8yu7UD3tpq98JZJurxoGU6jRLBYGqjI/wTD93OWE
         tlvD4ZMVI8OOkGvoLlovz3zz+hrexLCVjScs/NSRHu2oJq+fAvLynUwsI2ZwPvPcDpCx
         Z+d42PlwT+ktiDkhb8l0wac0EIFz84GS/y3CC3vmAHLTqHyaxQ4PQSXD03hxSlCmMFmy
         bbMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjuSCEo0jMSrnYQ/NGoy5kKoxKXnf9+PBsQt6PfN9NujygUiXHmXex0vfHz0gSrOugJ7qCVLo4A7Aae5oOzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHLqPSAe6/x/ZChVJoATPKWHFUbeSW7GHQwvbT0eKeF9JBjvtC
	eDM6OGzOWmGjFuCdmgH+heGTkXIGNyowvLC0OGDuWN4etPV1NQXh
X-Gm-Gg: ASbGncsU5DFKPH3LKc8WZdsSzHUi2hTCUCPltZFY8wtVSogEIoh9iNmaRXxha5M5Tus
	fQUZEiEhTVTc+cBXvKETADvBIhRSTKJLuc86IfAVPtN/HgGT6C/qjiQMT8vwKnx2rDVZGSRnLm5
	ZtRridTSJ7zjV9MF2ffS7kdUC0HE32rUNbwr6piEOKDvmIX0Oygmv6EVUoVuaNnO7xXqjz3DyuJ
	rgvRQXjs96Dze7MQcM4gkRpP1lZMT2fq/pvf8YbG5ByDUWg9ciuVpQ+vbGf36SzYjhSWdQChRv+
	Z/x4R58=
X-Google-Smtp-Source: AGHT+IGFE1mRmyM5NL2PUAWpAoscqFHXvU8vwTTuUZkYB6i9lL3x0jZgiaefTaKhcRetCPxuiJ6lzw==
X-Received: by 2002:a17:90b:3889:b0:2ee:aa28:79aa with SMTP id 98e67ed59e1d1-2f28fa55d20mr2136406a91.6.1734068850070;
        Thu, 12 Dec 2024 21:47:30 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.47.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Dec 2024 21:47:29 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	x86@kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	ocfs2-devel@lists.linux.dev,
	Yafang Shao <laoar.shao@gmail.com>,
	Ofir Bitton <obitton@habana.ai>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 6/7] drivers: Repace get_task_comm() with %pTN
Date: Fri, 13 Dec 2024 13:46:09 +0800
Message-Id: <20241213054610.55843-7-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241213054610.55843-1-laoar.shao@gmail.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_214731_085673_14860AE5 
X-CRM114-Status: GOOD (  13.81  )
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

Since task->comm is guaranteed to be NUL-terminated, we can print it
directly without the need to copy it into a separate buffer. This
simplifies the code and avoids unnecessary operations.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Ofir Bitton <obitton@habana.ai>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
---
 drivers/accel/habanalabs/common/context.c         |  5 ++---
 .../accel/habanalabs/common/habanalabs_ioctl.c    | 15 +++++----------
 .../gpu/drm/i915/display/intel_display_driver.c   | 10 ++++------
 drivers/gpu/drm/nouveau/nouveau_chan.c            |  4 +---
 drivers/gpu/drm/nouveau/nouveau_drm.c             |  7 +++----
 drivers/tty/tty_io.c                              |  5 ++---
 6 files changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/accel/habanalabs/common/context.c b/drivers/accel/habanalabs/common/context.c
index b83141f58319..e4026051b735 100644
--- a/drivers/accel/habanalabs/common/context.c
+++ b/drivers/accel/habanalabs/common/context.c
@@ -199,7 +199,6 @@ int hl_ctx_create(struct hl_device *hdev, struct hl_fpriv *hpriv)
 
 int hl_ctx_init(struct hl_device *hdev, struct hl_ctx *ctx, bool is_kernel_ctx)
 {
-	char task_comm[TASK_COMM_LEN];
 	int rc = 0, i;
 
 	ctx->hdev = hdev;
@@ -271,8 +270,8 @@ int hl_ctx_init(struct hl_device *hdev, struct hl_ctx *ctx, bool is_kernel_ctx)
 
 		mutex_init(&ctx->ts_reg_lock);
 
-		dev_dbg(hdev->dev, "create user context, comm=\"%s\", asid=%u\n",
-			get_task_comm(task_comm, current), ctx->asid);
+		dev_dbg(hdev->dev, "create user context, comm=\"%pTN\", asid=%u\n",
+			current, ctx->asid);
 	}
 
 	return 0;
diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 1dd6e23172ca..32678cd0775a 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -1279,13 +1279,10 @@ static long _hl_ioctl(struct hl_fpriv *hpriv, unsigned int cmd, unsigned long ar
 		retcode = -EFAULT;
 
 out_err:
-	if (retcode) {
-		char task_comm[TASK_COMM_LEN];
-
+	if (retcode)
 		dev_dbg_ratelimited(dev,
-				"error in ioctl: pid=%d, comm=\"%s\", cmd=%#010x, nr=%#04x\n",
-				task_pid_nr(current), get_task_comm(task_comm, current), cmd, nr);
-	}
+				"error in ioctl: pid=%d, comm=\"%pTN\", cmd=%#010x, nr=%#04x\n",
+				task_pid_nr(current), current, cmd, nr);
 
 	if (kdata != stack_kdata)
 		kfree(kdata);
@@ -1308,11 +1305,9 @@ long hl_ioctl_control(struct file *filep, unsigned int cmd, unsigned long arg)
 	if (nr == _IOC_NR(DRM_IOCTL_HL_INFO)) {
 		ioctl = &hl_ioctls_control[nr - HL_COMMAND_START];
 	} else {
-		char task_comm[TASK_COMM_LEN];
-
 		dev_dbg_ratelimited(hdev->dev_ctrl,
-				"invalid ioctl: pid=%d, comm=\"%s\", cmd=%#010x, nr=%#04x\n",
-				task_pid_nr(current), get_task_comm(task_comm, current), cmd, nr);
+				"invalid ioctl: pid=%d, comm=\"%pTN\", cmd=%#010x, nr=%#04x\n",
+				task_pid_nr(current), current, cmd, nr);
 		return -ENOTTY;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 56b78cf6b854..416aff49ceb8 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -391,7 +391,6 @@ void intel_display_driver_resume_access(struct drm_i915_private *i915)
  */
 bool intel_display_driver_check_access(struct drm_i915_private *i915)
 {
-	char comm[TASK_COMM_LEN];
 	char current_task[TASK_COMM_LEN + 16];
 	char allowed_task[TASK_COMM_LEN + 16] = "none";
 
@@ -399,13 +398,12 @@ bool intel_display_driver_check_access(struct drm_i915_private *i915)
 	    i915->display.access.allowed_task == current)
 		return true;
 
-	snprintf(current_task, sizeof(current_task), "%s[%d]",
-		 get_task_comm(comm, current),
-		 task_pid_vnr(current));
+	snprintf(current_task, sizeof(current_task), "%pTN[%d]",
+		 current, task_pid_vnr(current));
 
 	if (i915->display.access.allowed_task)
-		snprintf(allowed_task, sizeof(allowed_task), "%s[%d]",
-			 get_task_comm(comm, i915->display.access.allowed_task),
+		snprintf(allowed_task, sizeof(allowed_task), "%pTN[%d]",
+			 i915->display.access.allowed_task,
 			 task_pid_vnr(i915->display.access.allowed_task));
 
 	drm_dbg_kms(&i915->drm,
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 2cb2e5675807..5bcfda6ecafe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -279,7 +279,6 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	const u64 plength = 0x10000;
 	const u64 ioffset = plength;
 	const u64 ilength = 0x02000;
-	char name[TASK_COMM_LEN];
 	int cid, ret;
 	u64 size;
 
@@ -338,8 +337,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		chan->userd = &chan->user;
 	}
 
-	get_task_comm(name, current);
-	snprintf(args.name, sizeof(args.name), "%s[%d]", name, task_pid_nr(current));
+	snprintf(args.name, sizeof(args.name), "%pTN[%d]", current, task_pid_nr(current));
 
 	ret = nvif_object_ctor(&device->object, "abi16ChanUser", 0, hosts[cid].oclass,
 			       &args, sizeof(args), &chan->user);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 107f63f08bd9..3264465cded6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1159,7 +1159,7 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_cli *cli;
-	char name[32], tmpname[TASK_COMM_LEN];
+	char name[32];
 	int ret;
 
 	/* need to bring up power immediately if opening device */
@@ -1169,10 +1169,9 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 		return ret;
 	}
 
-	get_task_comm(tmpname, current);
 	rcu_read_lock();
-	snprintf(name, sizeof(name), "%s[%d]",
-		 tmpname, pid_nr(rcu_dereference(fpriv->pid)));
+	snprintf(name, sizeof(name), "%pTN[%d]",
+		 current, pid_nr(rcu_dereference(fpriv->pid)));
 	rcu_read_unlock();
 
 	if (!(cli = kzalloc(sizeof(*cli), GFP_KERNEL))) {
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 9771072da177..bd39167d4234 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2622,14 +2622,13 @@ static int tty_tiocgicount(struct tty_struct *tty, void __user *arg)
 
 static int tty_set_serial(struct tty_struct *tty, struct serial_struct *ss)
 {
-	char comm[TASK_COMM_LEN];
 	int flags;
 
 	flags = ss->flags & ASYNC_DEPRECATED;
 
 	if (flags)
-		pr_warn_ratelimited("%s: '%s' is using deprecated serial flags (with no effect): %.8x\n",
-				__func__, get_task_comm(comm, current), flags);
+		pr_warn_ratelimited("%s: '%pTN' is using deprecated serial flags (with no effect): %.8x\n",
+				__func__, current, flags);
 
 	if (!tty->ops->set_serial)
 		return -ENOTTY;
-- 
2.43.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
