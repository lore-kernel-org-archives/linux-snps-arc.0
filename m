Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F401C76195
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Mar 2023 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3ypSwu1uP3QouMJ+boN1m51drw2rBYbnLKv/Zvbx2k=; b=MbFAhWHmM7mAEE
	tH8TxznjKoZqSxtJFimMhIDhH+OiCXLZ8gmP80onLKqJDGgc5+D2Pp2n+eIokCHQ+FN3yQR7gh0D2
	FQQ6nUBoS5h+3sIHeBdwad6BgYCGMB7GvRGkvAHNcVMa9w0gz1bP56QH62kmrdSX6j/LtSi37g1oV
	b9ScEBFuBZVYFhRy/J/SYe7NkXmT72Zm75IuFkW/s6K/VVn9i7h8FMv1XAP6iVWQ0o5lfreMQEQsK
	l7SMZEna4UjbSp7bsIMBhXP6Ue10n293U4Zfhcb1iGDMXWpDq5tJMsmho/90E3DhJeh+Wf/p8P1zN
	xBvy8DKrImZSV2Ldk3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmUm-00B2ui-0T;
	Mon, 27 Mar 2023 13:02:44 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmUe-00B2ok-0y;
	Mon, 27 Mar 2023 13:02:40 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 01DFD582160;
	Mon, 27 Mar 2023 09:02:29 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 27 Mar 2023 09:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1679922148; x=1679929348; bh=C0t+VBsIdNHlcZByrnG5NPOW3/HDBRin4l1
	1iuQ2qiw=; b=Y61mr9XUfXVFhUlJdoF8OWNZ1qM6LGTHSqUwPXey+5SLhbXuszz
	IX4F35TzFt8tNJqu3TdHQy42BVXRNe3bcFUV8/zj9nSivnmtuzQXp6yIK2l3HJtv
	arNn0qdsSFaxnf2jpGCdO42ZY/Yo7maZ9JJxQnYT9zQ6fDNdG0CMXLPJSTiBiuYc
	DxowTYLJD3TZAMG+gAP8IaltLqnFWdByE0RMezkwvVUj8PXoa7+fgC1mMOdcybmk
	FOSp8xBGb8i1lrklfr+C8l8mm7z3rZwyVo/iOqMqn8kIsrxCMYlMByaiI+EkJOfO
	AksZxvdJBavSBPl8RAWIMzvbBRTXG6xIPuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679922148; x=1679929348; bh=C0t+VBsIdNHlcZByrnG5NPOW3/HDBRin4l1
	1iuQ2qiw=; b=S8t3E1mZSSbesGBfIrPg8iez5iynYZ434j4/P/C+PFUpzIj6OWt
	K13vVMOr45Pq/x54idE06yYJdGJHsAgbut8cysdL7NSE20F2ZB97nGf6sGl0XtnJ
	9XT1e/v2R2VMawWFs9cAUtCqiZnEUzvQi5oNF6VrsD0uvg+IwkaMgefkI++oVxUX
	P6oUU+TSxGqMMY77icyCim+29Cz39zEK5CEbEi/5s9/A6kWKWjnkM9cNn+OZr9OG
	+PTT8iBaVt9Y7UzKaNo9juS2P9bsmSmnzuVEEp99tvwuhj8CNT8gHrMIM+y46L5g
	RgKT+E9GeicOtbPmieJjqHY7nt82g7IMpvg==
X-ME-Sender: <xms:4JMhZKEbJtHy_-7r0mhUuAf1RDVX6ONGet-C4uHDHI8aFxDwJeBTbg>
    <xme:4JMhZLWFbqjeW-l2s4SA4L2AsblAYcYuZ6OQ60CbfoemRcndoOUNn99kWSsbLC3eM
    b-EfXBxvzBJwVrahuc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:4JMhZELkazMXWEydSMGlmDWOa0OVgB7P_WKB0YhrlPTlihQYux3WDg>
    <xmx:4JMhZEHovsEueCzwFyZ_7j_02sVES08XwzN6GBrtdqzrQFX09dmI0A>
    <xmx:4JMhZAUOI7kSkdg94xSzJhhTWcVlrr09q_AxuFUHeLD9-JISNVRWQg>
    <xmx:5JMhZP2bf1MV6jKd0e2JRv6hBv-xH3H71MSGG9ZG8p0hNuqV3tmOJw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 75C74B60086; Mon, 27 Mar 2023 09:02:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-236-g06c0f70e43-fm-20230313.001-g06c0f70e
Mime-Version: 1.0
Message-Id: <a0b2c6a1-9f9a-490a-af1b-52d856102bc7@app.fastmail.com>
In-Reply-To: <52eef604-085e-acf9-f3ee-41ba9d8441d2@csgroup.eu>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-7-arnd@kernel.org>
 <52eef604-085e-acf9-f3ee-41ba9d8441d2@csgroup.eu>
Date: Mon, 27 Mar 2023 15:02:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Stafford Horne" <shorne@gmail.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>, "Christoph Hellwig" <hch@lst.de>,
 "Robin Murphy" <robin.murphy@arm.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>
