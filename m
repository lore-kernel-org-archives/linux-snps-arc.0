Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E44E7718B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2024 02:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2IiFpxkCp7O5X/h91NGRA7hhndS3SITFFY+sHcj2VU=; b=iAdSk8Untqjdt7
	jI/37Iexx/s2okNRUBfgrRQlSAIhbsjGyPNpRG9fAaXBuACBt9uXm+ZO6iupIRVTsjxgxH3x3OfNQ
	zqju8u1SV9bEVWpbNIbdwsJhaf7+VzJ8qgAkwYgbEa13Va8WSpJ9WfLnrk+nFmNtv2L4nakp4T71Y
	baS63Lz8SKQ+tht/aH10PIGxB5eSiL1kaGhootlJcCi+ZfXTC/6VjFxaiNBLLFy5d2ZAovdEXfBKD
	E5pr07veKqe89205qMxKCrOdqRHcvIo2BHg9cd6QYeoBnoDXP1DRWrrDE72GsEcMbrCqkzs5+IfLc
	yvqL9d9JIP2SeX8p6afw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6Nt-00000000cTd-3bwf;
	Thu, 19 Dec 2024 02:35:29 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6Nr-00000000cSC-3yAn
	for linux-snps-arc@lists.infradead.org;
	Thu, 19 Dec 2024 02:35:29 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-728eedfca37so359611b3a.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 18 Dec 2024 18:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734575727; x=1735180527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lFqN6P61Vcxg60EP2migAvtPpkWX8ZEoCx5nNg3/cM=;
        b=nFosZpk0OKt5qxGGIhwYGXlEDGNhLIPiQpM6SBnXTWLvkbCCfOMJD5m9v3fDKyy27N
         d5LivyAGcnyJtR+g+FNy4AS3tuNFF3Yc2+xgon4TZcBUjbLRMbIp5N5ZMMBEU+9fmply
         Qy7ajrZNQZB37avZ2i3xuMiOsAzowbOcG1GK+KqBGraTDlMAOG0ctlNpraPJ6czI6hHs
         cXC2no1eQqENtRpp6uKt63VEX2ER4eht/njiGvL8wSm7LN44zHMeeQJSCkjvloYcRgvB
         esLdHgDH2JaPSlIlj4KBWMQ6f7AEGbfkKnoxlLKhlsCGeHjtg2PU2fzyPzXV15ZcbwGz
         z4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734575727; x=1735180527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lFqN6P61Vcxg60EP2migAvtPpkWX8ZEoCx5nNg3/cM=;
        b=Xb1fRchttaLBZUxRGNgKbLfK8MpH9brusr+ngFDEMmGnA+VmzL722yOP9TjFjPzn++
         l5dhuMSyDj3aC8+r64sxzJaa4rv2jRi6f2NmJdDlMTRpNw7+juB52zsIlTT95nr8Oqaw
         rZMLrZnHmzRSnK22TM2urxJPcS8Kx42UrpJvsL0B+9bXh76RBYwa6dW+opm1y3KPKcQa
         3ZGLZMSxVCp3GZwB3p5QRFj/FEgnVsjZPAJbxRkMFHfwjX2d5eayHK0b7kf9AD1FQzgw
         J6tND9X7O0fGm7qc5cnzn6GHrupBDVyY1yNJ5k6vt+1du34iaLhoxd72J2TIDYaMy4UZ
         qZ4w==
X-Forwarded-Encrypted: i=1; AJvYcCXbCFoR1Kvs+5cXwHKrJ9MHMtK8zWSVrMLpmeJ7MUsgnDs/9tTA6wmzPi/mwesK4Vof4pYZPoS0O2ECd2z0Eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuUSQZ6ZhpPKxDQGny4I4EeqkB/wZIp3Rqs/ipVt31Qe2CuuXQ
	AyKBQW90gDydCm2fo0GJC+KuSA8NGqyiKvxglbN1kWvWfqzUANnR
X-Gm-Gg: ASbGncuhtJM8S/euDBh5X2pCDxhUOk2Wl/HvrusAPrkPWCyDWUtpfSSveIX7z5FFpRn
	TWGTmy4WOC0frcXfK8QMyQdBXPe4vSU4lv+VITGzVFpeAliWgPUYtYcWPwi7j/WDvwvtIWrqXfp
	kb0hub6gDIStNA2Xpcbeeoc0i/Oj9KpSf2D9kjmsItYcsej52bmuELpqqtC/0ebuaSHgvQnegkr
	pXh8p8b0xTqitBdyJKbWvogE/aquo1kyb1mytEK3K0qD+YfKxwWltFgY683l4FdRO8MVD+JyJ6E
	xtgUBFc=
X-Google-Smtp-Source: AGHT+IEASYTltYbmKh5ZDA03zBv0Z8CD36/wkPvI28CV3U8CPosE7HG5sfVxRVIBm8iQbfYV7EQNzQ==
X-Received: by 2002:a05:6a21:788c:b0:1e1:b727:181a with SMTP id adf61e73a8af0-1e5c763cc43mr2386992637.24.1734575726666;
        Wed, 18 Dec 2024 18:35:26 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b821da83sm142163a12.40.2024.12.18.18.35.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Dec 2024 18:35:26 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org,
	pmladek@suse.com,
	kvalo@kernel.org,
	bp@alien8.de,
	andriy.shevchenko@linux.intel.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
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
	Jiri Slaby <jirislaby@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Karol Herbst <kherbst@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 5/5] drivers: Remove get_task_comm() and print task comm directly
