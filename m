Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB23DE7718A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2024 02:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WsltjloHVN8lSGnD/ZXD4UP1Tjp73KBKDlzuX21KPpU=; b=rxTHA7IdMMYaXy
	mCuI0O0ct+UYLgCcHrGKSd4yzCv1/eVxgQwfJvCCVQqlI2l25wbqcqXiEUmUTf/aJymssPTMkOjTn
	xx529S8qqO+blOUIsfq5DH9jTGgvI2qa+OPofEP2fI2B5eiN5dyUiI6aKcrirVHZoqnfmsfxHeLtX
	BDfKLkYoXv9GELc63e81dfPGMDnrPU80fUs7U8qlj88xxOl79gGb/Qou650z4COFjfMUyHfXPnPkS
	/kguZi957k6Hj0JArI2Y9ZIWs4NL8pUF/nKMT3Vn5fk2hg8KCXqh1uhHronJ30vfSoYFI5dUsJmGc
	tyfHmTO/u+F/yAHK3Gwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6NV-00000000cDd-0xde;
	Thu, 19 Dec 2024 02:35:05 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO6NS-00000000cCm-1xd0
	for linux-snps-arc@lists.infradead.org;
	Thu, 19 Dec 2024 02:35:03 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-728ec840a8aso402910b3a.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 18 Dec 2024 18:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734575701; x=1735180501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewYmRGbtjw/u5CZQB/fGCIYq/IkhzVppRPs0v4hq1mw=;
        b=YmOvMbvqFZelXJeR4TrgPp26YrQxkt9nAWNKV9iGQS9Inf/ovXC4DpbFWNea/+FizX
         KSnQmfQMIPRqFFWlXIcWCS3GoKOAu/OkN5x4oYdfBaVh9z1Vg8DpjGLzQPopLPEstmhi
         jDs5To7MTiRSxVyYEFzBZq6mRnL5nvPJ5+H6TPH9iPH/gdiXUuxx9s8VcsOQPET122jU
         tUheCbPrRfpus61ER5v8/dJ3lOIOZqGvTASoKSqCvVonTiyovVYP54K7qKxTuO8rUmuK
         ulw7JKCgvbhaiLShfYho6BJdnq36wWWkMBZYrYnkJvf2W79plwkGrbCacKIewEIsKyHg
         gMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734575701; x=1735180501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewYmRGbtjw/u5CZQB/fGCIYq/IkhzVppRPs0v4hq1mw=;
        b=WR76lmqs/ZEU/7QcULjwWv/dZG6P+HKst4w+7w60CFiAqTkvJNlZVcefw/9Z+ASwk7
         M/iU48dkGaq4aURc0JkAbprWxLguWF93Sry/3N0sE/EX+8FtE9TFJ78R58kl4YGr8m78
         Ni0OC7VP3di0iDnysFBAJxZNSTmpjaxkm9ZJDXs0FoYjyYJyDAeoHV+7Q/JMDjY6kg0K
         KiXdMRyRecCeoG1ceg2E62W23vFsXvgEI6M85YeGRYI8Zbt5BrFzURQWaOTpMP7fWs0X
         wp4i8lNwQPuV0YxjTrxh3Qtxv6/cCIFTHpjT6l50UOB/CzYIqn6FA3z1n7OtfMeGHfbr
         B5cg==
X-Forwarded-Encrypted: i=1; AJvYcCUYC2gSBR+PoUSLrY0qspw6G3V3XHj5U/+GBmBJoYomv8Z//he93GuhwiVQBHnATMSUeznJ2cDwjE7ZFKF8Zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUBzIqX1b6zj0nTp47ROlcyvzmvDCStGS5OndFrwJKrQvnOijF
	5YyPhXJTQ/43QXtbSAsKbNEgjx+hYOvaxELdcKQuHWQeHMLdZrc9
X-Gm-Gg: ASbGncsbTgpchydq3U4v68+ijgVb2FsLtCepIHmU56Ufq8TECFgnE+rRNQA1JFCHHQc
	Xufa/qRf+84U6ZBiuFtt12eh9diGwvIgjpLmI1K7JFThrM1OuSLw3JbyuGiIS0nDGGwK+/0QVoG
	+WFNe2sn5PKRKWVNajLk3BcO+dxKWvw5QYP28K/LJglv+/3wCurQ7RcMNWE4s7DLOVl0iVvNdn5
	xAT0urolZv6qvIZzTVar83O7vsDdqeupoRmS3YJ3L9AVfGuN5Sia2aggRABYi1WeewIO4+F/KUi
	YHB5hn0=
X-Google-Smtp-Source: AGHT+IGkt8eWE3wh1dURnDDolV6IzXf9MexDfJ0kaeAEgc6DDmy7cFDTyCLLAMMKibF6E7v5iDX6cg==
X-Received: by 2002:aa7:9316:0:b0:724:ed8f:4d35 with SMTP id d2e1a72fcca58-72a8d2e0557mr8641134b3a.26.1734575700792;
        Wed, 18 Dec 2024 18:35:00 -0800 (PST)
Received: from localhost.localdomain ([180.159.118.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b821da83sm142163a12.40.2024.12.18.18.34.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Dec 2024 18:35:00 -0800 (PST)
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
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v2 0/5] Remove get_task_comm() and print task comm directly
Date: Thu, 19 Dec 2024 10:34:47 +0800
Message-Id: <20241219023452.69907-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_183502_509869_C47F9772 
X-CRM114-Status: UNSURE (   6.16  )
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

v1->v2:
- Don't add "%pTN" (Petr, Kalle, Borislav, Andy, Linus)

v1: https://lore.kernel.org/all/20241213054610.55843-1-laoar.shao@gmail.com/

Yafang Shao (5):
  kernel: Remove get_task_comm() and print task comm directly
  arch: Remove get_task_comm() and print task comm directly
  net: Remove get_task_comm() and print task comm directly
  security: Remove get_task_comm() and print task comm directly
  drivers: Remove get_task_comm() and print task comm directly

 arch/arc/kernel/unaligned.c                         |  5 ++---
 arch/x86/kernel/vm86_32.c                           |  5 ++---
 drivers/accel/habanalabs/common/context.c           |  3 +--
 drivers/accel/habanalabs/common/habanalabs_ioctl.c  | 11 +++--------
 drivers/gpu/drm/i915/display/intel_display_driver.c |  6 ++----
 drivers/gpu/drm/nouveau/nouveau_chan.c              |  4 +---
 drivers/gpu/drm/nouveau/nouveau_drm.c               |  5 ++---
 drivers/tty/tty_io.c                                |  3 +--
 kernel/capability.c                                 |  8 ++------
 kernel/futex/waitwake.c                             |  3 +--
 net/wireless/wext-core.c                            |  4 +---
 security/yama/yama_lsm.c                            |  4 +---
 12 files changed, 19 insertions(+), 42 deletions(-)

-- 
2.43.5


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
