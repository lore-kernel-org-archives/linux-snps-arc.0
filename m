Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9197D29DD5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 13 Jan 2026 06:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OTFAvphzStL3k4c+yTivB3za1OtWv3dmpToB/F57SJA=; b=kpVJF+aLDmJOObJ/cYekuoX09M
	Yv7ylfrtzO5OZEcpLSxgik/N0eg3gYjz0KjKKa+1CchYzLSeX2XnJejVQWfEGSBH3zAt1vMocU4H7
	if2pz2ICJ2cgFVzQ4UIAB7floIyDrcSO7tb4UDYPGdvSM1PMsMlxl/zJXfkFKfttj+gSQ/gSN+yDx
	bt4WK++BOrHyQMlKmPU+hmTHMnO3NpMtUeRIcVuvzZqlif1NmVgtuI1TJ2wg4zRGw730YS/xG5UPs
	4u/z33fAbNKkED6NfLBz55mhS6s4wQcvy8zkaYkO8yzB7oZE2oz1wgEEY6kCo0IaczIv4sZjVw0Y+
	daInoiEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYBd-00000006cEF-2C1V;
	Tue, 13 Jan 2026 06:47:29 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYBZ-00000006cDu-3EZ5
	for linux-snps-arc@lists.infradead.org;
	Tue, 13 Jan 2026 06:47:27 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CB4A2140018F;
	Tue, 13 Jan 2026 01:47:23 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 13 Jan 2026 01:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1768286843;
	 x=1768373243; bh=cEYOMM1PSktxOqi05mzVpBiogG7bA9EEwz1KvC3eXio=; b=
	VZmIKdseuDgzijlfdj+qhHWGxVFqUdqPBk5B70BVBJg8iqRkDNg4AWQjc8AF+bAX
	EQaaxdXDQix723/04mn56gkhcHIIMEzKMZ603y+ef+DcKC5wX6q8PaMPJt4ZYQPC
	n4+4zMA53lYMBIGRowH0cPwmeb0aW/If+R1GLP3aw6h6Q2YbqSBTMi2XiS3ZtsXo
	tEHmuh9wCO66PN/7zif4c5RvSx/Ufrmqw5qmRlStM6fKAY5VzmgUmpamrp2mR9p1
	mKSSf0OIHlbAWAMFuLWXA8daP42XejZDJc8qKpJdflhhsjxCxx2ou6kqHC2LNjcO
	AKH3V02tiI2Kzojo9xiPYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768286843; x=
	1768373243; bh=cEYOMM1PSktxOqi05mzVpBiogG7bA9EEwz1KvC3eXio=; b=o
	njlnBeBMU3hlPxkaR58mJUEK2Vrue3rPnsiGrDX/lYcogaOC8SlgDtSXkNXnNr00
	FBID91ZliQoj15ez1Rhz9tIDsOJsEMvoRnoUsRSyNvexT48ft97d7p9uDHzf2ixJ
	94Hxdb91eq4f+xsOuIEjGMH/AXRoYW3qvGzJjUlF0VXx80jBhYX3eEPBgxy/qxAA
	N3UFysSa9aOJVUGFWLgH6x8fYt1iXGqrooTQTrd047DvRSElsSFc82fgivavoWmf
	Y6r+lH15diJjjO8qmnXP1BWAqU/iQxSez5eSBKIuxsOA1LjTgT+F22J9wWp9Lvtj
	EOJUde4W35uLxzM3qYQ4w==
X-ME-Sender: <xms:e-plaYd9ngr25ccb1ekc4st25HucG-bZTCmaorUxelHnl5WzMUERtg>
    <xme:e-plaVCQRZB-Mj8ElUEsp53ncFj7K01vcw_BHHH6ce2PpYxkK3jQMMnrWt_mQZEl7
    AFCZ0Sd-spvo6YJ8cuXB1m8Dz18g4EFBMFwwhmAv_BlYA1U78-hONE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudelieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehvghhuphhtrg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhu
    hheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehlihhnuhigqdhsnhhpshdqrg
    hrtgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehovgdqkhgs
    uhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:e-plaeqX1YzFIpCMYwaFMknxciE1GlTPlJLJEtp_g4cqBG6P76Nopg>
    <xmx:e-plaVlEItkHoeyaoE6xXU7aVmUPlUjxbWUw5edqBjxwvt1jOAz1vw>
    <xmx:e-plaexXRMPAYewdg06LGisiRGKCRKop3QSExevpAVsWMCo5vnaXTQ>
    <xmx:e-plad-4GDhZDsGc_OV6NY4YBfRxV4Y4tOYzV4Ho9U0v5WPfE7W5xQ>
    <xmx:e-plaZaQRDuibgOEW9qxo96HpswZQxMVYsBHCVhGsayDkNXUoFNrTtmJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 923DA700065; Tue, 13 Jan 2026 01:47:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AZuBu9tzlIoV
Date: Tue, 13 Jan 2026 07:47:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, "kernel test robot" <lkp@intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org
Message-Id: <49e273ef-80e5-4199-912c-79c7f62da5ec@app.fastmail.com>
In-Reply-To: <b92a06fb-9032-4b96-a733-e80fe6ddfb20@kernel.org>
References: <202601131142.f4Kyqt82-lkp@intel.com>
 <b92a06fb-9032-4b96-a733-e80fe6ddfb20@kernel.org>
Subject: Re: [thomas-weissschuh:b4/at-vector-size-arch 2/24] ERROR: modpost:
 "__bswapsi2" [fs/ecryptfs/ecryptfs.ko] undefined!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_224726_314260_4C6258E3 
X-CRM114-Status: UNSURE (   8.62  )
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

On Tue, Jan 13, 2026, at 07:13, Vineet Gupta wrote:
> On 1/12/26 19:20, kernel test robot wrote:
> Sorry my bad.
> While ARC770 cpus do support swape, it seems gcc doesn't define the 
> builtin for
> arc700 (and generates a libcall) and as Arnd mentioned we don't have 
> -mcpu=arc770.
> As a quick fix/hack we could add EXPORT_SYMBOL this in 
> arch/arc/kernel/arcksyms.c ?

I don't think that exists in the kernel, it's only in libgcc.

How about keeping the inline function, but making it unconditional?

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
