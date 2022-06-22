Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C9FC433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Jun 2022 07:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9J/sgTvGJ4EC5FqDaKHRYG2l9sos5+MxW3qMWSsM/8I=; b=pIB9QhjdLZh08l
	pzDRI94hCBP+KxzLgt8+MUvCSAc95ZjclpNx1a2Qri7JURB/oIOeLIu3aXSadRTGQIbTpMKIuvstG
	6U/9dIdbB9qj5TIAm99g7LXsbDXTmJsk/LCAf4Rz6C9qKzyLshLeheMAidJ82fzBpuKmJv6XN866S
	Yu4TdTExhgCOcSUFjurRXoXgci5DNCY/YTYhaFxlyowmQOi6r4+4wU3J0jMpW9LTSUYfz6KW+hFyL
	IhRGS/sz+44bFowB7uxcCr+9FC5xEV6jz/aG+snL5O3nLrh/5barg6Olt+U29q+/eMOh4qPvQvVSF
	OaHB3yeGbJUYoZdO95bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3vCA-00983s-K1; Wed, 22 Jun 2022 07:54:38 +0000
Received: from smtpbg136.qq.com ([106.55.201.188] helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3vC4-0097w1-CS
	for linux-snps-arc@lists.infradead.org; Wed, 22 Jun 2022 07:54:37 +0000
X-QQ-mid: bizesmtp65t1655884341tb59pkwn
Received: from localhost.localdomain ( [125.70.163.206])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jun 2022 15:52:12 +0800 (CST)
X-QQ-SSF: 0100000000200020B000B00A0000000
X-QQ-FEAT: 1al0Ay5k4U3zy32h2+cL9Bj/nzhdZvtHEPp4Zgzg0Yx2lFQN5BPKd26xaupcm
	hCCh81ivB1rljGvEbnpmisY90FvofLSpcfFjIlLSUHf0fIGTw+exuAgn/sViSuPnfRHG5kV
	WnPZXZ9KYcr/HvOu8RixaKnEGUEtfeXSa1h9yEReLE6b9FV0NHgpMpYEjzuX4xGIEPCU97D
	o9p3mRuEc4PHVBxfPFZ2u65qbgBfOLnx2fxgyIe8Bjg7Qv1opxxYVZ/H7aswHm19VUExHna
	wpWReBYA5A6xjp85y52uVI0S9/EqA2D344I2w85RY4UIfV3ArluIjp9dp4aucUAUK8/31fL
	AiptNTuE91u1oLu4JE=
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vgupta@kernel.org,
	Julia.Lawall@inria.fr,
	deng.changcheng@zte.com.cn,
	libang.linuxer@gmail.com
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] ARC:kernel:Fix typos in comments
Date: Wed, 22 Jun 2022 15:52:04 +0800
Message-Id: <20220622075204.35329-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_005432_809432_D654C207 
X-CRM114-Status: UNSURE (   8.46  )
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

Delete the redundant word 'call'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
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
2.36.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
