Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D24C8303C
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Jul 2025 15:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ouqc7ZGno9yn6KauXn3ORipO7XVr5Jobd3nD8S7nbA=; b=V13GTzIJf+sIy7
	RDyDAzK0PtnoTCdT4b4m6hhQ+cIHiqaeux3umeNhIaJ3RALOuDZ4tKZDLPpPd6hZne6Pzhpw6ccb1
	BI8/cT8CkZDCMINXS+ADxPOjQF/6elu0SSLnG35M7kCleAUunNet/jX/1Ux01Ed5AV8W3TGz6qECu
	LDEQcKv298L5CZNdycue26dPWUHEGArgGBDCNq/KVdf0rDIde7RMGssfBprIGdGkY5Rk2tBZYikMn
	ImWw4S/5++83LIaYr+0tD/q/rCJ/eDuOI0r6c7pUCeSbqY+nzPvF/HSXrOU9V7DO2CzUBJXrBHWGW
	/3ko89hfzxcIpcxM3yuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWd06-00000005u7y-0JkW;
	Tue, 01 Jul 2025 15:34:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbTS-00000005be6-4Bek
	for linux-snps-arc@lists.infradead.org;
	Tue, 01 Jul 2025 13:56:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C5C32696;
	Tue,  1 Jul 2025 06:56:23 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A5673F58B;
	Tue,  1 Jul 2025 06:56:37 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH 04/23] ARC: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:55:57 +0100
Message-Id: <20250701135616.29630-5-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_065639_071909_6AAABFAF 
X-CRM114-Status: GOOD (  10.46  )
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

Instead of having the core code guess the note name for each regset,
use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linux-snps-arc@lists.infradead.org
---
 arch/arc/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/ptrace.c b/arch/arc/kernel/ptrace.c
index e0c233c178b1..cad5367b7c37 100644
--- a/arch/arc/kernel/ptrace.c
+++ b/arch/arc/kernel/ptrace.c
@@ -284,7 +284,7 @@ enum arc_getset {
 
 static const struct user_regset arc_regsets[] = {
 	[REGSET_CMN] = {
-	       .core_note_type = NT_PRSTATUS,
+	       USER_REGSET_NOTE_TYPE(PRSTATUS),
 	       .n = ELF_NGREG,
 	       .size = sizeof(unsigned long),
 	       .align = sizeof(unsigned long),
@@ -293,7 +293,7 @@ static const struct user_regset arc_regsets[] = {
 	},
 #ifdef CONFIG_ISA_ARCV2
 	[REGSET_ARCV2] = {
-	       .core_note_type = NT_ARC_V2,
+	       USER_REGSET_NOTE_TYPE(ARC_V2),
 	       .n = ELF_ARCV2REG,
 	       .size = sizeof(unsigned long),
 	       .align = sizeof(unsigned long),
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
