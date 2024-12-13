Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF446E7717D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 05:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXf5Vf962eXI0Es+mScyqMbIgq3R4+VXArcbjZmvvOM=; b=RntZm0ZJfjxSo+
	7FjEwTj+t5f6Fn3HonZOwUdW/qIslHST9WQHOYW8b3oVoWmU03SXWezfxUhOqhzCBDpt8eVVMzCb+
	WNeiSMnr8J92VnDFPyi29MqDv9sIx3qRPA95erJs3Gs6EWAGsdUoxhNgiSDqR/HK2QEjr3GL6NTJm
	xgsFdgl82hV/KrTeP3iaKDxZeZe2F3NZ4LEV7DnvuI5oLtg96OqG25Vv+ohFlOwo80b1B4j4S7tSh
	ZAyUvTzcLv2nQZpkf+6h5PA4zbuqHULauxYvHsIlrBp1bFu0469wPFl57m8cEAB36L9dr9PxqYcST
	/xDuB0fPGZxXN+3pFUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyW6-00000002ndK-2OUA;
	Fri, 13 Dec 2024 05:47:10 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyW3-00000002nc9-45H4
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 05:47:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2166651f752so14776075ad.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Dec 2024 21:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734068827; x=1734673627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmVT0W96xTTbgIHaje9qHPh+sH+dkYFHuEVe3qXraIA=;
        b=PPlhrsrI9DgnxH4RikZLrBxDCg82/7G+bDbE+AhFrnPwk5ukvmdTpCzbhw03gvP/DO
         IqpVBEfS/395Vn8xUvJzPF9VjuW0HYXU1lUxhMPP07xU64FAjFSId1Qg7SAbEne/T2BD
         nx/yMjAlA3ndSyrOUD1j/+vYeDR2vZkieODKYgFM2itGB6ax4Yv6XC3MXJYGkDhmk/wV
         z7gV4m00Frh6/dsEzE6R+lhpcdMRXIUybT3mgXGUepjnzsR9AfnTOu62AkirTycwLPQW
         uqbSoXE3/IxiKxgROahkElDL50hNQcUBb4IkJqeUQhrCevVtD/ZVCBuA4HlBGsUJ5+AG
         MQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734068827; x=1734673627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmVT0W96xTTbgIHaje9qHPh+sH+dkYFHuEVe3qXraIA=;
        b=FTDcsbbEY5p2knvhnSqUYXcuH/g2I0lqEH+1YTLnOpQtTPMbKjBBOLyv3grM2dSJo1
         zaI4bEFZjp0sRpN5Do8LNjp2tnefL1eCebvVQ9iJHYoqQ4yIdXd505fSGdxK483GaoZ0
         8w84LnenaQhTbEy3J77+tJO5NW8pm+PC7U8kLH0OomBJCt7SdU4+z2b2MjyDy7qWwLHw
         vR3oChwI84PRwGqqhis2uK48JojLKy2/3SmiZolg6dglh2wACUh8UNbq3GmdPBeKo07c
         0biIxlST5KCa45e37iSre5PJJDXRume1S4oiG6vjuHUFxp2SeCngSCTDJMi34m/6AFtF
         /LXg==
X-Forwarded-Encrypted: i=1; AJvYcCW+UgkV526fctSx2lboC0S+ZKPgngydbt67RsZ/fEA8Vbc6Nh5EnlqCVRWKMZvDpXXb20MNsIQkgdnofXb/Bw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3DojFw/E1QyFwu9mnfsc4u76N6fqrVqWD38w4vHfmvWInWlPX
	agqMy0SfNu5btTsxWGilovXBfGSUEhQ+lBy0852r8AnwQK8VyHs7
