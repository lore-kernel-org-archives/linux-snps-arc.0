Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02349ECAAD8
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Aug 2022 06:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOBXYvpfT8xIlUexuCukFQPPR8zy8nPnX+YkfBI9/Nc=; b=eQRuuRy6YrdI+f
	ZkZtIq1gN1yNKBb4JOa1Ox64stKjACrUsQ9KiyZZnNqDp1YBEjoGt+FgSRIHMtOhtfzEDAkn5zRZi
	m5ShtCyLg9j+woRXiIUuI+z04DalH0eCafiyx5LbvtKud5VFJdhDmSicWSj7PMQGksq4+Jeywfl7t
	8dhgoAU/ojF6UquH8iuwwJsWkzk+DLrk3TI8qYN8hxO5+KTyH8owIDPbE8xtICsfArPecmmsiltfQ
	dVzidppiiBBCG/JCBtDGOIz+O1V4m1wWK3Nq9Ypzp+Npxa6a7bZB0Ule/cKX4IhqeYPF+YzOePPKW
	C9mjSgxItNeHCelGsWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSv9R-00EZvY-Ql; Tue, 30 Aug 2022 06:55:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSv82-00EZCE-Ps; Tue, 30 Aug 2022 06:53:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 72D58CE12B2;
	Tue, 30 Aug 2022 06:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C028C433B5;
	Tue, 30 Aug 2022 06:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661842416;
	bh=ezCJz3zzII/UaKvcXNSbmcajv11zXu7NIaCF1ULUtp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r3amRcUQDjcf2J5Fgpm3U2izv3yA9NBy7nxMxatvsZT6tZWH3Rv9dQGtrjH3iNkPE
	 g6KyXSsfC/QLHSFUlf3IUv5+Vfh0AVJGPh5B8XP/13LvC1JxSH2AEqY4TAjFgDMhOt
	 AS0BwAQwYQJwQ8z8KNiqh3xod+STWMH9o+hwivFoZq7RQCb10x+P565pwYgOgJl59G
	 gjJI+WEJLyooY/K9536qNkXfUBIbivFBJ+BTi3q5eadkie5Q/E0dtzMU5gpdgyy2Z/
	 CftmJ3I3bk4yFCtql/IygZNvGqnuuCDfY9wzgM1PhTXU0Cx8xMIXsaEyLjA9FHpb8w
	 WEGB8pxdmmp3Q==
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
Subject: [PATCH 1/3] riscv: ptrace: Remove duplicate operation
Date: Tue, 30 Aug 2022 02:53:14 -0400
Message-Id: <20220830065316.3924938-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220830065316.3924938-1-guoren@kernel.org>
References: <20220830065316.3924938-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_235343_044111_B3CCEB55 
X-CRM114-Status: UNSURE (   9.29  )
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
 arch/riscv/kernel/ptrace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 2ae8280ae475..44f4b1ca315d 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -212,7 +212,6 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
 
 void ptrace_disable(struct task_struct *child)
 {
-	clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
 }
 
 long arch_ptrace(struct task_struct *child, long request,
-- 
2.36.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
