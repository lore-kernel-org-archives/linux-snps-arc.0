Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E70EC3DA4B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Jul 2024 09:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=inTQjVy4v0B1uCjZnsXsCwAzlGtiEJtySbpkQ3Wa3f4=; b=EGCVmLTT68PCWl
	VSOkFYWr7qzFwddHqMseudpkCgLsvBeR3WMsgJBwDydUvV1pV5dy0dWipnYE8FUFBNU5LBRB31qvr
	Z/suJ4wCx50evG9W5vGajcAjOhjIMeQx3xjkEQNUQvf4lNHw1+hTDdFskOEYkdial7tdSL3ED5fvC
	y80kW+PisLpEsFJArjBqTR2HCg5ZkWlJ2mBkOF/EMTyNrkRWLWvtsvh7ulD/T334thD0tW8jvabog
	u8u1HMbKlEpjdlVN96rWfO/xpELwc7+UpGfkHpZ84LXPtpwLD6DJH0vhFjlkYW87VM0OyopjanvmX
	IXvmJWwS9so1bkkX13iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU15o-0000000DLA2-2qYf;
	Wed, 17 Jul 2024 09:37:00 +0000
Received: from fout4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU15S-0000000DL4c-387g;
	Wed, 17 Jul 2024 09:36:40 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id 92EC41380327;
	Wed, 17 Jul 2024 05:36:36 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute6.internal (MEProxy); Wed, 17 Jul 2024 05:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721208996; x=1721295396; bh=ds4aqM5Kli
	aeb4EM9aEvOVD2sDxY4nAQiMOn0gmaAbs=; b=isyoZPSErBU9/B/t1RVSo3tn7U
	Tc3YRkr7pgDPJni2+1kEPudKDRq9Z/DhmIm3IdRxv/xc5IbMqawD7hhI4RMUiZc8
	9mACyynTn6yuEc4yNx+Wwg3lJYaxoZOqG9slbIAn4AdR9gu4GwgCVOmY4N0FYFbE
	LQ7sr6n6dmOZ2a8Qp2MpuKR3NDWfVRo9Bmy3D329b6ex17kTCU8oKgUWjgmgk7mz
	qr3c8jdpENSTE7CybQub0T7N8kA3EiBe9qEczTmxUV9bcDNvAguh9t7vQpGd2rJz
	2g3g/Km2lgKDnj8MZetYS2/jbUNsV+KMueiMxxHXdFa+vj60MQw+gfhIIG6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721208996; x=1721295396; bh=ds4aqM5Kliaeb4EM9aEvOVD2sDxY
	4nAQiMOn0gmaAbs=; b=IuTu2zxPr6v2uLemejK0Ei3q2B4Q5qgGmSQzRk8i6DLv
	vTrmN2pXjRAB7TogFn4MgE1l/SlcRTGZFdNhMgX6RowdwUfgZyXdETR7l/oQx8Uz
	acXX3NohpJxvp7OEXzYW402k1xxPokR0RTJ7A3FxrsYAOigVoUPmiM74YMAM7jz6
	PUfcqVFTwhWWYY63PWHaGQUB6ReeN+MssZ8JEUodVtXKlnLS2Ky5GIoUkEKePm6W
	xRLMDKvrDQrp/Im3iLn/kL1I7ykewwGpFDWrRhFJKtH6gP0CoH/HcxfbEZvMCALB
	OeLTYztagTQn3c5EnEI0C4GHxk9qYKBz1JwxEuvoKg==
X-ME-Sender: <xms:o5CXZuhHJeo328Hjywk4ATXGO_xTowOvuBLqBMB9x7vDw3N3_h3p6A>
    <xme:o5CXZvApUPKK7-wHjTzWsNyRJQ2vxM4h4IV9UcTrUVvPT3l8JJUm7IS8o4dZENEDn
    YB1kug2ZKo964UxCck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeeigddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:o5CXZmHTb_KO_B7rug2PaYI8JJcj3CGwU5Q-oWM_o3p-cfzt28dWmA>
    <xmx:o5CXZnSS1fFdG2a24qTS-iXIVfIn1WLz_T_hXOQBWB2dQPO-29ZlzQ>
    <xmx:o5CXZrxXt7Ba_vQnQnpzMzBBqhuM1FlyIaX28V6hNbIT4Gm9_2zDQw>
    <xmx:o5CXZl7fGWEov250RGBtfHL3SyIT_rpGUYjYUFhCMJk8j0lTbSPSMg>
    <xmx:pJCXZgpR0x6tJgWfugM-QILTlcTWV-om2c6810xHInv2PguUoHyykUCM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 301D919C005F; Wed, 17 Jul 2024 05:36:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <4d471a38-f86f-429d-a1a3-b882439ef7ba@app.fastmail.com>
In-Reply-To: <Zpd-Bx3VwrYWVeTs@hovoldconsulting.com>
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
 <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com>
 <d7d6854b-e10d-473f-90c8-5e67cc5d540a@app.fastmail.com>
 <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
 <CAHk-=wjqr_ahprUjddSBdQfSXUtg3Y2dCxHre=-Wa4VGdi7wuw@mail.gmail.com>
 <2b6336d1-34e0-48dd-b901-7b5208045597@app.fastmail.com>
 <ZpdnhhaQum_epcGp@hovoldconsulting.com>
 <be80d8f6-2a1b-4f63-a43e-652fa5328d11@app.fastmail.com>
 <Zpd-Bx3VwrYWVeTs@hovoldconsulting.com>
Date: Wed, 17 Jul 2024 11:36:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Johan Hovold" <johan@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-snps-arc@lists.infradead.org
Subject: Re: [GIT PULL] asm-generic updates for 6.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_023639_054855_7244291D 
X-CRM114-Status: UNSURE (   8.77  )
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

On Wed, Jul 17, 2024, at 10:17, Johan Hovold wrote:
> On Wed, Jul 17, 2024 at 10:01:10AM +0200, Arnd Bergmann wrote:
>
> Yeah, that's not something I noticed at least (and I assume I would
> have). And I only did aarch64 builds on a 6.9 x86_64 host (make 4.4.1).

Ok, I can reproduce the problem now: I installed a Fedora
VM guest and chroot mount and I see the same issue in there.

My normal Debian host has make 4.3, so I'll see if I can figure
if a specific change in make does it.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