Subject: Re: [PATCH 06/21] powerpc: dma-mapping: minimize for_cpu flushing
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_060237_112206_912B4D7C 
X-CRM114-Status: GOOD (  16.27  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMjcsIDIwMjMsIGF0IDE0OjU2LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+
IExlIDI3LzAzLzIwMjMgw6AgMTQ6MTMsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoKPj4gRnJv
bTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4gCj4+IFRoZSBwb3dlcnBjIGRtYV9z
eW5jXypfZm9yX2NwdSgpIHZhcmlhbnRzIGRvIG1vcmUgZmx1c2hlcyB0aGFuIG9uIG90aGVyCj4+
IGFyY2hpdGVjdHVyZXMuIFJlZHVjZSBpdCB0byB3aGF0IGV2ZXJ5b25lIGVsc2UgZG9lczoKPj4g
Cj4+ICAgLSBObyBmbHVzaCBpcyBuZWVkZWQgYWZ0ZXIgZGF0YSBoYXMgYmVlbiBzZW50IHRvIGEg
ZGV2aWNlCj4+IAo+PiAgIC0gV2hlbiBkYXRhIGhhcyBiZWVuIHJlY2VpdmVkIGZyb20gYSBkZXZp
Y2UsIHRoZSBjYWNoZSBvbmx5IG5lZWRzIHRvCj4+ICAgICBiZSBpbnZhbGlkYXRlZCB0byBjbGVh
ciBvdXQgY2FjaGUgbGluZXMgdGhhdCB3ZXJlIHNwZWN1bGF0aXZlbHkKPj4gICAgIHByZWZldGNo
ZWQuCj4+IAo+PiBJbiBwYXJ0aWN1bGFyLCB0aGUgc2Vjb25kIGZsdXNoaW5nIG9mIHBhcnRpYWwg
Y2FjaGUgbGluZXMgb2YgYmlkaXJlY3Rpb25hbAo+PiBidWZmZXJzIGlzIGFjdGl2ZWx5IGhhcm1m
dWwgLS0gaWYgYSBzaW5nbGUgY2FjaGUgbGluZSBpcyB3cml0dGVuIGJ5IGJvdGgKPj4gdGhlIENQ
VSBhbmQgdGhlIGRldmljZSwgZmx1c2hpbmcgaXQgYWdhaW4gZG9lcyBub3QgbWFpbnRhaW4gY29o
ZXJlbmN5Cj4+IGJ1dCBpbnN0ZWFkIG92ZXJ3cml0ZSB0aGUgZGF0YSB0aGF0IHdhcyBqdXN0IHJl
Y2VpdmVkIGZyb20gdGhlIGRldmljZS4KPgo+IEh1bSAuLi4uLiBXaG8gaXMgcmlnaHQgPwo+Cj4g
VGhhdCBiZWhhdmlvdXIgd2FzIGludHJvZHVjZWQgYnkgY29tbWl0IDAzZDcwNjE3YjhhNyAoInBv
d2VycGM6IFByZXZlbnQgCj4gbWVtb3J5IGNvcnJ1cHRpb24gZHVlIHRvIGNhY2hlIGludmFsaWRh
dGlvbiBvZiB1bmFsaWduZWQgRE1BIGJ1ZmZlciIpCj4KPiBJIHRoaW5rIHlvdXIgY29tbWl0IGxv
ZyBzaG91bGQgZXhwbGFpbiB3aHkgdGhhdCBjb21taXQgd2FzIHdyb25nLCBhbmQgCj4gbWF5YmUg
c2F5IHRoYXQgeW91ciBwYXRjaCBpcyBhIHJldmVydCBvZiB0aGF0IGNvbW1pdCA/CgpPaywgSSds
bCB0cnkgdG8gZXhwbGFpbiB0aGlzIGJldHRlci4gVG8gY2xhcmlmeSBoZXJlOiB0aGUgX19kbWFf
c3luYygpCmZ1bmN0aW9uIGluIGNvbW1pdCAwM2Q3MDYxN2I4YTcgaXMgdXNlZCBib3RoIGJlZm9y
ZSBhbmQgYWZ0ZXIgYSBETUEsCmJ1dCBteSBwYXRjaCAwNS8yMSBzcGxpdHMgdGhpcyBpbiB0d28s
IGFuZCBwYXRjaCAwNi8yMSBvbmx5IGNoYW5nZXMKdGhlIHBhcnQgdGhhdCBnZXRzIGNhbGxlZCBh
ZnRlciB0aGUgRE1BLWZyb20tZGV2aWNlIGJ1dCBsZWF2ZXMgdGhlCnBhcnQgYmVmb3JlIERNQS1m
cm9tLWRldmljZSB1bmNoYW5nZWQsIHdoaWNoIEFuZHJldydzIHBhdGNoCmFkZHJlc3NlZC4KCkFz
IEkgbWVudGlvbmVkIGluIHRoZSBjb3ZlciBsZXR0ZXIsIGl0IGlzIHN0aWxsIHVuY2xlYXIgd2hl
dGhlcgp3ZSB3YW50IHRvIGNvbnNpZGVyIHRoaXMgdGhlIGV4cGVjdGVkIGJlaGF2aW9yIGFzIHRo
ZSBkb2N1bWVudGF0aW9uCnNlZW1zIHVuY2xlYXIsIGJ1dCBteSBzZXJpZXMgZG9lcyBub3QgYXR0
ZW1wdCB0byBhbnN3ZXIgdGhhdApxdWVzdGlvbi4KCiAgICAgQXJuZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBs
aXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
