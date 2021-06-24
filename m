Return-Path: <SRS0=wWAH=LS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5FEC49EA5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Jun 2021 13:07:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7403B613FA
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Jun 2021 13:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7403B613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmaaQO/qSVwIeJiNMPkzGlgKNmEXZ1EYjh4sQ2PjGoc=; b=MzvwDhK78ii6zt
	Zqs5ZG5G/AGdGrwDSbETNFV3H0Jiy89f8HXGPyYxo7a0ozGR+DzoYWzSvG4MOx0Ic9Vn7is9CBZJA
	ewb4HzaX9NOgDM/Ln/NbcjsaYV82LytyCJ8Fciwp7sYpb5w1BEHAjnpjtrJjlGEG1T0bcXLT6Sy+h
	vlNcEFIqKeKxbDTN3ZjOZPuquZ22bUAvdMzZoqIN4ApoMBAgoNMyR+HyJbt07l7HWls2J1GrvxRKe
	d7SlYDIdTr2ksxb9Ik+B8CQcqQrtkcqfVfilb9qwmu9XvmYVT6w9LSjmD/5RGM/mmaWk34rntvyus
	RWEGGmMo1BU6UHO3+kDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwP4x-00Ek6Y-WC; Thu, 24 Jun 2021 13:07:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwP4t-00Ek5W-KU
 for linux-snps-arc@lists.infradead.org; Thu, 24 Jun 2021 13:07:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4D03613F6;
 Thu, 24 Jun 2021 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624540051;
 bh=nik1xFcO54CLXrylWhRVNwQOg1iEtMgXWsXyd08Z8ts=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q2Po7VQ2CLXrr8Hz0Eai4V6b2W0orVBH2NO2vkx9Cyl31ci67koMJ9ItY9Z5a9rzY
 34w/MJJUV+b6RrnrGJeoZSI9n0lJ9gErwqr7JO5vNAhRyjUb23WaI2lDfwaal7N35I
 t9vx3saYgtN0rlvVN8wnBgJZ2tMyIxtE/1y/6/N4=
Date: Thu, 24 Jun 2021 15:07:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saubhik Mukherjee <saubhik.mukherjee@gmail.com>
Cc: vgupta@synopsys.com, Jiri Slaby <jirislaby@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org,
 Pavel Andrianov <andrianov@ispras.ru>
Subject: Re: [question] De-registration does not remove port
Message-ID: <YNSDkDnrI38/+VAZ@kroah.com>
References: <3e131267-e1b3-1b83-f8be-0577da479223@gmail.com>
 <YNLfcKFL1LkJgXAR@kroah.com>
 <7af6c0a5-c990-5a40-104e-13f44b1cb4c5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7af6c0a5-c990-5a40-104e-13f44b1cb4c5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_060731_734161_B9643B07 
X-CRM114-Status: GOOD (  15.00  )
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

On Thu, Jun 24, 2021 at 06:33:01PM +0530, Saubhik Mukherjee wrote:
> On 6/23/21 12:44 PM, Greg KH wrote:
> > On Wed, Jun 23, 2021 at 11:42:36AM +0530, Saubhik Mukherjee wrote:
> > > In drivers/tty/serial/arc_uart.c, arc_serial_remove always returns 0,
> > > instead of calling uart_remove_one_port to remove uart port from serial
> > > core. The comment says "This will be never be called". In my understanding,
> > > a port added using uart_add_one_port should be removed during
> > > de-registration.
> > > 
> > > Is there a reason for this behavior?
> > 
> > Did you test the code to see if that function will ever be called?
> 
> I would like to reformulate the question: Suppose arc_serial_remove is never
> called. Then I would like to know how the driver de-registration is
> organized since the UART port is never removed?

I would like to reiterate my original question, have you tested this?

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
