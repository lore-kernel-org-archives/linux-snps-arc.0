Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9ACE77180
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 05:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WpOPzKVPIePG5JSE/n88q64rr00nqtxBPjiPl6Ws/hE=; b=AHW3ceHZzwX5Iw
	sYlv5y4ViVTZncmgoBqaPEOs3ytmDBRS1pIYShaQvT0s9VTqZC7a/nDMBr1uc/A3E1YI2PZ5Rz4wg
	yr3V/eom4rjH1UxMgZ/0ewaRbU/238PrwSLooS8bqzoDaKjU2HnHYpnXXPEHpZCa1nmzS+OhR/9/P
	9/NqS5W3VSpAMRx+UQX5w2AekCa9HaDga1mbEWQg/OMjguq9XLBhesK9BVbDQU0PmhAYJr6xfpeBO
	1G190J3hM+BFaOoHQKpLPSV5vm6nc1LRvYYmZMX7Jj6G6YX1hCUUVOX2UgNalVu655pkHHljLCMWf
	mx3o1fqu+WrZGeieo+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyVj-00000002nT1-1v1D;
	Fri, 13 Dec 2024 05:46:47 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyVh-00000002nSb-0S6A
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 05:46:46 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21628b3fe7dso12228105ad.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 12 Dec 2024 21:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734068804; x=1734673604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9nDBDHl8OkOEbonP7/O/xeWGAuqOftf+4IMvf+gS1cw=;
        b=OHxmsAQ/8MYhpoHxgWQyazsRmAw4unDny+/8Cy48TcxRMcvbbOEzZtX/WWsk+lw4DM
         IxDO+ED4p1MQKgxDiyy3UXGtN9ggims9hPsYevSUn3MgMbYvgI3sMNEJOKRCjfq78S1c
         IDpt8vtphdEurwWJtn4+2+e4qc78hpeAE9TPIKeerA6nzBSH1ymsYg00tijLel+c4Vyx
         DaOCAAyIadRgZM/7WFPZZ5qkBiHTvUHSdk5h/mQNQEOpabGhU2gMuTUyJAiHtUqxcDBr
         zHxhANisBXAxjJ/yisDcrF4+krhXfWsAKY7kMAswT9Y7CB+nNDo8rnxUpKSAhHUb3lKd
         n0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734068804; x=1734673604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nDBDHl8OkOEbonP7/O/xeWGAuqOftf+4IMvf+gS1cw=;
        b=sPSL4fJ5DGmDe+oXY0oEYAH/9fDsFmW4AiuIxB7AoLwK15/s6B1OKltxTTlnaiCZHD
         ozghL+9Pj7jUdl/8imRViWb5U9bO7zgNXaoqQnWLxotNgLwqBBg/cMvRlHPT+Nr3hsm6
         r7QiZ/WpdmNA+F28XJHz8p04o3u4wZbjg9Sw/ECeSLxxnIrQ4cfRtKZ04Zi32jdxV1XA
         2WUCKlQZ8I7Vo2hgufAztK9JlbRK9hjBeJiZ7oF9olZsRlzJZ72FVks/NaX+8p9kR4pA
         HGQJv2Ow52x1GqW7L1Mg0pOb/FErs8/dX6JaifaMQS+DWOpasufBVnvk7lwLut0RdBXp
         6lLw==
X-Forwarded-Encrypted: i=1; AJvYcCUCEGQsGNpslfZ6gItpERVpkcB4nwDxH2X9yWLpGCEEVIuc/Icr5X78oZpAaono3vfp0EYFzFvJmANFH4qYQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkrC9UHX9OaaD+fg7jWcbJ887CUSDeiAVLLVee+Gastl5gRRFv
	71ohypT1apkA5TlBb+fC7U+P9LrPehTWEpjNKRE/1xVIso1j62rT
X-Gm-Gg: ASbGncubM9jVUnSd5eKAt+wtUVPFP4CIMHszlfukg+MPtekPU/xh0YUNMAJgJ863ARH
	SnMLEq11ZOIXUAFmian4WRZQjTXC/5v/QHe1Vl9VypQ3kzk50CeoBqYNPbWBv1PPYleu+VQpAzX
	h/dmUGMi2wZwJTKYHtvFc5d/mjoTDjBYbChw3UMMoHhoyAnC8R+9cLS1wiKm+6xZjwPZLFX2eqH
	f2l8SiBdMxlKEgk2Xb6PiXsnvggLJDV8UU6xQZhMMqhkG+GEeAl4tvZD5ISi1tYzUlHwGdKlBSo
	txLQgw8=
X-Google-Smtp-Source: AGHT+IHVKByQs8aQw9nFW65MyCdke95tovLrIe/teYLFc9u83Eik6guIs9oKZyvf6Ts5Rmy4R5h3SA==
X-Received: by 2002:a17:902:ccd2:b0:216:26f1:530b with SMTP id d9443c01a7336-21892a70579mr20915305ad.51.1734068803702;
        Thu, 12 Dec 2024 21:46:43 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216483dd292sm82564985ad.226.2024.12.12.21.46.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Dec 2024 21:46:43 -0800 (PST)
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
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH 0/7] vsprintf: Add %pTN to print Task Name 
Date: Fri, 13 Dec 2024 13:46:03 +0800
Message-Id: <20241213054610.55843-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_214645_145386_CD81B810 
X-CRM114-Status: UNSURE (   7.55  )
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

Since task->comm is guaranteed to be NUL-terminated, it can be printed
directly. This patch introduces a new vsnprintf format specifier, %pTN, to
print a task's name. In this specifier, p represents the task pointer, T
stands for "Task," and N denotes "Name." With this abstraction, users no
longer need to manually retrieve the task name for printing purposes.

In this patchset, all instances of get_task_comm() used for printing the
task name have been replaced with the new %pTN specifier. The raw uses of
'xyz->comm' for printouts will be addressed in a subsequent patch.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/bpf/CAHk-=wgqrwFXK-CO8-V4fwUh5ymnUZ=wJnFyufV1dM9rC1t3Lg@mail.gmail.com 

Yafang Shao (7):
  vsprintf: Add %pTN to print task name
  kernel: Replace get_task_comm() with %pTN
  arch: Replace get_task_comm() with %pTN
  net: Replace get_task_comm() with %pTN
  security: Replace get_task_comm() with %pTN
  drivers: Repace get_task_comm() with %pTN
  fs: Use %pTN to print task name

 arch/arc/kernel/unaligned.c                    |  9 ++++-----
 arch/x86/kernel/vm86_32.c                      |  5 ++---
 drivers/accel/habanalabs/common/context.c      |  5 ++---
 .../accel/habanalabs/common/habanalabs_ioctl.c | 15 +++++----------
 .../drm/i915/display/intel_display_driver.c    | 10 ++++------
 drivers/gpu/drm/nouveau/nouveau_chan.c         |  4 +---
 drivers/gpu/drm/nouveau/nouveau_drm.c          |  7 +++----
 drivers/tty/tty_io.c                           |  5 ++---
 fs/ocfs2/cluster/netdebug.c                    |  5 ++---
 kernel/capability.c                            | 12 ++++--------
 kernel/futex/waitwake.c                        |  5 ++---
 lib/vsprintf.c                                 | 18 ++++++++++++++++++
 net/wireless/wext-core.c                       |  6 ++----
 scripts/checkpatch.pl                          |  6 ++++--
 security/yama/yama_lsm.c                       |  6 ++----
 15 files changed, 57 insertions(+), 61 deletions(-)

-- 
2.43.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
