Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2298FEE01FA
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Dec 2025 14:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kkziEjSv9h3Y+RLSExWCF0LBW+i76dscfPDxXIf62AA=; b=SNijLUSQXd/Agw/nTcqfW1RqnP
	CVEWOyBaRb/v72vWC/XdwEiv6PW9v4NXsNgVYimyam37mqWWFgCFydXKF3KAu3uL+SGhQupzhoY1x
	1U9MrEw0X7aL06eZVF70vmeCf1ZVpeHxbqjJFiR1MI1LMjY009TvwxOH67ljrPgW2Fv0X8QFVPEtF
	CHrANNLBae+xCDA5JoCmr+sHVHMf5m8nc7LOM/OzupEs0QhAKPSIPq78kMwByM2kIYc+RdArJDz7r
	vibb5PUHH6uwqvZ2uhnA2TCT4WRmXnGtF/ftkmAnAgKnlwu1Lw1LO95eb6cmvOuJIQ8BE0cRRTaXy
	zlRoxNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaah-00000004vgw-3TWC;
	Tue, 30 Dec 2025 14:20:51 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaad-00000004vfv-0OMy;
	Tue, 30 Dec 2025 14:20:48 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0BEFF7A0120;
	Tue, 30 Dec 2025 09:20:41 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 30 Dec 2025 09:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767104440;
	 x=1767190840; bh=j797tkRG/meb+wTyJA6C1cS77dXDDaZhFKPILW7Z/3E=; b=
	TmJ8ULiJvmNIrsm7/GvtPwWVBEZXe/TT6NFuBmOQkU/lD/tRK7XBevY+//lMCFI8
	rEXOOCNqAV5CTnU98ICu0cbX8MaQsA9Vekgpij9eJYc5Pr0p+cQEvMJlLVGaO5DU
	YE/964jtrClqjJITNZ2XGZnkpdoyX+lyXCQLB8HsfwsR+IJlNnAZ5/pBqn4mLEzB
	ouqaV9lcKzQeozNEQCaeiQvbjl4FVXXvW5NdDWGMzaDbmy8HoRNP+TMtad4XxhuR
	YaZBpOQskYevfD58woIkbYyi4yzV4wRF1lYr3N6lkv+AYHT5KokUFLie82R5TaS8
	ZXy/ffit3T9sYK9VPZ1vGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767104440; x=
	1767190840; bh=j797tkRG/meb+wTyJA6C1cS77dXDDaZhFKPILW7Z/3E=; b=B
	7ve9oP1gIacsmOjN2BBog6ts8ZcIMO99ncduZJMdIctIcFxsE49lOCWdzL0n4xF1
	RSHPauqOm5C8XjqZmPFs0DqLz0MFAFW0lhCfZMcj6cggyLeANVrjAcQvl5QaQrfl
	jBq3u4iaJpoCCQ1mLpYIuQoIDqWtZlIh01u2wkVr/LgHhCNAF5BqHWzyOXs1zlFm
	WzXc81JoC3SHCU0lWGjtcvA0BdNJhRw1hxk02OXAyr143A9cteyIdL/L0/rp3cMg
	uQvGnSo2Krh4A4x4p1kdgKGhBSnbaZ/VkZTNLl+5e6wxA8+9CT29KAQGGbiWzduR
	qAh1hbqbHiH8gUMAH6HJA==
X-ME-Sender: <xms:t99TaRc-_J89QObvrT1DXlX4054sswv-fCerUZP7AWJizWXjTFObaA>
    <xme:t99TaaDt8ch0qKpe3CrOm807rQTroRTEGXt3qT5kr0bsvK2EVh5X4fnX5A8LNqkEP
    lUlxHtRRp1jzlb78oLsriIB_Z57S0n4MjcVzznijj9TMYc1g5zqXYV3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdektddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhieehueehiedvffeuuddvveehuefhtdehkeetuedtffekfffhieeghfdtgeefhfen
    ucffohhmrghinhepuggvsghirghnrdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnh
    ekrdguvgdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhr
    tghpthhtohepughinhhguhihvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvgh
    huphhtrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoh
    epthhhohhmrghsrdifvghishhsshgthhhuhheslhhinhhuthhrohhnihigrdguvgdprhgt
    phhtthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhg
