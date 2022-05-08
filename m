Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D090C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun,  8 May 2022 03:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K/e7MdllvoeIHY6CRpbL52Lg9L8BlehIM5fLXu2Cz04=; b=z23or1IVLmy7Cj
	Y+trbDa/WjKRDZw7i8CPLAXZG1Xc+vR68rJx4v/GYOdw+Dx6+gxqrNxGgghrrX937B/yJQUtN+eJK
	fKSEe45mXkrQePih0nt0vI6tHTFOaqdR9IfiqGCs8BDRr74a0zsc0YQztfVaaEStV+RxhESJR2R4T
	kSsqQDbINPXVTQZHcvNJ78aO6jciAydKh5WmJ8IW57fvI6opra7cIi16nIDyF1yfc2LLAB8hDIbqP
	MqH6pk3RH98OmrHfSjA6WmYxD6FFCcAInr63r4J5Ptfahp7KdOVcL186oq6b+7ixy9YqCvBGQw1lD
	MSV9V3FtVkqLGnTEhtrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnXDG-008uFx-SW; Sun, 08 May 2022 03:04:02 +0000
Received: from smtpbg138.qq.com ([106.55.201.18] helo=smtpbg.qq.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnXDA-008uDr-L5
 for linux-snps-arc@lists.infradead.org; Sun, 08 May 2022 03:04:01 +0000
X-QQ-mid: bizesmtp84t1651978948twf40apl
Received: from localhost.localdomain ( [125.69.42.80])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 08 May 2022 11:02:26 +0800 (CST)
X-QQ-SSF: 01000000002000E0S000B00A0000000
X-QQ-FEAT: Mzskoac49OiMPXbnyEYdI4Qsrzbl4IKmMFgaE+lCQmtRRuGsyeNZUiwnpsEvu
 xqrzS2H1cvueaTfYzJG7DTrGofNXFBFvh8IljyG6LVuOOLnwRQU4kg14SJZP9nyzIUg6mgH
 SOzS0Kjswg+b8g4SptPRaWLFwrwjceQxyW+Q7eforwGeet11nePI5kq+8ZOMe6lZ7+/ereq
 70c4y8MIvemARkEIqIsCdaGw0TLbgMwMbUArnyEZ7wZY3Cdf656jI9lXmNpClE2mYW0OlBc
 +hfHS21BXl8q8ZRLyATqw8O/tKjPl1zNkwokM6ytgregXvFHqkBcSVKKEToe8IheD47zhKz
 Y5u8kBJF1AncqxuxGx0qTFWN7bWJA==
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: vgupta@kernel.org
Cc: peterz@infradead.org, will@kernel.org, wangborong@cdjrlc.com,
 Julia.Lawall@inria.fr, vschneid@redhat.com, deng.changcheng@zte.com.cn,
 libang.linuxer@gmail.com, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ARC: Fix comment typo
Date: Sun,  8 May 2022 11:02:24 +0800
Message-Id: <20220508030224.124797-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_200357_057544_BEFC62A2 
X-CRM114-Status: UNSURE (   8.87  )
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

Remove one of the repeated 'call' in comment line 396.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/arc/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index d947473f1e6d..6c22a53711e9 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -393,7 +393,7 @@ irqreturn_t do_IPI(int irq, void *dev_id)
  * API called by platform code to hookup arch-common ISR to their IPI IRQ
  *
  * Note: If IPI is provided by platform (vs. say ARC MCIP), their intc setup/map
- * function needs to call call irq_set_percpu_devid() for IPI IRQ, otherwise
+ * function needs to call irq_set_percpu_devid() for IPI IRQ, otherwise
  * request_percpu_irq() below will fail
  */
 static DEFINE_PER_CPU(int, ipi_dev);
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
