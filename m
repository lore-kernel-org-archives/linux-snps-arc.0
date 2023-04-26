Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83D0C77B7C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Apr 2023 01:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d7Ea2aKgmPbXNilg4LssSD2GsMtb5nL2W+xkW51o1LU=; b=DxL90yDJw3+R/V
	N6lM/JVolgD4IQ1i9sjfKqSW9tXEOVqXXg/tISGVsEEivNIWUoAA9k7NLao15GuHRaiOv/3rmWR4r
	cSEoSg0ogwwlbncghR9ZdQlRAFcLQvF1B2UOnSsCJ6L5BAu2UA0lvuznAcPvRvHFqxmrQKvEm9fxS
	v9t5bjvGmns1Y/iwlE77629WM1LIXtTxc4H1oM4Um3rnhTjpSPzkdynEvXooaSu2ekfsse+8hQiGG
	Q7MnKnYjx4HlV4xn1hUnrSiDUArVjyVjBXyYT94qiyXGuKFyHiVpmkxgbx2lXs8sqT/vE2hhvNs13
	VbZoYKYodgFMnnSNUWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prTxB-002aPy-0H;
	Wed, 26 Apr 2023 01:28:17 +0000
Received: from [202.114.0.240] (helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prTwv-002aHC-0C
	for linux-snps-arc@lists.infradead.org;
	Wed, 26 Apr 2023 01:28:14 +0000
Received: from localhost.localdomain ([172.16.0.254])
	(user=m202171830@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33Q1RO6N006360-33Q1RO6O006360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 26 Apr 2023 09:27:29 +0800
From: Ke Zhang <m202171830@hust.edu.cn>
To: Vineet Gupta <vgupta@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>
Cc: hust-os-kernel-patches@googlegroups.com, Ke Zhang <m202171830@hust.edu.cn>,
        Dongliang Mu <dzm91@hust.edu.cn>,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        linux-snps-arc@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] serial: arc_uart: fix of_iomap leak in `arc_serial_probe`
Date: Wed, 26 Apr 2023 09:27:20 +0800
Message-Id: <20230426012721.6856-1-m202171830@hust.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-FEAS-AUTH-USER: m202171830@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_182803_221389_2BEBE523 
X-CRM114-Status: GOOD (  11.14  )
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

Smatch reports:

drivers/tty/serial/arc_uart.c:631 arc_serial_probe() warn:
'port->membase' from of_iomap() not released on lines: 631.

In arc_serial_probe(), if uart_add_one_port() fails,
port->membase is not released, which would cause a resource leak.

To fix this, I replace of_iomap with devm_of_iomap.

Fixes: 8dbe1d5e09a7 ("serial/arc: inline the probe helper")
Signed-off-by: Ke Zhang <m202171830@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
This issue is found by static analysis and remains untested.
---
 drivers/tty/serial/arc_uart.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc_uart.c
index 59e25f2b6632..be1f3c379382 100644
--- a/drivers/tty/serial/arc_uart.c
+++ b/drivers/tty/serial/arc_uart.c
@@ -606,10 +606,11 @@ static int arc_serial_probe(struct platform_device *pdev)
 	}
 	uart->baud = val;
 
-	port->membase = of_iomap(np, 0);
-	if (!port->membase)
+	port->membase = devm_of_iomap(&pdev->dev, np, 0, NULL);
+	if (IS_ERR(port->membase)) {
 		/* No point of dev_err since UART itself is hosed here */
 		return -ENXIO;
+	}
 
 	port->irq = irq_of_parse_and_map(np, 0);
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
