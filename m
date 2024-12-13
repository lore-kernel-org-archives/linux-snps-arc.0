Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF22CE77180
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 05:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C64/kVrC+K9p6pt2edRIBSJARGAEtKrovTh4npF3WtU=; b=ubFk3PHEv1Unja
	7C9yoQjpAabihudVAi9UrVMhrIdWv2tBe4elFSq+1EgrBmKfXkb+o6w4AgbINWON8TxHh0vMvGd4v
	oHrUniaE/B27dqQf/OTwoFMaAQe5JEeHZbTf/JS3tjEUNyak9bBY/lwH4FAAZnh44X1u/BfBNb1Fb
	ESdWcmReQ060w5M6ePUTnyP1jdcqTIMkVrx8WDzwwB5/sHLdmAsyvAH62gxJXmOWTTS2YXcrQZF7G
	7KPXGFZTq/5LzzrXZKgXi8hs9qcpihcW2FycdURNJeTYLHXmsTwww6EEnA/SdjbQGMBAANd8sYzWK
	ZT1SWCfwLVOnC9KWXl3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyVr-00000002nWM-326j;
	Fri, 13 Dec 2024 05:46:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyVo-00000002nV8-3svz
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 05:46:54 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-216634dd574so8843915ad.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Dec 2024 21:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734068812; x=1734673612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq/q3oQ+1coBzSyYiu7PIQ9YY0FE8S8wlVnD6GFmf1s=;
        b=is6tD9rkA7lZKKLHmje0e0EkaIGinhW3NxvfHapfEwd1Q5EoWltSETL6q/1qrCcwK3
         ftfbO/le7YNqKdupOy9soTIykIv0WQyUykTn2F/VH9NCO1NDQ8LCyGuAT4P+p5DuDr69
         jU7trn4du42iywKNxW/6o7Y1M8nSladsZBKqoYHR2bk0rdZ2WvC9XboeERTpKDIhWOLO
         EJdO+DGP/TfgOsdr1netnjvE4MxLhqvwo0qRNzNtD3WvL2XSpeb00xJMt6SNxFGkgOTd
         Zz1e8SdJQSim+fzcJcLyn4GIq3iB8kqPPVIbIHg7B2KYcJSYc0gkOjf+YFXsVeZ1Q2H5
         +uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734068812; x=1734673612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yq/q3oQ+1coBzSyYiu7PIQ9YY0FE8S8wlVnD6GFmf1s=;
        b=lbvhcIkLc23ffbU7CthUxdrHgW/tfONZlis5IttEdxDLfaSjLbY2wHYT6mRuXjfu8J
         WZfwB9XiXXd+SITe58Cb1OtzbjtQSjeZLh24uL+wq9NJgweMiv1i4JG2ZF3fIIeQVTkO
         M08WGxPJR0mb7NPXSTUbMB2nnq+vqzjAReeoe+NzkzZqtU9XnFKQDPH1dYSuMyP2B915
         9DPByUSJ2cFa98TMcAyQbXLRcPg+Mj8CZBn5xQwPmkjnde2fYP4LsbaEm+tEE4xGLxmZ
         8lBg7iHoZpjgyhQZDvjgTJ3FciS4LfRYpoAw0eOZIXaxDsX5/oV+JOyCRWu7YwLb4ERN
         67aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXowTtZFUkF1sDK7oQ1G0j7KWQlfUpbCAlRt189xWNS4o5sV+/cj9ZrKYHkjxNQp53h+GAL10UStikTWKabHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLFKz3avBg19waTV9hdtHxosTHPrVYjP1Gdu4UDlV5cPniVhHF
	NuH0EApkHaFU012CN10TZHPddg2YTUhmoyKLJRmFe37QyfJALWHd6DSeD+5cX6U=
