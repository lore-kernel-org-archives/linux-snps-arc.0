Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C939C77B73
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Apr 2023 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TBsdAD3p0qnTmskkiPBIGRR2xXTnRNLDGpSbiNYrHKA=; b=F7TsTq27NI0NkR
	Fg7pmfa0e9Wqv6s/ZszIp9qznyuqHcwWp6I6kWt1nDigz8PVgcWNf2qu3phY5ds3Wmi+qsg0iCN18
	NTOJ9rKuCA6VkgLVgWpbalouAy/6y1l2C2mKytyoxrkDUmCsltN2jq9cmx/E97kFuGgvoEvPxdvkz
	0+vWh4PqrDNKg2ADOPWIcTdqTA5gn9szE/4dbBIsbFyAhOJYhO6RkL9bU0fBM8pSyHyamD9dGwzoB
	MTSGpOe6fJR3X1D114508dzcuIKTJJBBlNsQFwMm3ksdlA7LQAkTAdjmZyBXV8BO3GOj9IpRVtNIL
	g5im0ygB8tr7iqc8gIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pryk0-006Av2-0h;
	Thu, 27 Apr 2023 10:20:44 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pryjs-006AkW-23;
	Thu, 27 Apr 2023 10:20:41 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 55E0758242F;
	Thu, 27 Apr 2023 06:20:30 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 27 Apr 2023 06:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1682590830; x=1682598030; bh=Tk
	KJeIPKG7f6IRUahtFu2q5U2rkyrgs8/HMPUJWIYm8=; b=BXZFSJtImG4lwyWz1R
	Y7/lcgNiyVd086FQtgLBcSRGmR932Z0spDDCGarBT0Hd/8nD6P8choanmlSJltEP
	kPoELRuks97NsVV3Y6h6NpezIDi7hRIHdgiPpLL2ZXBfEme25O3IlABm5EUYrwhh
	AVy2IukqVHoLDG1ROJcetYfjykOEOzLaQqmNvmOBUOKxkupkytgV1BgX9hrDcVc8
	u/q017GOBJXhJMfD0TxokxxA1KPk6TEpqD/jMoVURAO+UI7jWhsfb8b/pTzReh7b
	OQfwHDEmY7iUYEiibC97/tc4m/+mw9BLZpZW6mI7sW08rtXqlwCLHwpzyP0CwWM2
	XOeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682590830; x=1682598030; bh=TkKJeIPKG7f6I
	RUahtFu2q5U2rkyrgs8/HMPUJWIYm8=; b=A3rKNELYfcMLHKjUJRChFjA5jzt0T
	1toIMbURvcg5t049xzhOMYNofYdB6yeboOlEFCfR1EOa7IaiAj9XVlIi9+gHkyUr
	YqD3Plzn4WqQjs8OtWvc1wDLL96SLSy9uDfda18B1JThg5FypTFPhyU02rPvKYII
	wT7HJHrJijZUkheztQQ+CjvRtq9pGnAEBU0BgJ2b9p1tVngJ+yckD93MkqZ/nfPU
	SpAzo2X/hkUZ932348+SB9kHgQVBu7NfIYCl6zw8DF5DQV4GSOacOGT4pis40Z2q
	enZAmWIIQ4Q9X3E9sVrABI39o+pMpmvo9OTHOp5lzese3fVWgrB0fF4hw==
X-ME-Sender: <xms:bUxKZKstBaHBLHM9ok8D-CDswTew4M9CczuZt6yl_INUiaZu7UVgSA>
    <xme:bUxKZPcv1uFbnzf7MnxdncZeiLlILvVfU0WtPBDJRr_J48scfOqkCp_MRlLS7l-UW
    UbvRZd-tDmlRL8V7HY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduiedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:bUxKZFyuXvjEBTGGN_2u9xp4DCMT9wkWrHyk9iZ8ZXliFHGl1tBu8Q>
    <xmx:bUxKZFNRqpp8n3XQXQIDRiNvmyfD5lVLeVr0M4ZHtC9Ef3kdp8WbyA>
    <xmx:bUxKZK_2XA45XIQakO42yV7_FYHWvon0ZFDLGHhhdEfdlQBBQ_5TcQ>
    <xmx:bkxKZNiH4G8Otc3lNEK8AoOIgkWzsOwDMcjHGflEPHn-6p6YJuPCWg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2C87BB60086; Thu, 27 Apr 2023 06:20:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <173a9a6c-d47d-487c-b61a-66d021548f5a@app.fastmail.com>
In-Reply-To: <3e33ab1d-b478-fdf5-6fbe-6580000182d1@suse.de>
References: <20230426130420.19942-1-tzimmermann@suse.de>
 <20230426192110.GA3791243@ravnborg.org>
 <3e33ab1d-b478-fdf5-6fbe-6580000182d1@suse.de>
Date: Thu, 27 Apr 2023 11:20:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Sam Ravnborg" <sam@ravnborg.org>
Cc: "Helge Deller" <deller@gmx.de>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Vineet Gupta" <vgupta@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "David S . Miller" <davem@davemloft.net>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org
Subject: Re: [PATCH 0/5] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_032037_107831_E6D57D39 
X-CRM114-Status: GOOD (  15.26  )
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

On Thu, Apr 27, 2023, at 08:22, Thomas Zimmermann wrote:
> Am 26.04.23 um 21:21 schrieb Sam Ravnborg:
>> On Wed, Apr 26, 2023 at 03:04:15PM +0200, Thomas Zimmermann wrote:
>>> Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
>>> fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
>>> depends on the architecture. It's still all located in fbdev's main
>>> header file <linux/fb.h>. Move all of it into each archtecture's
>>> <asm/fb.h>, with shared code in <asm-generic/fb.h>.
>> 
>> For once I think this cleanup is moving things in the wrong direction.
>> 
>> The fb_* helpers predates the generic io.h support and try to
>> add a generic layer for read read / write operations.
>> 
>> The right fix would be to migrate fb_* to use the io helpers
>> we have today - so we use the existing way to handle the architecture
>> specific details.
>
> I looked through the existing versions of the fb_() I/O helpers. They 
> can apparently be implemented with the regular helpers of similar names.
>
> I'm not sure, but even Sparc looks compatible. At least these sbus_ 
> functions seem to be equivalent to the __raw_() I/O helpers of similar 
> names. Do you still have that Sparc emulator?

I looked at the current code and came to the same conclusion: all
architectures we support today do the same thing in __raw_readl()
and fb_readl() etc, so we can completely remove the latter without
changing semantics.

I think the original list was necessary since not all architectures
supported the __raw_ accessors in the past, so they were open-coded
here for the rest. I thought there were also architectures on which
__raw_readl() does a byteswap to reverse the swap done in a PCI
host bridge, but it apears that none of those remain now, if we ever
had them.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
