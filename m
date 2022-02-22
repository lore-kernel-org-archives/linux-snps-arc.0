Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0C2C4332F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIGShTQpwN2pkp99ltuAqGTPtPi6Ep9VBLVwQdbKAfU=; b=MTRmzwHiRHJFKt
	bvVs3uExB8mPTI5NqNbwHbdaq/Cyp8OvCUg671WD9WWmy6zXeu8jz7eEwlZqDWsD5Q2X/E7brmZwV
	Yf/hsb/u34+DUVKugsW5T6Ax5/8B07E2sh3guMfBsDq3lRvChP86b+q/hK7EpHEGxWvgul3KpQMjH
	l9ENd9yUvU8wOWNSTX0CBtL3CFYWkCE9l4bUGC25tZsBKkSan678iynaBbHuXP/dpus2hBwZNhi6n
	+/2uCGQnFGNEs3McoXz9Dr4+K0ZRNag7cn3Z7WM9CYBkzYzcpa9v3PNZSyXrycl6Pfni2/i8MX+Bz
	hVF+dvmq9TOvOh1zH8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVx9-009qhu-H1; Tue, 22 Feb 2022 14:15:43 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwt-009qVo-Cj
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:28 +0000
Received: by mail-lj1-x22d.google.com with SMTP id o9so19800588ljq.4
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ykAMrt6VP6qT7O4tYFeDY8h2l1cYAYQkUTlMRYziNiA=;
 b=mlPa4gQc9ZTGJ1Y+sDCeUpPbjTrsXgFt4Hnw9mjz6FxLh6or98oDnoIuUzyDPqdz2x
 tpMgKbBP1K4As4i3KhRq8CPeJkQt4K+Loz0Xf2Kql9GkIJHKIKTkX52fGZ0FQdFBFBKj
 HgAME8j1EHjvCxUJ6sZiIhM59tl0feKHjOGV93BJk8HV7Z/1rib6sFjht7TLHmy/tGrh
 KLbHo3nTyWCtgg0NsxDT7ldFHSupqOyDcQBOY89uTnD1UndVUdCDd/uidCqP34qqx1Np
 yD4zwtoIGkzPkq2d8Cf557KD6QVX0THyA0KQFLzaglkZkZJEgvVlhuKtmTD+y3KvIs6L
 G9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ykAMrt6VP6qT7O4tYFeDY8h2l1cYAYQkUTlMRYziNiA=;
 b=ftBDBrHzbvNp/ZFHP4E/ztn1xSCeBGuJFHEJBlU7/jNDTrrS/xKBafW2j2JBS1hqNi
 sCPuTSPxvCtl1qsnIqarKbfPl/LYvIGJv2+Chk8P/KXB8gZ+Orr2Zg91Fq6wIYljSmR9
 wcKxjRtqUIHkUCs9i8ok5T9+NVjgIqgS2tDctlIc/nt0fp+T+STW13zHVmHiLqT8LPkY
 XjjH/l+bVDaDj5AcGo5mvmZWfumCRFBPPL8X6GtcV+dfDq+OL70D6892vimAblHpAPBy
 9VRrmHb9RzDUHDOFa1KWx5TKpAPgsKn/hVsIcAHOgX8mXLvfiNop5zveAl/UsJHtE+U5
 wdrQ==
X-Gm-Message-State: AOAM533rGcBSmCEfkkEdysR5x8Zi72QpMoPuaBq5Fiy2oittKimkoyqa
 UUypnlYTgZ+B50Yg7o99dS4RTnRrRE4=
X-Google-Smtp-Source: ABdhPJw0GMoDmvtN1S5dQSe05XJVO/GHOo/emvHarIKuB0xCHixLKYnIOuGRnvyC101TJLLTmrFfaQ==
X-Received: by 2002:a05:651c:1791:b0:243:94bd:d94c with SMTP id
 bn17-20020a05651c179100b0024394bdd94cmr17460326ljb.468.1645539325770; 
 Tue, 22 Feb 2022 06:15:25 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:25 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 12/13] ARC: build: inhibit ZOL generation by compiler
Date: Tue, 22 Feb 2022 17:15:05 +0300
Message-Id: <20220222141506.4003433-13-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061527_493249_E01E97B6 
X-CRM114-Status: GOOD (  10.26  )
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

From: Vineet Gupta <vgupta@kernel.org>

Inhibit ZOL generation by compiler if configuration states
the lack of it. This is done before we remove the ZOL regs
save/restore in entry code

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index ec0f672bcee6..98a03c8d719c 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -44,6 +44,8 @@ cflags-y				+= -Wa,-I$(srctree)/arch/arc/include
 cflags-$(CONFIG_ARC_HAS_LLSC)		+= -mlock
 cflags-$(CONFIG_ARC_HAS_SWAPE)		+= -mswape
 
+cflags-$(CONFIG_ARC_LACKS_ZOL)		+= -fno-branch-count-reg
+
 ifdef CONFIG_ISA_ARCV2
 
 ifdef CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
