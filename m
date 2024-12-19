Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD03E77188
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2024 02:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwbesRAgw0mIjvgv399aOdPG63EM+1AhK/bO8qva1sg=; b=luvP6YjlMqrL4/
	qN2e5jYZmx1nDruvfhuljNh4RB8NHpLXdQ2NVo5DP+RNKvIa5zL3nhWysRlzAmCbhbvmhpJ3sd1iU
	Bbc+oDVwKaStsq0JMj2j1HVzRbjeePnoHj/XYyo/1DfnX/NO5T5ONByeS8b7rxEvNKgbP/njdNurb
	hrcbjR2GZoCA6qYQJShE2srrfu/K8Fokg/w+ahRup/BPLhmBWKSVCi4FfGjkWyc2knglsADQN4v3+
	2UheQy2rnu8lDidQzwAj9HZXVUEvhoseQPe3JsuFc/1K1DT0EEkzKdEYtk7OZfs5+hKjQ4KoUmWcI
	7zs1qM19qKijD+FAk3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6Nd-00000000cKc-3oDN;
	Thu, 19 Dec 2024 02:35:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6Nb-00000000cJW-3SXo
	for linux-snps-arc@lists.infradead.org;
	Thu, 19 Dec 2024 02:35:12 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-72739105e02so359857b3a.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 18 Dec 2024 18:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734575711; x=1735180511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFcOX4O91tQFD6muydW9g9dtgYf4vZjGzF6jEGHBeGo=;
        b=cXvTDpunHzgRViKVuwMt/WmiqidZImhjrBc0jsqi62pjndQze0E36NM5zgZ42Mj+0S
         dgLR/wmtBJ5XzyYKIzKXYrTwUXO8HUknK1EdaYfCSWC/OR4ZnfxFO8IY2bn6lL6vcyDn
         4GERqkKd/XruH1NGLAqNc3rF7GreaZxFFPeM8dizA3lc5bIYcO06m3WZRX1Qilvi8OQz
         YogeLrxyZC52ZvxaQTEfD7W43qFApmshwQ1d7EuhH1jfjfJqluEHmYHaX7Wseo/CZlrn
         P+eEA/er6nxhThWlh11jo0XHrmJ3Isva3diBSGjb1mgkmNaSbNysegvEXqLbHrDCstvw
         nR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734575711; x=1735180511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFcOX4O91tQFD6muydW9g9dtgYf4vZjGzF6jEGHBeGo=;
        b=BFRgbgjqmn6ByGd2531ulTfeqoj7l0UohH1Q4UIqZnJYED5wK5j3Dk7szLbfVT8191
         7+Cf+pRHVbe7CUd9Ql8i3mN3odTwxujeeKUEfvVEQhiX3pfMnZzEEkcOESNwLBgY3Bff
         kYi+Z0ZbMK68Sf5WxaU491OmdWy54BJU198z5eBa/JI1iijimCyIdP5l5idRGbxUGn2H
         WFoJazCcZbrJmR32rsaqSUfC3CcjNfKlVgFoh7Y1Zm6Uelk5CUbv1cRLwUj5BbJyiHPu
         Kmc7IYagP0CsNfpaTsNBZDx9pCUR4LWEHI6XrcE5DMxCCzM2DQiuyfxkgwF7ukGyMkW2
         d4iA==
X-Forwarded-Encrypted: i=1; AJvYcCXGSW6OhSrDyrKUDbbVN3V3RA6HKaaO/DxyJ/tASmzGFVA419ybMFc+RA/UMHdAqU6Df98ygK7lTG8d8tWfLg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7QjBI9DwcBA5n1cnSkpCFgUzh0p6ihLFfqCfrGJFbOjzM/ir8
	lV8Ag9sqzhfe8DBx4jmQlz5m+d8kyohaH2FwR2hOYsmBZW86CFWy