X-ME-Proxy: <xmx:uN9TaQU688yxyFQjFfRyXYLltULsFccUVUb1W6KM8UxuvqMuW4XzAA>
    <xmx:uN9TaUJxajozySVRadHAkP3Au2LwIRD_01BSXq4Ehy7QM7NmSC37ug>
    <xmx:uN9TaYsYZwh9Yp85Vc6ddCcEika2HL2wFPknhPF8yeY9VK4VIROtKg>
    <xmx:uN9TaR3V9p54UXdeEQpPGfQh5qDmTwZX5rUgOKp3xZ-we4my2aW09A>
    <xmx:uN9TaYBaGDLq9ksEzojNYbTN5zN0nummAs1aIZ4SOm7rj4T5STlGSIEw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E30BB700065; Tue, 30 Dec 2025 09:20:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AeWvpOYieCaN
Date: Tue, 30 Dec 2025 15:20:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Vineet Gupta" <vgupta@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <d2ad12f2-3d65-4bef-890c-65d78a33d790@app.fastmail.com>
In-Reply-To: <20251230-headers_install-config-leak-v1-2-efba5c58073d@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-2-efba5c58073d@linutronix.de>
Subject: Re: [PATCH 2/5] ARM: uapi: Stop leaking CONFIG_CPU_ENDIAN_BE8 reference to
 userspace
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_062047_461602_787B32F9 
X-CRM114-Status: GOOD (  11.84  )
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

T24gVHVlLCBEZWMgMzAsIDIwMjUsIGF0IDA4OjEwLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToK
PiBVQVBJIGhlYWRlcnMgYXJlIG5vdCBzdXBwb3NlZCB0byBsZWFrIHJlZmVyZW5jZXMgdG8ga2Nv
bmZpZyBzeW1ib2xzLgo+IFRoZXNlIHdvbid0IGJlIHNldCB3aGVuIGJ1aWxkaW5nIHVzZXJzcGFj
ZS4gSGlkZSB0aGUga2NvbmZpZyByZWZlcmVuY2UKPiBiZWhpbmQgJ2lmIGRlZmluZWQoX19LRVJO
RUxfXyknLCBzbyBpdCB3aWxsIGJlIHN0cmlwcGVkIGJ5Cj4gaGVhZGVyc19pbnN0YWxsLnNoLCB0
aGUgc2FtZSB3YXkgb3RoZXIga2NvbmZpZyByZWZlcmVuY2VzIGluIHRoaXMgZmlsZQo+IGFyZSBo
YW5kbGVkLiBUaGUgcmVzdWx0IGZvciB1c2Vyc3BhY2Ugd2lsbCBiZSB0aGUgc2FtZSwgYnV0IHRo
ZQo+IGV4Y2VwdGlvbiBpbiBoZWFkZXJzX2luc3RhbGwuc2ggY2FuIGFsc28gYmUgcmVtb3ZlZC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBs
aW51dHJvbml4LmRlPgoKQWNjb3JkaW5nIHRvIGNvZGVzZWFyY2guZGViaWFuLm5ldCwgdGhlcmUg
YXJlIG5vIGFjdHVhbCB1c2VycyBvZgp0aGlzIGRlZmluaXRpb24gb3V0c2lkZSBvZiB0aGUga2Vy
bmVsLCBhbmQgdGhlcmUgcmVhbGx5IHNob3VsZG4ndApiZSBlaXRoZXIuCgpJdCBzaG91bGQgYmUg
Ym90aCBzYWZlIGFuZCBjb3JyZWN0IHRvIG9wZW4tY29kZSBQU1JfRU5EU1RBVEUKaW4gdGhlIHR3
byBmaWxlIHdoZXJlIGl0IGlzIHVzZWQgYXMKCiBpZiAoSVNfRU5BQkxFRChDT05GSUdfQ1BVX0VO
RElBTl9CRTgpKQogICAgICAgIHJlZ3MtPkFSTV9jcHNyIHw9IFBTUl9FX0JJVAoKYW5kIHRoZW4g
cmVtb3ZlIHRoZSBkZWZpbml0aW9uIGZyb20gdGhlIGhlYWRlci4gQWx0ZXJuYXRpdmVseQppdCBj
b3VsZCBiZSBtb3ZlZCBpbnRvIHRoZSBub24tdWFwaSBoZWFkZXIsIG9yIHlvdSBjYW4gaGF2ZQph
biAjaWZkZWYgYXJvdW5kIGJvdGggb2YgdGhlbS4KCiAgICAgQXJuZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBs
aXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
