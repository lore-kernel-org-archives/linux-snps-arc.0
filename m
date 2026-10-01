Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2048CCA5FA5
	for <linux-snps-arc@archiver.kernel.org>; Thu,  1 Oct 2026 08:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrr1COitEPMEvPeNWeyUqTT5o8Z79+v6sIkCfbwRA5k=; b=ULuXstbaQUovLl
	2dl/v34RgbdaT6LLG5vxCVPZP93JqVivXnB4ffHYC+gAOZiesidZptqdbAlxBrvP33oje9vWLedFL
	ZLKZYtB4FblvrjHoTyqnBHQ2N5jdptRn8TxAF1FcxNS4B73+O0V5pl6Y/qrek8rqLGCk1PJTibV0+
	u79u4BA/Fu1Hesm5NcaL59wdomHWMgR6XLHprs89UvGSPUZCYdf9kt2B/TTLwxkEyCWRO/6uJf0uh
	h0RJyUSMw5TQj9qAQGA8ycndm1jzjt+Hr857oWDeMq+vXymZnu1v8psYB6lUv11TaF5SLWV9Jnvju
	/NK+nAL+6kr2jAASsKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCNL-00000008DaM-2pK4;
	Thu, 01 Oct 2026 08:42:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCNJ-00000008DXt-3XSl
	for linux-snps-arc@lists.infradead.org;
	Thu, 01 Oct 2026 08:42:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 051C760A54;
	Thu,  1 Oct 2026 08:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD371F0089A;
	Thu,  1 Oct 2026 08:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790844164;
	bh=9hOkpGS5ErwxdHwTx0cN+BXyaNkX9IR+KQs4cH+2KAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kP3IdNbQJsXfM9PScfd7ItsfkKVyq8TnrevWk2zpdYB7wCai88LVMKjSeH/nMir5h
	 iWl79fgcHR4prmsz5KOCgBYWluFO1vFHU7DpIuxZIcx8/vEg60msmRN+W3C0X9KIgn
	 vCbLOsu7D4fy8185lGwJykbpezvx2JJgDSyGsqqE=
Date: Thu, 1 Oct 2026 10:42:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-serial@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] serial: arc_uart: Use platform IRQ helper
Message-ID: <2026100129-unrest-cleaver-6528@gregkh>
References: <20260925183050.56839-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260925183050.56839-1-rosenp@gmail.com>
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

On Fri, Sep 25, 2026 at 11:30:50AM -0700, Rosen Penev wrote:
> Avoid calling irq_dispose_mapping() by letting the platform_device
> machinery handle it. Also enable possibility of handling -EPROBE_DEFER
> and other errors. Handle as early as possible to avoid doing unnecessary
> work.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/tty/serial/arc_uart.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc_uart.c
> index 3988e5958896..b46b057a181b 100644
> --- a/drivers/tty/serial/arc_uart.c
> +++ b/drivers/tty/serial/arc_uart.c
> @@ -30,7 +30,6 @@
>  #include <linux/tty_flip.h>
>  #include <linux/serial_core.h>
>  #include <linux/io.h>
> -#include <linux/of_irq.h>
>  #include <linux/of_address.h>
>  
>  /*************************************
> @@ -571,12 +570,17 @@ static int arc_serial_probe(struct platform_device *pdev)
>  	struct arc_uart_port *uart;
>  	struct uart_port *port;
>  	int dev_id;
> +	int irq;
>  	u32 val;
>  
>  	/* no device tree device */
>  	if (!np)
>  		return -ENODEV;
>  
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
>  	dev_id = of_alias_get_id(np, "serial");
>  	if (dev_id < 0)
>  		dev_id = 0;
> @@ -607,7 +611,7 @@ static int arc_serial_probe(struct platform_device *pdev)
>  		return PTR_ERR(port->membase);
>  	}
>  
> -	port->irq = irq_of_parse_and_map(np, 0);
> +	port->irq = irq;
>  
>  	port->dev = &pdev->dev;
>  	port->iotype = UPIO_MEM;
> -- 
> 2.55.0
> 
> 

You forgot an Assisted-by: tag here :(

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
