Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040CDC9EC6C
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 Jan 2026 10:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QX8CIvsifQ1p5oCO4IHEBBmR1hAd+XhAdKux0JH1u2k=; b=e4EBciHsnZw/70nhs9Ak7HIbyG
	750xbq76a/awVpWQ7YOtQ2GKzUR7S0/CvdA7VJ5o6JdevHlae7kAluIqznwNnSPE0x2oOPGnNFH++
	QYBFgooDmpjERC9JSQdTDl7+YItPkuFuKtApvlIN2T3p6zB/b4+r9VusyJTrS+UtL5qnAhax7Ri61
	o3ctYz5ELXt/j2n54p/pQL57Oxc0eZAhGH0H9WoybtfeUyvloRRfWutpHf7UeXJCiZrFgitzpqTea
	Bu8IRvobjcWBBkvaZPZjzug/HxO9Ds320BDUsqLRw/iwh3WZApofdHkHx7Gqm0Go/LotlsO4uCSCS
	lkCmuqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFOM-00000005Bix-2s2n;
	Mon, 12 Jan 2026 10:43:22 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFOJ-00000005Bhb-3i2O;
	Mon, 12 Jan 2026 10:43:21 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7C10E1400088;
	Mon, 12 Jan 2026 05:43:16 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 12 Jan 2026 05:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1768214596;
	 x=1768300996; bh=/U0bfsaRs/ZGq0q7sk/kz3WOlfgb/vCNIGmB3A9Kyk4=; b=
	iIC7HlUbY74G1sdZL+mFMUt9TCfAuIcmFBrhw8kzmM+XhuOAoBZEqSIfZoTIbSLN
	dZjmfe0jZML/g9EDKOOIEMySFlzj6vThNF/Y9SetnIl1PQzqE3hh/k0hAZH/Yjlv
	4oZfRErND5QJhXkly9uRbyFiErRnjjBj3ODlItiQgUKvepxuVEdKde4rAN9etNBP
	EwQ7ZkWCRaCvxd6x/4617tFvonAgH+6Q0t5nuLxJXJuRoWiXM7LvDznDmOky5lpF
	ANtBCMojVniSZegE/fb5FzT4dW2kCy9Dil4RcHpYB8xGNsWsnOt/JJp5sEapXktE
	012TqcDPyNX3mevhSjuN3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768214596; x=
	1768300996; bh=/U0bfsaRs/ZGq0q7sk/kz3WOlfgb/vCNIGmB3A9Kyk4=; b=f
	geCEwzPNIJvzmd2t3J7cJi4AKg0yurpopg/shNoMCkehqtp/3dWImVdVaRja9NFp
	tqE7Uc2vMrJlUaDWhFS9G4aFcO8eUuIO7HT0mAbk0UAbLrkhRrBXx1gtht51tU0Q
	yoMev05ru1Q7Cj4iYqvdQkhU+p3jp5zEEFnyu0Vyi+SX5Unr90R9v+TvaWoLu1hO
	M8IB2/v3a0SlC+tEmxV0z7mDnLOAC+qWQyxA4RG4ihkotEogu+W3j8NEYzjtJHOp
	pKI2tvWqf71PMPI2QpBEnndocmh38H5fYY+2aTXtY27xC+YOuTEe1N7ym375UwWo
	rmxwoNVcDmHDvvolBuH0Q==
X-ME-Sender: <xms:RNBkaZ7uqZwuVQEBGRPLik6Ls8KU_GnO6P8qCLK5RpmKBziyekv4lQ>
    <xme:RNBkaRth8zknZNRb91tIljEd6GMkkYXcE4jzM3eQCnR1DK5KogrNh0XKaTEdHbyil
    TzfiRqzLgcdUB-x7r3GISFaWOJJbKLWshgwSV9vwAA601qlYNnZIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudejvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehlihhnuhigse
    grrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepughinhhguhihvghnsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehvghhuphhtrgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhn
    uhhtrhhonhhigidruggvpdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhuhh
    eslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehl
    ihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrh
    hnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:RNBkadUdsbg6w5ttK6HKXbX_dq6v5vjyyOkQiZrtwYw7pc-iaY8JrQ>
    <xmx:RNBkaSKlDt0Q5e1Q3seqFlJJJ1h_7JPXHIpeSRu0lvZooSNyJSdJeg>
    <xmx:RNBkaWhb0T9tBgdk282S0xsNPnaPm6BNC3tGMXILMiBmiGA4zJtUZA>
    <xmx:RNBkaXLs3vrbtY7kZn6hOzRUtunOUZcaA4NOUtnfEjWbS5r8w-UUBQ>
    <xmx:RNBkaTFWhNWNgu5prUrBLXZpqF7t4wC83KmULb_J5mN8Jw5iUOfJEZZH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F0575700065; Mon, 12 Jan 2026 05:43:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AzziJVMBiyuw
Date: Mon, 12 Jan 2026 11:42:55 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Vineet Gupta" <vgupta@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <b78c96d5-bd5e-47b5-86b3-e06855fcd6be@app.fastmail.com>
In-Reply-To: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
References: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
Subject: Re: [PATCH v2 0/5] uapi: fix remaining kconfig leaks in UAPI headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_024320_249931_D4633390 
X-CRM114-Status: GOOD (  10.79  )
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

T24gTW9uLCBKYW4gMTIsIDIwMjYsIGF0IDA4OjU4LCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToK
PiBBIGZldyBVQVBJIGhlYWRlcnMgc3RpbGwgY29udGFpbmVkIHJlZmVyZW5jZXMgdG8ga2NvbmZp
ZyBzeW1ib2xzLgo+IENsZWFuIHRoZW0gYWxsIHVwIGFuZCBhZnRlcndhcmRzIHJlbW92ZSB0aGUg
bm93IHVzZWxlc3MgZXhjZXB0aW9uCj4gbWFjaGluZXJ5IGluIGhlYWRlcnNfaW5zdGFsbC5zaC4K
Pgo+IEludGVuZGVkIHRvIGJlIHJvdXRlZCB0aHJvdWdoIHRoZSBrYnVpbGQgdHJlZS4KPgo+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJv
bml4LmRlPgo+IC0tLQoKV2hvbGUgc2VyaWVzCgpSZXZpZXdlZC1ieTogQXJuZCBCZXJnbWFubiA8
YXJuZEBhcm5kYi5kZT4KCkkgd291bGQgaGF2ZSBwcmVmZXJyZWQgY2xlYW5pbmcgdXAgdGhlIHg4
NiBhdXh2ZWMuaCBoZWFkZXIKbW9yZSwgYnV0IHdlIGNhbiBhbHdheXMgZG8gdGhhdCBsYXRlciBh
bmQgeW91ciBwYXRjaCBub3QKYSByZWdyZXNzaW9uLgoKU2hvdWxkIEkgdGFrZSB0aGUgc2VyaWVz
IHRocm91Z2ggdGhlIGFzbS1nZW5lcmljIHRyZWUgaWYgdGhlcmUKYXJlIG5vIG90aGVyIGNvbmNl
cm5zLCBvciBkbyB5b3UgaGF2ZSBvdGhlciBwbGFucyBmb3IgbWVyZ2luZyBpdD8KCiAgICAgIEFy
bmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1h
cmMK
