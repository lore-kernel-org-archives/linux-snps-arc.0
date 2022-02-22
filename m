Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7A0C4332F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oC8kVtS2jHz5LKC56uqsdvVUmuWw2LkzAgN+2YlLl1Q=; b=At6DJaUjPyAgAR
	287PAgUur7MRXIdjtNv15YtQG3n05gQrZDC/biH2j6h4ddQeP8OPekeu5jnHzw7WV4iEvkMWgx5ll
	kcYM2eLLbWOnpCQIHHliUiWyVoGszJfq4yrzE0sJ0DC10F4UY3emuaAuU2kivBK/PW4V7wi1PKuU9
	DpjKeCX7d4E4qVmnbuWjQFGBUsZrbgQmuy+X0aNMJACWgaZeYHgfEruvmiZ5mpP/inuJr1N0sZPQG
	bI/V3kAfVCTUAyk/tD3xxk/YEbPoAyC+f8q/9lJmRXeuVasgLappxH5NQ8E8MoUb/Ut0TrtgUp5wg
	d1eQvdqY6K6I/IjHDMxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVwm-009qPn-S7; Tue, 22 Feb 2022 14:15:20 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwj-009qMW-DU
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:19 +0000
Received: by mail-lf1-x12a.google.com with SMTP id bu29so25183294lfb.0
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HG5m80l6haGvENEoatq0FknP1FnLlK/WDGmT25jh4h4=;
 b=FLwYMBllj7VVvzsQrIqQHkabctno5OX4DkLMvm88cRLcTI+TRJDeiO1Nc73/WLff4R
 ccdLuMGsjEvPVJRfE0juhQq6aD2b/BQdmRx/d2qqcA1/tuokAeLIopoddojU+XYl/EKw
 ryO2Mh9b7tFQi8KKxMiDce0YPfNScIMEB/ctqaf1JVL0Y5ZIYUEgQtSME0xQmEsY3Qde
 Q97hGZVtwSLZa+UrR9wISsqG5lbIA+D1uPVQFoRjyoyRVhJNlwlphkr35F6j7tqfSZgO
 dzUtLgHPo762ch4POpg1cPDkZ58og1xF7XJKORflm12QIOdwynIgySYAQ5zhu/69QVn0
 beuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HG5m80l6haGvENEoatq0FknP1FnLlK/WDGmT25jh4h4=;
 b=eFSPspiAwTciYoUYuT9hEsSDU2nFRtV4cE46yUwPJVTwI8NRiCKLOaicRil1jHhOGx
 GfhrKAAGtSmLi43A0+9r3pBueLnHnQ7S4gphRPAUy+geib6qjdrBLelEm1BVVAT4nGpU
 A+CruvFDbBpXYs1IsoiGEB/Ztxbgg9xxnH2pVCxxEB+j/6IgJWko37H3nadHio3Y6iXd
 Db2mxoCxQU+SJiMCtnwDlZcPbEOfkC5pJqGfoxsMZA7nS3DUdHH9S7lehzDg6cyDiKhU
 r9NkitgsUFTghclmig0htwLTv0d1WOZLMlYE5KpqgF3OdxsDcPucAIIBt91qe8l+tjYs
 Wg3Q==
X-Gm-Message-State: AOAM532kh+J7beJe6aqzHPzJ1yNeXPAwqh/JFa8nmoGAiaMJkO80iTPG
 KipSMWMkfBWbOePAl0a9wobbg+qLe10=
X-Google-Smtp-Source: ABdhPJwVPRD4iyPfm/Ewj8tXJuNNBgA76LikdzWDEfdEUUHWsSA+5srOKG7FBIFKXi04wVHIp0gI1A==
X-Received: by 2002:a05:6512:44b:b0:43a:53e6:9cf6 with SMTP id
 y11-20020a056512044b00b0043a53e69cf6mr18096914lfk.154.1645539315828; 
 Tue, 22 Feb 2022 06:15:15 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:15 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 00/13] ARC: handle the lack of ZOL support
