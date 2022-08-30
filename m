Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54154ECAAD8
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Aug 2022 06:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQmR4okYMcTnwyEKk7i9R8EIkpOeYCxvDhijJ9jP5FM=; b=GHuTBRyZrciQGq
	KIhNySXSCjshqrFiYpXXnCZkk4XiXLkk21qJoZYQhRo80V+QPLD2pEgKSS2bE5r47IbR3h78dmjKf
	8vgarU0bptE/Q+toIkf+/hgMUI6J3DT4k6NR7KzCeL5WBAYit4J/44IyFbZrQKm4zQLzIG10CJiVp
	mbJTmWo1w28BHlCQBfrDIsFYcK0inZL/8NnvE6Xnh2YXusCsx0N+g01auPSFVFdbBirnabi8tuqQd
	tz8HfTVw25ZiDY8EIBK8cvN5G03DVBk4MXaJoWaKkkkqUR3JlTnTRc+Rg+Ymv+bjCaJH/LEXIOem2
	XTUKJzltxZBHM3rZyrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSv9W-00EZyy-A0; Tue, 30 Aug 2022 06:55:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSv85-00EZDt-R6; Tue, 30 Aug 2022 06:53:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 689E9B815D1;
	Tue, 30 Aug 2022 06:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95177C43141;
	Tue, 30 Aug 2022 06:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661842423;
	bh=6jVazXBqfWdKpxDWhL1vnDZxpkMfN57CDtGrBVFvRs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F5PrLREEw9ieJXHk2T6r8fNSMm4hqpEggsRJrXPWuFPl7+oJKfH/xBCo0A6FJO0y2
	 t9K5uxEE398h542YOD7o2yTfT4WHu83D6O1abG132Tc4bQAupCKANNBSa193HMsikz
	 4M3nENDu9L/3n8h3C0uJfXqbSAkKm+orfEcMHOgDUj056bJn4i+7AKEbgu317hT+U3
	 3aqhj2tDhdw86//1qF+BA6svknF5okzAHkY4nNxbm4KxsHyWfDR9AJ+3fwLF8hBKQj
	 DIDDu38CXvQN9Ac3hF/lVAAzTDYfnjIUHHuFPh1gUncCU4gVLx3CzOPt9r0MIDKxVd
	 ZacRoVho/xM/A==
From: guoren@kernel.org
To: oleg@redhat.com,
	vgupta@kernel.org,
	linux@armlinux.org.uk,
	monstr@monstr.eu,
	dinguyen@kernel.org,
	palmer@dabbelt.com,
	davem@davemloft.net,
	arnd@arndb.de,
	shorne@gmail.com,
	guoren@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	sparclinux@vger.kernel.org,
	openrisc@lists.librecores.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 2/3] openrisc: ptrace: Remove duplicate operation
Date: Tue, 30 Aug 2022 02:53:15 -0400
Message-Id: <20220830065316.3924938-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220830065316.3924938-1-guoren@kernel.org>
References: <20220830065316.3924938-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_235346_076772_AF524F2A 
X-CRM114-Status: UNSURE (   9.14  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The TIF_SYSCALL_TRACE is controlled by a common code, see
kernel/ptrace.c and include/linux/thread.h.

clear_task_syscall_work(child, SYSCALL_TRACE);

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/openrisc/kernel/ptrace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/openrisc/kernel/ptrace.c b/arch/openrisc/kernel/ptrace.c
index b971740fc2aa..cc53fa676706 100644
--- a/arch/openrisc/kernel/ptrace.c
+++ b/arch/openrisc/kernel/ptrace.c
@@ -132,7 +132,6 @@ void ptrace_disable(struct task_struct *child)
 	pr_debug("ptrace_disable(): TODO\n");
 
 	user_disable_single_step(child);
-	clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
 }
 
 long arch_ptrace(struct task_struct *child, long request, unsigned long addr,
-- 
2.36.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
