Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1163DC433F5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 14 Apr 2022 08:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H0wlqa7tN0FqAXvLNPovKUHtLguEBmVmO4yu35pSB74=; b=RcBz4nRFvgO5Bk
	xcQuUDFhzgT3/BNZgsUwB92IOHtKmQjtrHsFrnWog+j9zgDDLOe9Z8bmONkStW5L2a8l3l8yU9bun
	b7dOwM/2Pp5Qn8RYgp7dlWt9/1/IPorGBNotJZMt7GOrt9st4jYqRV8ogdnljfSFSvjk0KcsQ3nrC
	rj7JfquEaI4aRSJ0Ad9yDWbPCheiYJYaqw2sqvNsFseG9bIIaIhDH77MQzW1QsXq+kr4UDxLVCFuD
	jfDVSL6S2u99BoqKjGANDGFsJ0ixSTz5k2wgWl8HEw0LUutPGbzA5HCA8WEHguMBmGjujjekbczGa
	xkIuMICiIMd9O6oobJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neufW-004VFV-80; Thu, 14 Apr 2022 08:17:34 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neufS-004VBs-LJ
 for linux-snps-arc@lists.infradead.org; Thu, 14 Apr 2022 08:17:32 +0000
Received: by mail-lj1-x22d.google.com with SMTP id m8so5066124ljc.7
 for <linux-snps-arc@lists.infradead.org>; Thu, 14 Apr 2022 01:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dv6zk7oLUbQ0xtsRjg4hNj8Ci5wYxzJmIo6HFxaMt7M=;
 b=iwDyQoJ9aKoUw7TIhIiPO7/RXOUDduyPv8d7SC4TDrOA0Aj3rpkkDFv1Jn+Z0KzmyG
 2HUsXrP5WdCqDRXXvsIVU0DchzuU4ibv4oniCwgA4hRa9YELRTQRDqaWKUbBfgggJYDH
 nTPBFj9RQ+Y9TjJU0SQplKS1h/T2zZVHbPL5uhJENSLOI4pCm8eAj1RHqNuSx44snUKZ
 qpyH7NSQhc0ea2gWpjlQlOQlZmyFkglMTpC9Pi69M3yfFyJXO5+nAp6rzkaxsyhfWWhU
 enX9e5TOO6DXtWtNn/bMv4WKVWO6vA/Yue96lji2hm+9yq7BgCmD6qegK/G8Lgwvi8ky
 42ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dv6zk7oLUbQ0xtsRjg4hNj8Ci5wYxzJmIo6HFxaMt7M=;
 b=H5og44UKwAzf0CGhZNN2SQc1Z+38aInO8/4O1KYOQVjwfV+3e5ido3rAe9J9ancliE
 tXkeVt3zNaIqZEeVOy0x5zZKLIatIw9eLWhf0xSoeYR9gTBx92c8TYvVV2saNvFGp5Ih
 xpcJySoW65Gk/KhaBE6laOMWf3SqPEuTAG6RV1JO9X7+Svx7s966S+030p8JGtzsq5o0
 UIUNChKhwIl4gBz6yCf3MedOj5thPNOP9dU48+jtMcx+WVdGsuPKabxjnxd7DCtA1mQy
 BuvkywXKDyoJ226usU2mcysKE6gIVTB0Ysmzz9Mp9cv7Sgy1VEm2b4MViE22OawPNgh0
 Bxgw==
X-Gm-Message-State: AOAM533khjt2LWAj2EcLs4LeGFZ2kiAsq88Ej+OvNK1iHgDAK1gX6nYG
 fcFjGABa/iXeAVbxcD+V4LPy3L7AyA0iHSPD
X-Google-Smtp-Source: ABdhPJw7hzSAaE40T9LhfF2zX7o9bgdcE7VW/qv+e9sEmXNXZgdvY32obMaA6ynFfYPq1THdqT1ZMA==
X-Received: by 2002:a2e:3a1a:0:b0:24b:59d4:7006 with SMTP id
 h26-20020a2e3a1a000000b0024b59d47006mr968020lja.392.1649924247030; 
 Thu, 14 Apr 2022 01:17:27 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 v20-20020a2e87d4000000b0024b638069b1sm117116ljj.39.2022.04.14.01.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 01:17:26 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v2 0/4] ARC: add missing bits for better BPF support
Date: Thu, 14 Apr 2022 11:17:20 +0300
Message-Id: <20220414081724.3177956-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_011730_755969_27731651 
X-CRM114-Status: UNSURE (   9.53  )
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

Here is the second revision of the patch series implementing
the following two features for ARC:
- HAVE_REGS_AND_STACK_ACCESS_API
- HAVE_SYSCALL_TRACEPOINTS

Adding these features enables more BPF programs for ARC kernels,
including KPROBE, TRACEPOINT, PERF_EVENT program types.

Regards,
Sergey

v1 -> v2:

- drop path with uapi for BPF_PROG_TYPE_PERF_EVENT program type: send it via bpf mailing list
- add patch with ARCv2 changes for kprobe disasm

Sergey Matyukevich (4):
  ARC: enable HAVE_REGS_AND_STACK_ACCESS_API feature
  ARC: entry: fix syscall_trace_exit argument
  ARC: implement syscall tracepoints
  ARC: disasm: handle ARCv2 case in kprobe get/set functions

 arch/arc/Kconfig                   |   2 +
 arch/arc/include/asm/ptrace.h      |  27 ++++++
 arch/arc/include/asm/syscall.h     |   2 +
 arch/arc/include/asm/thread_info.h |   5 +-
 arch/arc/kernel/disasm.c           |  64 ++++++++++++-
 arch/arc/kernel/entry.S            |  13 +--
 arch/arc/kernel/ptrace.c           | 140 ++++++++++++++++++++++++++++-
 7 files changed, 241 insertions(+), 12 deletions(-)

-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