X-Gm-Gg: ASbGncu1Ic61+XeM7/n3Zn55SoajOgyknOx0kgvQKHQqV+FSi0NhlqFU/IT9AYd5ctq
	CBwbI/WND7w5yKBI2zPwaRsAutjrq3Z3i7Qt7XHtPM1ZzaP7TItEq7TDTvDdid6psXrNOmBei0u
	Wz+x2yM+++9rO+8uFTeqXhwHJFuhVga1P66zD7JyKBuTEiUsSNjOE2ViCW5qdxeMzWAR/NsQFBn
	pulRNjDT4Z2Ebf+nFem93L1e3XDaqgsmAUbhKWTioyGW/vHzRKCxG9S0pzgmywLMSqzn0LR1hG9
	TQotY5c=
X-Google-Smtp-Source: AGHT+IGGw/OV/ScatMLc+XWrd5qwOO8iHzpYdxpzWycga8KUsVtQ1P1ntSP55wYL5SQs/JpC5cq7/g==
X-Received: by 2002:a17:902:d484:b0:215:431f:268f with SMTP id d9443c01a7336-21892999536mr21105555ad.10.1734068827157;
        Thu, 12 Dec 2024 21:47:07 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.47.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Dec 2024 21:47:06 -0800 (PST)
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
	Vineet Gupta <vgupta@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 3/7] arch: Replace get_task_comm() with %pTN
Date: Fri, 13 Dec 2024 13:46:06 +0800
Message-Id: <20241213054610.55843-4-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241213054610.55843-1-laoar.shao@gmail.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_214708_011504_789F9354 
X-CRM114-Status: GOOD (  13.34  )
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
 arch/arc/kernel/unaligned.c | 9 ++++-----
 arch/x86/kernel/vm86_32.c   | 5 ++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arc/kernel/unaligned.c b/arch/arc/kernel/unaligned.c
index d2f5ceaaed1b..fb8e995823e3 100644
--- a/arch/arc/kernel/unaligned.c
+++ b/arch/arc/kernel/unaligned.c
@@ -200,23 +200,22 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
 		     struct callee_regs *cregs)
 {
 	struct disasm_state state;
-	char buf[TASK_COMM_LEN];
 
 	/* handle user mode only and only if enabled by sysadmin */
 	if (!user_mode(regs) || !unaligned_enabled)
 		return 1;
 
 	if (no_unaligned_warning) {
-		pr_warn_once("%s(%d) made unaligned access which was emulated"
+		pr_warn_once("%pTN(%d) made unaligned access which was emulated"
 			     " by kernel assist\n. This can degrade application"
 			     " performance significantly\n. To enable further"
 			     " logging of such instances, please \n"
 			     " echo 0 > /proc/sys/kernel/ignore-unaligned-usertrap\n",
-			     get_task_comm(buf, current), task_pid_nr(current));
+			     current, task_pid_nr(current));
 	} else {
 		/* Add rate limiting if it gets down to it */
-		pr_warn("%s(%d): unaligned access to/from 0x%lx by PC: 0x%lx\n",
-			get_task_comm(buf, current), task_pid_nr(current),
+		pr_warn("%pTN(%d): unaligned access to/from 0x%lx by PC: 0x%lx\n",
+			current, task_pid_nr(current),
 			address, regs->ret);
 
 	}
diff --git a/arch/x86/kernel/vm86_32.c b/arch/x86/kernel/vm86_32.c
index e9e803a4d44c..1f55d5c2628d 100644
--- a/arch/x86/kernel/vm86_32.c
+++ b/arch/x86/kernel/vm86_32.c
@@ -246,9 +246,8 @@ static long do_sys_vm86(struct vm86plus_struct __user *user_vm86, bool plus)
 
 	/* VM86_SCREEN_BITMAP had numerous bugs and appears to have no users. */
 	if (v.flags & VM86_SCREEN_BITMAP) {
-		char comm[TASK_COMM_LEN];
-
-		pr_info_once("vm86: '%s' uses VM86_SCREEN_BITMAP, which is no longer supported\n", get_task_comm(comm, current));
+		pr_info_once("vm86: '%pTN' uses VM86_SCREEN_BITMAP, which is no longer supported\n",
+			     current);
 		return -EINVAL;
 	}
 
-- 
2.43.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
