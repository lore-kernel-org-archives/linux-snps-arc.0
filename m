Return-Path: <SRS0=+CSQ=LR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6D8C48BE5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Jun 2021 07:15:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC06660FD8
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Jun 2021 07:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC06660FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvHZ4DB4fILJb+zvr05tqOPJ7wvjLAnqN2ZkBBD+WiA=; b=v5fGvXsDwohDG/
	Fh+r3hqoid5ZfZ2Lz6LCXSz8nY+9mmSNYj1Lnp1Inf9tN++5DPnCwm/m7X0hy6Dm3yJ5ecv/eY9aw
	xfXOWoMVtBY4Wmueb6kUrziqEXySmqCV/U9TGoEV2PC1143hbibo8BB3i8LaTHTtrKlwygbKYNaQV
	nlRpmf5Dya0pqueEKlxeUREjg+cZGlebfkvIJKmhjokb7K4xeku/HGYa+CgVaq9sApMWRsh0xWkVd
	WqENwYVZlQVcSyee1AyQYUCcRVIwDtNgqJrJRfrdgGeLU1Ed3Ggy4ncofncy4uQ9KxVxfKRCWSbAG
	oh5hvlTx45xDsAHz5kDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvx6D-009hIW-Cm; Wed, 23 Jun 2021 07:15:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvx6B-009hHl-Ee
 for linux-snps-arc@lists.infradead.org; Wed, 23 Jun 2021 07:15:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C0726023B;
 Wed, 23 Jun 2021 07:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624432499;
 bh=BIJkp+bmcpYoUNpthePnxTk/99MSKXjR1s8U+gXPqxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJZy04Xz4F2KocY6sOqVmz2/2kcEzHRoPOXKtLIXZYqL4KEB0Gue3K73R7IQ6oqzU
 yvRzpo2jY0kwfpGwoWFnyrp7p0Je001Zg4draSJNUs/iewNdKQUOEQx9/uPJbgetR+
 5fjruXQ2RunUdpVoFKbzr0UZb/Ru9UTJFv1QdM7c=
Date: Wed, 23 Jun 2021 09:14:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saubhik Mukherjee <saubhik.mukherjee@gmail.com>
Cc: vgupta@synopsys.com, Jiri Slaby <jirislaby@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org,
 Pavel Andrianov <andrianov@ispras.ru>
Subject: Re: [question] De-registration does not remove port
Message-ID: <YNLfcKFL1LkJgXAR@kroah.com>
References: <3e131267-e1b3-1b83-f8be-0577da479223@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e131267-e1b3-1b83-f8be-0577da479223@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_001459_564838_AB4B380B 
X-CRM114-Status: UNSURE (   7.62  )
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

On Wed, Jun 23, 2021 at 11:42:36AM +0530, Saubhik Mukherjee wrote:
> In drivers/tty/serial/arc_uart.c, arc_serial_remove always returns 0,
> instead of calling uart_remove_one_port to remove uart port from serial
> core. The comment says "This will be never be called". In my understanding,
> a port added using uart_add_one_port should be removed during
> de-registration.
> 
> Is there a reason for this behavior?

Did you test the code to see if that function will ever be called?

thanks,

greg k-h

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
