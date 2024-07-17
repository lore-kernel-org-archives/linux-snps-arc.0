Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF9DC3DA42
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Jul 2024 12:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jc0Bi3hM6H4VbKP4mw/+y7/RI08Np4/qFLrVwF0ZV/U=; b=oWEdLnfx7UIvuv
	VYJY1Bf5AHKUnK5g54AWbZhaWuoFeqgCIccEqZzXW9OQ5WqCdk2a5P1DwtfHaVZrXWTmniProbmNV
	Oz04e4k/u7esiSDQuD1vPcAsh7aih4t9b7hAJkf3G4aPOvq56eash5lEJuZOJscEDcvNofKbKTw1j
	rSRjXtAHJyh6INPhtCWwe0letz3nHZhs2c8KWzNFxnoy7+c7ob7mbNsqNSCnBUQIobFtwSdEqRhbE
	Rl4mXX1dfxpcfCiJd3/NeRjEAkkhR+tSSdUhIqsZRWPuyouuNd4Yyd1E2If4WhpfAKIuSzLXmrdFK
	9QEtV7zhxcmYXgkf5oRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU43L-0000000DnOb-25eG;
	Wed, 17 Jul 2024 12:46:39 +0000
Received: from fhigh3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU430-0000000DnJt-06eK;
	Wed, 17 Jul 2024 12:46:19 +0000
Received: from compute9.internal (compute9.nyi.internal [10.202.2.228])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id D13FC1140186;
	Wed, 17 Jul 2024 08:46:16 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute9.internal (MEProxy); Wed, 17 Jul 2024 08:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721220376; x=1721306776; bh=/CApYD6wKY
	nJBVN4NbL8zaH4ZDUgadgUBuZp5+ecVs4=; b=qiqOQV/ZBHOGp+WRExDp4NzLdj
	ziUl9xIHaUXYnBshQBoAxGk/gVS9rKLhRK3WBuRgdNEnDrwmn0Lz+anGbh4newhE
	qiATIwmRv/uj2g97g8OM9RmpergkSLw+X7W4kUIR3qD0+Sl3oiyBhFE7eqVdaNTI
	hC5+8KqqGeDfYXzIGk8dMxUi5mEwdWN2Hc6IAtoq5iGyL4pQpuMcTcRNKOKP2de3
	6zNHPaNDFteBrktsnqiWXnXbafZ0NsOCqMvmUv1OmeMZMyfrbORXxOjHXJeMxP2+
	4q3LewaZnF+cG+ZYcI2RbDUOX+kfrd+vAJCTLl/90fgj2rZLmCRi4UlvyZMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721220376; x=1721306776; bh=/CApYD6wKYnJBVN4NbL8zaH4ZDUg
	adgUBuZp5+ecVs4=; b=lYhGR3c6zUvtgFpfRszwIHAm42Q0BxFUb415+QYJFeWc
	xgsRAJPATdNRpoNNiS9aXLKn0WxLdP682FIdPO46JBZmfMGQhly4a8i6oFGthfZz
	MhFlY26GuQSbriMBkK+V96uPCGjdex4OQ1xbetOET4QNa3VNWCeBc5hNFUyTNl+L
	rHmQwOmCnsr3GcrnNgqz27e439an53N8EqFLy9tRPFumSP+Sq2OIEBy1i91XrbA1
	KPpacdbigM/viaWRTAxU/POrsaT3X1zfv7DLwIDNeU0MIYbgtFpSqjy6mpU5h2Cg
	3FlnIjvjSEGDizXvce20/14W1hOI1EbikHnEsxZt6Q==
X-ME-Sender: <xms:FL2XZgu54zRo188ytbgokKLG-eM4_oct46qUF3zL2lA9v_10Y08z2A>
    <xme:FL2XZtfHT4Wi8X98SWGHqJjKULUVb3Lv8BrlqYk6a31KbWqIe6kozNUkhdKJoFqki
    AP5eR3FC6wazrKMIKk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeeigdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:FL2XZryYFxReCHxYg1QjiiH7dcsKpiwNjFrFgvo9GdtpbStBQBAuag>
    <xmx:Fb2XZjNceNt8fkAK1H8grmE9yW5ioXtEGgCiD38SIQUspwW20NYIWQ>
    <xmx:Fb2XZg_YXApV0zJUjelNBs_wv_CkV8Vm_zjLElkOJ-FFFFFcNOuA0g>
    <xmx:Fb2XZrUUYISPVoAHWqmqGi54AAfe6u4d7cGemq7uUnXOcqRDtpbcow>
    <xmx:GL2XZh2MdXKDq-J1IfFLVUWchvHx5FvMcBTDJmK2Ej4vcoG0Bdlci1mt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1A54C19C0062; Wed, 17 Jul 2024 08:46:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <f92d9393-779d-408a-b3f0-906658fef3cd@app.fastmail.com>
In-Reply-To: <91b10591-1554-4860-8843-01c6cfd7de13@app.fastmail.com>
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
 <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com>
 <d7d6854b-e10d-473f-90c8-5e67cc5d540a@app.fastmail.com>
 <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
 <CAHk-=wjqr_ahprUjddSBdQfSXUtg3Y2dCxHre=-Wa4VGdi7wuw@mail.gmail.com>
 <2b6336d1-34e0-48dd-b901-7b5208045597@app.fastmail.com>
 <ZpdnhhaQum_epcGp@hovoldconsulting.com>
 <be80d8f6-2a1b-4f63-a43e-652fa5328d11@app.fastmail.com>
 <Zpd-Bx3VwrYWVeTs@hovoldconsulting.com>
 <4d471a38-f86f-429d-a1a3-b882439ef7ba@app.fastmail.com>
 <91b10591-1554-4860-8843-01c6cfd7de13@app.fastmail.com>
Date: Wed, 17 Jul 2024 14:45:46 +0200
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
X-CRM114-CacheID: sfid-20240717_054618_273713_B7821A73 
X-CRM114-Status: UNSURE (   8.91  )
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

On Wed, Jul 17, 2024, at 12:54, Arnd Bergmann wrote:
> 
> -$(obj)/syscall_table_%.h: $(syscalltbl) $(systbl) FORCE
> +$(obj)/syscall_table_%.h: $(syscalltbl) $(systbl)
>         $(call if_changed,systbl)
> 
>  # Create output directory. Skip it if at least one old header exists
>
> Masahiro, does that make sense to you? I assume you can
> explain this properly, but I'll already send a patch with
> this version.

This was not quite right either, but I sent a patch now
that works with both old and new versions of make and
has appears to have the intended behavior for incremental
builds with or without changes to syscall.tbl:

https://lore.kernel.org/lkml/20240717124253.2275084-1-arnd@kernel.org/T/

    Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
