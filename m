Return-Path: <SRS0=IYFD=LE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA382C48BD1
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Jun 2021 19:12:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25724611CC
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Jun 2021 19:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25724611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cn9umofg624SzxGoRufy8CocBedIpq/2Aj3oUFAkfdo=; b=UnuGZn//KA6LWF
	llA5FcLcx8h5qxs+WLR4rD8cdvsu6uVixdpwdkeoqKDjzesHLgZCV9jTF48INYeEDxD7ZEZE5CAml
	V9wBSJZzUw8zUwOm+Lv9aKddSX/y5IllRp2Mp2BrbKTXjVd1v8+7CetZOo1+Wgi7KCst315a0VU/J
	PnCzrurlGpK21Kt0HZjW5m4Hva4tBQeErgXI8QZSXVWxAcgY8s0+ErmAoaBt/VPBnJ35W1AjY9ztK
	Fhomlbb9yMy5eSpDQjm5PrNUd9cb7HNGMp0q3Qq8pwQxZ10YVGro7q6RZrhWpdWTjlZYIAd3Tv4UT
	hnmGZGzgkWJ2ph+h+o9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrQ6J-002EUs-IX; Thu, 10 Jun 2021 19:12:23 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrQ6G-002EUH-O7
 for linux-snps-arc@lists.infradead.org; Thu, 10 Jun 2021 19:12:22 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 003FAC0AE5;
 Thu, 10 Jun 2021 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1623352339; bh=7khdIaQtTK1MIOXk3FXEO2cEA11Zp9810SHnpbDPJZA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BUHwsYR6TvXrg+CISQaPZ9xrmolRCxM+Zou0Jd01wAIiYogg+XWB6Ato+QTFgkYqd
 A9nUT4rZW8JdJOplZYGt6MDyWicNV5efvlermv5xuitdMrPUgK047SYD3+x+M4g2JV
 ZnAoy88i4y7MYV+s6isuAMrLF9BKVJnCODsU5XGZSM0Gh5K0GG7zIkNvxkULBKI2rl
 OKJ0mKG26mPik+bwlLgHBwnsaji3CKJtf0YMck+yBNfj496cjH7LD0c2rGoZiNJHZv
 X4oRE32v8e1+HuClTzdhiht/PFqJwerxi6O0LoONoFo5DQN23w1hT7pJAdcCdqEShq
 ahYJDmTJoiJag==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7CD70A0072;
 Thu, 10 Jun 2021 19:12:18 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 Vladimir Isaev <Vladimir.Isaev@synopsys.com>
Subject: [PATCH v2] ARCv2: save ABI registers across signal handling
Date: Thu, 10 Jun 2021 12:12:16 -0700
Message-Id: <20210610191216.2936035-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202106101254.80jqhB9j-lkp@intel.com>
References: <202106101254.80jqhB9j-lkp@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_121220_857972_C9EBFDF1 
X-CRM114-Status: GOOD (  16.03  )
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

ARCv2 has some configuration dependent registers (r30, r58, r59) which
could be targetted by the compiler. To keep the ABI stable, these were
unconditionally part of the glibc ABI
(sysdeps/unix/sysv/linux/arc/sys/ucontext.h:mcontext_t) however we
missed populating them (by saving/restoring them across signal
handling).

This patch fixes the issue by
 - adding arcv2 ABI regs to kernel struct sigcontext
 - populating them during signal handling

Change to struct sigcontext might seem like a glibc ABI change (although
it primarily uses ucontext_t:mcontext_t) but the fact is
 - it has only been extended (existing fields are not touched)
 - the old sigcontext was ABI incomplete to begin with anyways

Fixes: https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/53
Cc: <stable@vger.kernel.org>
Tested-by: kernel test robot <lkp@intel.com>
Reported-by: Vladimir Isaev <isaev@synopsys.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/include/uapi/asm/sigcontext.h |  1 +
 arch/arc/kernel/signal.c               | 43 ++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/arc/include/uapi/asm/sigcontext.h b/arch/arc/include/uapi/asm/sigcontext.h
index 95f8a4380e11..7a5449dfcb29 100644
--- a/arch/arc/include/uapi/asm/sigcontext.h
+++ b/arch/arc/include/uapi/asm/sigcontext.h
@@ -18,6 +18,7 @@
  */
 struct sigcontext {
 	struct user_regs_struct regs;
+	struct user_regs_arcv2 v2abi;
 };
 
 #endif /* _ASM_ARC_SIGCONTEXT_H */
diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
index b3ccb9e5ffe4..cb2f88502baf 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -61,6 +61,41 @@ struct rt_sigframe {
 	unsigned int sigret_magic;
 };
 
+static int save_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
+{
+	int err = 0;
+#ifndef CONFIG_ISA_ARCOMPACT
+	struct user_regs_arcv2 v2abi;
+
+	v2abi.r30 = regs->r30;
+#ifdef CONFIG_ARC_HAS_ACCL_REGS
+	v2abi.r58 = regs->r58;
+	v2abi.r59 = regs->r59;
+#else
+	v2abi.r58 = v2abi.r59 = 0;
+#endif
+	err = __copy_to_user(&mctx->v2abi, &v2abi, sizeof(v2abi));
+#endif
+	return err;
+}
+
+static int restore_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
+{
+	int err = 0;
+#ifndef CONFIG_ISA_ARCOMPACT
+	struct user_regs_arcv2 v2abi;
+
+	err = __copy_from_user(&v2abi, &mctx->v2abi, sizeof(v2abi));
+
+	regs->r30 = v2abi.r30;
+#ifdef CONFIG_ARC_HAS_ACCL_REGS
+	regs->r58 = v2abi.r58;
+	regs->r59 = v2abi.r59;
+#endif
+#endif
+	return err;
+}
+
 static int
 stash_usr_regs(struct rt_sigframe __user *sf, struct pt_regs *regs,
 	       sigset_t *set)
@@ -94,6 +129,10 @@ stash_usr_regs(struct rt_sigframe __user *sf, struct pt_regs *regs,
 
 	err = __copy_to_user(&(sf->uc.uc_mcontext.regs.scratch), &uregs.scratch,
 			     sizeof(sf->uc.uc_mcontext.regs.scratch));
+
+	if (is_isa_arcv2())
+		err |= save_arcv2_regs(&(sf->uc.uc_mcontext), regs);
+
 	err |= __copy_to_user(&sf->uc.uc_sigmask, set, sizeof(sigset_t));
 
 	return err ? -EFAULT : 0;
@@ -109,6 +148,10 @@ static int restore_usr_regs(struct pt_regs *regs, struct rt_sigframe __user *sf)
 	err |= __copy_from_user(&uregs.scratch,
 				&(sf->uc.uc_mcontext.regs.scratch),
 				sizeof(sf->uc.uc_mcontext.regs.scratch));
+
+	if (is_isa_arcv2())
+		err |= restore_arcv2_regs(&(sf->uc.uc_mcontext), regs);
+
 	if (err)
 		return -EFAULT;
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
