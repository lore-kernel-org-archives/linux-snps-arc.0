Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2089C7618D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 Apr 2023 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzsi5xYS8tJpp6iXmjBQOcMSckcUYAUcNduo0EHo96E=; b=n8Lcu8+9E3hxht
	5gFlEx4eMU1vCPVonALw0mcZ/VqGV/EBIrQL/nHOGp/cSSABYy3d/N4Q0JTBGO1s2R1dvhIL/oNVj
	35loQEyL05oKROX+uTRCCkhueTSHvFebu14I19KvaIzkhUUgc+Q2FYPDTKociaC6ZbVkhSTMkbVOP
	vFofkUbT/C9JlRLXP+AZQYIu43meAiEP0mnW682wNCO36ER+XHiy5KBu6TTR7zLywAq0fUpFttJXj
	naRwPEySEvAcXpT5sXwAoD/4qYLmuZ44l7NV90ic67yDg0PjydtJOipE5W/7fsyrEQC95IsWMo5Sz
	8fx70t5DhiUYPGl+5hgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQka-007f2q-2i;
	Thu, 06 Apr 2023 14:38:08 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkQkX-007f0B-0B;
	Thu, 06 Apr 2023 14:38:06 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id D62C5320085B;
	Thu,  6 Apr 2023 10:37:58 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 06 Apr 2023 10:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680791878; x=1680878278; bh=ox
	2ZTXVsnbCyF5ePDD8wIyzUaomnw6wvo09Yg9xH4yE=; b=Xl+ravcsiPsKVk2KkL
	I2jaNWP6SsVzgj0l2AAUmdwcsWH8WBvAQaHcPNWK+oWtxSG5v8oft3mEiGrfSX+O
	oOOyht5MAlRfGzJVVW/iK2pv4kUDma72keV05qqQR8UC9Pc42i0O9T9EHpbWfV2q
	dhneyZXVZjxAxknA+NZ3ltAeelllUc2qY1dUTPlVHUWQKRYu1HGioEopE0mqBp1x
	yAl5Qo49dkA9pIDgeovoR8Wtmb0YUeabZaE1fHuoRFtZXdWYnqKR3cGRvxX3PLsI
	WCdrwJwIgl81qkWG+GkEin7JO5Vdh2sfir2w6BIffO16YKeBp9i2LWc6dH7NCOlY
	2Feg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680791878; x=1680878278; bh=ox2ZTXVsnbCyF
	5ePDD8wIyzUaomnw6wvo09Yg9xH4yE=; b=GJfsiXySiyLf/aSKQME9Omi9YYhQr
	CBUMzH5Uu43SH4QKDtYKPdBAJfuqP0NYP8lJWaRmtwPVtNV7viKv4fLZGelyBqMK
	J5Qna0pHObrbrHvqZPnhXi74n8rFpFnA2IhtqhvDkY3Z4V+VtO1Mf625SU81oW1O
	fZ7gI045b0yaHjkgJUFjqkjCPcT9n75w4QICk0wh0D0JSwWkLoz/7o543vEbuZi5
	3gbR+G+lSU0RNbFT5kHLJQRV5kzSUkuNvJ66O5Oi0u+VQ5cdF+pUKK8toGyIkV/Q
	rkuRD9xppnn4JB0zMQ6IdR/RkvatfyUfnN/l9S6EkQxCzLpAoyGjeVpog==
X-ME-Sender: <xms:RtkuZCqf42ix84osUCEK9qBmJpUY0MWD5aN0kUufTQmfAJCPAI9ePQ>
    <xme:RtkuZAqdmJirzfxks01q6UkJQGYetIRs4WOepWBxGJcXFoPE90E4G-icR0GYMnVOt
    VJ4Ttz8oAhfswFsqN0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejfedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:RtkuZHMxqn64kqiLOVgPSyYvg7svJqv-ByDyemeaeZD3anI6mqKv_Q>
    <xmx:RtkuZB7My2vHt6AwrHQt_rAYHS5WUC7Rj_Thxx6629TSM03aenFM8g>
    <xmx:RtkuZB6hFGsGfZM8nFH_fIefgRcisw4z8faenvM5ePqi-0oFIPgF4Q>
    <xmx:RtkuZCPXreSStp1HAL25jNK0qQrYTDcw3TjgITOQ56G92NdX7CTSpQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 216BEB60093; Thu,  6 Apr 2023 10:37:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <3ff4e8c4-9c4d-4694-bc34-d7778958770e@app.fastmail.com>
In-Reply-To: <20230406143019.6709-2-tzimmermann@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-2-tzimmermann@suse.de>
Date: Thu, 06 Apr 2023 16:37:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Daniel Vetter" <daniel.vetter@ffwll.ch>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 01/19] fbdev: Prepare generic architecture helpers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_073805_368371_2CE47C42 
X-CRM114-Status: GOOD (  12.48  )
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

On Thu, Apr 6, 2023, at 16:30, Thomas Zimmermann wrote:
> Generic implementations of fb_pgprotect() and fb_is_primary_device()
> have been in the source code for a long time. Prepare the header file
> to make use of them.
>
> Improve the code by using an inline function for fb_pgprotect()
> and by removing include statements. The default mode set by
> fb_pgprotect() is now writecombine, which is what most platforms
> want.
>
> Symbols are protected by preprocessor guards. Architectures that
> provide a symbol need to define a preprocessor token of the same
> name and value. Otherwise the header file will provide a generic
> implementation. This pattern has been taken from <asm/io.h>.
>
> v2:
> 	*  use writecombine mappings by default (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
