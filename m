Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B358BCD1284
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Apr 2024 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJ8iZnipDZhyrtdaTYCHW/2Di8d700Ay4Vb+awBhjYQ=; b=QJQD/6vvMqmrVP
	/G21gH6XmxAeecSw0DZEMhwi0Kj6WpSPMWjRcz207HFahGV2qdIqM5IdXLL6r6KBglUdej7H9Pdd6
	crIVgBNK1QU8BqtsE0OQtF1EIjHqR3U3voKirp0nG5NRv5yorF3tBL8+5w47s8VwWYDHx1Zu5pYS9
	UZ6kdRKP9xWyr4RtulZQuT8RX9qd/WYUro9BSUxHQVkEXrLQ/aIigoF7Y2mqR+wmf2fawKgHDQPpu
	y1JgoErfLUuAarluNXD4IxhcOBbq30OKgIqVA9Qe0WAsAA9SJXK12G/wuDcKiKX9PJYWONjWHBKhr
	fVlp0h5h2MmHEhSa5tqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOgT-00000003A7O-0zyC;
	Thu, 04 Apr 2024 15:07:21 +0000
Received: from wfhigh1-smtp.messagingengine.com ([64.147.123.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOgQ-00000003A6C-0Ckr
	for linux-snps-arc@lists.infradead.org;
	Thu, 04 Apr 2024 15:07:19 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 0D12718001AB;
	Thu,  4 Apr 2024 11:07:14 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 04 Apr 2024 11:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1712243234; x=1712329634; bh=Df3WYhd/e4
	mwV76oBS+r3imfhWKZ9Jv4zriSH1RBgp4=; b=bwyYcZdu31NsnPpgmA0ZRPL3lg
	cR/iOroTX0yQpVPsMse1VoZQHmWT8Umm7sJlImbvGmPabPQ67u1iiPHcEjEtaXPS
	C4nULGLoNQW+8Ag4scYSAiL7VSWfKuaiqxQT0WTNYc59m5ecDzAWrUnRDK9tYIIQ
	aE0SvEm8Kl9X0HsruWk9CUf9En1yhz/Jxnn74EIh8H0CNbXT6cCzMxIXscMYtGn9
	oGSBSd95amUUZoHQt6KhZSSnjM6fhdaj+DpDMMJ+0CYA7202BW07FxIH4bfMYIzG
	qdnH/cclOGSLvplpQM6xEzrLHfkBg9BNWeFMafq6LNp51+bjyA8uYk8LqVzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712243234; x=1712329634; bh=Df3WYhd/e4mwV76oBS+r3imfhWKZ
	9Jv4zriSH1RBgp4=; b=Jd6ifrXwGA7fap3xsh+sMJyeZRbQ3b4pjcxQnT7WCN3S
	iv5S6rKoygS+LDDzxLPhA0raNOjnuMUGtdwzdMSr7CHHExBTD97Sm/E2A+nahHqA
	IsKnU6kcxECiV43wQLHOAe2LKKSYPhuiGaab3sVDJ7RySNcZGxkZQhWciQyP+YSo
	esSh5HdlG6U3uOvQYJiwo63K+MXWtsb2T74ruP2KmSC4+j54j9ken2SFZJitKnI1
	AAMWalSBCpwV7fGIelusDqrcEuri0p/FxhZ/djhlYHZ0QcurEwJ8SgTtnUU9SHIM
	e7PAX4fBkiTfvQeym9Un+Pnz95LlHr+hNqGz5Qw+Mw==
X-ME-Sender: <xms:IcIOZuLzLNsU9owrhanKtw8LG_c2xKY-m_qzSLMvtT7HU6q2tl8p8Q>
    <xme:IcIOZmL_js1uYY9fUDujiFhiHBw7liZ2n29E5GN5Hpud1g5FMxEBUi4fjjJ4HNpgh
    4bEJSnkkkkIvpQtlKI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefkedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:IcIOZusgDWFGTpKQ7u3H6b-p1OxSX8i25oBEztBmfAoGLH2t7QyJ4A>
    <xmx:IcIOZjaSsYVJbWIWaZgF8lZClXjCVBx3WqMdoTXCag2q9Iu7dbqiiw>
    <xmx:IcIOZlaJA1D46C6rF6IyJ-9YAv4wWZambQAEeYFzsZ6CoPOsgSMK8A>
    <xmx:IcIOZvBZE-_CdrsSBsJndU982ZFYdmlymLsmNPrp7XU0DWSc7_6thQ>
    <xmx:IsIOZjMawgC1GXNpL6qKh7kKYhVjHnxJ7WG1kKcm-Z5AXWT_G_n7klGr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9D188B6008D; Thu,  4 Apr 2024 11:07:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
MIME-Version: 1.0
Message-Id: <110db7fd-9a20-46e3-9f6c-8ba30e146af5@app.fastmail.com>
In-Reply-To: <b84884eb-e23b-480d-827e-06f1188ece9e@paulmck-laptop>
References: <31c82dcc-e203-48a9-aadd-f2fcd57d94c1@paulmck-laptop>
 <20240401213950.3910531-3-paulmck@kernel.org>
 <836df0c7-51a7-4786-8a65-a70efe9b6eec@app.fastmail.com>
 <32936b57-f451-460b-a2df-e74293e44f5c@paulmck-laptop>
 <f9b3c536-887a-4a33-bd03-70e60c5aa517@app.fastmail.com>
 <b84884eb-e23b-480d-827e-06f1188ece9e@paulmck-laptop>
Date: Thu, 04 Apr 2024 17:06:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "Vineet Gupta" <vgupta@kernel.org>,
 "Andi Shyti" <andi.shyti@linux.intel.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Palmer Dabbelt" <palmer@rivosinc.com>, linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH RFC cmpxchg 3/8] ARC: Emulate one-byte and two-byte cmpxchg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_080718_294111_C98BD619 
X-CRM114-Status: GOOD (  22.51  )
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

On Thu, Apr 4, 2024, at 16:44, Paul E. McKenney wrote:
> On Thu, Apr 04, 2024 at 01:57:32PM +0200, Arnd Bergmann wrote:
>> On Tue, Apr 2, 2024, at 19:06, Paul E. McKenney wrote:
>> > Or is your question specific to the 16-bit primitives?  (Full disclosure:
>> > I have no objection to removing Alpha ev4/45/5, having several times
>> > suggested removing Alpha entirely.  And having the scars to prove it.)
>> 
>> For the native sub-word access, alpha ev5 cannot do either of
>> them, while armv3 could do byte access but not 16-bit words.
>> 
>> It sounds like the old alphas are already broken then, which
>> is a good reason to finally drop support. It would appear that
>> the arm riscpc is not affected by this though.
>
> Good point, given that single-byte load/store and emulated single-byte
> cmpxchg() has been in common code for some time.
>
> So armv3 is OK with one-byte emulated cmpxchg(), but not with two-byte,
> which is consistent with the current state of this series in the -rcu
> tree.  (My plan is to wait until Monday to re-send the series in order
> to allow the test robots to find yet more bugs.)
>
> Or is the plan to also drop support for armv3 in the near term?

Russell still has his RiscPC, which is probably the only one
using armv3 kernels (it's actually v4 but relies on -march=armv3
to work around hardware quirks). Since armv3 support was dropped
in gcc-9, it's a matter of time before we drop this as well, but
it's not now.

>> We'd still need all the combinations of cmpxchg() and xchg()
>> with the four sizes and ordering variants, but at least the
>> latter should easily collapse on most architectures. At the
>> moment, most architectures only provide the full-ordering
>> version.
>
> That does make a lot of sense to me.  Though C-language inline functions
> have some trouble with type-generic parameters.
>
> However, my patch is down at architecture-specific level, so should not
> affect the cmpxchg() macro, right?  Or am I missing some aspect of your
> proposed refactoring?

Today, arch_cmpxchg() and its variants are defined in each
architecture to handle some subset of integer sizes.

The way I'd like to do this in the future would be to remove that
macro in favor of arch_{cmp,}xchg{8,16,32,64}{,_relaxed,_release,
_acquire,_local} inline functions that each architecture needs
to provide either directly or through a generic helper, with
all the macros wrapping them moved to common code.

I've been wanting to change this for years now and it never
quite makes it to the top of my todo pile, so I guess it can wait
a little longer.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
