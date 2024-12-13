Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1281E77180
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 05:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=muLqcsYeHHfGH4fg/pANt0kLmbV3XC+sqfkZR02zy/I=; b=Z0JZQn7CUC+QyU
	vTAcrzAl7LJSkcdH9BQTIPvCquxBr31BbQ50E5Gnl+XFkdJP4ZoNHn1nX0xmeS27kG0N7c+yhiRT5
	rXhGji+RdVbmf76S9eVyk5tRe5KGn54mhRzK9kF9Ieide+ZghN20Jjkhv7dtX/VhOV5CzW9Yz+3lN
	q9kFjgPz7dpNRcyzLSYV4tuXrQ4hsStI1vJWshnaLhzrCBJzl99WoGiQl3wIzXZTp/zwpUtPAqdML
	vQ9OcIs9QjUiOj6rVJOL3Hdb0nMJ8V8QF+PYKfexy4+SJ056LV4a3hSNfDGswRqI3GBqLEIBRe4a4
	qhWV6SwWslUh/+dOwbAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyYM-00000002o2Q-2RRr;
	Fri, 13 Dec 2024 05:49:30 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyYK-00000002o1p-0yWX
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 05:49:29 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-728ea1e0bdbso1127647b3a.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Dec 2024 21:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734068967; x=1734673767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2jUPvsdlfQUhZsdbtI4Ke1sLD5+tvHbQzW9Gl1gyas=;
        b=bDHq5TNec//2mdO+ZXZOht0pmAiYFF+HClAwOBJZSL8kco030zIeJO/lvm0ojqNFFC
         J6xvD6ljErJ69pL0+nkkUPCvBSvdSgLfjBbq7irWGsYqjnH1X3YmXAz+8ZEc8Xi3YsTb
         PD2pXQD05nEz+J96r6xinKhUxjSBiBxsCMBt+QXUpN4X8+bqnW7FgpAtznqC9sWmbX6V
         5mFd9kwJU6iPq5ihFQupVN1YXCNSe8sWtTDGqvGZnwcNwoXmqKi09NctuYksFbbxXIMf
         zgGc/va/PLbm6DBV9P8YkhJk9pUZJ1/lwqISMa0oh41ABY2pKouQFPFj76GA8zTuV9rF
         Bceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734068967; x=1734673767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2jUPvsdlfQUhZsdbtI4Ke1sLD5+tvHbQzW9Gl1gyas=;
        b=vubKLQbWS4X6ziWR5M5athmGdc6J5DCIHs7y2nQuurWaVcg/fsR/F8hOFugHZATDrc
         6rGQ341mT3fnBzNfCY3JkoAqHJpekPaR7WpyCuO7E+mm7CW3uaAtBPnJ9Z/TwGwLtguM
         wRD/ELq/JFSHx7WhEhMgKGq+ctQRmLLjE4SV5lx3Pxvu3D6uHg8qjzvRBEjXOMCorKI+
         NUkrs7QEMfeA3KC+d2/jgi2GsOijEHRQdCO1ZYwjvgVE/WhSqw2iuxmCHbXhdpnkKOYu
         xR9SG3bqAJ5db/XACOvnY0vGsg7oEE0gSBvSlwacqoEDKcmKd8KRpJiO7iF6+LXtDcdi
         dmzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2RYBChfVyJm6suybqc1j1vEVnTJpwLge2mx7iOvnqyj2KlkUbqkX3AySOmYe6GNUft2z8yeglZMusrARdyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+5PJ/bgo0/NIG3UqjSy32+Fr5AOsO4oomHq+yqEzz95FJd4Qv
	ZLeMydf3/rUiQ0F2QyJfW4KwkW7CRJH72mAOaBDtdNne/5PvV5xw
X-Gm-Gg: ASbGncuFcO4d3TEs/alC5p6pBNh9bEJTEjBhR5zXjt0BHpxW/ON45+oI/5U9ewPVMOW
	ld8yZh50X8IuGI8RBUHuHMhTJx/MAbpEJTbQ2nCJ5UDYhwxT8WZ4fYnHa7LXZjKy684/UU3MBfP
	vgVn6EwmJtG5UYg0RXu2lFBZXtKcJ+zaAsjIKB6zHi8s3igN3bmN6aU1O5zAIAtfNz8ToKCM0Px
	Ghdn2rSkxiyofKitqt+BsDyVRA395DSEH8VQJCxQFPhyCsTs1IJ3cfYtPnIst60c0ddvlrkS8d9
	nHM57ks=
X-Google-Smtp-Source: AGHT+IGsjn2HsD9B470GSaZ7/WuS4a1ciiqbzWwWUR77XR0Zla03DKiQ+x82aV6yWtJ1LuxULtoYsw==
X-Received: by 2002:a05:6a00:b46:b0:71e:4786:98ee with SMTP id d2e1a72fcca58-7290c2702e3mr2257553b3a.21.1734068967116;
        Thu, 12 Dec 2024 21:49:27 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm8166032b3a.32.2024.12.12.21.49.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Dec 2024 21:49:26 -0800 (PST)
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
	Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 7/7] fs: Use %pTN to print task name
Date: Fri, 13 Dec 2024 13:49:18 +0800
Message-Id: <20241213054918.56441-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_214928_267095_EE890E0C 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Fasheh <mark@fasheh.com>
Cc: Joel Becker <jlbec@evilplan.org>
Cc: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/cluster/netdebug.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/cluster/netdebug.c b/fs/ocfs2/cluster/netdebug.c
index bc27301eab6d..039d99f951ea 100644
--- a/fs/ocfs2/cluster/netdebug.c
+++ b/fs/ocfs2/cluster/netdebug.c
@@ -122,11 +122,10 @@ static int nst_seq_show(struct seq_file *seq, void *v)
 	send = ktime_to_us(ktime_sub(now, nst->st_send_time));
 	status = ktime_to_us(ktime_sub(now, nst->st_status_time));
 
-	/* get_task_comm isn't exported.  oh well. */
 	seq_printf(seq, "%p:\n"
 		   "  pid:          %lu\n"
 		   "  tgid:         %lu\n"
-		   "  process name: %s\n"
+		   "  process name: %pTN\n"
 		   "  node:         %u\n"
 		   "  sc:           %p\n"
 		   "  message id:   %d\n"
@@ -137,7 +136,7 @@ static int nst_seq_show(struct seq_file *seq, void *v)
 		   "  wait start:   %lld usecs ago\n",
 		   nst, (unsigned long)task_pid_nr(nst->st_task),
 		   (unsigned long)nst->st_task->tgid,
-		   nst->st_task->comm, nst->st_node,
+		   nst->st_task, nst->st_node,
 		   nst->st_sc, nst->st_id, nst->st_msg_type,
 		   nst->st_msg_key,
 		   (long long)sock,
-- 
2.43.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
