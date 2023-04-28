Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC69AC77B7C
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Apr 2023 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8RycfxROdg4LlHSFplojlRRIaSoV34Z66f8XCF5NLs=; b=dJj2xO7sE4epNp
	8wvMvfYff/c3tychnSTWgb29eDtx2gLoxmXbQHpb/ekdqBjJ43baGITi9sM8AvT7d0PWXfOjSkEJ2
	SyNyEeEcqRbZ87zkkeVxbI9FgNvKwRQmi67tSAYEANcfsmUxNWUz+cdsDf7FZoftrklxBnaX3FpMD
	UEkIlz627OUA7ObD/AHW35J00Gs5OBQ8WB7mwKNUBYK51O5v+/6b+KidB31ltROh0ID8Vhf7BhHNP
	RkEEGt7BtYZBX/GiTxnsp0FAN+aGw12beqda0cW9GqCFh6FZIqjcCRVtf1ehkkw+DhVKO0lSHUWqX
	bP7D6yz02vcjx4HPBD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psNyb-00AJ1a-1Y;
	Fri, 28 Apr 2023 13:17:29 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psNyW-00AIsT-1l;
	Fri, 28 Apr 2023 13:17:26 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id AB7305C00BE;
	Fri, 28 Apr 2023 09:17:17 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 28 Apr 2023 09:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1682687837; x=1682774237; bh=PcHVTECY0DTSklc3ILW7xV/aJ7/Nau9fSJX
	oavdaK3A=; b=eUdK2nJGUj2ojcq/iN8+k9NH/YFehW26tD8EuLHi59mfHw77XBh
	fsxNlrmYAQkqxYxfq6y27vgAktDmUq34FmXwMFdqTfPO9loKN1XNr+UVkGw680qV
	BX4/DYfgCMWrAxE4Wow3ZwgWlN0ZNzHHEAtYzaMI7xLQjVEHla6fM+TZ1yvnzX8P
	E9OEYJ2zcL1QVyo974JDoFI3uCjuLc0KDC60ytqogt91Vrtguy8dOzwcDADe8Q8K
	wwGN7a6AzKt12/FKaJ6yE4xZxx1mfSbCRrBkh1w9kOWf+J/cSrAHTesLpKGIXn3y
	r/ezr2uqH7xDgE1v6IYlgXMzGM/v2wMUp7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682687837; x=1682774237; bh=PcHVTECY0DTSklc3ILW7xV/aJ7/Nau9fSJX
	oavdaK3A=; b=UHAR/6bgsNPLLEMAvooCE2Mz7rvShUkiKAolMysUv1eAD0G8pRJ
	Axt2cEsFq+HL0Sk84JLCYXyIoo4UY6iWfrU5QyWSoznl6Dl9up0oJPS8fmgZCkKN
	EmUFVujWaEm9kpXEdbpvXC1srFotbipILlqEP+BJC/wZA/MRDDmTDOObpyzAXcfr
	P5fPwPdeW2skiNrFbXI8pS1Fet/chSbd2eiKQ8NJCdOODy4lMW1yCHqd7i+2kw0m
	kkAAHSUBJawkS7oRrDqwSvWgWl0YC4FGX0wEe7mqbkV7MbyF4ZFqT2f9EaWXdta5
	UEG6fShDzo25wuyIzYe0uuavmo6nS5Qe20w==
X-ME-Sender: <xms:W8dLZGx3L9IVhQ2Z-Dm1gEY_dwHGXe32-QXDVpGxL4oZOrgre8krDA>
    <xme:W8dLZCT9BitiC8iWSIbkWjDY3CQ3ktYEHuCqF4lu4DEpLRIH__A8UyQjFfr8K3-Q_
    Hql-wi5bFWVO6i97bQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedukedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:W8dLZIV4-CWeJ_MAEkYa-T1q9H3_MDecIqHVzquAXQO4y7Xxr-G-sA>
    <xmx:W8dLZMg6khyrtIk2_xVeJ0jwab7q97YJj0EgH88Gpq1BMDBeqvzniA>
    <xmx:W8dLZIB7tmcXPfPCpXuu_s8_Ujf8-kwPj0DVIS5NrKHqzYp1SN7Ggg>
    <xmx:XcdLZPBenYiA6kEk2QhVgO0DBNH2txmCkaSu9NuYz9QpUDkjGGj7IA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A158DB60086; Fri, 28 Apr 2023 09:17:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <f612c682-5767-4a58-82f6-f4a4d1b592a1@app.fastmail.com>
In-Reply-To:  <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-6-tzimmermann@suse.de>
 <430c73f0-45f4-f81e-6506-bc8cc955d936@arm.com>
 <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>
Date: Fri, 28 Apr 2023 14:17:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Robin Murphy" <robin.murphy@arm.com>
Cc: "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Vineet Gupta" <vgupta@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "David S . Miller" <davem@davemloft.net>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Sam Ravnborg" <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O functions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_061724_892458_BD1F12A0 
X-CRM114-Status: GOOD (  11.57  )
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

