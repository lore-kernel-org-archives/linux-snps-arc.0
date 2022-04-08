Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE7CC433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Apr 2022 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9eUZsnyiS2bFAL1AYOmv/gLehI4t/asvWLRJTUyI9hs=; b=JI5QMEt9B1YOju
	bmWenLcJAUxY0DijhL5k41BEHmQSXtz4AWbQLnYxZ/oWKXwRpQA4jhyiVtNxLn/C1YAZ0vg1rppAn
	LGu9vhdABqJMyEeilToaOztADxGhF8PpPVtVSNN8gTrDc/1QUfhvAWDctnAKjjGmvcBu6TykOCivU
	gQf8P58SDFHmJxvcQgmO7Ph8AtJWxpt76YhHXqchhLS33PClpP+5+Iu2bVY9JnORyAWQK8ajvdlHj
	6SZy8bvybMZq96AsBK7D1ewEAJQO3utCGacoqvkiT9W6olr7fa4uQqM2deLtoL/EPHkN4g6NoLaR/
	uuPaXHI/an0mPzWtWf+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncr02-000O9c-BG; Fri, 08 Apr 2022 15:58:14 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncr00-000O7P-Ez
 for linux-snps-arc@lists.infradead.org; Fri, 08 Apr 2022 15:58:13 +0000
Received: by mail-lj1-x229.google.com with SMTP id s13so12070415ljd.5
 for <linux-snps-arc@lists.infradead.org>; Fri, 08 Apr 2022 08:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/nCgXXDO0qdc8fMgH2tJnDi1P46KdOhcK/OKsjbVC8=;
 b=YC++pzLB1aVdec7prjmAf38F7b8tYiRlPx1Ls2X2HI960mUmxVLWE3+5uH+ziMmbTK
 MWXEhAsK+ya7LaEuGxgZAcDEeJ2cy9IoFTmEIhEAhqugWrTFcY3wgnPDBrMeDybQcFJb
 d1kawmGtAgdMf4cEFYXAGredhloUxhhxxOiTL6JjAzXxDxGOUGes3O7+2wCZtNIhwmoH
 8QurF9U5Txq90xzXy2PqTa7QL2u98VV/q7cp7HO6nLM8fw2+3TFfuTjKFD4aEwMo9umJ
 CXmMNzEcTgrNpDFlRomcQhtTYtHE1spe1hxL+a9/+ArwjmYYU5+LNhQRTUBtq8t6GX0G
 IU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/nCgXXDO0qdc8fMgH2tJnDi1P46KdOhcK/OKsjbVC8=;
 b=yqlmyT2VndZfN+h+HO7mGF78ZtcNdA1gHH99Tn54Kj7s7dbzzVtPvkmCfUUhcYTrwa
 ozs2xDepuhE3jIO4lDMr1ERd12M0m/57c96ebvpBzbGvDRzhKMJNQ8dVwVyGveS9uobl
 R1ex+udQj2Mzd/yIWSJosHiKs/qRQxXe+lXKLQY34CJjv+qpI2bDKVY17/85NSGoqxeY
 HjzWv0RQZ/ATVlOW4VErUqubGPEl+q1jbgts3TV9QVwXkG/a+BznNMomLDjoJV+hZZ3c
 A5DbEjtn4grkoToL/JjHseewqLLQNtIUQ52tMzWbsEytnppMA6poPIf5XtniX6mk71pQ
 U7yw==
X-Gm-Message-State: AOAM5331Cib9Tyygit+WtaP4HYKVWHuGSzUn4WGU20SIG4yg8gGrmnFE
 EXl9HQViTQWQFYfk1olbmN/wOTZEtCHw3A==
X-Google-Smtp-Source: ABdhPJx8D+wgIMXM/BQRxOV1z5swqRct4LlQV3buXjjXozIGjrQ2P/siXnQv/8D1cHHE1jvUuMaJOQ==
X-Received: by 2002:a2e:b0f5:0:b0:24a:fca7:d40b with SMTP id
 h21-20020a2eb0f5000000b0024afca7d40bmr12190920ljl.521.1649433487829; 
 Fri, 08 Apr 2022 08:58:07 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 r9-20020a2e9949000000b0024b46eef85bsm461826ljj.127.2022.04.08.08.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 08:58:06 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH 0/4] ARC: add missing bits for better BPF support
Date: Fri,  8 Apr 2022 18:58:00 +0300
Message-Id: <20220408155804.587197-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_085812_539789_8F844858 
X-CRM114-Status: UNSURE (   9.76  )
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

Hi Vineet and all,

This patch set implements the following two features for ARC:
- HAVE_REGS_AND_STACK_ACCESS_API
- HAVE_SYSCALL_TRACEPOINTS

Adding these features enables more BPF programs for ARC kernels,
including KPROBE, TRACEPOINT, PERF_EVENT program types.

Regards,
Sergey

Sergey Matyukevich (4):
  ARC: bpf: define uapi for BPF_PROG_TYPE_PERF_EVENT program type
  ARC: enable HAVE_REGS_AND_STACK_ACCESS_API feature
  ARC: entry: fix syscall_trace_exit argument
  ARC: implement syscall tracepoints

 arch/arc/Kconfig                           |   2 +
 arch/arc/include/asm/perf_event.h          |   4 +
 arch/arc/include/asm/ptrace.h              |  27 ++++
 arch/arc/include/asm/syscall.h             |   2 +
 arch/arc/include/asm/thread_info.h         |   5 +-
 arch/arc/include/uapi/asm/bpf_perf_event.h |   9 ++
 arch/arc/kernel/entry.S                    |  13 +-
 arch/arc/kernel/ptrace.c                   | 140 ++++++++++++++++++++-
 8 files changed, 192 insertions(+), 10 deletions(-)
 create mode 100644 arch/arc/include/uapi/asm/bpf_perf_event.h

-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
