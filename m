Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C91C4332F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Oct 2022 21:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VoBnjet91KQkm65fFBVnLG49AwQSj72QD8eo0w8nYIM=; b=Kyqqjdk6xt48M9
	lc+LiIizt3aAvONag7DiAzww64MjNzcVqLzq/56KlPrVSdSdcQcPtAsrsyKTUGHY2jLN2pvfpvgb3
	qSyM2675uGsGcfMF0pzIVtM9bajJIhhsfkE30WjvNsWCHmfS0YOBwjIH4N6r33FMFPJ3pZZt89qjT
	S9qZDihuoQrbOTcsFdN3ED9AKBWFZha3a5cy4MfftJSx9AFvp6OQgY7wG2+8Ya0JqwD86oIpIBYzu
	FZyFUHI66VC5Qb0ZyzTGeOXNyW6d+Nzo2yyoD9aKHjbobhBzdKfV5MJcZm1I419h73s3uiI5+bQUQ
	ebake/C/45/x6s8Cimow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojS9A-00Fzl6-GA; Fri, 14 Oct 2022 21:23:12 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojS8z-00FzfM-2e
	for linux-snps-arc@lists.infradead.org; Fri, 14 Oct 2022 21:23:02 +0000
Received: from localhost.localdomain (178.176.75.138) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Sat, 15 Oct
 2022 00:22:47 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Oleg Nesterov <oleg@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
	<linux-snps-arc@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 01/13] arc: ptrace: user_regset_copyin_ignore() always returns 0
Date: Sat, 15 Oct 2022 00:22:23 +0300
Message-ID: <20221014212235.10770-2-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20221014212235.10770-1-s.shtylyov@omp.ru>
References: <20221014212235.10770-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
X-Originating-IP: [178.176.75.138]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 10/14/2022 21:00:39
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 173137 [Oct 14 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 500 500 6cc86d8f5638d79810308830d98d6b6279998c49
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: 	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {rdns complete}
X-KSE-AntiSpam-Info: {fromrtbl complete}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.138
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=none header.from=omp.ru;spf=none
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/14/2022 21:03:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/14/2022 3:23:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_142301_154216_6048D356 
X-CRM114-Status: UNSURE (   8.07  )
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

user_regset_copyin_ignore() always returns 0, so checking its result seems
pointless -- don't do this anymore...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 arch/arc/kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/ptrace.c b/arch/arc/kernel/ptrace.c
index da7542cea0d8..2abdcd9b09e8 100644
--- a/arch/arc/kernel/ptrace.c
+++ b/arch/arc/kernel/ptrace.c
@@ -185,7 +185,7 @@ static int genregs_set(struct task_struct *target,
 
 #define REG_IGNORE_ONE(LOC)		\
 	if (!ret)			\
-		ret = user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf, \
+		user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf, \
 			offsetof(struct user_regs_struct, LOC), \
 			offsetof(struct user_regs_struct, LOC) + 4);
 
-- 
2.26.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