T24gRnJpLCBBcHIgMjgsIDIwMjMsIGF0IDEzOjI3LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6
Cj4gT24gRnJpLCBBcHIgMjgsIDIwMjMgYXQgMjoxOOKAr1BNIFJvYmluIE11cnBoeSA8cm9iaW4u
bXVycGh5QGFybS5jb20+IHdyb3RlOgo+PiBPbiAyMDIzLTA0LTI4IDEwOjI3LCBUaG9tYXMgWmlt
bWVybWFubiB3cm90ZToKCj4+ID4gLQo+PiA+IC0jZWxpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBk
ZWZpbmVkKF9fYWxwaGFfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKSB8fCAgICAgIFwKPj4gPiAt
ICAgICBkZWZpbmVkKF9faHBwYV9fKSB8fCBkZWZpbmVkKF9fc2hfXykgfHwgZGVmaW5lZChfX3Bv
d2VycGNfXykgfHwgXAo+PiA+IC0gICAgIGRlZmluZWQoX19hcm1fXykgfHwgZGVmaW5lZChfX2Fh
cmNoNjRfXykgfHwgZGVmaW5lZChfX21pcHNfXykKPj4gPiAtCj4+ID4gLSNkZWZpbmUgZmJfcmVh
ZGIgX19yYXdfcmVhZGIKPj4gPiAtI2RlZmluZSBmYl9yZWFkdyBfX3Jhd19yZWFkdwo+PiA+IC0j
ZGVmaW5lIGZiX3JlYWRsIF9fcmF3X3JlYWRsCj4+ID4gLSNkZWZpbmUgZmJfcmVhZHEgX19yYXdf
cmVhZHEKPj4gPiAtI2RlZmluZSBmYl93cml0ZWIgX19yYXdfd3JpdGViCj4+ID4gLSNkZWZpbmUg
ZmJfd3JpdGV3IF9fcmF3X3dyaXRldwo+PiA+IC0jZGVmaW5lIGZiX3dyaXRlbCBfX3Jhd193cml0
ZWwKPj4gPiAtI2RlZmluZSBmYl93cml0ZXEgX19yYXdfd3JpdGVxCj4+Cj4+IE5vdGUgdGhhdCBv
biBhdCBsZWFzdCBzb21lIGFyY2hpdGVjdHVyZXMsIHRoZSBfX3JhdyB2YXJpYW50cyBhcmUKPj4g
bmF0aXZlLWVuZGlhbiwgd2hlcmVhcyB0aGUgcmVndWxhciBhY2Nlc3NvcnMgYXJlIGV4cGxpY2l0
bHkKPj4gbGl0dGxlLWVuZGlhbiwgc28gdGhlcmUgaXMgYSBzbGlnaHQgcmlzayBvZiBpbmFkdmVy
dGVudGx5IGNoYW5naW5nCj4+IGJlaGF2aW91ciBvbiBiaWctZW5kaWFuIHN5c3RlbXMgKE1JUFMg
bW9zdCBsaWtlbHksIGJ1dCBhIGZldyBvbGQgQVJNCj4+IHBsYXRmb3JtcyBydW4gQkUgYXMgd2Vs
bCkuCj4KPiBBbHNvIG9uIG02OGssIHdoZW4gSVNBIG9yIFBDSSBhcmUgZW5hYmxlZC4KPgo+IElu
IGFkZGl0aW9uLCB0aGUgbm9uLXJhdyB2YXJpYW50cyBtYXkgZG8gc29tZSBleHRyYXMgdG8gZ3Vh
cmFudGVlCj4gb3JkZXJpbmcsIHdoaWNoIHlvdSBkbyBub3QgbmVlZCBvbiBhIGZyYW1lIGJ1ZmZl
ci4KPgo+IFNvIEknZCBnbyBmb3IgdGhlIF9fcmF3XyooKSB2YXJpYW50cyBldmVyeXdoZXJlLgoK
VGhlIG9ubHkgaW1wbGVtZW50YXRpb25zIGluIGZiZGV2IGFyZQoKIDEpIHNwYXJjIHNidXMKIDIp
IF9fcmF3X3dyaXRlbAogMykgZGlyZWN0IHBvaW50ZXIgZGVyZWZlcmVuY2UKCkJ1dCBub25lIHVz
ZSB0aGUgYnl0ZS1zd2FwcGluZyB3cml0ZWwoKSBpbXBsZW1lbnRhdGlvbnMsIGFuZAp0aGUgb25s
eSBvbmVzIHRoYXQgdXNlIHRoZSBkaXJlY3QgcG9pbnRlciBkZXJlZmVyZW5jZSBvciBzYnVzCmFy
ZSB0aGUgb25lcyBvbiB3aGljaCB0aGVzZSBhcmUgZGVmaW5lZCB0aGUgc2FtZSBhcyBfX3Jhd193
cml0ZWwKCiAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc25wcy1hcmMK
