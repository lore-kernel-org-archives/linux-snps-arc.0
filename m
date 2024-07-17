Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E9EC3DA4B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Jul 2024 06:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLDnnqhIwh27AsAJ7DDPAQE5ifv2YJUcLfEuV7AQAg0=; b=DuZwSjm22lP1dn
	bRE8O+XNCbPVgDUWozpSITj2rb+T0m4ZL8SaWD+N2V1dU8bEnN9E8nzFTdYsAgjBfhWe8GTZKtRW8
	NS2azR/X4FTc9xg3blZDR9JQ1AkE2I1mtPsvl3cD7n3mLKpcLEtnVT28q0p8QsoMqp2V384G+Q8r/
	vD/BwoHtzt9HXznLDgD8tb4z+NzWqNGKRdBI2YxPegK6a0k4ffJd8N3TD/EjHyX5KEiJ/gRUIBOc7
	8GO2YJfE/RdIi/nIV3VhTOMuCZBd74PUzpnnEfek9dFB7RySmqz+1MgeTuZOD4ddMflTvuOvGrE/H
	btuebz3GF7TXoxZo9+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxkC-0000000Cl7v-2XyI;
	Wed, 17 Jul 2024 06:02:28 +0000
Received: from fout2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxjr-0000000Cl2I-1vJQ;
	Wed, 17 Jul 2024 06:02:09 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id EC27B1380273;
	Wed, 17 Jul 2024 02:02:05 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute6.internal (MEProxy); Wed, 17 Jul 2024 02:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721196125; x=1721282525; bh=s7KuyIqvIg
	I/k+6qXPqK6+K+0ILQ6zny5br217rA/cg=; b=TxdDuVHBA6pP2KAS6CIrwvUNlj
	eXMZnKZ+s+Gn8e+mTrnqEfd3NAq531VmO+spYY4WHFjdYiG+C0y2Cv1oulqJJRug
	McSGhGS+vxIisP70kd+QUSRlOB3S7ek2fTIWs26QCd6BMdXbSLv+ACLWaWgMuw0G
	LLGbDHxb+ODAv+sDkOn9aqHsW2iNr2Lg+ZEcGzXMoHYcKhlqYp15tK7N4Hc1WaXR
	gUIVDRnOtEp1qc7NJQGQGSR5Li0/mw5cJod3ROR2NZN0Cei1VvlkD1lENVdytYKu
	FbMTlh3kfQkKWZHXITUqcAXJJut8/x4bfsLPIQUDM4oKNeI7lRlbfHal+eDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721196125; x=1721282525; bh=s7KuyIqvIgI/k+6qXPqK6+K+0ILQ
	6zny5br217rA/cg=; b=iy57Shj+rMMq0tgL8F/b4GYe9Nu5PqrGYSCT/PbD9M5/
	0KhYhe473tb02Gs5inSJPVoB4lIH9FVQdHR1oyz4lo2upKFXmc4nYOYa4teAaq3V
	R07LkGrhuYforttrNu0XCLMZSeUNJEpz/k4KREfn6ajhuNuibkmPzv43lt8VN0fT
	i1/a+8BEL5wXsZXK+ilbEO3bXZ1UMllWfAeWH0prDPs6T94pwOc3Z0fIUcrsW9vV
	tcGWgiFRSV016P+CaygIErZsVUq2BBziw/u7gEZ+YeJzlA6fIwJf89RcGeh12UkR
	uuW2Y+5Jhls8ywPxJYPKGMpaYqjhZJXvBZsbUWZFag==
X-ME-Sender: <xms:XF6XZhASZKRtrx88hvmEqjeC4Joes9NXX9VPo9GyHKgpJNnVSx266Q>
    <xme:XF6XZvgsjLXz3zi9oGV7g2tyYzXvEQ3w8lyegGX3eEuUoarepzwpZNoCIqdAKQySy
    3eS9905O-rjWOG_Zq8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeehgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:XF6XZslNFrl7P2PNLVmEzkv4YrLUeV64nc8FBVEyYKCWGTO9AQBDRw>
    <xmx:XF6XZrwgkSDQ7vjyFVOvY8HBHZdrHUnFS9hU3NzLrC3z-S7q4FAgYQ>
    <xmx:XF6XZmScx7LJyMWu_IbYlUK4h8k_-ZMJQyTixDgUXprSjJv-cP9rag>
    <xmx:XF6XZuYKltr-lNPOmRWTppGpWmh6NWQqxBsewHtt7h0sujRWIzzZRg>
    <xmx:XV6XZn_oX9nmRr2w04j_4ZetEq37mOqIJ60LsUeH07ay06T4PzvAJjt_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 83D2419C005D; Wed, 17 Jul 2024 02:02:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <2b6336d1-34e0-48dd-b901-7b5208045597@app.fastmail.com>
In-Reply-To: <CAHk-=wjqr_ahprUjddSBdQfSXUtg3Y2dCxHre=-Wa4VGdi7wuw@mail.gmail.com>
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
 <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com>
 <d7d6854b-e10d-473f-90c8-5e67cc5d540a@app.fastmail.com>
 <CAHk-=wir5og_Pd6MBSDFS+dL-bxoBix03QyGheySeeWPX82SDw@mail.gmail.com>
 <CAHk-=wjqr_ahprUjddSBdQfSXUtg3Y2dCxHre=-Wa4VGdi7wuw@mail.gmail.com>
Date: Wed, 17 Jul 2024 08:01:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: "Masahiro Yamada" <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-snps-arc@lists.infradead.org
Subject: Re: [GIT PULL] asm-generic updates for 6.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_230207_866785_2F5F7D62 
X-CRM114-Status: UNSURE (   9.46  )
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

On Wed, Jul 17, 2024, at 07:08, Linus Torvalds wrote:
> On Tue, 16 Jul 2024 at 21:57, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> Note, it really might be just 'allmodconfig'. We've had things that
>> depend on config entries in the past, eg the whole
>> CONFIG_HEADERS_INSTALL etc could affect things.

I had tried a partial allmodconfig build earlier to save time,
did a full build again now, still nothing:

arnd@studio:~/arm-soc/bisect$ make allmodconfig -sj20
arnd@studio:~/arm-soc/bisect$ make -sj20
arnd@studio:~/arm-soc/bisect$ touch .config
arnd@studio:~/arm-soc/bisect$ make allmodconfig -sj20
arnd@studio:~/arm-soc/bisect$ make -j20
  SYNC    include/config/auto.conf.cmd
  CALL    scripts/checksyscalls.sh
  CHK     kernel/kheaders_data.tar.xz
arnd@studio:~/arm-soc/bisect$ find . -newer .config
.
./arch/arm64/kvm
./include/config
./include/config/auto.conf.cmd
./include/config/auto.conf
./include/generated
./include/generated/uapi/linux
./include/generated/autoconf.h
./include/generated/rustc_cfg
./init
./kernel
./lib
./scripts/mod
./.missing-syscalls.d

This is in a fresh worktree, doing a native arm64 build
in the source directory. In case the problem is related to
changes in high-resolution timestamping, I am running
a slightly older kernel (still 6.8) and I'm using btrfs
with relatime for the build here. I also tried on tmpfs
now, same results. ccache is disabled.

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
