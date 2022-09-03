Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09751ECAAD4
	for <linux-snps-arc@archiver.kernel.org>; Sat,  3 Sep 2022 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJpw1zpm1n+/eG1N8My7cLZxwi4sZ8G4esDgxbcx49Q=; b=iLqSG/+RSVuo4i
	kovqwzgTD/8JAKs5MNG+eym9+GUAHpwlQ7uCTwwgHdupdSw9HdbS+/0zjvCcEAeQW9O6gTlSKR4+1
	hR+1U+xc03i+3UghxruwYCMS+vq3vGuA0ExWV62n6suebTHxK778ckBMi/LbP/VeCNtzoBdsIR1Nv
	z+2su0/Gz0hz5HyU45YpD/UhOjApcmjkcQ203hWl1mXThD03XaxVlF2XDRFuoc3252KrlAgE1efl1
	Z8LwqmonesWJTpYHtsPFgwvOoI38mVplxcdo91jpM/Md5IbNFTCKvB70fZ3LRhD8drjJs/YTTpgLn
	YF1AUHUzkjtkQTdQwHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVwO-00DXk9-Qh; Sat, 03 Sep 2022 16:24:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVw1-00DXNX-LI; Sat, 03 Sep 2022 16:23:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 046CB60A09;
	Sat,  3 Sep 2022 16:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973D6C433D7;
	Sat,  3 Sep 2022 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662222232;
	bh=KP0swQ0+kClqdN6HeWUaPcd4siKNWtxg+hX1oInsUFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MW5Ml0XVb8n9WtUPo4R8Hz1XeXEfIRU7wXu1TqWJx+L+2V65xknIh78V4JcHnRzzN
	 G+WuNhhGSYt5fjNP5j28KCOfJJG2WJ25OixJIuJqB7p1ZHffDastM6SftSYAecdcnS
	 0J3Vyk7KdRHeNiZTHd7PeNAESrRRoyJlj3UF5rZ5mMPQnXrpcxgU8sxoX7fViklSe+
	 gmv5TRHOHGHJYni6v+DCI0ZCTQCn5UrnQUa0q6dTzjfaIvRRMmdbsMEeAiOcPvo0Vw
	 fxi+uBeeC1vvy2fRaE+/1EbxRexGTtBMRSNX9K4rYgDoVtH0OE3Duyw0T1OWbZZZvK
	 x5E5UZhz8GA7A==
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
Subject: [PATCH V2 2/3] openrisc: ptrace: Remove duplicate operation
Date: Sat,  3 Sep 2022 12:23:26 -0400
Message-Id: <20220903162328.1952477-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220903162328.1952477-1-guoren@kernel.org>
References: <20220903162328.1952477-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_092353_767283_318A7E3F 
X-CRM114-Status: UNSURE (   8.92  )
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
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Acked-by: Stafford Horne <shorne@gmail.com>
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
