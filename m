Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232FAE7718B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2024 02:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3zFTBOPyyGaHPZf5i5QRAngCJFQYubQ0u8sCm9v5Z4=; b=nCZLRZhBEhm3b3
	4IHm3zqmyBbMqiaWnREy7kSy8KJ65hOtolIqeM/WZUQF28o9zVjuUeubS0wQuyXviLuBZIIg7ACZO
	LGsUjh5iAyANGtJ4AlYbzbzLVQsmgHNRHDStCwiI4N9tOxN4cd2Ss0n32lz6a7kpVI9kJNLFqBd2+
	2MsDWy51p3E/H7uXqBLpkDMuQVfPtFJj0GgLTTPqCVEBlb8fbBdihPsbNduwLg3rvCb3SL6Q7wpXn
	dwhC5bjhSVmmVF3aLV7USWJG590gzc7x4QcXtBUxoRGa2o53JL909ayAeKUSejg51Gp+DgEXhTZG1
	F0n3UEXx55p5gDZExmzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6Nn-00000000cPx-3giN;
	Thu, 19 Dec 2024 02:35:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6Nl-00000000cO5-34xI
	for linux-snps-arc@lists.infradead.org;
	Thu, 19 Dec 2024 02:35:22 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-725c86bbae7so277227b3a.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 18 Dec 2024 18:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734575720; x=1735180520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35FnTfH4WG+K4PY792luJMCXMpwCP4Hox12oxUuAxYU=;
        b=k4C/6GQ6oFuycPvMeoD/ea2jREIUs5GYcPU1DqxMWliuJ4yakCoSpOVgLtpApGNmhd
         360c39JUMUKJY3zOZoAS+2Jj2srBiJkmC08SeGd4cK69gQ8stUrFB9WrnNlcSQH0fUxU
         zsQbSi/GBwxkSSf/OEHjL8m7BviD3msB/ez+6qcLEIHMhY0XpIC3TKQKcMj2zOsIHE7s
         CFrEB9pzODr3rt6yRryJamZidy4+o+ldOq1c25bp3kwfXUGztQIlLYGLZ2IxS3AAtHWH
         daPEYmq73GyqZUSX3VGAL6N24brlX38Wqkj+gvboWdHL2oSdJL80z3XgdP92rD071OfY
         /MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734575720; x=1735180520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35FnTfH4WG+K4PY792luJMCXMpwCP4Hox12oxUuAxYU=;
        b=humtpqa1Vip7quc+s0hmbiNTaG6TLBy7uunSGYVGT0Qh8DWgWNkl0iIRow+f03uFoY
         +SheF3iHk6XKU3u5lqX45cOZprwGj9dakYof4tTCBOrxz4xshdKlFIpSM2/xDILNkF8k
         caqcD4gB5eJo61G9zj9/Iow6OpHtxdoJf5LkFmvl3VEOKIjUFq9wMuOA+RunDwxazM8y
         3xmCougitdvuyEXFdSYBI8oF82biPDEh9SC8mM4tm4VfUJ/XjiucqaDS0kWgf7aHqvYF
         HeE327s5XZhJfAvAtjuIdnsOb2IRaiMPRlHmEHfj1QMC8mylt/FqNXc+AVSXN7a6FFBh
         SNIg==
X-Forwarded-Encrypted: i=1; AJvYcCWNrz4JjcdUtpHOAZiR4d7K/laRQczsBlmFG//+Pxi7/ZKojsgN+vkRIgsNvvJNe4g8P4G4CBaEdVGINpDZ6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrtfbZCG0xA5I8jhQsp8iwqxIovbZzmZvX9ZpYrPMLvCh9wUeg
	77I8vjhJdo/gdNHVbJtiUXDBAyrrkajmiXIJbz2u5kOWatMlYq/h
X-Gm-Gg: ASbGncvLFGlT9fy9TMrSWuqL7P0Xeflv6h6Ctv0nF1RzECfOTWj9W7uQFi17PzjzvVK
	WWEDsOTVT9ZJETD4lgHGX66XNesPYAklu5TGbj5K4p01u929cYLaNBx7jfT/E6dPLIWYQyYjS5Q
	rMYh8gBNjAVpH9JoESsPUSgOy5CPnh4Jg+arhMGY9ycTrA0SQ36+eD2CrMLT3RPu/5//eOnvGzn
	sNjzE9fGAUQmjbVv+Ta4aZhz7kvCJkDSPN1vrGkVJOxFZWBUwSHlUEZTgwWxpdU0D8CCpJX3SUF
	K+YKp/Q=
X-Google-Smtp-Source: AGHT+IEYa8/cPCrPUtV+8BluujgYPFlXKrKcInk+YdaLokr+l/jazm3QEi9WUGXKVKTvc9yKVja0nA==
X-Received: by 2002:a05:6a00:9096:b0:725:e37d:cd35 with SMTP id d2e1a72fcca58-72a8d2c2269mr8262629b3a.18.1734575720422;
        Wed, 18 Dec 2024 18:35:20 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b821da83sm142163a12.40.2024.12.18.18.35.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Dec 2024 18:35:20 -0800 (PST)
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
	Paul Moore <paul@paul-moore.com>,
	Kees Cook <kees@kernel.org>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>
Subject: [PATCH v2 4/5] security: Remove get_task_comm() and print task comm directly
Date: Thu, 19 Dec 2024 10:34:51 +0800
Message-Id: <20241219023452.69907-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241219023452.69907-1-laoar.shao@gmail.com>
References: <20241219023452.69907-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_183521_770608_7EC9548F 
X-CRM114-Status: UNSURE (   9.44  )
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
Reviewed-by: Paul Moore <paul@paul-moore.com>
Acked-by: Kees Cook <kees@kernel.org>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
---
 security/yama/yama_lsm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index e1a5e13ea269..1a2d02fee09b 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -76,7 +76,6 @@ static void report_access(const char *access, struct task_struct *target,
 				struct task_struct *agent)
 {
 	struct access_report_info *info;
-	char agent_comm[sizeof(agent->comm)];
 
 	assert_spin_locked(&target->alloc_lock); /* for target->comm */
 
@@ -86,8 +85,7 @@ static void report_access(const char *access, struct task_struct *target,
 		 */
 		pr_notice_ratelimited(
 		    "ptrace %s of \"%s\"[%d] was attempted by \"%s\"[%d]\n",
-		    access, target->comm, target->pid,
-		    get_task_comm(agent_comm, agent), agent->pid);
+		    access, target->comm, target->pid, agent->comm, agent->pid);
 		return;
 	}
 
-- 
2.43.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
