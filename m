Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4437DC4332F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 13 Dec 2022 10:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gomtaEQIqB+gRTh6JnezTOg9w/eK6goNaHXpVaFWHlU=; b=AklDtJkyaHFC11KMokl1VirGhl
	ejzEXiPeIZZP2K5i6k7KdmGRn3+WCfXN9Blgdm338NApz/lK++l3VqrH4v8+5MjzEjCIF9Up8zYIT
	MUr6/6zA0ayRJ4GS+djoFj81DEKzGecP0Ao+mwHAPNEx+m3CayRjvglQ6uHoPXYROV1t5KqmoCMOA
	dHHD0C10a9Kxmk9kOx5KN/K5hTvul/oSs2r9qRyY+R0Cwid7QUpdej3ZAmSmNhsq+fmzXCZwaHONJ
	zoSam9BYNqwNfoCBDNR126A8Z21kqBGWTMaFU1E7oEWbC2nnW7Ihlh5kaWZ+9CTKOniiAN2fzDbmg
	TEFEe31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52Uq-00FYVh-5m; Tue, 13 Dec 2022 10:26:48 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52Un-00FYUA-2T
	for linux-snps-arc@lists.infradead.org; Tue, 13 Dec 2022 10:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670927205; x=1702463205;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ah5SZVY2fxhzaYLbtqGp5de0N+/yQQjIpznbkipHIEk=;
  b=gBsU0rsEeWI593Q6vev0/7X8SM1eDodxT/fdLPwGb4HRCZypJVOkxh12
   2uf3kBpxWy4fvMK5QeCQgvn7NC/HzUWsahMqY7qOAvByG2Fpcj5BGQodf
   XQKZ9nrmH0PnMVGr72JFGsuQxL7PhXCT6yWxjVJK+z0ZZ2/edQZksDQeL
   mgh0pDge8JStIAodg7FzXs0k8Y/CpQub7q2yXfXbyxufheYQ198OVHe4+
   htnGkKoR8utQC/IQti7l2xcZqInKS+NN9960gBBRnnGdtR6QrlBBpmgED
   /iNRg/8VcLvU66SWI3XaXcUsX5KRuScqPqbPslYCQfJj5ufv/sH/yLUUl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="404354167"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; 
   d="scan'208";a="404354167"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 02:26:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="712023652"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; 
   d="scan'208";a="712023652"
Received: from myegin-mobl1.ger.corp.intel.com ([10.251.216.20])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 02:26:36 -0800
Date: Tue, 13 Dec 2022 12:26:33 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
cc: Vineet Gupta <vgupta@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, linux-snps-arc@lists.infradead.org, 
    linux-serial <linux-serial@vger.kernel.org>, kernel@pengutronix.de
Subject: Re: [PATCH] serial: arc_uart: Drop empty platform remove function
In-Reply-To: <20221212212037.3773636-1-u.kleine-koenig@pengutronix.de>
Message-ID: <2260aed-5ad1-a67-13b9-17b3ad8b3377@linux.intel.com>
References: <20221212212037.3773636-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-159833375-1670927198=:1741"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_022645_143765_2583B1F8 
X-CRM114-Status: GOOD (  17.84  )
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
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-159833375-1670927198=:1741
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 12 Dec 2022, Uwe Kleine-König wrote:

> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

> ---
>  drivers/tty/serial/arc_uart.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc_uart.c
> index 2a65ea2660e1..f1b6034addda 100644
> --- a/drivers/tty/serial/arc_uart.c
> +++ b/drivers/tty/serial/arc_uart.c
> @@ -632,12 +632,6 @@ static int arc_serial_probe(struct platform_device *pdev)
>  	return uart_add_one_port(&arc_uart_driver, &arc_uart_ports[dev_id].port);
>  }
>  
> -static int arc_serial_remove(struct platform_device *pdev)
> -{
> -	/* This will never be called */
> -	return 0;
> -}
> -
>  static const struct of_device_id arc_uart_dt_ids[] = {
>  	{ .compatible = "snps,arc-uart" },
>  	{ /* Sentinel */ }
> @@ -646,7 +640,6 @@ MODULE_DEVICE_TABLE(of, arc_uart_dt_ids);
>  
>  static struct platform_driver arc_platform_driver = {
>  	.probe = arc_serial_probe,
> -	.remove = arc_serial_remove,
>  	.driver = {
>  		.name = DRIVER_NAME,
>  		.of_match_table  = arc_uart_dt_ids,
> 

--8323329-159833375-1670927198=:1741
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--8323329-159833375-1670927198=:1741--

