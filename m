Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B625DD730A2
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Apr 2026 05:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:Message-ID:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=332M6LK+QuUQ17GPXPvvxqosOSsPyBDZsF/BsIrwUP4=; b=3g1xVfxwm/q6sI
	8wqaQA9mJ2wsI59dHychwsigVx8K+EBzdU+K6kg1LSqg5j8tac2XvfWQ4oK/afu3kb1y10AQ1htKs
	/wiIIHQ01HJxFKUjCH/DkADRifIBu821L8Yzepxoays96TLjbzD1slfyQZzmVRte2BQwr/HJa6Qsk
	CbppmqGiUz2M5DEdDM3tXnsigR3k96amPBxrhSGnL2SKrMbOCEfqSK3VSJfvbP5BgPo2pcDudVPoR
	TJzcBnxvINURhQzO1GWbTxkLFqXhY3H721ZDoTh7X2n3twikpaPwo4F/q/TkjNyzG+X9NvULMaHZ1
	3pf2+FyGEi/mj29E3noA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XQ1-00000001Ldl-0ZBg;
	Fri, 03 Apr 2026 05:50:09 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XPy-00000001Lcs-38Hz
	for linux-snps-arc@lists.infradead.org;
	Fri, 03 Apr 2026 05:50:08 +0000
Received: from 0002-arc.eml (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAA3WuELVc9pL4m7DA--.13684S2;
	Fri, 03 Apr 2026 13:50:03 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 13:41:47 +0800
Message-ID: <20260403161002.2-arc-dt-cpumap-pengpeng@iscas.ac.cn>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] arc: validate DT CPU map strings before parsing them
X-CM-TRANSID: rQCowAA3WuELVc9pL4m7DA--.13684S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFy3uryUtF1xWF47Cw1xZrb_yoW8Gr13pF
	Z09FyqqrZ0v3s7A34qyr1kua4Ykw1kJr129FWrGw47Zw47tryDXrZa9F1v9r1xArW09a4F
	kFZ8uF4qyr4UJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUya14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbnmRUUUUUU==
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_225007_207653_900B4016 
X-CRM114-Status: UNSURE (   7.26  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

arc_get_cpu_map() fetches the possible-cpus or present-cpus property
from the flat DT and immediately passes the raw pointer to
cpulist_parse(). That parser expects a NUL-terminated text buffer, but
this path does not prove that the DT property is terminated within its
declared bounds.

Reject unterminated CPU-map properties before handing them to
cpulist_parse().

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arc/kernel/smp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index b2f2c59279a6..e0f8218e9172 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -22,6 +22,7 @@
 #include <linux/irqdomain.h>
 #include <linux/export.h>
 #include <linux/of_fdt.h>
+#include <linux/string.h>
 
 #include <asm/mach_desc.h>
 #include <asm/setup.h>
@@ -43,11 +44,15 @@ static int __init arc_get_cpu_map(const char *name, struct cpumask *cpumask)
 {
 	unsigned long dt_root = of_get_flat_dt_root();
 	const char *buf;
+	int len;
 
-	buf = of_get_flat_dt_prop(dt_root, name, NULL);
+	buf = of_get_flat_dt_prop(dt_root, name, &len);
 	if (!buf)
 		return -EINVAL;
 
+	if (!memchr(buf, '\0', len))
+		return -EINVAL;
+
 	if (cpulist_parse(buf, cpumask))
 		return -EINVAL;
 
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
