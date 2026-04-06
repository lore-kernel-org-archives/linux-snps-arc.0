Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0E8E9D82F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Apr 2026 01:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:References:
	In-Reply-To:Cc:To:Message-ID:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IdWk/kyCSAiF+a5CVHpIhwg/FvgdkNdAJ4Mnz8kFlpE=; b=j3J2b1hEE3rMSfdaXeFkXJfBMb
	TG8EL8AsF49G7LQWjDnqCzFEDvfBr2WqmcYTG9iJvfl261+wZttZt5jR/CN6CmnTOAl9ipxdiXvAb
	kuYOjhQ2klf2VpXvgYSlKbwaITBE8Vciknxzd9Ton6WVLBOEY0pnBM44wlfLgrdgVoGWucWOHXvDn
	EI1R7Cxz04G2Un5m1Xxx7/GMhqiQY/Yj0Gk65J7IyHccrWdNzVP7i8jXFPtdEM7DX4toGUABjRfAB
	uSMUvjn5hZ8CZ3ItodIdAjYQ6CBCLNwM/ih64PtZJIPL3QKGoz89IxNFZGSpcThV35IisLNDxB4w1
	+T7Z6qKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Z0r-00000004giG-3Pot;
	Mon, 06 Apr 2026 01:44:25 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Z0p-00000004gha-0IQi
	for linux-snps-arc@lists.infradead.org;
	Mon, 06 Apr 2026 01:44:24 +0000
Received: from 0001-arc-v2.eml (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowAC3Sg70D9NpD3imDA--.29086S2;
	Mon, 06 Apr 2026 09:44:20 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Mon, 6 Apr 2026 15:00:00 +0800
Message-ID: <20260406152001.2-arc-dt-cpumap-v2-pengpeng@iscas.ac.cn>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260403161002.2-arc-dt-cpumap-pengpeng@iscas.ac.cn>
References: <20260403161002.2-arc-dt-cpumap-pengpeng@iscas.ac.cn>
Subject: [PATCH v2] arc: validate DT CPU map strings before parsing them
X-CM-TRANSID: zQCowAC3Sg70D9NpD3imDA--.29086S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFy3uryUtF1xWF47CrWkCrg_yoW8Gw4fpF
	Z09FyqgrWqvwn7Ja4qyr1xua4Ygwn7Jr129FW5Kw47Za17try8XrZI9F1v9r1xAr409a4a
	kFZ8uF4qyr4UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK62vIxIIY0VWUWVWUZwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4
	x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8C
	rVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxV
	WUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sREbAwU
	UUUUU==
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_184423_484818_45EB2999 
X-CRM114-Status: UNSURE (   7.78  )
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

Changes since v1:
- fold the NUL-termination check into the initial lookup test, as
  suggested by Vineet Gupta

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arc/kernel/smp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arc/kernel/smp.c b/arch/arc/kernel/smp.c
index b2f2c59279a6..632976c22107 100644
--- a/arch/arc/kernel/smp.c
+++ b/arch/arc/kernel/smp.c
@@ -22,6 +22,7 @@
 #include <linux/irqdomain.h>
 #include <linux/export.h>
 #include <linux/of_fdt.h>
+#include <linux/string.h>
 
 #include <asm/mach_desc.h>
 #include <asm/setup.h>
@@ -43,9 +44,10 @@ static int __init arc_get_cpu_map(const char *name, struct cpumask *cpumask)
 {
 	unsigned long dt_root = of_get_flat_dt_root();
 	const char *buf;
+	int len;
 
-	buf = of_get_flat_dt_prop(dt_root, name, NULL);
-	if (!buf)
+	buf = of_get_flat_dt_prop(dt_root, name, &len);
+	if (!buf || !memchr(buf, '\0', len))
 		return -EINVAL;
 
 	if (cpulist_parse(buf, cpumask))
 		return -EINVAL;
 
 	return 0;
 }
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
