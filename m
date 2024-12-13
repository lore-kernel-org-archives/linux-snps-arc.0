Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24747E7717D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 05:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOvrvnTdGXAz39DpX11gfCrSjSe1LuD90W4HaGGnUyQ=; b=XGTaf7ruD7jMhR
	LbwFJB1M02OPBf5lyvaSjaS/2jGvLY9AvnU3BrjlnXFqtwfoi6QPe2jYYPsuC90LH+LT5mIaPGj91
	bX5NiU90IQD9G6D3qP0IkOLGnPqtObzAXnYg6o+/fgHFhPIdp0T2SHZdgFj7S3nbEnUNDrKFBElRz
	cuUDWm/hA1LtA4Vq2XuK6SpuCcm3+zF2JWroHejYNxAQA5Z780LtnMGL3kusxvdW77s5OcOcHG7Ak
	nKfA4LY92AYgz1SZbV0UPmq6XJbjjT8kSKdenlM/dIXw+M4dnLwknygcAIo6c0TFcYhk+qGh/ag5t
	422fx+1Yw9IzjysW5qGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyWI-00000002ni9-3evm;
	Fri, 13 Dec 2024 05:47:22 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyWH-00000002nhZ-0ogL
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 05:47:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-216395e151bso9166715ad.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Dec 2024 21:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734068840; x=1734673640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQpRmGydqcdMOxZRzmLm98GnY2wtgMQ5ZotZeI2M2YQ=;
        b=dcXXbmoFZ3JFR2tz/j15/26tOEZBEwjsFAM4eWqW0/7N9TPQ3MxQQvAA7ZolVUKw/o
         EV3G/2sxMQLJ+Ap/mO5Th0iewlZBshNjYMSm94ub4Y3pKQhrOoGItce7yah/hPCDLi5p
         +fbyzAjrMUmT/3mMoXILVOq9ULJr+L+s5E740NmF6HYslGJtjbA2yTpi5Jn63pNqu2+0
         7iTukfaipyW59kdC1X1qqnSSvy+jJxixbj8e8OSVL17hNmYUdBXW4bVMacQuFp3gJTce
         ykDrpyBKL5xXQ1SlwEAPEwGeIXIbgwafOhMGpeMNmkQptqgzcJcicet0nKplmGzmc1lo
         /F1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734068840; x=1734673640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQpRmGydqcdMOxZRzmLm98GnY2wtgMQ5ZotZeI2M2YQ=;
        b=e3MdNqZG+LUb5dmarJSj6SdMOrisoma5usdcRjF8KrIHBl54wJwwq4EF3YpVZJqutm
         mS8GBgL6KrnMudbGNOZqq2wQUQEbaly3c8SeYrvZrULG6NLnNkyPFrKUvzTI5LEF2JiY
         EnarDm/d3/LBwWOxafgKeG6s4opSOVXi6ciXEODarM6ypoHtfxCKYTguA6sTpavBPccC
         M0SfsRAxs0oWDE3PBNsfFQKZiw2a+O/FgsdjZ6wvUsfL9LF4jm0MEScHJznsp+vM6gU3
         VUl2wWDdwT/mecIaPkdR30HS9oqpga08vXil+0UbAgmcOOU2+wnfoDfQPJ0pJydGUzN9
         EyEA==
X-Forwarded-Encrypted: i=1; AJvYcCXvZgO21dj5Qt7vfujc80NI+lOuSjBdnWitb+yeLzIONzBHfIUJahSImW8OjticRKGnprj9/fGyvi5K9n1Imw==@lists.infradead.org
X-Gm-Message-State: AOJu0YygutYrjnjZA1KJiuLUh2DQvlteyIIgZXktembIVJYEnrUKOQ32
	FNJzzZRPXZ2wgXVga2iNwSSoBjrQCaDslE6pisHkbGJRXori9Jhi
X-Gm-Gg: ASbGncsKnOcQD3N7MCyRg6P/Bc3iPuybSD2kmbDEIS9idsAfEO1OF0/xzlyd71IvZmd
	ixQSwSLQxc/F0L71UxGdOzGDtjuOiWf/rI74xcGiAXMx2R7rLvKT0BA482g2hDTDDvQ0eBATmr4
	VC+g6jY3SMH/RJ94zrODAk5n2iazvuZbdIKsn3gJrfVdDxTFJnx5v97COU8wGYWDHLn/uvTk5X2
	Vdmq8+JVM2DNeElgGUnHzTIGNF9pjWdmr/2Q8C5sQO33OpmfkCWSZFw0YCuWqaWQwTCEnB1ZLVO
	WNgEDpc=
X-Google-Smtp-Source: AGHT+IGy5lWO5x7q/SCrL+dH9NQnv1Rp0u2NkmqEtY14rjHQEczQdhUClmCmrxdf9miFcIspK1e1uA==
X-Received: by 2002:a17:902:d506:b0:215:9c06:272a with SMTP id d9443c01a7336-2178c872102mr82765085ad.24.1734068840305;
        Thu, 12 Dec 2024 21:47:20 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.47.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Dec 2024 21:47:19 -0800 (PST)
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
	Kees Cook <kees@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>
Subject: [PATCH 5/7] security: Replace get_task_comm() with %pTN
Date: Fri, 13 Dec 2024 13:46:08 +0800
Message-Id: <20241213054610.55843-6-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241213054610.55843-1-laoar.shao@gmail.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_214721_228910_30C9FAA8 
X-CRM114-Status: UNSURE (   8.76  )
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
Cc: Kees Cook <kees@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>
---
 security/yama/yama_lsm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index e1a5e13ea269..4bdfa51ea6fd 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -76,7 +76,6 @@ static void report_access(const char *access, struct task_struct *target,
 				struct task_struct *agent)
 {
 	struct access_report_info *info;
-	char agent_comm[sizeof(agent->comm)];
 
 	assert_spin_locked(&target->alloc_lock); /* for target->comm */
 
@@ -85,9 +84,8 @@ static void report_access(const char *access, struct task_struct *target,
 		 * Imagine angry ranting about procfs here.
 		 */
 		pr_notice_ratelimited(
-		    "ptrace %s of \"%s\"[%d] was attempted by \"%s\"[%d]\n",
-		    access, target->comm, target->pid,
-		    get_task_comm(agent_comm, agent), agent->pid);
+		    "ptrace %s of \"%pTN\"[%d] was attempted by \"%pTN\"[%d]\n",
+		    access, target, target->pid, agent, agent->pid);
 		return;
 	}
 
-- 
2.43.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
