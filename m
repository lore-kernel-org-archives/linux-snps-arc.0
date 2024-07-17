Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1E7C3DA42
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Jul 2024 08:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B22ffCaAvCIwPmMyD4MocPmGHaIqLOpvxgnYN7S9evo=; b=EfaVAb74GfyRxw
	AO9HNBlrBMLvgmcZIQ7TW1ftRzbCauPsV235qaAysf7PLpaVvsD6oIf4SreUPnWNDpJ47iQ+eSNLY
	FLIPxpTz0e8/AMACXHzXMvF8T1iU3vWIIKmKuv9CFtuyikV2JezE4NvKpOiP0J+Pe5akLJokIwHWc
	6++f4GNwi3goVvsBSJx+SPeqxKg0qAk94NaeX1tca4MPudnIFtzgeh/zCvkcMw+qiJ5gmNxD9hVsw
	1sJ1iB88e6doSzQ3+9JSIFPTaiLr8Nq7MLidg3wWytu4aK4wcWMPhPj5pxfr9yqaZ5nCUN7lwNfqk
	x+0QvcSRzRMr6/lC6p8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzbn-0000000D3qc-3Inr;
	Wed, 17 Jul 2024 08:01:55 +0000
Received: from fhigh8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzbR-0000000D3lP-2lMX;
	Wed, 17 Jul 2024 08:01:35 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 9E28811401F4;
	Wed, 17 Jul 2024 04:01:31 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute6.internal (MEProxy); Wed, 17 Jul 2024 04:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721203291; x=1721289691; bh=H2TbYW11mN
	7UYagfgm58HiJYNR2mAP7xROw6j1RPLtU=; b=iPzmTB+Sbxj48eBHke5Eyc2G74
	ZFQGgIkhAmhzzIECTnQlnOEeOFadQwSWERgLblWcuXSQbG5ayz2adewKZb1avGVy
	EXP68zkrZEL06N0p3ihaqzIR07alAiXhhEx3SYAnXpdXNGTMzbVNl8/WCpP/te6c
	Wtos6HYakbsYYlaYZVQ776RJOe/QUpJIFHamiVkp6OzJ/8MNjDYALKbhlE1MvS7S
	2ePNih12Ak7SQ3Szce49X50KhUx+QuET1q+YoEtLuELQHb9LHfE4xCWC1Jhuwm+c
	e+Vw6VHjl1xhi4QYMpr5DNj2Bnfb7gmUi8UpG9pNVAtuINmLTdV31CR9Rmwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721203291; x=1721289691; bh=H2TbYW11mN7UYagfgm58HiJYNR2m
	AP7xROw6j1RPLtU=; b=IEiv8CYmMUxHNLpE6hlmXh6GwqqUcQ31YrIEoIeamqRx
	VWaNpKSYV86Et/Vx67MVrCfx5z9zOoo52LNaL0z9bpM3d4tzwD/obj8DN/S4tENR
	fSokIQkAMQa7+HnYPT9qxMnJugUC2MboyjapJDdrZt1WU6VXqazuC2d44R9nYuM2
	0zOXdRnwe6R0AWHAxcUY0F5yM/hqRLXeq5UGDh/2vM1/GXAgmlmCtJGPJ5ehnEb3
	0UcVDEfVbJNytzpnGIulL3WwqOR1uh6cFl2MQKfSHslTCknLUEfOdwKrDV/41NFf
	eDaP26DPZ7wM2LWNkqk47g1l9ws/U8ds+Pv7hjI8NA==
X-ME-Sender: <xms:WnqXZg4pIhSIiKAz5XWsbVKMmfKrqTL6W3H_Ew6wRxCj_k49FJyO1A>
    <xme:WnqXZh4rTIiGHLV5nftk5_c1chggOyPd3WM_QznKwQvvGSsS7sQ4L4Fhpt25Hj6Qq
    9fJ0C-8ZkbnkZmG3xk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeehgdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:WnqXZvenMzJ1YNRfkyfEts4qCpenTuL5Lp5CM3bwYRE7Q0J2kTbrLQ>
    <xmx:WnqXZlLafRdtK2Wo1Hetj2q8WbwOqUi2KLge4SS6Zb0UoqJZVX_e8g>
    <xmx:WnqXZkJll6521kxyFh6lUGpan2JOYoJumVeITgbYopi1eqrbO6_a3g>
    <xmx:WnqXZmwFLnEZvyeDq9G_pVaUR91uFDvIsNawUFrL9FoSBW8Aemx_bQ>
    <xmx:W3qXZhDMibW5ZBW41fdJyPq4ezKPW9QOggVDPkI_v1vIKdgwuKvDFjHm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3C0C519C005E; Wed, 17 Jul 2024 04:01:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <be80d8f6-2a1b-4f63-a43e-652fa5328d11@app.fastmail.com>
In-Reply-To: <ZpdnhhaQum_epcGp@hovoldconsulting.com>
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
 <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com>
 <d7d6854b-e10d-473f-90c8-5e67cc5d540a@app.fastmail.com>
 <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
 <CAHk-=wjqr_ahprUjddSBdQfSXUtg3Y2dCxHre=-Wa4VGdi7wuw@mail.gmail.com>
 <2b6336d1-34e0-48dd-b901-7b5208045597@app.fastmail.com>
 <ZpdnhhaQum_epcGp@hovoldconsulting.com>
Date: Wed, 17 Jul 2024 10:01:10 +0200
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
X-CRM114-CacheID: sfid-20240717_010133_789863_54E96B33 
X-CRM114-Status: GOOD (  14.32  )
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

On Wed, Jul 17, 2024, at 08:41, Johan Hovold wrote:
> On Wed, Jul 17, 2024 at 08:01:43AM +0200, Arnd Bergmann wrote:
>> On Wed, Jul 17, 2024, at 07:08, Linus Torvalds wrote:
>> > On Tue, 16 Jul 2024 at 21:57, Linus Torvalds <torvalds@linux-foundation.org> wrote:
>> >>
>> >> Note, it really might be just 'allmodconfig'. We've had things that
>> >> depend on config entries in the past, eg the whole
>> >> CONFIG_HEADERS_INSTALL etc could affect things.
>> 
>> I had tried a partial allmodconfig build earlier to save time,
>> did a full build again now, still nothing:
>
> FWIW, I noticed this last Friday as well when I did a few builds of
> linux-next and every change I made triggered what appeared to be a full
> rebuild of the tree.
>
> This was with a trimmed config [1] and separate build tree (tmpfs).

Thanks, that makes it quicker to try out. I'm now using
your config to do more testing. I still don't see it with
a normal build though.

I do see that setting the timestamp of syscall.tbl to
a future date does result in always rebuilding everything,
but I don't think that is what you are seeing, since that
also produces a warning from make:

arnd@studio:~/arm-soc/build/bisect$ touch -t 202501010000 arch/x86/entry/syscalls/syscall_64.tbl 
arnd@studio:~/arm-soc/build/bisect$ make ARCH=x86 CROSS_COMPILE=x86_64-linux- 
make[2]: Warning: File 'arch/x86/entry/syscalls/syscall_64.tbl' has modification time 14483017 s in the future
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
make[2]: warning:  Clock skew detected.  Your build may be incomplete.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