X-Gm-Gg: ASbGnctGZDja1PkmkzTiS05DFU8vjVOu3nrH8QTJE49N/ruukYh71mZC71FAx4G0Erp
	XmyboUHZi6+lHcWpSAen/VXTgeWNShILwgn6px2Vqm23u2EVqt+VskC/uvOFqQvdUCmO2QVxNP6
	LyoDgFEu8gYrnSTDWuqlxPH1CXhQwAvlDBL46UzqJk+Hl/yFyt80qFE7H2VWM5jDrpxVa75Pn7K
	HagF5uwr25NtjEnQQj9d3VoqY0lpJ3k/Rza1DNe+/iyADEvdLlUm2Ud4hUGqi617jArR623QVg2
	y8UPooQ=
X-Google-Smtp-Source: AGHT+IF8uDHPAeHRKoSWXDpZOfxN83+9I3jRkG5wW7qXuv+87XI+9vIxsP70Tcc6kEOf0TdmQfwRSg==
X-Received: by 2002:a05:6a20:c6c2:b0:1e1:ca25:8da3 with SMTP id adf61e73a8af0-1e5b4820f26mr9200947637.20.1734575711218;
        Wed, 18 Dec 2024 18:35:11 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b821da83sm142163a12.40.2024.12.18.18.35.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Dec 2024 18:35:10 -0800 (PST)
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
	Vineet Gupta <vgupta@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 2/5] arch: Remove get_task_comm() and print task comm directly
Date: Thu, 19 Dec 2024 10:34:49 +0800
Message-Id: <20241219023452.69907-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241219023452.69907-1-laoar.shao@gmail.com>
References: <20241219023452.69907-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_183511_904218_BE4B744E 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/arc/kernel/unaligned.c | 5 ++---
 arch/x86/kernel/vm86_32.c   | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arc/kernel/unaligned.c b/arch/arc/kernel/unaligned.c
index d2f5ceaaed1b..3b2d8b1bd271 100644
--- a/arch/arc/kernel/unaligned.c
+++ b/arch/arc/kernel/unaligned.c
@@ -200,7 +200,6 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
 		     struct callee_regs *cregs)
 {
 	struct disasm_state state;
-	char buf[TASK_COMM_LEN];
 
 	/* handle user mode only and only if enabled by sysadmin */
 	if (!user_mode(regs) || !unaligned_enabled)
@@ -212,11 +211,11 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
 			     " performance significantly\n. To enable further"
 			     " logging of such instances, please \n"
 			     " echo 0 > /proc/sys/kernel/ignore-unaligned-usertrap\n",
-			     get_task_comm(buf, current), task_pid_nr(current));
+			     current->comm, task_pid_nr(current));
 	} else {
 		/* Add rate limiting if it gets down to it */
 		pr_warn("%s(%d): unaligned access to/from 0x%lx by PC: 0x%lx\n",
-			get_task_comm(buf, current), task_pid_nr(current),
+			current->comm, task_pid_nr(current),
 			address, regs->ret);
 
 	}
diff --git a/arch/x86/kernel/vm86_32.c b/arch/x86/kernel/vm86_32.c
index e9e803a4d44c..e6cc84143f3e 100644
--- a/arch/x86/kernel/vm86_32.c
+++ b/arch/x86/kernel/vm86_32.c
@@ -246,9 +246,8 @@ static long do_sys_vm86(struct vm86plus_struct __user *user_vm86, bool plus)
 
 	/* VM86_SCREEN_BITMAP had numerous bugs and appears to have no users. */
 	if (v.flags & VM86_SCREEN_BITMAP) {
-		char comm[TASK_COMM_LEN];
-
-		pr_info_once("vm86: '%s' uses VM86_SCREEN_BITMAP, which is no longer supported\n", get_task_comm(comm, current));
+		pr_info_once("vm86: '%s' uses VM86_SCREEN_BITMAP, which is no longer supported\n",
+			     current->comm);
 		return -EINVAL;
 	}
 
-- 
2.43.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