Date: Tue, 22 Feb 2022 17:14:53 +0300
Message-Id: <20220222141506.4003433-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061517_505030_D08E199E 
X-CRM114-Status: GOOD (  14.79  )
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

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Hi Vineet and all,

This patch series continues to prepare arch/arc for the upcoming ARCv3
support. ARCv3 does not support zero-overhead-loop (ZOL). So this patch
series provides a set of changes that make ZOL support optional.

The patch series is based on top of Linux 5.17-rc5. It has been tested
with enabled CONFIG_ARC_LACKS_ZOL option on ARCv2 HSDK hardware as well
as on nSIM simulator for ARCv2.

I fixed typos, updated Vineet's email address, and slightly modified
several commit messages. Otherwise this patch series is the first chunk
of ARCv3 bring-up changes by Vineet, available at Synopsys github: see
github.com/foss-for-synopsys-dwc-arc-processors/linux

Regards,
Sergey

Vineet Gupta (13):
  ARC: uaccess: elide unaliged handling if hardware supports
  ARC: Kconfig: introduce option to disable ZOL
  ARC: uaccess: drop CC_OPTIMIZE_FOR_SIZE
  ARC: uaccess: elide ZOL, use double load/stores
  ARCv2: memset: don't prefetch for len == 0 which happens a lot
  ARCv2: memset: elide unaligned handling if hardware supports
  ARCv2: memset: rewrite using double load/stores
  ARC: string: use generic C code if no ZOL support
  ARC: delay: elide ZOL
  ARC: checksum: elide ZOL
  ARC: head: elide ZOL
  ARC: build: inhibit ZOL generation by compiler
  ARC: pt_regs: handle the case when ZOL is not supported

 arch/arc/Kconfig                           |  10 ++
 arch/arc/Makefile                          |   3 +
 arch/arc/include/asm/asm-macro-dbnz-emul.h |  12 ++
 arch/arc/include/asm/asm-macro-dbnz.h      |   8 ++
 arch/arc/include/asm/asm-macro-ll64-emul.h |  31 +++++
 arch/arc/include/asm/asm-macro-ll64.h      |  20 +++
 arch/arc/include/asm/assembler.h           |  41 ++++++
 arch/arc/include/asm/checksum.h            |  58 +++++++-
 arch/arc/include/asm/delay.h               |  16 +++
 arch/arc/include/asm/entry-arcv2.h         |   4 +
 arch/arc/include/asm/entry.h               |   2 +
 arch/arc/include/asm/ptrace.h              |   4 +-
 arch/arc/include/asm/string.h              |  15 ++-
 arch/arc/include/asm/uaccess.h             |  29 ++--
 arch/arc/kernel/arcksyms.c                 |   2 +
 arch/arc/kernel/asm-offsets.c              |   2 +
 arch/arc/kernel/disasm.c                   |   2 +
 arch/arc/kernel/head.S                     |   8 +-
 arch/arc/kernel/intc-arcv2.c               |   2 +
 arch/arc/kernel/kgdb.c                     |   4 +
 arch/arc/kernel/process.c                  |   2 +
 arch/arc/kernel/ptrace.c                   |  12 ++
 arch/arc/kernel/signal.c                   |   8 ++
 arch/arc/kernel/troubleshoot.c             |   3 +
 arch/arc/kernel/unaligned.c                |   2 +
 arch/arc/kernel/vmlinux.lds.S              |   2 +-
 arch/arc/lib/Makefile                      |   6 +
 arch/arc/lib/memset-archs.S                | 147 +++++++++------------
 arch/arc/lib/uaccess.S                     | 144 ++++++++++++++++++++
 arch/arc/mm/extable.c                      |  11 --
 30 files changed, 493 insertions(+), 117 deletions(-)
 create mode 100644 arch/arc/include/asm/asm-macro-dbnz-emul.h
 create mode 100644 arch/arc/include/asm/asm-macro-dbnz.h
 create mode 100644 arch/arc/include/asm/asm-macro-ll64-emul.h
 create mode 100644 arch/arc/include/asm/asm-macro-ll64.h
 create mode 100644 arch/arc/include/asm/assembler.h
 create mode 100644 arch/arc/lib/uaccess.S

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
