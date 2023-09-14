Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02620EEAA62
	for <linux-snps-arc@archiver.kernel.org>; Thu, 14 Sep 2023 18:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qv45ByBUUspUUwZ5dtlAHE5q7wb5TCNgjfomGxpf5w0=; b=vhsNhR3rXYNF2/
	jpK2YrCPc7djI1+DlpN9oUxU8+5IlvguFL8Y0pGp6CgCMh7ErkfHpxqVcFLOWPLwFE+rG8T8e2FIr
	KQZM0Td0ZTN7ux7wLNtPNHYALaaql7a+l1wgdBVKzUosuoCR2BVBc+Dtnuq7iMBvCSmGPklfHapYI
	vZnx9tlnavCf+/x9FtTrofrXSV6XqEOXwwtA7gNmnxPn/S53fp46h1rXAWpPVjQKQIpB+BxS4XKXQ
	4jTOvliZbNQ/4TgozPYRh4xlEu4Eboy1M2FZhD0dv5O6zcyO0mRgzMk3+sXFzBFdS1cnO9yTxy2wX
	lMEkM1s30bMCJ6ZuYtvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrF5-0094vH-2n;
	Thu, 14 Sep 2023 18:39:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrEt-0094ke-0w
	for linux-snps-arc@lists.infradead.org;
	Thu, 14 Sep 2023 18:38:58 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694716727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzsn2wLYsWS44Gbs24avQ4nqhzEXcoHpcp6KNR2u0GE=;
	b=PiJR5jMN7CVVZo8siH35FwnJFoSDfXaB7ytFHSQkwHRaQ+jVGAS45QDRTXT05uk0ubuWUR
	ypRaqKU5MiNEmIar0/k6pnSjYR7UZoP3tLOl1SWRLlPtvMAvuA2EWhBaxYg2PPa7frbNrq
	iW0FlJ1UVo03/8eHUfNsbc5INW1VgtLIFpmHtgZ5vzGMJSZfkGO+MrxULFEJ34hYUJqKPP
	IWsAFHssQ38VQeZn6VIF6MBsLqdxCWEQdJe5UHPrRiZtnI9mkk0TMLw7XyDWxJNc8IVj9X
	wTdog0tqfcGozCm07toBOvFNKPAaLuWTD75SD+cXvZr7wlaBeU/4eQMmdGpITA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694716727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzsn2wLYsWS44Gbs24avQ4nqhzEXcoHpcp6KNR2u0GE=;
	b=MiF9n5qv0YK7IdQjzTI3Kbo1xwtqPynXg98RvBsu+Hr3Twlm6rN65Op6DLiw2hKFzDWYz1
	gBCFTmnSTbNPWfAw==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH tty v1 20/74] serial: arc_uart: Use port lock wrappers
Date: Thu, 14 Sep 2023 20:43:37 +0206
Message-Id: <20230914183831.587273-21-john.ogness@linutronix.de>
In-Reply-To: <20230914183831.587273-1-john.ogness@linutronix.de>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_113855_495769_E570ECB7 
X-CRM114-Status: GOOD (  15.02  )
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

From: Thomas Gleixner <tglx@linutronix.de>

When a serial port is used for kernel console output, then all
modifications to the UART registers which are done from other contexts,
e.g. getty, termios, are interference points for the kernel console.

So far this has been ignored and the printk output is based on the
principle of hope. The rework of the console infrastructure which aims to
support threaded and atomic consoles, requires to mark sections which
modify the UART registers as unsafe. This allows the atomic write function
to make informed decisions and eventually to restore operational state. It
also allows to prevent the regular UART code from modifying UART registers
while printk output is in progress.

All modifications of UART registers are guarded by the UART port lock,
which provides an obvious synchronization point with the console
infrastructure.

To avoid adding this functionality to all UART drivers, wrap the
spin_[un]lock*() invocations for uart_port::lock into helper functions
which just contain the spin_[un]lock*() invocations for now. In a
subsequent step these helpers will gain the console synchronization
mechanisms.

Converted with coccinelle. No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/tty/serial/arc_uart.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc_uart.c
index ad4ae19b6ce3..1aa5b2b49c26 100644
--- a/drivers/tty/serial/arc_uart.c
+++ b/drivers/tty/serial/arc_uart.c
@@ -279,9 +279,9 @@ static irqreturn_t arc_serial_isr(int irq, void *dev_id)
 	if (status & RXIENB) {
 
 		/* already in ISR, no need of xx_irqsave */
-		spin_lock(&port->lock);
+		uart_port_lock(port);
 		arc_serial_rx_chars(port, status);
-		spin_unlock(&port->lock);
+		uart_port_unlock(port);
 	}
 
 	if ((status & TXIENB) && (status & TXEMPTY)) {
@@ -291,12 +291,12 @@ static irqreturn_t arc_serial_isr(int irq, void *dev_id)
 		 */
 		UART_TX_IRQ_DISABLE(port);
 
-		spin_lock(&port->lock);
+		uart_port_lock(port);
 
 		if (!uart_tx_stopped(port))
 			arc_serial_tx_chars(port);
 
-		spin_unlock(&port->lock);
+		uart_port_unlock(port);
 	}
 
 	return IRQ_HANDLED;
@@ -366,7 +366,7 @@ arc_serial_set_termios(struct uart_port *port, struct ktermios *new,
 	uartl = hw_val & 0xFF;
 	uarth = (hw_val >> 8) & 0xFF;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 
 	UART_ALL_IRQ_DISABLE(port);
 
@@ -391,7 +391,7 @@ arc_serial_set_termios(struct uart_port *port, struct ktermios *new,
 
 	uart_update_timeout(port, new->c_cflag, baud);
 
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static const char *arc_serial_type(struct uart_port *port)
@@ -521,9 +521,9 @@ static void arc_serial_console_write(struct console *co, const char *s,
 	struct uart_port *port = &arc_uart_ports[co->index].port;
 	unsigned long flags;
 
-	spin_lock_irqsave(&port->lock, flags);
+	uart_port_lock_irqsave(port, &flags);
 	uart_console_write(port, s, count, arc_serial_console_putchar);
-	spin_unlock_irqrestore(&port->lock, flags);
+	uart_port_unlock_irqrestore(port, flags);
 }
 
 static struct console arc_console = {
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
