Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1147CA5FF0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Oct 2026 12:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rd9U/e1VADkMCa4i1E1VJw+NvyQdxAnDpL5q29aqKfI=; b=k74uhJ2wNJQi0R
	flaP1MGmTGmPrU3VAnCpdspw04cbsLRMwpu0TJ2z13jn8Ms7v1Ne3YKEMMt2JAQpwGPAAH6jNsr7p
	sJ6zHLSMZP9sv8XXIw8WcK59A99HgvqSV1iQANijbKGAcUs7nVQsEZq5p8nLyfszBnpG0SnD4N5PK
	aZ0jHwZVbvDEJFuy8nc6vWctBegHePOkTur615Iw8aNk1gsIAUyJMBP+zOFW8aeqRpw9+0X3tLnRz
	JObCBKdg9+1ji5560nMURR0fLUppH5isU/W92zaCI28jeSEzBR/SrUhKsq2Fee3/ByuwogyrOwDMJ
	XXO7S7pg/EVm2zGHcjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhUh-0000000GNZT-1q8C;
	Mon, 05 Oct 2026 12:08:35 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhUe-0000000GNYQ-23GZ
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Oct 2026 12:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201962; bh=UyE2WbqxID6O1bGrrpnC3dh
	LKyhQZ5MZNS++hKSonwE=; b=eZ2XT5Bh4pXDtA40DlRj0lsF7MM3PQxbEpumAS8ocLlYGKCpBh
	Onu1KggTJSFIP63bAJ3GV4GjZDdY+q/CwNpMAMIr25H8f4WS6hnIsnCfFZVGkbQrTBlYkPBPtYv
	pkDrle8XJRHWS1Tu2bPND0bxnKRaeoo7efvNSGvAlXWgem4IcsdZwGQ4z5N/bHwI+vjEJ06nJ+1
	uXN8fP2rLAYFAOmrL6v40zx4nAEVt9hJm/1WXxTzQb6RVZbG4Qlc77YlmIyhGb4oYmGiDo0q7St
	ypMDw1C9AXDUxI+PTPaH1jxY6hXMBBs7ohriLVC7nghSPWC8XfVHG1iBVwWHNQVDvCw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201962; bh=UyE2WbqxID6O1bGrrpnC3dh
	LKyhQZ5MZNS++hKSonwE=; b=4fNx8f8psYphS2ELO4DamDMhCz7KzrLNPkKLK5GgxIU8P6GdKk
	tdaM6pSLX+q1NGmVNr7INXgUzQwffOmwUCCA==;
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org,
	vgupta@kernel.org,
	guoren@kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: arnd@arndb.de,
	paulmck@kernel.org,
	david.laight.linux@gmail.com,
	glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH v5 2/3] csky: Emulate two-byte cmpxchg
Date: Mon,  5 Oct 2026 12:05:55 +0000
Message-ID: <20261005120556.383004-3-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005120556.383004-1-brads@mainlining.org>
References: <20261005120556.383004-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_050832_681765_D5D4F042 
X-CRM114-Status: UNSURE (   7.33  )
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

C-SKY has no two-byte atomic compare and swap, so the __cmpxchg()
macros let case 2 fall through to BUILD_BUG() via default, and a
two-byte cmpxchg() fails the build.

Route case 2 through the new cmpxchg_emu_u16(), which narrows the
old and new values itself, so all three orderings, relaxed, acquire
and full, keep the (uintptr_t) casts the case 1 path already uses.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/csky/include/asm/cmpxchg.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
index db6dda47184e..6f3ca79e54ac 100644
--- a/arch/csky/include/asm/cmpxchg.h
+++ b/arch/csky/include/asm/cmpxchg.h
@@ -64,6 +64,9 @@
 	switch (size) {						\
 	case 1:							\
 		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (unsigned long)__old, (unsigned long)__new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
@@ -97,6 +100,9 @@
 	switch (size) {						\
 	case 1:							\
 		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (unsigned long)__old, (unsigned long)__new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
@@ -131,6 +137,9 @@
 	switch (size) {						\
 	case 1:							\
 		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (unsigned long)__old, (unsigned long)__new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
-- 
2.53.0

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