X-Gm-Gg: ASbGncvHGzl9F8LJhfM7ozD8kOK5Yau0/zB6gQyuEAZaRx0vxMC5ruY+N5lTBicmJxX
	pgVrPwJO716/hG7gLlKi8jPH2/qz6UF2L8oqBeDfwdSOCJAhpr9JJj/wUlZvHZVCw956CZd8EN9
	7lqP9maN1uJQOBRAirL8YX1RECo/L7+44SRM1Xi9fmJxzRXuwv9JHaP7hg7pr68iQrioT0yWrw/
	OXFOp33D/DZdrU3igtxAnTQkUJZk0ochdxbfCDFT2ohm6N6NEmyZRtCJp5bovR3KdsCuKAfRtTZ
	jatovl8=
X-Google-Smtp-Source: AGHT+IFWBnsyszL3fKLErMwBwi/nv5YJk8bNHSLutoorKV6bDApMEi8hBMM4652Yq5VqnH7LBX6qQg==
X-Received: by 2002:a17:903:2a8d:b0:215:a3e4:d251 with SMTP id d9443c01a7336-2189298bb21mr20543965ad.6.1734068811964;
        Thu, 12 Dec 2024 21:46:51 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.46.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Dec 2024 21:46:51 -0800 (PST)
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
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 1/7] vsprintf: Add %pTN to print task name
Date: Fri, 13 Dec 2024 13:46:04 +0800
Message-Id: <20241213054610.55843-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20241213054610.55843-1-laoar.shao@gmail.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_214652_963458_B35F2784 
X-CRM114-Status: GOOD (  13.16  )
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

Since the task->comm is guaranteed to be NUL-ternimated, we can print it
directly. Add a new vsnprintf format specifier "%pTN" to print task comm,
where 'p' represents the task Pointer, 'T' stands for Task, and 'N' denots
Name. With this abstraction, the user no longer needs to care about
retrieving task name.

checkpatch.pl is updated accordingly.

Link: https://lore.kernel.org/bpf/CAHk-=wgqrwFXK-CO8-V4fwUh5ymnUZ=wJnFyufV1dM9rC1t3Lg@mail.gmail.com
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andy Whitcroft <apw@canonical.com>
Cc: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 lib/vsprintf.c        | 18 ++++++++++++++++++
 scripts/checkpatch.pl |  6 ++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 6ac02bbb7df1..bb1018d79655 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2273,6 +2273,17 @@ char *resource_or_range(const char *fmt, char *buf, char *end, void *ptr,
 	return resource_string(buf, end, ptr, spec, fmt);
 }
 
+static noinline_for_stack
+char *task_name_string(char *buf, char *end, struct task_struct *p,
+		       struct printf_spec spec)
+{
+	if (check_pointer(&buf, end, p, spec))
+		return buf;
+
+	buf = string(buf, end, p->comm, spec);
+	return buf;
+}
+
 int __init no_hash_pointers_enable(char *str)
 {
 	if (no_hash_pointers)
@@ -2525,6 +2536,13 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		default:
 			return error_string(buf, end, "(einval)", spec);
 		}
+	case 'T':
+		switch (fmt[1]) {
+		case 'N':
+			return task_name_string(buf, end, ptr, spec);
+		default:
+			return error_string(buf, end, "(einval)", spec);
+		}
 	default:
 		return default_pointer(buf, end, ptr, spec);
 	}
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76..fe0d80f55ce8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6908,11 +6908,13 @@ sub process {
 					$specifier = $1;
 					$extension = $2;
 					$qualifier = $3;
-					if ($extension !~ /[4SsBKRraEehMmIiUDdgVCbGNOxtf]/ ||
+					if ($extension !~ /[4SsBKRraEehMmIiUDdgVCbGNOxtfT]/ ||
 					    ($extension eq "f" &&
 					     defined $qualifier && $qualifier !~ /^w/) ||
 					    ($extension eq "4" &&
-					     defined $qualifier && $qualifier !~ /^cc/)) {
+					     defined $qualifier && $qualifier !~ /^cc/) ||
+					    ($extension eq "T" &&
+					     defined $qualifier && $qualifier ne "N")) {
 						$bad_specifier = $specifier;
 						last;
 					}
-- 
2.43.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
