Return-Path: <SRS0=iJlA=NV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F40C432BE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 17:30:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E5460F57
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Aug 2021 17:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91E5460F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=breakpoint.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vaQe4WdAut5ATDyrmMYlcSZQ95BIvpu/1Gzvvf0ktRc=; b=BbODGm+ulp9iPc
	smChf5RGW0FPMxF7TSigpnxi15uBZ+5C2r9juZQI4fklhVwFXnjxD6D1uu89MSFVgR2mICVz9nRYl
	RmF8kWvvr/kA2PTwLp3ft8Qz/7M4cpUq1oxATe9kx11d9ai+8fLl/2A2Gyqymc4aBOqZe6H5D8Qrr
	1rROTqnow53R7Ych8eVTig4tz95TSCds/dj2PE/0ILPSK2KN3Urjs6bauTo0gpO9P51bHASV88oi3
	DpoOObmDqXypjBFfx8qbB37ZUIaue6VUWpswegeWAj/4b3WoUc75CmYa/GmPVSQz7MrRELpKkZmba
	ccasvOQXXpDmc0CntQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKl74-000ESY-3u; Mon, 30 Aug 2021 17:30:26 +0000
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:12e:520::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKl71-000EQa-3c
 for linux-snps-arc@lists.infradead.org; Mon, 30 Aug 2021 17:30:24 +0000
Received: from bigeasy by Chamillionaire.breakpoint.cc with local (Exim 4.92)
 (envelope-from <sebastian@breakpoint.cc>)
 id 1mKl6l-0005kw-TU; Mon, 30 Aug 2021 19:30:07 +0200
Date: Mon, 30 Aug 2021 19:30:07 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>, 989442@bugs.debian.org,
 "Package Development List for OpenSSL packages."
 <pkg-openssl-devel@alioth-lists.debian.net>
Cc: Helmut Grohne <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [Pkg-openssl-devel] Bug#989442: Debian: openssl: Add ARC target
Message-ID: <20210830173007.yjcdqduzdczwqizq@flow>
References: <a04109c1-e502-b979-d342-5c28ed558863@synopsys.com>
 <PH0PR12MB5401221D5C33C6E7BC9D440DA1CB9@PH0PR12MB5401.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH0PR12MB5401221D5C33C6E7BC9D440DA1CB9@PH0PR12MB5401.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_103023_226185_EE2AA7BD 
X-CRM114-Status: UNSURE (   5.67  )
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

On 2021-08-30 16:37:11 [+0000], Alexey Brodkin wrote:
> On Thu, 3 Jun 2021 19:14:24 +0000 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote: 
> > This is needed to bootstrap arc port. 
> > Patch attached. 
> 
> Ping!

Urgh. Sorry, thanks for the ping.

> -Alexey

Sebastian

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
