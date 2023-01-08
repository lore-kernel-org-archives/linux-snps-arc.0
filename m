Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A20DC63797
	for <linux-snps-arc@archiver.kernel.org>; Sun,  8 Jan 2023 19:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=awDbCj36o16JVdlLym3YFhnQ80HJN9UHE8vamy5nmP8=; b=htAUH069mjtRi3
	U/saD1ffpDmFcLNnbwLdelziXHDb7hXufbq+MfV437uh42pBDQFuNK2eLWsHyazR7/EbnfW8cskYZ
	o4FaTPfddvQLlRBDo5g88kCFSMfAIVflNqQ0TYAziW1EM/wzeS6qdgpE41hLfwgleu2LMkfLFK6cF
	90uPLAlXpC9SXLLoO00MWiJ4SVqMxmTv4VzNghL9Jm+dIPLI0GE2btuzFa5Fm5T6r580BdH/gPViG
	UAyyssJZTnsBuoWOeO8yAs0lr9Es2JWonNSv6+0ebwm/KR8gqbrxJPwwwHXQqSBRywnOWgMB/05Fh
	jEzvCB9mdRcTQHWRUIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEayf-00FOYQ-O3; Sun, 08 Jan 2023 19:05:05 +0000
Received: from smtp-22.smtpout.orange.fr ([80.12.242.22] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEayb-00FOVK-DU
	for linux-snps-arc@lists.infradead.org; Sun, 08 Jan 2023 19:05:03 +0000
Received: from pop-os.home ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id EayQpvONwvuBYEayQps48G; Sun, 08 Jan 2023 20:04:52 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Jan 2023 20:04:52 +0100
X-ME-IP: 86.243.100.34
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Dan Carpenter <error27@gmail.com>
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] bit_spinlock: Include <asm/processor.h>
Date: Sun,  8 Jan 2023 20:04:44 +0100
Message-Id: <8b81101d59a31f4927016c17e49be96754a23380.1673204461.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_110501_634287_B1EF8D1B 
X-CRM114-Status: UNSURE (   8.27  )
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

In an attempt to simplify some includes in <include/dcache.h>, it
appeared, when compiling fs/ecryptfs/dentry.c, that <linux/bit_spinlock.h>
was relying on other includes to get the definition of cpu_relax().
(see [1])

It broke on arc.

Include <asm/processor.h> in <linux/bit_spinlock.h> to fix the issue.
This will help remove some un-needed includes from <include/dcache.h>.

[1]: https://lore.kernel.org/all/202301082130.LXMj5qkD-lkp@intel.com/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure who to send this to.
get_maintainer.pl is of no help, and the file is untouched from a too long
time.

Greg? Dan? Any pointer?
---
 include/linux/bit_spinlock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/bit_spinlock.h b/include/linux/bit_spinlock.h
index bbc4730a6505..d0fd2a7afca2 100644
--- a/include/linux/bit_spinlock.h
+++ b/include/linux/bit_spinlock.h
@@ -2,6 +2,7 @@
 #ifndef __LINUX_BIT_SPINLOCK_H
 #define __LINUX_BIT_SPINLOCK_H
 
+#include <asm/processor.h>
 #include <linux/kernel.h>
 #include <linux/preempt.h>
 #include <linux/atomic.h>
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
