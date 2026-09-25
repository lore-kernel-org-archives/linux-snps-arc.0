Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B680C9830E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Sep 2026 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=78P7mxmjJcOdQaNMhC3snfshfCN9aSdfjaRJryYheN4=; b=XrcZNtcrl6IDXv
	4SCG6msUGRlPJLqcrLlCOqAXSVtXmnkwft/u+PJ0BIOthYXJ0t6Ad05Tfk+0MEgi9CLHUdl66Z+yn
	8xZYc+YnLlAVujbAnDpmayFMlUxZcn1bJqlrWQjrenlRYGrVSogiS0dPnndFhk/HXW6VxRI/WFYND
	5Gz6SCx2OdyC9EljmPTPizGABQDLOELhuEBp3pqh47mX2nYvqR65JTR2kVnG/2D/mYKCgzsFYjG5Z
	GtxqNK7WmsarCYVyirdnNgx4bElHO8gjs2ZgImYsaRnP1ge5naPV5t55Q2+eQcwY8S2BPSPaEJQak
	0an6p0sznWOD1D6GO09Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAhF-0000000E9ga-34iW;
	Fri, 25 Sep 2026 18:30:57 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAhD-0000000E9fo-05Zg
	for linux-snps-arc@lists.infradead.org;
	Fri, 25 Sep 2026 18:30:56 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 006d021491bc7-6b1ae6b2010so762270eaf.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 25 Sep 2026 11:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361054; x=1790965854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cW2XG4Hoqs2N1NPgfs1kba+XBAoXoAzgs1+8F/XNb98=;
        b=Tk8AaqAGB3QwSBytEOjMTtjEWOlu3lysmQEYeLasTYNsFu6VfQn1Q5uWhMX8qL0BWC
         dGB+W1kY3dPJVQfLUcjQOmpk4B8nMmEQ54M39udqnSKCoCvXsPC2UOL0goIyVxMIFeW1
         zUdhbL3gJe7exMoOr2N9srAWBhRxgra+0TsVj7PHeAjfGwPdZ21EugIdPuZXzH+HLo3G
         UtLqJZtIcgqQOR7Ds4Zjy5MeQW5VfbPOfRCNo/F/NbPHyo31bBzmA0HvvG2ark5fkx/F
         h9B32M7Dwjesod7n74LXS4UjbBzT2IYULoTwER2HwzyyM4CO95R5Rxe7PryVGSM9Boum
         WERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361054; x=1790965854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cW2XG4Hoqs2N1NPgfs1kba+XBAoXoAzgs1+8F/XNb98=;
        b=NM+tT0qr+8Vr4uBoW+F3lTmdiq3lASS+GWGZOFJo216RkeGmrlkXRfB9LKkjslkNjV
         Ua1tkaOFoMh5Gm0errZlCcBWSaCJM1Ax51tUVTne31cpE3EF0LweqcDQENIUKjTrQywt
         DifbGBrENS5TWddjqrrxakrFwpoTJxAt4ZQ6NO5mX+3aDtBMo9XaLKloif6+fmYXqZkW
         PDFirh+S3u1idej5ScAp6Qgu2uXnf7e1V5cLw1QpI32Z2cK0z4+HqfuaYP0w++VYg//b
         6CGghUR72nV0eLPiypc+bPZR7kSeNMjRgqMqO8TyjhB/z5n693c/lR6ltXb7mcegz0Sb
         h5Ag==
X-Forwarded-Encrypted: i=1; AKwUvBzqxDF7RdjoGW3LV3HVj9W14yXqt4f0A3dVxG3lt87XQ8MN3WjID0lvE22FHGArH7OQrab+uDKN7hszRnj0Mg==@lists.infradead.org
X-Gm-Message-State: AFuF++kNqqaQDUcMyPrx7svRxfyx437d8jc0Vwjgr9eC6i2UHMUZnOfL
	dh26Jz6grj6znvUFuWEQPyqt7YQAhv0CMxYcpKPs59i1LZUci/RArVKf
X-Gm-Gg: AYBFou23TB+koRmJP9viKKCsKDBTA5eQ4pZ+CC+sOwA6PsJ8M09npi8AvENP4Js4s02
	NqqtnCLaL5/NnO3ehH+agzPSwFWj/V2mnUJKrf9frCh9ZL65wwBebGsNxhBEqMBKbhQMT2+lInk
	RJSMtn9TzY4eOPK6aWOBOXiThv7U0Ec1Qqn8VjI/qlB+/NKQnpYG9zxLyBkz+mr/VMD1WBFpXFB
	Jy5nZbDJXgd3PKOH1hH8JWycGfzFyevb8MblfuFeBqKi0alJg/7er78AvwcVdsP/Of8s6WEI9dL
	kluel3oliLperFUuk5rRfIVeyGOR5sNV1+JJYRAJW2YVBqBdcB7FC7wNFcLvp16YFtL5u6ATTDS
	TIHTf8K+pfC5cYAYqoPbuYv3XG/fIi4zzL91ZvS6lwQufVDEHE6N49v/3ICbLhsiudmUP03eU3j
	1cQ00h3uLnMwJPcUqjbbU1TtwF9I2UoRG1snAtZd6T2IVVO4WL1iLbyDp0KsPHCJOXajQwNf8gz
	GCIbMW+CrVg52ys7dfUq3DmyFVcGrkOhU/EAOr86Vl+wQ8mA5VywFRp7uX7ZnYWjlI2AEcKv6jl
	tT5fvR+PftANim+DICN8+728j61vKOXp+y95Kl9U7tjg0ibr
X-Received: by 2002:a05:6820:4b0c:b0:6c3:2390:c293 with SMTP id 006d021491bc7-6d43e80cbd2mr6577666eaf.32.1790361053750;
        Fri, 25 Sep 2026 11:30:53 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e8beb374sm3181560a34.10.2026.09.25.11.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:30:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-snps-arc@lists.infradead.org (open list:SYNOPSYS ARC ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS)
Subject: [PATCH] serial: arc_uart: Use platform IRQ helper
Date: Fri, 25 Sep 2026 11:30:50 -0700
Message-ID: <20260925183050.56839-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_113055_068691_9CD6DF5D 
X-CRM114-Status: GOOD (  11.08  )
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

Avoid calling irq_dispose_mapping() by letting the platform_device
machinery handle it. Also enable possibility of handling -EPROBE_DEFER
and other errors. Handle as early as possible to avoid doing unnecessary
work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/arc_uart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc_uart.c
index 3988e5958896..b46b057a181b 100644
--- a/drivers/tty/serial/arc_uart.c
+++ b/drivers/tty/serial/arc_uart.c
@@ -30,7 +30,6 @@
 #include <linux/tty_flip.h>
 #include <linux/serial_core.h>
 #include <linux/io.h>
-#include <linux/of_irq.h>
 #include <linux/of_address.h>
 
 /*************************************
@@ -571,12 +570,17 @@ static int arc_serial_probe(struct platform_device *pdev)
 	struct arc_uart_port *uart;
 	struct uart_port *port;
 	int dev_id;
+	int irq;
 	u32 val;
 
 	/* no device tree device */
 	if (!np)
 		return -ENODEV;
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	dev_id = of_alias_get_id(np, "serial");
 	if (dev_id < 0)
 		dev_id = 0;
@@ -607,7 +611,7 @@ static int arc_serial_probe(struct platform_device *pdev)
 		return PTR_ERR(port->membase);
 	}
 
-	port->irq = irq_of_parse_and_map(np, 0);
+	port->irq = irq;
 
 	port->dev = &pdev->dev;
 	port->iotype = UPIO_MEM;
-- 
2.55.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