Date: Thu, 19 Dec 2024 10:34:52 +0800
Message-Id: <20241219023452.69907-6-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241219023452.69907-1-laoar.shao@gmail.com>
References: <20241219023452.69907-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_183528_084834_AF5A5808 
X-CRM114-Status: GOOD (  14.46  )
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
Reviewed-by: Jiri Slaby <jirislaby@kernel.org> (For tty)
Reviewed-by: Lyude Paul <lyude@redhat.com> (For nouveau)
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
 drivers/accel/habanalabs/common/context.c           |  3 +--
 drivers/accel/habanalabs/common/habanalabs_ioctl.c  | 11 +++--------
 drivers/gpu/drm/i915/display/intel_display_driver.c |  6 ++----
 drivers/gpu/drm/nouveau/nouveau_chan.c              |  4 +---
 drivers/gpu/drm/nouveau/nouveau_drm.c               |  5 ++---
 drivers/tty/tty_io.c                                |  3 +--
 6 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/accel/habanalabs/common/context.c b/drivers/accel/habanalabs/common/context.c
index b83141f58319..9f212b17611a 100644
--- a/drivers/accel/habanalabs/common/context.c
+++ b/drivers/accel/habanalabs/common/context.c
@@ -199,7 +199,6 @@ int hl_ctx_create(struct hl_device *hdev, struct hl_fpriv *hpriv)
 
 int hl_ctx_init(struct hl_device *hdev, struct hl_ctx *ctx, bool is_kernel_ctx)
 {
-	char task_comm[TASK_COMM_LEN];
 	int rc = 0, i;
 
 	ctx->hdev = hdev;
@@ -272,7 +271,7 @@ int hl_ctx_init(struct hl_device *hdev, struct hl_ctx *ctx, bool is_kernel_ctx)
 		mutex_init(&ctx->ts_reg_lock);
 
 		dev_dbg(hdev->dev, "create user context, comm=\"%s\", asid=%u\n",
-			get_task_comm(task_comm, current), ctx->asid);
+			current->comm, ctx->asid);
 	}
 
 	return 0;
diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 1dd6e23172ca..8729a0c57d78 100644
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
 				"error in ioctl: pid=%d, comm=\"%s\", cmd=%#010x, nr=%#04x\n",
-				task_pid_nr(current), get_task_comm(task_comm, current), cmd, nr);
-	}
+				task_pid_nr(current), current->comm, cmd, nr);
 
 	if (kdata != stack_kdata)
 		kfree(kdata);
@@ -1308,11 +1305,9 @@ long hl_ioctl_control(struct file *filep, unsigned int cmd, unsigned long arg)
 	if (nr == _IOC_NR(DRM_IOCTL_HL_INFO)) {
 		ioctl = &hl_ioctls_control[nr - HL_COMMAND_START];
 	} else {
-		char task_comm[TASK_COMM_LEN];
-
 		dev_dbg_ratelimited(hdev->dev_ctrl,
 				"invalid ioctl: pid=%d, comm=\"%s\", cmd=%#010x, nr=%#04x\n",
-				task_pid_nr(current), get_task_comm(task_comm, current), cmd, nr);
+				task_pid_nr(current), current->comm, cmd, nr);
 		return -ENOTTY;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 56b78cf6b854..62596424a9aa 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -391,7 +391,6 @@ void intel_display_driver_resume_access(struct drm_i915_private *i915)
  */
 bool intel_display_driver_check_access(struct drm_i915_private *i915)
 {
-	char comm[TASK_COMM_LEN];
 	char current_task[TASK_COMM_LEN + 16];
 	char allowed_task[TASK_COMM_LEN + 16] = "none";
 
@@ -400,12 +399,11 @@ bool intel_display_driver_check_access(struct drm_i915_private *i915)
 		return true;
 
 	snprintf(current_task, sizeof(current_task), "%s[%d]",
-		 get_task_comm(comm, current),
-		 task_pid_vnr(current));
+		 current->comm, task_pid_vnr(current));
 
 	if (i915->display.access.allowed_task)
 		snprintf(allowed_task, sizeof(allowed_task), "%s[%d]",
-			 get_task_comm(comm, i915->display.access.allowed_task),
+			 i915->display.access.allowed_task->comm,
 			 task_pid_vnr(i915->display.access.allowed_task));
 
 	drm_dbg_kms(&i915->drm,
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 2cb2e5675807..cd659b9fd1d9 100644
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
+	snprintf(args.name, sizeof(args.name), "%s[%d]", current->comm, task_pid_nr(current));
 
 	ret = nvif_object_ctor(&device->object, "abi16ChanUser", 0, hosts[cid].oclass,
 			       &args, sizeof(args), &chan->user);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 107f63f08bd9..ea7206484d22 100644
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
 	snprintf(name, sizeof(name), "%s[%d]",
-		 tmpname, pid_nr(rcu_dereference(fpriv->pid)));
+		 current->comm, pid_nr(rcu_dereference(fpriv->pid)));
 	rcu_read_unlock();
 
 	if (!(cli = kzalloc(sizeof(*cli), GFP_KERNEL))) {
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 9771072da177..102e31f62f76 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2622,14 +2622,13 @@ static int tty_tiocgicount(struct tty_struct *tty, void __user *arg)
 
 static int tty_set_serial(struct tty_struct *tty, struct serial_struct *ss)
 {
-	char comm[TASK_COMM_LEN];
 	int flags;
 
 	flags = ss->flags & ASYNC_DEPRECATED;
 
 	if (flags)
 		pr_warn_ratelimited("%s: '%s' is using deprecated serial flags (with no effect): %.8x\n",
-				__func__, get_task_comm(comm, current), flags);
+				__func__, current->comm, flags);
 
 	if (!tty->ops->set_serial)
 		return -ENOTTY;
-- 
2.43.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
